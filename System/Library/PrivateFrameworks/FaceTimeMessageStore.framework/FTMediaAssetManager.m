@implementation FTMediaAssetManager

- (FTMediaAssetManager)init
{
  return (FTMediaAssetManager *)sub_23B33B454();
}

- (void)saveLivePhotoWithPhotoURL:(NSURL *)a3 videoURL:(NSURL *)a4 completion:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSURL *v10;
  NSURL *v11;
  FTMediaAssetManager *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_23B393E98((uint64_t)&unk_256A0CCA0, (uint64_t)v9);
}

- (void)saveVideoWithURL:(NSURL *)a3 completion:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSURL *v8;
  FTMediaAssetManager *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_23B393E98((uint64_t)&unk_256A0CC90, (uint64_t)v7);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
