@implementation FMDRemoteAssetMIMETypeProvider

- (id)mimeTypeForFileExtension:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithFilenameExtension:](UTType, "typeWithFilenameExtension:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredMIMEType"));

  return v4;
}

@end
