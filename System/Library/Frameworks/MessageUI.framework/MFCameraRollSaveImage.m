@implementation MFCameraRollSaveImage

id __MFCameraRollSaveImage_block_invoke(uint64_t a1)
{
  return (id)objc_msgSend((Class)getPHAssetChangeRequestClass[0](), "creationRequestForAssetFromImage:", *(_QWORD *)(a1 + 32));
}

@end
