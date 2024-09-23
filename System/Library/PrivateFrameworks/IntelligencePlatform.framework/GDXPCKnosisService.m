@implementation GDXPCKnosisService

- (GDXPCKnosisService)init
{
  const char *v2;
  GDXPCKnosisService *v3;
  uint64_t v4;
  NSXPCInterface *serverInterface;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GDXPCKnosisService;
  v3 = -[GDXPCKnosisService init](&v7, sel_init);
  if (v3)
  {
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v2, (uint64_t)&unk_1EEE28CD0);
    v4 = objc_claimAutoreleasedReturnValue();
    serverInterface = v3->_serverInterface;
    v3->_serverInterface = (NSXPCInterface *)v4;

  }
  return v3;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_invalidate(self->_connection, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)GDXPCKnosisService;
  -[GDXPCKnosisService dealloc](&v4, sel_dealloc);
}

- (void)locked_establishConnection
{
  NSObject *v3;
  id v4;
  const char *v5;
  NSXPCConnection *v6;
  NSXPCConnection *connection;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[8];

  if (!self->_connection)
  {
    GDXPCLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE4F2000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCKnosisService: establishing connection.", buf, 2u);
    }

    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v6 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, (uint64_t)CFSTR("com.apple.intelligenceplatform.Knosis"), 0);
    connection = self->_connection;
    self->_connection = v6;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v8, (uint64_t)self->_serverInterface);
    objc_msgSend_setInterruptionHandler_(self->_connection, v9, (uint64_t)&unk_1E5DD9F18);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1AE9207BC;
    v13[3] = &unk_1E5DDA118;
    objc_copyWeak(&v14, (id *)buf);
    objc_msgSend_setInvalidationHandler_(self->_connection, v10, (uint64_t)v13);
    objc_msgSend_resume(self->_connection, v11, v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  GDXPCKnosisService *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_locked_establishConnection(v5, v6, v7);
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5->_connection, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v9;
}

- (id)executeKGQ:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  GDKnosisResult *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  void *hasMoreAnswers_debug;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *, _BYTE *);
  void *v33;
  id v34;
  uint64_t *v35;
  uint8_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[3];
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  __CFString *v64;
  uint8_t buf[8];
  uint8_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  __CFString *v70;
  uint8_t v71[4];
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  GDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCKnosisService: executeKgqQuery called.", buf, 2u);
  }

  if (a4)
    *a4 = 0;
  *(_QWORD *)buf = 0;
  v66 = buf;
  v67 = 0x3032000000;
  v68 = sub_1AE920274;
  v69 = sub_1AE920284;
  v70 = &stru_1E5DDB0B8;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = sub_1AE920274;
  v63 = sub_1AE920284;
  v64 = &stru_1E5DDB0B8;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_1AE920274;
  v57 = sub_1AE920284;
  v58 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v48 = 0;
  objc_msgSend_limit(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_integerValue(v10, v11, v12);

  v48 = v13;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_1AE920274;
  v45 = sub_1AE920284;
  v46 = 0;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = sub_1AE9205A8;
  v33 = &unk_1E5DD9F40;
  v35 = &v59;
  v36 = buf;
  v37 = &v49;
  v38 = &v41;
  v39 = &v53;
  v17 = v16;
  v34 = v17;
  v40 = v47;
  if ((objc_msgSend_iteratingExecuteKGQ_error_block_(self, v18, (uint64_t)v6, a4, &v30) & 1) != 0)
  {
    v19 = [GDKnosisResult alloc];
    v20 = *((_QWORD *)v66 + 5);
    v21 = v60[5];
    v22 = v50[3];
    v23 = v54[5];
    objc_msgSend_limit(v6, v24, v25);
    v7 = objc_claimAutoreleasedReturnValue();
    hasMoreAnswers_debug = (void *)objc_msgSend_initWithQuery_kgq_status_answers_errorMessage_limit_offset_hasMoreAnswers_debug_(v19, v26, v20, v21, v22, v17, v23, v7, &unk_1E5E0CE60, 0, v42[5], v30, v31, v32, v33);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (a4)
        v29 = *a4;
      else
        v29 = 0;
      *(_DWORD *)v71 = 138412290;
      v72 = v29;
      _os_log_error_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_ERROR, "GDXPCKnosisService: error during ExecuteKGQ call: %@", v71, 0xCu);
    }
    hasMoreAnswers_debug = 0;
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(v47, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(buf, 8);

  return hasMoreAnswers_debug;
}

