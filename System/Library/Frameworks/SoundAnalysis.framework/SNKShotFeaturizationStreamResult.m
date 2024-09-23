@implementation SNKShotFeaturizationStreamResult

- (SNKShotFeaturizationStreamResult)init
{
  SNKShotFeaturizationStreamResult *result;

  SNKShotFeaturizationStreamResult.init()((uint64_t)self);
  return result;
}

- (MLMultiArray)data
{
  id v2;

  sub_1D42C0860();
  return (MLMultiArray *)v2;
}

- (void)setData:(id)a3
{
  id v4;
  SNKShotFeaturizationStreamResult *v5;

  v4 = a3;
  v5 = self;
  sub_1D42C08C8((uint64_t)v4);

}

- (int64_t)datasetType
{
  SNKShotFeaturizationStreamResult *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_1D42C097C();
  v4 = v3;

  return v4;
}

- (void)setDatasetType:(int64_t)a3
{
  sub_1D42C09D4(a3);
}

- (SNKShotLabel)label
{
  SNKShotFeaturizationStreamResult *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1D42C0A2C();
  v4 = v3;

  return (SNKShotLabel *)v4;
}

- (void)setLabel:(id)a3
{
  id v4;
  SNKShotFeaturizationStreamResult *v5;

  v4 = a3;
  v5 = self;
  sub_1D42C0AC0(v4);

}

- (void).cxx_destruct
{
  sub_1D42CB61C((uint64_t)self, OBJC_IVAR___SNKShotFeaturizationStreamResult_impl);
}

@end
