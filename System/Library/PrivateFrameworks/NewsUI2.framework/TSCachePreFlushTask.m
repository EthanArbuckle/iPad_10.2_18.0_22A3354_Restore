@implementation TSCachePreFlushTask

- (void)dealloc
{
  TSCachePreFlushTask *v2;

  v2 = self;
  CachePreFlushTask.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_1D5FAE038(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TSCachePreFlushTask_block));
}

- (void)finish
{
  uint64_t *v2;
  void (*v3)(uint64_t);
  TSCachePreFlushTask *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___TSCachePreFlushTask_block);
  v3 = *(void (**)(uint64_t))((char *)&self->super.isa + OBJC_IVAR___TSCachePreFlushTask_block);
  v4 = self;
  if (v3)
  {
    v5 = sub_1D5FAE028((uint64_t)v3);
    v3(v5);
    sub_1D5FAE038((uint64_t)v3);
    v6 = *v2;
  }
  else
  {
    v6 = 0;
  }
  *v2 = 0;
  v2[1] = 0;
  sub_1D5FAE038(v6);

}

- (TSCachePreFlushTask)init
{
  TSCachePreFlushTask *result;

  result = (TSCachePreFlushTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
