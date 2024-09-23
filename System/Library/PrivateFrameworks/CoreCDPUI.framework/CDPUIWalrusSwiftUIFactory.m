@implementation CDPUIWalrusSwiftUIFactory

- (id)makeSwiftUIViewWithCdpContext:(id)a3 advancedDataProtectionViewModelDelegate:(id)a4 presentingViewController:(id)a5
{
  id v8;
  id v9;
  CDPUIWalrusSwiftUIFactory *v10;
  void *v11;

  v8 = a3;
  swift_unknownObjectRetain();
  v9 = a5;
  v10 = self;
  v11 = (void *)sub_20DCC1CA4(v8, a4, v9);

  swift_unknownObjectRelease();
  return v11;
}

- (void)makeSwiftUIUpsellViewWithCDPContext:(id)a3 urlBag:(id)a4 networkObserver:(id)a5 viewModelDelegate:(id)a6 completion:(id)a7
{
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  CDPUIWalrusSwiftUIFactory *v17;

  v12 = _Block_copy(a7);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  swift_unknownObjectRetain();
  v17 = self;
  sub_20DCC202C(v14, v15, v16, (uint64_t)a6, (uint64_t)sub_20DCC19D4, v13);

  swift_unknownObjectRelease();
  swift_release();
}

- (CDPUIWalrusSwiftUIFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDPUIWalrusSwiftUIFactory;
  return -[CDPUIWalrusSwiftUIFactory init](&v3, sel_init);
}

@end
