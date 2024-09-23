@implementation ZL21saveImageWithKeywordsP7CIImageP8NSStringbP7NSArray

const char *___ZL21saveImageWithKeywordsP7CIImageP8NSStringbP7NSArray_block_invoke()
{
  char *v0;
  int v1;
  const char *result;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = getenv("CI_SAVE_IMAGES");
  if (v0)
    v1 = atoi(v0);
  else
    v1 = saveImageWithKeywords(CIImage *,NSString *,BOOL,NSArray *)::saveImages;
  saveImageWithKeywords(CIImage *,NSString *,BOOL,NSArray *)::saveImages = v1 != 0;
  result = getenv("CI_METAL_SDOF");
  if (result)
    result = (const char *)atoi(result);
  if (v1)
  {
    v3[0] = CFSTR("kCIContextUseMetalRenderer");
    v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (_DWORD)result != 0);
    v4[1] = CFSTR("CIDisparityRefinement-saveImageWithKeywords");
    v3[1] = CFSTR("kCIContextName");
    v3[2] = CFSTR("working_format");
    v4[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056);
    result = +[CIContext contextWithOptions:](CIContext, "contextWithOptions:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3));
    saveImageWithKeywords(CIImage *,NSString *,BOOL,NSArray *)::context = (uint64_t)result;
  }
  return result;
}

@end
