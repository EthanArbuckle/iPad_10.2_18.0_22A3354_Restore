@implementation CHSessionStateTracker

- (CHSessionStateTracker)init
{
  CHSessionStateTracker *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CHSessionStateTracker *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CHSessionStateTracker;
  v2 = -[CHSessionStateTracker init](&v10, sel_init);
  v8 = v2;
  if (v2)
    objc_msgSend_setActive(v2, v3, v4, v5, v6, v7);
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  sub_1BE6EFD84(self);
  v3.receiver = self;
  v3.super_class = (Class)CHSessionStateTracker;
  -[CHSessionStateTracker dealloc](&v3, sel_dealloc);
}

- (void)setIdle
{
  sub_1BE6EFE18(self, 0);
}

- (void)setActive
{
  sub_1BE6EFE18(self, 1);
}

- (BOOL)isActive
{
  CHSessionStateTracker *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_state == 1;
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__connection, 0);
}

@end
