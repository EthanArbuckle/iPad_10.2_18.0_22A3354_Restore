@implementation MFMailMimeTextAttachment

- (BOOL)shouldDownloadAttachmentOnDisplay
{
  unsigned int v4;

  if (-[MFMimeTextAttachment hasBeenDownloaded](self, "hasBeenDownloaded"))
    return 1;
  if (-[MFNetworkController isOnWWAN](+[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance"), "isOnWWAN"))
  {
    v4 = 0x20000;
  }
  else
  {
    v4 = 0x100000;
  }
  return objc_msgSend(-[MFMimeTextAttachment _displayedMimePart](self, "_displayedMimePart"), "approximateRawSize") < v4;
}

@end
