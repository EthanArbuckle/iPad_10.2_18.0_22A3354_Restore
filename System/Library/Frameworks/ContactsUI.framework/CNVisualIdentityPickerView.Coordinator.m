@implementation CNVisualIdentityPickerView.Coordinator

- (void)photoPickerDidCancel:(id)a3
{
  void (*v4)(void);
  id v5;
  _TtCV10ContactsUI26CNVisualIdentityPickerView11Coordinator *v6;

  v4 = *(void (**)(void))&self->parent[OBJC_IVAR____TtCV10ContactsUI26CNVisualIdentityPickerView11Coordinator_parent + 8];
  v5 = a3;
  v6 = self;
  v4();

}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  _TtCV10ContactsUI26CNVisualIdentityPickerView11Coordinator *v13;
  id v14;

  v9 = objc_allocWithZone((Class)CNVisualIdentity);
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = self;
  v14 = objc_msgSend(v9, sel_initWithContact_, v11);
  (*(void (**)(void))&v13->parent[OBJC_IVAR____TtCV10ContactsUI26CNVisualIdentityPickerView11Coordinator_parent + 24])();

}

- (_TtCV10ContactsUI26CNVisualIdentityPickerView11Coordinator)init
{
  _TtCV10ContactsUI26CNVisualIdentityPickerView11Coordinator *result;

  result = (_TtCV10ContactsUI26CNVisualIdentityPickerView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v2;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV10ContactsUI26CNVisualIdentityPickerView11Coordinator_parent);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

}

@end
