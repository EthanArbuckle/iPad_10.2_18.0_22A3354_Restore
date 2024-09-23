@implementation UIImagePickerController(Swift)

- (uint64_t)ic_setSavingOptionsCreateOriginalImageData
{
  return objc_msgSend(a1, "_setImagePickerSavingOptions:", 4);
}

- (uint64_t)ic_writeImageDataToSavedPhotosAlbum:()Swift
{
  return UIImageDataWriteToSavedPhotosAlbum();
}

+ (uint64_t)ic_originalImageDataFromInfo:()Swift
{
  return objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0DC58E8]);
}

@end
