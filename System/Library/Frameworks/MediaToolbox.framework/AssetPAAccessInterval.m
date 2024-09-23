@implementation AssetPAAccessInterval

- (AssetPAAccessInterval)initWithClientPid:(int)a3 auditToken:(id *)a4
{
  AssetPAAccessInterval *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  objc_super v15;
  uint64_t v16;
  uint64_t v17;
  Class (*v18)(uint64_t);
  void *v19;
  __int128 *v20;
  __int128 v21;
  __int128 v22;
  void (*v23)(uint64_t);
  uint64_t v24;

  v15.receiver = self;
  v15.super_class = (Class)AssetPAAccessInterval;
  v5 = -[AssetPAAccessInterval init](&v15, sel_init, *(_QWORD *)&a3);
  if (v5)
  {
    *(_QWORD *)&v21 = 0;
    *((_QWORD *)&v21 + 1) = &v21;
    *(_QWORD *)&v22 = 0x3052000000;
    *((_QWORD *)&v22 + 1) = __Block_byref_object_copy__7;
    v23 = __Block_byref_object_dispose__7;
    v6 = (void *)getPAAccessLoggerClass_softClass;
    v24 = getPAAccessLoggerClass_softClass;
    if (!getPAAccessLoggerClass_softClass)
    {
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __getPAAccessLoggerClass_block_invoke;
      v19 = &unk_1E2F91F58;
      v20 = &v21;
      __getPAAccessLoggerClass_block_invoke((uint64_t)&v16);
      v6 = *(void **)(*((_QWORD *)&v21 + 1) + 40);
    }
    _Block_object_dispose(&v21, 8);
    v5->_logger = (PAAccessLogger *)(id)objc_msgSend(v6, "sharedInstance");
    v7 = objc_alloc((Class)getPATCCAccessClass());
    v8 = (_QWORD *)MEMORY[0x1E0DB1158];
    v9 = *MEMORY[0x1E0DB1158];
    v10 = *(_OWORD *)&a4->var0[4];
    v21 = *(_OWORD *)a4->var0;
    v22 = v10;
    v11 = objc_msgSend(v7, "initWithAuditToken:forService:", &v21, v9);
    v5->_access = (PATCCAccess *)v11;
    if (!s_shouldUseStubPAApplication)
    {
      if (!v11)
        return v5;
      goto LABEL_8;
    }
    *(_QWORD *)&v21 = 0;
    *((_QWORD *)&v21 + 1) = &v21;
    *(_QWORD *)&v22 = 0x3052000000;
    *((_QWORD *)&v22 + 1) = __Block_byref_object_copy__7;
    v23 = __Block_byref_object_dispose__7;
    v12 = (objc_class *)getPAApplicationClass_softClass;
    v24 = getPAApplicationClass_softClass;
    if (!getPAApplicationClass_softClass)
    {
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __getPAApplicationClass_block_invoke;
      v19 = &unk_1E2F91F58;
      v20 = &v21;
      __getPAApplicationClass_block_invoke((uint64_t)&v16);
      v12 = *(objc_class **)(*((_QWORD *)&v21 + 1) + 40);
    }
    _Block_object_dispose(&v21, 8);
    v5->_application = (PAApplication *)objc_msgSend([v12 alloc], "initWithType:identifier:", 0, CFSTR("com.apple.music"));
    v13 = objc_msgSend(objc_alloc((Class)getPATCCAccessClass()), "initWithAccessor:forService:", v5->_application, *v8);
    v5->_access = (PATCCAccess *)v13;
    if (v13)
LABEL_8:
      v5->_accessInterval = (PAAccessInterval *)(id)-[PAAccessLogger beginIntervalForAccess:](v5->_logger, "beginIntervalForAccess:");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[PAAccessInterval end](self->_accessInterval, "end");

  v3.receiver = self;
  v3.super_class = (Class)AssetPAAccessInterval;
  -[AssetPAAccessInterval dealloc](&v3, sel_dealloc);
}

@end
