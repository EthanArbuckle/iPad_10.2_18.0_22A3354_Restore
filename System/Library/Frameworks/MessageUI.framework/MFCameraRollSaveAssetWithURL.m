@implementation MFCameraRollSaveAssetWithURL

id __MFCameraRollSaveAssetWithURL_block_invoke(uint64_t a1)
{
  return (id)objc_msgSend((Class)getPHAssetChangeRequestClass[0](), "creationRequestForAssetFromVideoAtFileURL:", *(_QWORD *)(a1 + 32));
}

id __MFCameraRollSaveAssetWithURL_block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend((Class)getPHAssetChangeRequestClass[0](), "creationRequestForAssetFromImageAtFileURL:", *(_QWORD *)(a1 + 32));
}

@end
