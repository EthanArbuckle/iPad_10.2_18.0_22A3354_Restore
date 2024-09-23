@implementation MFComposePhotoPickerProgressManager

- (BOOL)hasAnyProgress
{
  MFComposePhotoPickerProgressManager *v2;

  v2 = self;
  sub_1ABA5FD50();

  return sub_1ABA650D8() & 1;
}

- (void)setProgress:(id)a3 for:(id)a4
{
  id v5;
  id v6;
  MFComposePhotoPickerProgressManager *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  v6 = a4;
  v7 = self;
  v9 = sub_1ABA65348();
  sub_1ABA5FDD4(a3, v9, v8);
  swift_bridgeObjectRelease();

}

- (id)progressFor:(id)a3
{
  id v4;
  MFComposePhotoPickerProgressManager *v5;
  uint64_t v6;
  uint64_t v7;
  id v11;

  v4 = a3;
  v5 = self;
  v6 = sub_1ABA65348();
  v11 = (id)sub_1ABA600AC(v6, v7);
  swift_bridgeObjectRelease();

  return v11;
}

- (void)cancelProgressFor:(id)a3
{
  id v4;
  MFComposePhotoPickerProgressManager *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = self;
  v6 = sub_1ABA65348();
  sub_1ABA60240(v6, v7);
  swift_bridgeObjectRelease();

}

- (void)cancelEverything
{
  MFComposePhotoPickerProgressManager *v2;

  v2 = self;
  sub_1ABA60450();

}

- (MFComposePhotoPickerProgressManager)init
{
  return (MFComposePhotoPickerProgressManager *)PhotoPickerProgressManager.init()();
}

- (void).cxx_destruct
{
  sub_1ABA57AB4();
}

@end
