@implementation DataFrameBatchProvider

- (int64_t)count
{
  return *(_QWORD *)self->count;
}

- (id)featuresAtIndex:(int64_t)a3
{
  void *v4;

  swift_retain();
  v4 = (void *)sub_22AA5BA08(a3);
  swift_release();
  return v4;
}

@end
