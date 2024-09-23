@implementation HUControlCenterSharedStateManager

+ (HUControlCenterSharedStateManager)sharedManager
{
  os_unfair_lock_s *v2;
  id v3;

  if (qword_1ED57F508 != -1)
    swift_once();
  os_unfair_lock_lock((os_unfair_lock_t)(qword_1ED57F500 + 16));
  if (qword_1ED57F520 != -1)
    swift_once();
  v2 = (os_unfair_lock_s *)(qword_1ED57F500 + 16);
  v3 = (id)qword_1ED57F510;
  os_unfair_lock_unlock(v2);
  return (HUControlCenterSharedStateManager *)v3;
}

- (void)enterModuleViewWillAppear
{
  uint64_t v2;
  HUControlCenterSharedStateManager *v3;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___HUControlCenterSharedStateManager_isVisibleRefCounter);
  v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  sub_1B8F4C2FC((uint64_t *)(v2 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));

  swift_release();
}

- (void)exitModuleViewDidDisappear
{
  uint64_t v2;
  HUControlCenterSharedStateManager *v3;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___HUControlCenterSharedStateManager_isVisibleRefCounter);
  v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  sub_1B8F4BE5C((uint64_t *)(v2 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));

  swift_release();
}

- (HUControlCenterSharedStateManager)init
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = OBJC_IVAR___HUControlCenterSharedStateManager_isVisibleRefCounter;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57F530);
  v4 = swift_allocObject();
  *(_DWORD *)(v4 + 24) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  *(Class *)((char *)&self->super.isa + v3) = (Class)v4;
  v6.receiver = self;
  v6.super_class = (Class)HUControlCenterSharedStateManager;
  return -[HUControlCenterSharedStateManager init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)bootstrap
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  id v11;

  v0 = (void *)objc_opt_self();
  sub_1B8E23A60(0, &qword_1ED57F4F0);
  v1 = (void *)sub_1B93EE420();
  objc_msgSend(v0, sel_setConfiguration_, v1);

  v2 = objc_msgSend(v0, sel_sharedDispatcher);
  objc_msgSend(v2, sel_warmup);

  v3 = objc_msgSend(v0, sel_sharedDispatcher);
  v4 = objc_msgSend(v3, sel_homeManager);

  if (qword_1ED57F410 != -1)
    swift_once();
  v5 = sub_1B93EC884();
  __swift_project_value_buffer(v5, (uint64_t)qword_1ED57F3F0);
  v11 = v4;
  v6 = sub_1B93EC86C();
  v7 = sub_1B93EE234();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    if (v11)
    {
      v10 = v11;
      sub_1B93EE600();
    }
    else
    {
      sub_1B93EE600();
      v4 = 0;
    }
    *v9 = v4;

    _os_log_impl(&dword_1B8E1E000, v6, v7, "ControlCenterSharedStateManager is bootstrapped: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57F930);
    swift_arrayDestroy();
    MEMORY[0x1BCCC1CD0](v9, -1, -1);
    MEMORY[0x1BCCC1CD0](v8, -1, -1);

  }
  else
  {

  }
}

@end
