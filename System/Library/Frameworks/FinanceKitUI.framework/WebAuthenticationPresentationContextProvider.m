@implementation WebAuthenticationPresentationContextProvider

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB58]), sel_init);
}

- (_TtC12FinanceKitUI44WebAuthenticationPresentationContextProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WebAuthenticationPresentationContextProvider();
  return -[WebAuthenticationPresentationContextProvider init](&v3, sel_init);
}

@end
