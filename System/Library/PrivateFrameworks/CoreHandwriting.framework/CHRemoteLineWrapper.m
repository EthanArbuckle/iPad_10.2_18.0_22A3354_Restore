@implementation CHRemoteLineWrapper

- (CHRemoteLineWrapper)initWithEnableCachingIfAvailable:(BOOL)a3
{
  CHRemoteLineWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHRemoteLineWrapper;
  result = -[CHRemoteLineWrapper init](&v5, sel_init);
  if (result)
    result->_enableCachingIfAvailable = a3;
  return result;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSXPCConnection *connection;
  objc_super v8;

  if (self)
  {
    objc_msgSend_invalidate(self->_connection, a2, v2, v3, v4, v5);
    connection = self->_connection;
    self->_connection = 0;

  }
  v8.receiver = self;
  v8.super_class = (Class)CHRemoteLineWrapper;
  -[CHRemoteLineWrapper dealloc](&v8, sel_dealloc);
}

- (id)lineWrappingResultForGroups:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  CHRemoteLineWrappingRequest *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSXPCConnection *connection;
  uint64_t v21;
  char *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSXPCConnection *v27;
  NSXPCConnection *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSXPCConnection *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  id *v69;
  id v70;
  id v71;
  id v73;
  _QWORD v74[6];
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t, void *);
  void *v78;
  uint64_t *v79;
  uint64_t v80;
  id *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  id location;
  id *p_location;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  uint8_t buf[8];
  uint64_t v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;

  v8 = a3;
  v9 = a4;
  v10 = [CHRemoteLineWrappingRequest alloc];
  v14 = (id)objc_msgSend_initWithLineWrappableGroups_options_(v10, v11, (uint64_t)v8, (uint64_t)v9, v12, v13);
  v19 = v14;
  if (!self)
  {

    v71 = 0;
    if (!a5)
      goto LABEL_13;
    goto LABEL_12;
  }
  connection = self->_connection;
  v21 = MEMORY[0x1E0C809B0];
  v22 = "CHModelCatalogModelType" + 16;
  if (!connection)
  {
    v73 = v8;
    v23 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v27 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v23, v24, (uint64_t)CFSTR("com.apple.handwritingd.remoterecognition"), 0, v25, v26);
    v28 = self->_connection;
    self->_connection = v27;

    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v29, (uint64_t)&unk_1EF58B478, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x1E0C99E60];
    v35 = objc_opt_class();
    v36 = objc_opt_class();
    v37 = objc_opt_class();
    v38 = objc_opt_class();
    objc_msgSend_setWithObjects_(v34, v39, v35, v40, v41, v42, v36, v37, v38, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v33, v44, (uint64_t)v43, (uint64_t)sel_transcriptionPathsForTokenizedTextResult_recognitionRequest_withReply_, 0, 1);
    objc_msgSend_setRemoteObjectInterface_(self->_connection, v45, (uint64_t)v33, v46, v47, v48);
    objc_initWeak(&location, self);
    v49 = self->_connection;
    *(_QWORD *)buf = v21;
    v93 = 3221225472;
    v94 = (uint64_t)sub_1BE6B55D0;
    v95 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E77F3140;
    objc_copyWeak((id *)&v96, &location);
    objc_msgSend_setInterruptionHandler_(v49, v50, (uint64_t)buf, v51, v52, v53);
    objc_msgSend_setInvalidationHandler_(self->_connection, v54, (uint64_t)&unk_1E77F15D0, v55, v56, v57);
    objc_msgSend_resume(self->_connection, v58, v59, v60, v61, v62);
    objc_destroyWeak((id *)&v96);
    objc_destroyWeak(&location);

    connection = self->_connection;
    v8 = v73;
    v22 = "delType";
    if (!connection)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v63 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v63, OS_LOG_TYPE_FAULT, "XPC connection must be non-nil", buf, 2u);
      }

      connection = self->_connection;
    }
  }
  *(_QWORD *)buf = 0;
  v93 = (uint64_t)buf;
  v94 = 0x3032000000;
  v95 = sub_1BE6B5C54;
  v96 = sub_1BE6B5C64;
  v97 = 0;
  location = 0;
  p_location = &location;
  v88 = 0x3032000000;
  v89 = sub_1BE6B5C54;
  v90 = sub_1BE6B5C64;
  v91 = 0;
  v80 = 0;
  v81 = (id *)&v80;
  v82 = 0x3032000000;
  v83 = sub_1BE6B5C54;
  v84 = sub_1BE6B5C64;
  v85 = 0;
  v75 = v21;
  v76 = *((_QWORD *)v22 + 8);
  v64 = v76;
  v77 = sub_1BE6B5C6C;
  v78 = &unk_1E77F2310;
  v79 = &v80;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(connection, v15, (uint64_t)&v75, v16, v17, v18);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v21;
  v74[1] = v64;
  v74[2] = sub_1BE6B5D88;
  v74[3] = &unk_1E77F3168;
  v74[4] = buf;
  v74[5] = &location;
  objc_msgSend_handleLineWrappingRequest_withReply_(v65, v66, (uint64_t)v19, (uint64_t)v74, v67, v68);
  v69 = v81;
  if (!v81[5])
    v69 = p_location;
  v70 = objc_retainAutorelease(v69[5]);
  self = (CHRemoteLineWrapper *)*(id *)(v93 + 40);

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&location, 8);

  _Block_object_dispose(buf, 8);
  v71 = v70;
  if (a5)
LABEL_12:
    *a5 = objc_retainAutorelease(v71);
LABEL_13:

  return self;
}

- (BOOL)isEqualToRemoteLineWrapper:(id)a3
{
  return self == a3 || self->_enableCachingIfAvailable == *((unsigned __int8 *)a3 + 16);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToRemoteLineWrapper;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToRemoteLineWrapper = objc_msgSend_isEqualToRemoteLineWrapper_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteLineWrapper;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  return 13 * self->_enableCachingIfAvailable + 7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
