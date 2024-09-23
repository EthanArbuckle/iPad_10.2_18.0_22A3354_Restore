@implementation CMGestureManager

- (CMGestureManager)init
{
  uint64_t v2;
  uint64_t v3;

  return (CMGestureManager *)objc_msgSend_initWithPriority_(self, a2, 0, v2, v3);
}

- (CMGestureManager)initWithPriority:(int)a3
{
  uint64_t v3;
  CMGestureManager *v4;
  CMGestureManagerInternal *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v3 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)CMGestureManager;
  v4 = -[CMGestureManager init](&v10, sel_init);
  if (v4)
  {
    v5 = [CMGestureManagerInternal alloc];
    v4->_internal = (id)objc_msgSend_initWithPriority_(v5, v6, v3, v7, v8);
  }
  return v4;
}

- (void)dealloc
{
  id internal;
  NSObject *v4;
  objc_super v5;
  _QWORD block[5];

  internal = self->_internal;
  v4 = *((_QWORD *)internal + 4);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F41C6F4;
  block[3] = &unk_1E2955938;
  block[4] = internal;
  dispatch_async(v4, block);

  self->_internal = 0;
  v5.receiver = self;
  v5.super_class = (Class)CMGestureManager;
  -[CMGestureManager dealloc](&v5, sel_dealloc);
}

- (void)setGestureHandler:(id)a3
{
  id internal;
  NSObject *v4;
  _QWORD v5[6];

  internal = self->_internal;
  v4 = *((_QWORD *)internal + 4);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F41C754;
  v5[3] = &unk_1E2955B60;
  v5[4] = internal;
  v5[5] = a3;
  dispatch_async(v4, v5);
}

- (id)gestureHandler
{
  id internal;
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  internal = self->_internal;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_18F206C44;
  v11 = sub_18F206BA0;
  v12 = 0;
  v3 = *((_QWORD *)internal + 4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F41C808;
  v6[3] = &unk_1E2956830;
  v6[4] = internal;
  v6[5] = &v7;
  dispatch_sync(v3, v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

+ (BOOL)isGestureServiceEnabled
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  char v7;

  v7 = 0;
  if (sub_18F45ABB4((uint64_t)&v7, a2, v2, v3, v4))
    v5 = v7 == 0;
  else
    v5 = 1;
  return !v5;
}

+ (BOOL)isGestureServiceAvailable
{
  _BOOL4 v2;

  if ((sub_18F1F7758() & 1) != 0)
    LOBYTE(v2) = 0;
  else
    return (sub_18F1F781C() >> 3) & 1;
  return v2;
}

+ (void)setGestureServiceEnabled:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  sub_18F45AB88(a3, a2, a3, v3, v4);
}

@end
