@implementation UIImage

void __63__UIImage_Conversion__avt_dataRepresentationForTypeIdentifier___block_invoke(uint64_t a1, id a2)
{
  CGImageDestinationAddImage(*(CGImageDestinationRef *)(a1 + 40), (CGImageRef)objc_msgSend(objc_retainAutorelease(a2), "CGImage"), *(CFDictionaryRef *)(a1 + 32));
}

@end
