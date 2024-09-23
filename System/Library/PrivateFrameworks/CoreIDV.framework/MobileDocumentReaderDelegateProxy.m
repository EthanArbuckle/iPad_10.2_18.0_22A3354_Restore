@implementation MobileDocumentReaderDelegateProxy

- (void)mobileDocumentReaderStateDidChange:(id)a3
{
  void (*v3)(char *);
  char *v4;
  id v5;

  v3 = *(void (**)(char *))self->onStateChange;
  v4 = (char *)a3 + OBJC_IVAR____TtC7CoreIDV35XPCMobileDocumentReaderSessionState_value;
  v5 = a3;
  swift_retain();
  v3(v4);

  swift_release();
}

@end
