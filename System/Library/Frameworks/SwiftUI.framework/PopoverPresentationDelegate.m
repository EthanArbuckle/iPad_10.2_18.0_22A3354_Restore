@implementation PopoverPresentationDelegate

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id v7;
  _TtC7SwiftUI27PopoverPresentationDelegate *v8;

  v7 = a3;
  v8 = self;
  specialized PopoverPresentationDelegate.popoverPresentationController(_:willRepositionPopoverTo:in:)(a4);

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC7SwiftUI27PopoverPresentationDelegate *v8;
  UIModalPresentationStyle v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = PopoverPresentationDelegate.adaptivePresentationStyle(for:traitCollection:)((UIPresentationController)v6, (UITraitCollection)v7);

  return v9;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4;
  _TtC7SwiftUI27PopoverPresentationDelegate *v5;

  v4 = a3;
  v5 = self;
  specialized PopoverPresentationDelegate.presentationControllerDidAttemptToDismiss(_:)(v4);

}

- (_TtC7SwiftUI27PopoverPresentationDelegate)init
{
  _TtC7SwiftUI27PopoverPresentationDelegate *result;

  result = (_TtC7SwiftUI27PopoverPresentationDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI27PopoverPresentationDelegate_delegate);
}

@end
