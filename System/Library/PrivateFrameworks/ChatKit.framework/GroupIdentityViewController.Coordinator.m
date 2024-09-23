@implementation GroupIdentityViewController.Coordinator

- (void)handleGroupPhotoChanged:(id)a3
{
  id v4;
  _TtCV7ChatKit27GroupIdentityViewController11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_18E64F308(v4);

}

- (void)handleGroupDisplayNameChanged:(id)a3
{
  id v4;
  _TtCV7ChatKit27GroupIdentityViewController11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_18E64FA1C(v4);

}

- (void)handleAddressBookChanged:(id)a3
{
  id v4;
  _TtCV7ChatKit27GroupIdentityViewController11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_18E650160(v4);

}

- (void)headerViewControllerDidTapActionButton:(id)a3
{
  id v4;
  _TtCV7ChatKit27GroupIdentityViewController11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_18E650948();

}

- (void)presentGroupNameAndPhotoEditor
{
  _TtCV7ChatKit27GroupIdentityViewController11Coordinator *v2;

  v2 = self;
  sub_18E650948();

}

- (void)visualIdentityPicker:(id)a3 presentationControllerWillDismiss:(id)a4
{
  uint64_t v6;
  id v7;
  _TtCV7ChatKit27GroupIdentityViewController11Coordinator *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;

  v6 = qword_1EE1073D0;
  v7 = a3;
  v13 = a4;
  v8 = self;
  if (v6 != -1)
    swift_once();
  v9 = sub_18E7666F8();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EE10E3E0);
  v10 = sub_18E7666E0();
  v11 = sub_18E768D80();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_18DFCD000, v10, v11, "visualIdentityPicker.presentationControllerWillDismiss", v12, 2u);
    MEMORY[0x193FF4F20](v12, -1, -1);
  }

}

- (void)dismissIdentityPicker:(id)a3
{
  id v4;
  _TtCV7ChatKit27GroupIdentityViewController11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_18E6523A8(v4);

}

- (void)visualIdentityPickerDidCancel:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _TtCV7ChatKit27GroupIdentityViewController11Coordinator *v10;

  v4 = qword_1EE1073D0;
  v5 = a3;
  v10 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_18E7666F8();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EE10E3E0);
  v7 = sub_18E7666E0();
  v8 = sub_18E768D80();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_18DFCD000, v7, v8, "visualIdentityPickerDidCancel", v9, 2u);
    MEMORY[0x193FF4F20](v9, -1, -1);
  }

  sub_18E6523A8(v5);
}

- (void)visualIdentityPicker:(id)a3 didUpdatePhotoForVisualIdentity:(id)a4 withContactImage:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtCV7ChatKit27GroupIdentityViewController11Coordinator *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_18E6524CC(v8, v9);

}

- (_TtCV7ChatKit27GroupIdentityViewController11Coordinator)init
{
  _TtCV7ChatKit27GroupIdentityViewController11Coordinator *result;

  result = (_TtCV7ChatKit27GroupIdentityViewController11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV7ChatKit27GroupIdentityViewController11Coordinator_groupIdentityController));
}

@end
