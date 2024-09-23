@implementation CKCardMediaObject

- (BOOL)shouldShowViewer
{
  void *v2;
  char v3;

  -[CKMediaObject transfer](self, "transfer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFileDataReady");

  return v3;
}

- (BOOL)shouldBeQuickLooked
{
  return CKIsRunningInMacCatalyst() != 0;
}

@end
