@implementation TSCacheFlushingManager

- (id)createPreFlushTask
{
  TSCacheFlushingManager *v2;
  id v3;

  v2 = self;
  v3 = CacheFlushingManager.createPreFlushTask()();

  return v3;
}

- (void)addPreFlushTask:(id)a3
{
  _QWORD *v4;
  NSObject *v5;
  TSCacheFlushingManager *v6;
  uint64_t v7;
  void *v8;
  void (*v9)(_QWORD *, void *);
  _QWORD v10[6];

  v4 = _Block_copy(a3);
  v5 = *(NSObject **)((char *)&self->super.isa + OBJC_IVAR___TSCacheFlushingManager_preFlushGroup);
  v6 = self;
  dispatch_group_enter(v5);
  v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v10[4] = sub_1D5FC1B74;
  v10[5] = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = sub_1D5EB52E8;
  v10[3] = &block_descriptor_16_3;
  v8 = _Block_copy(v10);
  v9 = (void (*)(_QWORD *, void *))v4[2];
  swift_retain_n();
  v9(v4, v8);
  _Block_release(v8);
  swift_release_n();
  swift_release();
  _Block_release(v4);

}

- (void)enableFlushing
{
  TSCacheFlushingManager *v2;

  v2 = self;
  _s7NewsUI220CacheFlushingManagerC06enableD0yyF_0();

}

- (TSCacheFlushingManager)init
{
  TSCacheFlushingManager *result;

  result = (TSCacheFlushingManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___TSCacheFlushingManager_storageLevelProvider);

}

@end
