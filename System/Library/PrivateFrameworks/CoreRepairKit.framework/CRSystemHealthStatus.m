@implementation CRSystemHealthStatus

- (BOOL)getCurrentSystemHealthStatusForComponents:(unint64_t)a3 WithReply:(id)a4
{
  void (**v5)(id, _QWORD, uint64_t, uint64_t);
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  _QWORD v25[8];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v5 = (void (**)(id, _QWORD, uint64_t, uint64_t))a4;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_1D140574C;
  v47 = sub_1D140575C;
  v48 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_1D140574C;
  v41 = sub_1D140575C;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1D140574C;
  v35 = sub_1D140575C;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v6 = objc_alloc(MEMORY[0x1E0CB3B38]);
  v8 = objc_msgSend_initWithMachServiceName_options_(v6, v7, (uint64_t)CFSTR("com.apple.mobilerepaird"), 0);
  v9 = (void *)v44[5];
  v44[5] = v8;

  objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v10, (uint64_t)&unk_1EFC5DAA8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteObjectInterface_((void *)v44[5], v13, (uint64_t)v12, v14);

  objc_msgSend_resume((void *)v44[5], v15, v16, v17);
  v18 = (void *)v44[5];
  v19 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1D1405764;
  v26[3] = &unk_1E9220670;
  v26[4] = &v37;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v18, v20, (uint64_t)v26, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = sub_1D14057D4;
  v25[3] = &unk_1E9220698;
  v25[4] = &v37;
  v25[5] = &v27;
  v25[6] = &v31;
  v25[7] = &v43;
  objc_msgSend_getCurrentSystemHealthStatusForComponentsInternal_WithReply_(v22, v23, a3, (uint64_t)v25);

  v5[2](v5, *((unsigned __int8 *)v28 + 24), v32[5], v38[5]);
  LOBYTE(a3) = *((_BYTE *)v28 + 24);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  return a3;
}

@end
