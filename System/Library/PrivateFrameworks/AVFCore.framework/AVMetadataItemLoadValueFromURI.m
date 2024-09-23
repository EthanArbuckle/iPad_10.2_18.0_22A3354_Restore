@implementation AVMetadataItemLoadValueFromURI

uint64_t __AVMetadataItemLoadValueFromURI_block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t CoreMediaDataType;

  if (!a2)
    return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a4);
  if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "scheme"), "isEqualToString:", CFSTR("http")) & 1) != 0
    || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "scheme"), "isEqualToString:", CFSTR("https")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(a3, "statusCode") - 400 <= 0xFFFFFF37)
      return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a4);
  }
  if (objc_msgSend(a3, "MIMEType"))
    CoreMediaDataType = FigMetadataGetCoreMediaDataType();
  else
    CoreMediaDataType = 0;
  return objc_msgSend(*(id *)(a1 + 32), "respondWithValue:dataType:", a2, CoreMediaDataType);
}

@end
