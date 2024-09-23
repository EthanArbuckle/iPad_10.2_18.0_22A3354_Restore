@implementation ImageProcessingXPCServiceModel

- (void)backgroundColorForImageWithData:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v6 = _Block_copy(a4);
  v7 = a3;
  swift_retain();
  v8 = sub_23361D3C4();
  v10 = v9;

  _Block_copy(v6);
  sub_233443EA0(v8, v10, self, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_23316BEA4(v8, v10);
  swift_release();
}

- (void)renderThumbnailUsing:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  swift_retain();
  sub_23344400C((uint64_t)v7, (uint64_t)self, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_release();
}

@end
