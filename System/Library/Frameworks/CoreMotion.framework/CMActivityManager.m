@implementation CMActivityManager

- (CMActivityManager)init
{
  CMActivityManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMActivityManager;
  v2 = -[CMActivityManager init](&v4, sel_init);
  if (v2)
    v2->_internal = objc_alloc_init(CMActivityManagerInternal);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_internal = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMActivityManager;
  -[CMActivityManager dealloc](&v3, sel_dealloc);
}

- (void)setActivityHandler:(id)a3
{
  id internal;
  NSObject *v4;
  _QWORD v5[6];

  internal = self->_internal;
  v4 = *((_QWORD *)internal + 3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F41E3D0;
  v5[3] = &unk_1E2955B60;
  v5[4] = internal;
  v5[5] = a3;
  dispatch_async(v4, v5);
}

- (id)activityHandler
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
  v10 = sub_18F206C54;
  v11 = sub_18F206BAC;
  v12 = 0;
  v3 = *((_QWORD *)internal + 3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F41E484;
  v6[3] = &unk_1E2956830;
  v6[4] = internal;
  v6[5] = &v7;
  dispatch_sync(v3, v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isActivityAvailable
{
  _BOOL8 v2;

  if ((sub_18F1F7758() & 1) != 0)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    sub_18F1F77DC();
    return ((unint64_t)sub_18F1F7BFC() >> 22) & 1;
  }
  return v2;
}

- (int64_t)overrideOscarSideband:(BOOL)a3 withState:(int64_t)a4
{
  id internal;
  NSObject *v7;
  uint64_t v8;
  int64_t v9;
  NSObject *v10;
  _QWORD v12[7];
  BOOL v13;
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  internal = self->_internal;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v7 = *((_QWORD *)internal + 3);
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F41E5B4;
  block[3] = &unk_1E2956C30;
  block[4] = internal;
  block[5] = &v15;
  dispatch_sync(v7, block);
  v9 = v16[3];
  if (!v9)
  {
    v10 = *((_QWORD *)internal + 6);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = sub_18F41E63C;
    v12[3] = &unk_1E29574E0;
    v13 = a3;
    v12[5] = &v15;
    v12[6] = a4;
    v12[4] = internal;
    dispatch_sync(v10, v12);
    v9 = v16[3];
  }
  _Block_object_dispose(&v15, 8);
  return v9;
}

- (int64_t)simulateMotionState:(BOOL)a3 withState:(int64_t)a4
{
  id internal;
  NSObject *v7;
  uint64_t v8;
  int64_t v9;
  NSObject *v10;
  _QWORD v12[7];
  BOOL v13;
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  internal = self->_internal;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v7 = *((_QWORD *)internal + 3);
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F41E97C;
  block[3] = &unk_1E2956C30;
  block[4] = internal;
  block[5] = &v15;
  dispatch_sync(v7, block);
  v9 = v16[3];
  if (!v9)
  {
    v10 = *((_QWORD *)internal + 10);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = sub_18F41EA04;
    v12[3] = &unk_1E29574E0;
    v13 = a3;
    v12[5] = &v15;
    v12[6] = a4;
    v12[4] = internal;
    dispatch_sync(v10, v12);
    v9 = v16[3];
  }
  _Block_object_dispose(&v15, 8);
  return v9;
}

- (int64_t)simulateMotionStateYouthWithState:(int64_t)a3
{
  id internal;
  NSObject *v4;
  _QWORD v6[6];

  internal = self->_internal;
  v4 = *((_QWORD *)internal + 3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F41EB08;
  v6[3] = &unk_1E2956590;
  v6[4] = internal;
  v6[5] = a3;
  dispatch_sync(v4, v6);
  return *((_QWORD *)internal + 13);
}

@end
