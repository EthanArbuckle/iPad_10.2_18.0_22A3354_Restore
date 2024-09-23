@implementation PlayerAvatarPickerActionImplementation

- (void)photoPickerDidCancel:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_1AB617310(v3);

  swift_release();
}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  swift_retain();
  sub_1AB6173B4(v7, (uint64_t)v8, (uint64_t)v9);

  swift_release();
}

@end
