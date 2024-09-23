@implementation AvatarEditorView.Coordinator

- (void)photoPickerDidCancel:(id)a3
{
  id v4;
  _TtCV12GameCenterUIP33_08F422D3891D7273A98CAC5FE2A95BDE16AvatarEditorView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1AB554478(v4);

}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtCV12GameCenterUIP33_08F422D3891D7273A98CAC5FE2A95BDE16AvatarEditorView11Coordinator *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1AB5BA1AC(v8, (uint64_t)v9, (uint64_t)v10);

}

- (_TtCV12GameCenterUIP33_A3F53D5CE5AC6C06F2DAA78D55DA747516AvatarEditorView11Coordinator)init
{
  sub_1AB554BE8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)&self->parent[OBJC_IVAR____TtCV12GameCenterUIP33_08F422D3891D7273A98CAC5FE2A95BDE16AvatarEditorView11Coordinator_parent
                                  + 8]);
  swift_release();
}

- (_TtCV12GameCenterUIP33_08F422D3891D7273A98CAC5FE2A95BDE16AvatarEditorView11Coordinator)init
{
  sub_1AB554BE8();
}

@end
