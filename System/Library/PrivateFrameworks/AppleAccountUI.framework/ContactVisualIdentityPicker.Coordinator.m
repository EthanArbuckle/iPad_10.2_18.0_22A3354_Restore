@implementation ContactVisualIdentityPicker.Coordinator

- (void)visualIdentityPickerDidCancel:(id)a3
{
  id v4;
  _TtCV14AppleAccountUI27ContactVisualIdentityPicker11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1DB5D2688(a3);

}

- (void)visualIdentityPicker:(id)a3 didUpdatePhotoForVisualIdentity:(id)a4 withContactImage:(id)a5
{
  id v6;
  id v7;
  id v8;
  _TtCV14AppleAccountUI27ContactVisualIdentityPicker11Coordinator *v9;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  v9 = self;
  sub_1DB5D2A74(a3, a4, (uint64_t)a5);

}

- (_TtCV14AppleAccountUI27ContactVisualIdentityPicker11Coordinator)init
{
  return (_TtCV14AppleAccountUI27ContactVisualIdentityPicker11Coordinator *)sub_1DB5D51F8();
}

- (void).cxx_destruct
{
  sub_1DB5D5798((uint64_t)self + OBJC_IVAR____TtCV14AppleAccountUI27ContactVisualIdentityPicker11Coordinator_parent);
}

@end
