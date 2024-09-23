@implementation CKDDaemonProcess

+ (id)currentProcess
{
  id v2;
  void *v3;
  CKDDaemonProcess *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)qword_1ED702CE8;
  if (!qword_1ED702CE8)
  {
    v4 = [CKDDaemonProcess alloc];
    v6 = objc_msgSend__initWithProcessType_(v4, v5, 2);
    v7 = (void *)qword_1ED702CE8;
    qword_1ED702CE8 = v6;

    v3 = (void *)qword_1ED702CE8;
  }
  v8 = v3;
  objc_sync_exit(v2);

  return v8;
}

- (int64_t)processType
{
  return self->_processType;
}

- (BOOL)isSystemInstalledBinary
{
  return self->_isSystemInstalledBinary;
}

+ (void)deriveCurrentProcessWithArgC:(int)a3 argv:(const char *)a4
{
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  CKDDaemonProcess *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  id obj;

  v5 = *(_QWORD *)&a3;
  obj = a1;
  objc_sync_enter(obj);
  if (qword_1ED702CE8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, obj, CFSTR("CKDDaemonProcess.m"), 41, CFSTR("Not expected to have a current process here"));

  }
  v9 = [CKDDaemonProcess alloc];
  v11 = objc_msgSend__initWithArgC_argv_(v9, v10, v5, a4);
  v12 = (void *)qword_1ED702CE8;
  qword_1ED702CE8 = v11;

  objc_sync_exit(obj);
}

- (id)_initWithProcessType:(int64_t)a3
{
  CKDDaemonProcess *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKDDaemonProcess;
  v4 = -[CKDDaemonProcess init](&v11, sel_init);
  v5 = (uint64_t)v4;
  if (v4)
  {
    v4->_processType = a3;
    if (*MEMORY[0x1E0C95290] != -1)
      dispatch_once(MEMORY[0x1E0C95290], &unk_1E7837948);
    *(_BYTE *)(v5 + 8) = *MEMORY[0x1E0C95288];
    if (!a3 && _os_feature_enabled_impl())
    {
      v6 = objc_alloc(MEMORY[0x1E0D03770]);
      v8 = objc_msgSend_initWithChunkDelegate_(v6, v7, v5);
      v9 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = v8;

    }
  }
  return (id)v5;
}

- (id)_initWithArgC:(int)a3 argv:(const char *)a4
{
  uint64_t v8;
  char v9;
  int v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  option v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v8 = 0;
  v9 = 0;
  v28 = *MEMORY[0x1E0C80C00];
  v24 = xmmword_1E78379A8;
  v25 = unk_1E78379B8;
  v26 = xmmword_1E78379C8;
  v27 = unk_1E78379D8;
  v21 = *(option *)ymmword_1E7837968;
  v22 = xmmword_1E7837988;
  v23 = unk_1E7837998;
  while (1)
  {
    while (1)
    {
      v10 = getopt_long_only(a3, (char *const *)a4, "std", &v21, 0);
      if (v10 <= 114)
        break;
      if (v10 == 115)
      {
        v8 = 1;
      }
      else if (v10 == 116)
      {
        v8 = 2;
      }
    }
    if (v10 == -1)
      break;
    if (v10 == 100)
      v9 = 1;
  }
  v12 = objc_msgSend__initWithProcessType_(self, v11, v8, *(_OWORD *)&v21.name, *(_OWORD *)&v21.flag, v22, v23, v24, v25, v26, v27);
  v15 = (_QWORD *)v12;
  if (v12)
  {
    if (*(_BYTE *)(v12 + 8) == (v9 & 1))
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, v15, CFSTR("CKDDaemonProcess.m"), 85, CFSTR("Incompatible env and cli arguments for using debug"));

    }
    if ((v15[2] == 2) != (*MEMORY[0x1E0C95280] != 0))
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, v15, CFSTR("CKDDaemonProcess.m"), 86, CFSTR("Incompatible env and cli arguments for supporting test hooks"));

    }
  }
  return v15;
}

- (id)chunkDataFromSignature:(id)a3 forContainerIdentifier:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  CKDDaemonProcess *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  if (_os_feature_enabled_impl())
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = sub_1BE9BB1C0;
    v24 = sub_1BE9BAE88;
    v25 = 0;
    objc_msgSend_defaultContext(CKDLogicalDeviceContext, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1BEC0BD24;
    v14[3] = &unk_1E78379F0;
    v11 = v10;
    v15 = v11;
    v16 = v7;
    v17 = self;
    v18 = v6;
    v19 = &v20;
    CKMuckingWithPersonas(v14);
    v12 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (C2Multipeer)multipeer
{
  return self->_multipeer;
}

- (void)setMultipeer:(id)a3
{
  objc_storeStrong((id *)&self->_multipeer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multipeer, 0);
}

@end
