@implementation TDCustomAsset

- (CGSize)sourceImageSizeWithDocument:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "customAssetProvider"), "document:willProvideAssetForCustomRendition:withReferenceData:", a3, objc_msgSend((id)-[TDCustomAsset renditions](self, "renditions"), "anyObject"), -[TDCustomAsset referenceData](self, "referenceData")), "customAssetSize");
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)sourceImageWithDocument:(id)a3
{
  CGImage *v3;
  void *v4;

  v3 = (CGImage *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "customAssetProvider"), "document:willProvideAssetForCustomRendition:withReferenceData:", a3, objc_msgSend((id)-[TDCustomAsset renditions](self, "renditions"), "anyObject"), -[TDCustomAsset referenceData](self, "referenceData")), "customAssetImage");
  v4 = (void *)objc_msgSend(MEMORY[0x24BE28C38], "imageWithCGImage:", v3);
  CGImageRelease(v3);
  return v4;
}

@end
