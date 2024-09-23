@implementation MFMailMimeTextAttachment

- (BOOL)shouldDownloadAttachmentOnDisplay
{
  BOOL v3;
  void *v4;
  int v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;

  if (-[MFMimeTextAttachment hasBeenDownloaded](self, "hasBeenDownloaded"))
    return 1;
  +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isOnWWAN");

  -[MFMimeTextAttachment _displayedMimePart](self, "_displayedMimePart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "approximateRawSize");
  if (v5)
    v8 = 0x20000;
  else
    v8 = 0x100000;
  v3 = v7 < v8;

  return v3;
}

@end