- (BOOL)iteratingExecuteKGQ:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  int v22;
  uint64_t v24;
  NSObject *oslog;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  _QWORD v36[7];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  uint8_t buf[8];
  uint8_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint8_t v67[4];
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v27 = a5;
  GDXPCLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v8, OS_LOG_TYPE_DEFAULT, "GDXPCKnosisService: iteratingExecuteKGQ called.", buf, 2u);
  }
  oslog = v8;

  *(_QWORD *)buf = 0;
  v62 = buf;
  v63 = 0x3032000000;
  v64 = sub_1AE920274;
  v65 = sub_1AE920284;
  v66 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 1;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = sub_1AE920274;
  v55 = sub_1AE920284;
  v56 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_1AE920274;
  v49 = sub_1AE920284;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = sub_1AE9203C8;
  v36[3] = &unk_1E5DD9F68;
  v36[4] = buf;
  v36[5] = &v41;
  v36[6] = &v37;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v36);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  while (*((_BYTE *)v58 + 24))
  {
    if (*((_BYTE *)v42 + 24))
      break;
    if (*((_QWORD *)v62 + 5))
      break;
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = objc_msgSend_longValue((void *)v52[5], v10, v11);
    v17 = objc_msgSend_longValue((void *)v46[5], v15, v16);
    objc_msgSend_numberWithLong_(v13, v18, v17 + v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOffset_(v7, v20, (uint64_t)v19);

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_1AE9204B8;
    v28[3] = &unk_1E5DD9F90;
    v30 = buf;
    v31 = &v41;
    v32 = &v37;
    v33 = &v57;
    v34 = &v51;
    v35 = &v45;
    v29 = v27;
    objc_msgSend_executeKGQ_withCompletion_(v12, v21, (uint64_t)v7, v28);

  }
  v22 = *((unsigned __int8 *)v38 + 24);
  if (*((_BYTE *)v38 + 24))
  {
    if (a4)
      *a4 = objc_retainAutorelease(*((id *)v62 + 5));
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v24 = *((_QWORD *)v62 + 5);
      *(_DWORD *)v67 = 138412290;
      v68 = v24;
      _os_log_error_impl(&dword_1AE4F2000, oslog, OS_LOG_TYPE_ERROR, "GDXPCKnosisService: error during iteratingExecuteKGQ call: %@", v67, 0xCu);
    }

  }
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(buf, 8);

  return v22 == 0;
}

- (id)executeIntent:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1AE920274;
  v27 = sub_1AE920284;
  v28 = 0;
  GDXPCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE4F2000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCKnosisService: executeIntent called.", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v18 = buf;
  v19 = 0x3032000000;
  v20 = sub_1AE920274;
  v21 = sub_1AE920284;
  v8 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1AE92028C;
  v16[3] = &unk_1E5DDA190;
  v16[4] = buf;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = sub_1AE920354;
  v15[3] = &unk_1E5DD9FB8;
  v15[4] = &v23;
  v15[5] = buf;
  objc_msgSend_executeIntent_withCompletion_(v10, v11, (uint64_t)v6, v15);

  v12 = (void *)v24[5];
  if (a4 && !v12)
  {
    *a4 = objc_retainAutorelease(*((id *)v18 + 5));
    v12 = (void *)v24[5];
  }
  v13 = v12;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
