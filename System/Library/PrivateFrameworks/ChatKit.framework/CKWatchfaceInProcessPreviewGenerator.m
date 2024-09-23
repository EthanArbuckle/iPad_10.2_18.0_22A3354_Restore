@implementation CKWatchfaceInProcessPreviewGenerator

+ (Class)implementation
{
  if (implementation_onceToken != -1)
    dispatch_once(&implementation_onceToken, &__block_literal_global_22);
  return (Class)(id)implementation_impl;
}

uint64_t __54__CKWatchfaceInProcessPreviewGenerator_implementation__block_invoke()
{
  uint64_t result;

  result = MEMORY[0x193FF3C18](CFSTR("NTKGreenfieldUtilities"), CFSTR("NanoTimeKitCompanion"));
  implementation_impl = result;
  return result;
}

+ (void)generateFacePreviewImageFromUrl:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(a1, "implementation");
  if (v7)
    objc_msgSend(v7, "generateFacePreviewImageFromUrl:completionBlock:", v8, v6);
  else
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);

}

@end
