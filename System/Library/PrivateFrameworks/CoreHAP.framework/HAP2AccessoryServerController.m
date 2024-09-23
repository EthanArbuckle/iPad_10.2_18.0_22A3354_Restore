@implementation HAP2AccessoryServerController

- (HAP2AccessoryServerController)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HAP2AccessoryServerController)initWithEncoding:(id)a3 secureTransport:(id)a4 operationQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HAP2AccessoryServerController *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v12 = -[HAP2AccessoryServerController initWithEncoding:secureTransport:operationQueue:accessoryFactory:](self, "initWithEncoding:secureTransport:operationQueue:accessoryFactory:", v10, v9, v8, v11);

  return v12;
}

- (HAP2AccessoryServerController)initWithEncoding:(id)a3 secureTransport:(id)a4 operationQueue:(id)a5 accessoryFactory:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HAP2AccessoryServerController *v15;
  uint64_t v16;
  HAP2PropertyLock *propertyLock;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HAP2AccessoryServerController;
  v15 = -[HAP2AccessoryServerController init](&v19, sel_init);
  if (v15)
  {
    +[HAP2PropertyLock lockWithName:](HAP2PropertyLock, "lockWithName:", CFSTR("HAP2AccessoryServerController.propertyLock"));
    v16 = objc_claimAutoreleasedReturnValue();
    propertyLock = v15->_propertyLock;
    v15->_propertyLock = (HAP2PropertyLock *)v16;

    objc_storeStrong((id *)&v15->_encoding, a3);
    objc_storeStrong((id *)&v15->_transport, a4);
    objc_storeStrong((id *)&v15->_operationQueue, a5);
    objc_storeStrong((id *)&v15->_accessoryFactory, a6);
    objc_msgSend(v12, "setDelegate:", v15);
  }

  return v15;
}

- (void)dealloc
{
  HAP2AccessoryServerSecureTransport *transport;
  void *v4;
  objc_super v5;

  transport = self->_transport;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServerSecureTransport closeWithError:completion:](transport, "closeWithError:completion:", v4, &__block_literal_global_17388);

  v5.receiver = self;
  v5.super_class = (Class)HAP2AccessoryServerController;
  -[HAP2AccessoryServerController dealloc](&v5, sel_dealloc);
}

- (id)readAttributeDatabaseWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HAP2AccessoryServerControllerAttributeRequestOperation *v13;
  void *v14;
  void *v15;
  HAP2AccessoryServerControllerAttributeRequestOperation *v16;
  uint64_t v17;
  void *v18;
  HAP2AccessoryServerControllerAttributeRequestOperation *v19;
  void *v20;
  HAP2SerializedOperationQueue *operationQueue;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  HAP2AccessoryServerControllerAttributeRequestOperation *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  HAP2AccessoryServerController *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v31 = self;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%@ Reading the attribute database", buf, 0xCu);
  }
  -[HAP2AccessoryServerController encoding](self, "encoding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v6, "readRequestForAttributeDatabaseWithEncryption:error:", 1, &v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v29;

  if (v7)
  {
    -[HAP2AccessoryServerController transport](self, "transport");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wellKnownEndpoint:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HAP2AccessoryServerController transport](self, "transport");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mimeTypeForWellKnownEndpoint:", 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = [HAP2AccessoryServerControllerAttributeRequestOperation alloc];
    -[HAP2AccessoryServerController encoding](self, "encoding");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServerController transport](self, "transport");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HAP2AccessoryServerControllerOperation initWithName:controller:encoding:transport:request:endpoint:mimeType:timeout:options:](v13, "initWithName:controller:encoding:transport:request:endpoint:mimeType:timeout:options:", CFSTR("Fetch attribute database"), self, v14, v15, v7, v10, 0.0, v12, 0);

    v17 = MEMORY[0x1E0C809B0];
    v18 = (void *)MEMORY[0x1E0CB34C8];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __69__HAP2AccessoryServerController_readAttributeDatabaseWithCompletion___block_invoke;
    v26[3] = &unk_1E894D9E8;
    v26[4] = self;
    v19 = v16;
    v27 = v19;
    v28 = v4;
    objc_msgSend(v18, "blockOperationWithBlock:", v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addDependency:", v19);
    if (self)
      operationQueue = self->_operationQueue;
    else
      operationQueue = 0;
    -[HAP2SerializedOperationQueue addOperation:](operationQueue, "addOperation:", v20);
    objc_initWeak((id *)buf, v19);
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __69__HAP2AccessoryServerController_readAttributeDatabaseWithCompletion___block_invoke_2;
    v24[3] = &unk_1E894DDF8;
    objc_copyWeak(&v25, (id *)buf);
    +[HAP2Cancelable cancelableWithBlock:](HAP2Cancelable, "cancelableWithBlock:", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)readValuesForCharacteristics:(id)a3 timeout:(double)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  id v18;
  void *v19;
  id v21;
  _QWORD v22[5];
  uint8_t buf[4];
  HAP2AccessoryServerController *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v12 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = objc_msgSend(v10, "count");
    v15 = objc_msgSend(v10, "count");
    v16 = "s";
    *(_DWORD *)buf = 138412802;
    v24 = self;
    if (v15 == 1)
      v16 = "";
    v25 = 2048;
    v26 = v14;
    v27 = 2080;
    v28 = v16;
    _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_DEFAULT, "%@ Reading %lu characteristic%s", buf, 0x20u);

  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __89__HAP2AccessoryServerController_readValuesForCharacteristics_timeout_options_completion___block_invoke;
  v22[3] = &unk_1E894D098;
  v22[4] = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v22);
  v21 = 0;
  -[HAP2AccessoryServerController _createOperationsToReadCharacteristics:timeout:options:error:](self, v10, a5, &v21, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v21;
  -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, v17, v18, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)writeValuesForCharacteristics:(id)a3 timeout:(double)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  _BYTE *v26;
  double v27;
  unint64_t v28;
  _QWORD v29[5];
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v12 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = objc_msgSend(v10, "count");
    v15 = objc_msgSend(v10, "count");
    v16 = "s";
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = self;
    if (v15 == 1)
      v16 = "";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2080;
    v31 = (uint64_t (*)(uint64_t, uint64_t))v16;
    _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_DEFAULT, "%@ Writing %lu characteristic%s", buf, 0x20u);

  }
  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __90__HAP2AccessoryServerController_writeValuesForCharacteristics_timeout_options_completion___block_invoke;
  v29[3] = &unk_1E894C728;
  v29[4] = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v29);
  -[HAP2AccessoryServerController encoding](self, "encoding");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "groupingsForWriteRequestsForCharacteristics:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy__17240;
  v32 = __Block_byref_object_dispose__17241;
  v33 = 0;
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __90__HAP2AccessoryServerController_writeValuesForCharacteristics_timeout_options_completion___block_invoke_216;
  v24[3] = &unk_1E894C700;
  v27 = a4;
  v28 = a5;
  v24[4] = self;
  v26 = buf;
  v21 = v20;
  v25 = v21;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v24);
  -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, v21, *(void **)(*(_QWORD *)&buf[8] + 40), v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(buf, 8);
  return v22;
}

- (id)enableNotificationsForCharacteristics:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  HAP2PropertyLock *v22;
  NSObject *v23;
  void *v24;
  id *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  char v32;
  id *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  id v37;
  int v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  int v44;
  unint64_t v45;
  const char *v46;
  void *v47;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _QWORD v53[5];
  id v54;
  _BYTE *v55;
  uint64_t *v56;
  _QWORD v57[6];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  id v64;
  _QWORD v65[5];
  id v66;
  unint64_t v67;
  id obj;
  _QWORD v69[4];
  id v70;
  _QWORD v71[6];
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  _QWORD v78[5];
  id v79;
  id v80;
  _QWORD v81[5];
  id v82;
  _BYTE buf[32];
  HAP2AccessoryServerController *v84;
  uint64_t *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = (_QWORD *)0x1E0C99000;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v11 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = objc_msgSend(v7, "count");
    v14 = objc_msgSend(v7, "count");
    v15 = "s";
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = self;
    if (v14 == 1)
      v15 = "";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)&buf[24] = v15;
    _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEFAULT, "%@ Enabling notifications for %lu characteristic%s", buf, 0x20u);

  }
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke;
  v81[3] = &unk_1E894C750;
  v81[4] = self;
  v16 = v10;
  v82 = v16;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v81);
  v17 = objc_msgSend(v16, "count");
  if (v17 != objc_msgSend(v7, "count"))
  {
    v72 = 0;
    v73 = &v72;
    v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__17240;
    v76 = __Block_byref_object_dispose__17241;
    v77 = 0;
    v18 = MEMORY[0x1E0C809B0];
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_220;
    v71[3] = &unk_1E894C778;
    v71[4] = self;
    v71[5] = &v72;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v71);
    v69[0] = v18;
    v69[1] = 3221225472;
    v69[2] = __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_228;
    v69[3] = &unk_1E894C7E0;
    v19 = v8;
    v70 = v19;
    v20 = (void *)MEMORY[0x1D17B7400](v69);
    v21 = (void *)v73[5];
    if (v21)
    {
      -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, MEMORY[0x1E0C9AA60], v21, v19);
      v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
LABEL_34:

      _Block_object_dispose(&v72, 8);
      goto LABEL_35;
    }
    if (self)
    {
      v58 = 0;
      v59 = &v58;
      v60 = 0x2020000000;
      LOBYTE(v61) = 0;
      v22 = self->_propertyLock;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __75__HAP2AccessoryServerController_isFlagNotificationEnableConsistencyWarning__block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E894DEE8;
      v84 = self;
      v85 = &v58;
      -[HAP2PropertyLock performReadingBlock:](v22, "performReadingBlock:", buf);

      LODWORD(v22) = *((unsigned __int8 *)v59 + 24);
      _Block_object_dispose(&v58, 8);
      if ((_DWORD)v22)
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v23 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = self;
          _os_log_error_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%@ Enabling notification while all notifications disable request has been issued; some notifications will remain enabled",
            buf,
            0xCu);
        }
      }
    }
    -[HAP2AccessoryServerController encoding](self, "encoding");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id *)(v73 + 5);
    obj = (id)v73[5];
    objc_msgSend(v24, "notificationRequestsForCharacteristics:type:error:", v7, 0, &obj);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v25, obj);

    v26 = (void *)v73[5];
    if (v26)
    {
      v49 = 0;
      v27 = 0;
      v28 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_29;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v47, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_231;
    v65[3] = &unk_1E894C808;
    v65[4] = self;
    v67 = a4;
    v30 = v29;
    v66 = v30;
    objc_msgSend(v47, "enumerateObjectsUsingBlock:", v65);
    -[HAP2AccessoryServerController encoding](self, "encoding");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "encodingFeatures");

    if ((v32 & 0x10) != 0)
    {
      v33 = (id *)(v73 + 5);
      v64 = (id)v73[5];
      -[HAP2AccessoryServerController _createOperationsToReadCharacteristics:timeout:options:error:](self, v7, a4, &v64, 0.0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v33, v64);
      if (!v49)
      {
        -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, MEMORY[0x1E0C9AA60], (void *)v73[5], v19);
        v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v49 = 0;
        v28 = 0;
        v27 = 0;
        v38 = 0;
        goto LABEL_27;
      }
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v34 = (id)hap2Log_accessory;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        v44 = objc_msgSend(v49, "count");
        v45 = objc_msgSend(v49, "count");
        v46 = "";
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = self;
        if (v45 > 1)
          v46 = "s";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v44;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = v46;
        _os_log_debug_impl(&dword_1CCE01000, v34, OS_LOG_TYPE_DEBUG, "%@ Adding %d read operation%s after enabling notify", buf, 0x1Cu);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)&buf[24] = __Block_byref_object_copy__17240;
      v84 = (HAP2AccessoryServerController *)__Block_byref_object_dispose__17241;
      v85 = 0;
      v58 = 0;
      v59 = &v58;
      v60 = 0x3032000000;
      v61 = __Block_byref_object_copy__17240;
      v62 = __Block_byref_object_dispose__17241;
      v63 = 0;
      v35 = (void *)MEMORY[0x1D17B7400](v20);
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_235;
      v57[3] = &unk_1E894C830;
      v57[4] = buf;
      v57[5] = &v58;
      v36 = MEMORY[0x1D17B7400](v57);

      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_2_236;
      v53[3] = &unk_1E894C858;
      v9 = v53;
      v53[4] = self;
      v54 = v35;
      v55 = buf;
      v56 = &v58;
      v37 = v35;
      v27 = (void *)MEMORY[0x1D17B7400](v53);

      _Block_object_dispose(&v58, 8);
      _Block_object_dispose(buf, 8);

      v20 = (void *)v36;
    }
    else
    {
      v49 = 0;
      v27 = 0;
    }
    v28 = (void *)objc_msgSend(v30, "copy");
    v38 = 1;
LABEL_27:

    if (!v38)
    {
LABEL_33:

      goto LABEL_34;
    }
    v26 = (void *)v73[5];
LABEL_29:
    -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, v28, v26, v20);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, v49, 0, v27);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = 0;
    }
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_3;
    v50[3] = &unk_1E894DB00;
    v41 = v39;
    v51 = v41;
    v42 = v40;
    v52 = v42;
    +[HAP2Cancelable cancelableWithBlock:](HAP2Cancelable, "cancelableWithBlock:", v50);
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    goto LABEL_33;
  }
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_218;
  v78[3] = &unk_1E894CFF8;
  v78[4] = self;
  v80 = v8;
  v79 = v16;
  -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, MEMORY[0x1E0C9AA60], 0, v78);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();

LABEL_35:
  return v9;
}

- (id)disableNotificationsForCharacteristics:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  unint64_t v29;
  id obj;
  _QWORD v31[6];
  _QWORD v32[5];
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v10 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = objc_msgSend(v8, "count");
    v13 = objc_msgSend(v8, "count");
    v14 = "s";
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = self;
    if (v13 == 1)
      v14 = "";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2080;
    v34 = (uint64_t (*)(uint64_t, uint64_t))v14;
    _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEFAULT, "%@ Disabling notifications for %lu characteristic%s", buf, 0x20u);

  }
  v15 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke;
  v32[3] = &unk_1E894D098;
  v32[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v32);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy__17240;
  v35 = __Block_byref_object_dispose__17241;
  v36 = 0;
  v31[0] = v15;
  v31[1] = 3221225472;
  v31[2] = __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke_237;
  v31[3] = &unk_1E894C778;
  v31[4] = self;
  v31[5] = buf;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v31);
  v16 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v16)
  {
    -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, MEMORY[0x1E0C9AA60], v16, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HAP2AccessoryServerController encoding](self, "encoding");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)&buf[8];
    obj = *(id *)(*(_QWORD *)&buf[8] + 40);
    objc_msgSend(v18, "notificationRequestsForCharacteristics:type:error:", v8, 1, &obj);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v19 + 40), obj);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v27[0] = v15;
      v27[1] = 3221225472;
      v27[2] = __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke_241;
      v27[3] = &unk_1E894C808;
      v27[4] = self;
      v29 = a4;
      v28 = v21;
      objc_msgSend(v20, "enumerateObjectsUsingBlock:", v27);

    }
    v25[0] = v15;
    v25[1] = 3221225472;
    v25[2] = __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke_2;
    v25[3] = &unk_1E894C7E0;
    v26 = v9;
    v23 = (void *)MEMORY[0x1D17B7400](v25);
    -[HAP2AccessoryServerController _maybeBeginCharacteristicOperations:error:completion:]((id *)&self->super.super.isa, v22, *(void **)(*(_QWORD *)&buf[8] + 40), v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(buf, 8);

  return v17;
}

- (id)removePairing:(id)a3 cleanupLocalData:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HAP2AccessoryServerControllerOperation *v21;
  void *v22;
  void *v23;
  HAP2AccessoryServerControllerOperation *v24;
  uint64_t v25;
  HAP2AccessoryServerControllerOperation *v26;
  void *v27;
  HAP2AsynchronousBlockOperation *v28;
  void *v29;
  HAP2SerializedOperationQueue *operationQueue;
  HAP2SerializedOperationQueue *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id location;
  _QWORD v42[5];
  id v43;
  HAP2AccessoryServerControllerOperation *v44;
  id v45;
  _BYTE *v46;
  BOOL v47;
  id v48;
  id v49;
  _BYTE buf[24];
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v10 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEFAULT, "%@ Asking accessory to remove pairing with identifier: %@", buf, 0x16u);

  }
  -[HAP2AccessoryServerController accessoryServer](self, "accessoryServer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "conformsToProtocol:", &unk_1EFA37B20) & 1) != 0)
  {
    -[HAP2AccessoryServerController accessoryServer](self, "accessoryServer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && (objc_msgSend(v14, "isPaired") & 1) != 0)
    {
      v49 = 0;
      -[HAP2AccessoryServerController _getPairingsCharacteristicForServer:error:](self, v14, &v49);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v49;
      if (v15)
      {
        -[HAP2AccessoryServerController encoding](self, "encoding");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v16;
        objc_msgSend(v17, "requestToRemovePairing:characteristic:error:", v8, v15, &v48);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v48;

        if (v18)
        {
          -[HAP2AccessoryServerController transport](self, "transport");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "endpointForCharacteristic:", v15);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          -[HAP2AccessoryServerController transport](self, "transport");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "mimeTypeForCharacteristicRequests");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = [HAP2AccessoryServerControllerOperation alloc];
          -[HAP2AccessoryServerController encoding](self, "encoding");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAP2AccessoryServerController transport](self, "transport");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[HAP2AccessoryServerControllerOperation initWithName:controller:encoding:transport:request:endpoint:mimeType:timeout:options:](v21, "initWithName:controller:encoding:transport:request:endpoint:mimeType:timeout:options:", CFSTR("Remove pairing"), self, v22, v23, v18, v37, 0.0, v36, 0);

          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v51 = __Block_byref_object_copy__17240;
          v52 = __Block_byref_object_dispose__17241;
          v25 = MEMORY[0x1E0C809B0];
          v53 = 0;
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __75__HAP2AccessoryServerController_removePairing_cleanupLocalData_completion___block_invoke;
          v42[3] = &unk_1E894C8D0;
          v42[4] = self;
          v43 = v8;
          v47 = a4;
          v26 = v24;
          v44 = v26;
          v46 = buf;
          v45 = v9;
          v27 = (void *)MEMORY[0x1D17B7400](v42);
          v28 = -[HAP2AsynchronousBlockOperation initWithBlock:]([HAP2AsynchronousBlockOperation alloc], "initWithBlock:", v27);
          v29 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v28;

          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "addDependency:", v26);
          if (self)
            operationQueue = self->_operationQueue;
          else
            operationQueue = 0;
          v31 = operationQueue;
          -[HAP2SerializedOperationQueue addOperation:](v31, "addOperation:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

          objc_initWeak(&location, v26);
          v39[0] = v25;
          v39[1] = 3221225472;
          v39[2] = __75__HAP2AccessoryServerController_removePairing_cleanupLocalData_completion___block_invoke_3;
          v39[3] = &unk_1E894DDF8;
          objc_copyWeak(&v40, &location);
          +[HAP2Cancelable cancelableWithBlock:](HAP2Cancelable, "cancelableWithBlock:", v39);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_destroyWeak(&v40);
          objc_destroyWeak(&location);

          _Block_object_dispose(buf, 8);
        }
        else
        {
          (*((void (**)(id, id))v9 + 2))(v9, v38);
          +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v16 = v38;
      }
      else
      {
        (*((void (**)(id, id))v9 + 2))(v9, v16);
        +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_19;
    }
  }
  else
  {

    v14 = 0;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v33 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = self;
    _os_log_error_impl(&dword_1CCE01000, v33, OS_LOG_TYPE_ERROR, "%@ Cannot call remove pairing on an unpaired accessory", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 16);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v9 + 2))(v9, v34);

  +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v32;
}

- (id)addPairing:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HAP2AccessoryServerControllerOperation *v19;
  void *v20;
  void *v21;
  HAP2AccessoryServerControllerOperation *v22;
  void *v23;
  uint64_t v24;
  HAP2AccessoryServerControllerOperation *v25;
  void *v26;
  HAP2SerializedOperationQueue *operationQueue;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  HAP2AccessoryServerControllerOperation *v38;
  HAP2AccessoryServerController *v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  HAP2AccessoryServerController *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v8 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v44 = self;
    v45 = 2112;
    v46 = v10;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEFAULT, "%@ Asking accessory to add pairing with identifier: %@", buf, 0x16u);

  }
  -[HAP2AccessoryServerController accessoryServer](self, "accessoryServer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "conformsToProtocol:", &unk_1EFA37B20) & 1) != 0)
  {
    -[HAP2AccessoryServerController accessoryServer](self, "accessoryServer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && (objc_msgSend(v12, "isPaired") & 1) != 0)
    {
      v42 = 0;
      -[HAP2AccessoryServerController _getPairingsCharacteristicForServer:error:](self, v12, &v42);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v42;
      if (v13)
      {
        -[HAP2AccessoryServerController encoding](self, "encoding");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v14;
        objc_msgSend(v15, "requestToAddPairing:characteristic:error:", v6, v13, &v41);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v41;

        if (v16)
        {
          -[HAP2AccessoryServerController transport](self, "transport");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "endpointForCharacteristic:", v13);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          -[HAP2AccessoryServerController transport](self, "transport");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "mimeTypeForCharacteristicRequests");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = [HAP2AccessoryServerControllerOperation alloc];
          -[HAP2AccessoryServerController encoding](self, "encoding");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAP2AccessoryServerController transport](self, "transport");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[HAP2AccessoryServerControllerOperation initWithName:controller:encoding:transport:request:endpoint:mimeType:timeout:options:](v19, "initWithName:controller:encoding:transport:request:endpoint:mimeType:timeout:options:", CFSTR("Add pairing"), self, v20, v21, v16, v33, 0.0, v32, 0);

          v23 = (void *)MEMORY[0x1E0CB34C8];
          v24 = MEMORY[0x1E0C809B0];
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __55__HAP2AccessoryServerController_addPairing_completion___block_invoke;
          v37[3] = &unk_1E894D9E8;
          v25 = v22;
          v38 = v25;
          v39 = self;
          v40 = v7;
          objc_msgSend(v23, "blockOperationWithBlock:", v37);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addDependency:", v25);
          if (self)
            operationQueue = self->_operationQueue;
          else
            operationQueue = 0;
          -[HAP2SerializedOperationQueue addOperation:](operationQueue, "addOperation:", v26);
          objc_initWeak((id *)buf, v25);
          v35[0] = v24;
          v35[1] = 3221225472;
          v35[2] = __55__HAP2AccessoryServerController_addPairing_completion___block_invoke_254;
          v35[3] = &unk_1E894DDF8;
          objc_copyWeak(&v36, (id *)buf);
          +[HAP2Cancelable cancelableWithBlock:](HAP2Cancelable, "cancelableWithBlock:", v35);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_destroyWeak(&v36);
          objc_destroyWeak((id *)buf);

        }
        else
        {
          (*((void (**)(id, id))v7 + 2))(v7, v34);
          +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v14 = v34;
      }
      else
      {
        (*((void (**)(id, id))v7 + 2))(v7, v14);
        +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_19;
    }
  }
  else
  {

    v12 = 0;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v29 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v44 = self;
    _os_log_error_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_ERROR, "%@ Cannot call remove pairing on an unpaired accessory", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v7 + 2))(v7, v30);

  +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v28;
}

- (id)listPairingsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HAP2AccessoryServerControllerOperation *v15;
  void *v16;
  void *v17;
  HAP2AccessoryServerControllerOperation *v18;
  uint64_t v19;
  void *v20;
  HAP2AccessoryServerControllerOperation *v21;
  void *v22;
  HAP2SerializedOperationQueue *operationQueue;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[5];
  HAP2AccessoryServerControllerOperation *v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  HAP2AccessoryServerController *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = self;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%@ Asking accessory to list pairings", buf, 0xCu);
  }
  -[HAP2AccessoryServerController accessoryServer](self, "accessoryServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EFA37B20) & 1) != 0)
  {
    -[HAP2AccessoryServerController accessoryServer](self, "accessoryServer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && (objc_msgSend(v7, "isPaired") & 1) != 0)
    {
      v36 = 0;
      -[HAP2AccessoryServerController _getPairingsCharacteristicForServer:error:](self, v7, &v36);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v36;
      if (v8)
      {
        -[HAP2AccessoryServerController encoding](self, "encoding");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v9;
        objc_msgSend(v10, "requestToListPairingsWithCharacteristic:error:", v8, &v35);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v35;

        if (v11)
        {
          -[HAP2AccessoryServerController transport](self, "transport");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "endpointForCharacteristic:", v8);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          -[HAP2AccessoryServerController transport](self, "transport");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "mimeTypeForCharacteristicRequests");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = [HAP2AccessoryServerControllerOperation alloc];
          -[HAP2AccessoryServerController encoding](self, "encoding");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAP2AccessoryServerController transport](self, "transport");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[HAP2AccessoryServerControllerOperation initWithName:controller:encoding:transport:request:endpoint:mimeType:timeout:options:](v15, "initWithName:controller:encoding:transport:request:endpoint:mimeType:timeout:options:", CFSTR("List pairings"), self, v16, v17, v11, v28, 0.0, v14, 0);

          v19 = MEMORY[0x1E0C809B0];
          v20 = (void *)MEMORY[0x1E0CB34C8];
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __60__HAP2AccessoryServerController_listPairingsWithCompletion___block_invoke;
          v32[3] = &unk_1E894D9E8;
          v32[4] = self;
          v21 = v18;
          v33 = v21;
          v34 = v4;
          objc_msgSend(v20, "blockOperationWithBlock:", v32);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addDependency:", v21);
          if (self)
            operationQueue = self->_operationQueue;
          else
            operationQueue = 0;
          -[HAP2SerializedOperationQueue addOperation:](operationQueue, "addOperation:", v22);
          objc_initWeak((id *)buf, v21);
          v30[0] = v19;
          v30[1] = 3221225472;
          v30[2] = __60__HAP2AccessoryServerController_listPairingsWithCompletion___block_invoke_2;
          v30[3] = &unk_1E894DDF8;
          objc_copyWeak(&v31, (id *)buf);
          +[HAP2Cancelable cancelableWithBlock:](HAP2Cancelable, "cancelableWithBlock:", v30);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_destroyWeak(&v31);
          objc_destroyWeak((id *)buf);

        }
        else
        {
          (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v29);
          +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v9 = v29;
      }
      else
      {
        (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v9);
        +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_19;
    }
  }
  else
  {

    v7 = 0;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v25 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v38 = self;
    _os_log_error_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_ERROR, "%@ Cannot call remove pairing on an unpaired accessory", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v26);

  +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v24;
}

- (id)unpairedIdentifyWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HAP2AccessoryServerControllerOperation *v13;
  void *v14;
  void *v15;
  HAP2AccessoryServerControllerOperation *v16;
  void *v17;
  uint64_t v18;
  HAP2AccessoryServerControllerOperation *v19;
  id v20;
  void *v21;
  HAP2SerializedOperationQueue *operationQueue;
  void *v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  HAP2AccessoryServerControllerOperation *v28;
  HAP2AccessoryServerController *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  HAP2AccessoryServerController *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = self;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%@ Performing unpaired identify", buf, 0xCu);
  }
  -[HAP2AccessoryServerController encoding](self, "encoding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v6, "unpairedIdentifyRequestWithError:", &v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v31;

  -[HAP2AccessoryServerController transport](self, "transport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wellKnownEndpoint:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HAP2AccessoryServerController transport](self, "transport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mimeTypeForWellKnownEndpoint:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [HAP2AccessoryServerControllerOperation alloc];
  -[HAP2AccessoryServerController encoding](self, "encoding");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServerController transport](self, "transport");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HAP2AccessoryServerControllerOperation initWithName:controller:encoding:transport:request:endpoint:mimeType:timeout:options:](v13, "initWithName:controller:encoding:transport:request:endpoint:mimeType:timeout:options:", CFSTR("Unpaired identify"), self, v14, v15, v7, v10, 0.0, v12, 0);

  v17 = (void *)MEMORY[0x1E0CB34C8];
  v18 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __64__HAP2AccessoryServerController_unpairedIdentifyWithCompletion___block_invoke;
  v27[3] = &unk_1E894D9E8;
  v19 = v16;
  v28 = v19;
  v29 = self;
  v20 = v4;
  v30 = v20;
  objc_msgSend(v17, "blockOperationWithBlock:", v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addDependency:", v19);
  if (self)
    operationQueue = self->_operationQueue;
  else
    operationQueue = 0;
  -[HAP2SerializedOperationQueue addOperation:](operationQueue, "addOperation:", v21);
  objc_initWeak((id *)buf, v19);
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __64__HAP2AccessoryServerController_unpairedIdentifyWithCompletion___block_invoke_262;
  v25[3] = &unk_1E894DDF8;
  objc_copyWeak(&v26, (id *)buf);
  +[HAP2Cancelable cancelableWithBlock:](HAP2Cancelable, "cancelableWithBlock:", v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);

  return v23;
}

- (void)handleUpdatedMetadataWithOldMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  HAP2AccessoryServerAccessoryCache *accessoryCache;
  id v14;
  int v15;
  HAP2AccessoryServerController *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAP2AccessoryServerController accessoryServer](self, "accessoryServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EFA37D98) & 1) != 0)
  {
    -[HAP2AccessoryServerController accessoryServer](self, "accessoryServer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(v6, "isPaired"))
    {
      v7 = objc_msgSend(v4, "configNumber");
      if (v7 == objc_msgSend(v6, "configNumber"))
      {
        v8 = objc_msgSend(v4, "stateNumber");
        if (v8 != objc_msgSend(v6, "stateNumber"))
        {
          if (hap2LogInitialize_onceToken != -1)
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
          v9 = (void *)hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
          {
            v10 = v9;
            v15 = 138412802;
            v16 = self;
            v17 = 1024;
            v18 = objc_msgSend(v4, "stateNumber");
            v19 = 1024;
            v20 = objc_msgSend(v6, "stateNumber");
            _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "%@ Actively pinging accessory due to updated s#: %u -> %u", (uint8_t *)&v15, 0x18u);

          }
          objc_msgSend(v6, "verifyConnection");
        }
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v11 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          v12 = v11;
          v15 = 138412802;
          v16 = self;
          v17 = 1024;
          v18 = objc_msgSend(v4, "configNumber");
          v19 = 1024;
          v20 = objc_msgSend(v6, "configNumber");
          _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%@ Re-reading attribute database due updated c#: %u -> %u", (uint8_t *)&v15, 0x18u);

        }
        if (self)
          accessoryCache = self->_accessoryCache;
        else
          accessoryCache = 0;
        -[HAP2AccessoryServerAccessoryCache invalidateAccessoryCache](accessoryCache, "invalidateAccessoryCache");
        objc_msgSend(v6, "clearAccessories");
        v14 = (id)objc_msgSend(v6, "updateAccessoriesWithReason:", CFSTR("bonjourUpdate.configNumberChanged"));
      }
    }
  }
  else
  {

    v6 = 0;
  }

}

- (BOOL)mergeWithNewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HAP2AccessoryServerController transport](self, "transport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "mergeWithNewTransport:", v6);
  return (char)v4;
}

- (void)closeSession
{
  uint64_t v3;
  void *v4;
  HAP2AsynchronousBlockOperation *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  HAP2AsynchronousBlockOperation *v10;
  void *v11;
  HAP2SerializedOperationQueue *v12;
  _QWORD v13[6];
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__17240;
  v19 = __Block_byref_object_dispose__17241;
  v20 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__HAP2AccessoryServerController_closeSession__block_invoke;
  v14[3] = &unk_1E894DEE8;
  v14[4] = self;
  v14[5] = &v15;
  v4 = (void *)MEMORY[0x1D17B7400](v14, a2);
  v5 = -[HAP2AsynchronousBlockOperation initWithName:block:]([HAP2AsynchronousBlockOperation alloc], "initWithName:block:", CFSTR("Close session"), v4);
  v6 = (void *)v16[5];
  v16[5] = (uint64_t)v5;

  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __45__HAP2AccessoryServerController_closeSession__block_invoke_268;
  v13[3] = &unk_1E894DEE8;
  v13[4] = self;
  v13[5] = &v15;
  v7 = (id)MEMORY[0x1D17B7400](v13);
  v8 = v7;
  if (self)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__17240;
    v28 = __Block_byref_object_dispose__17241;
    v29 = 0;
    v21[0] = v3;
    v21[1] = 3221225472;
    v21[2] = __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke;
    v21[3] = &unk_1E894D188;
    v21[4] = self;
    v23 = &v24;
    v22 = v7;
    v9 = (void *)MEMORY[0x1D17B7400](v21);
    v10 = -[HAP2AsynchronousBlockOperation initWithName:block:]([HAP2AsynchronousBlockOperation alloc], "initWithName:block:", CFSTR("Disable-all-notifications"), v9);
    v11 = (void *)v25[5];
    v25[5] = (uint64_t)v10;

    v12 = self->_operationQueue;
    -[HAP2SerializedOperationQueue addOperation:](v12, "addOperation:", v25[5]);

    _Block_object_dispose(&v24, 8);
  }

  _Block_object_dispose(&v15, 8);
}

- (void)updateMaxRequestTimeout:(double)a3
{
  void *v5;
  HAP2SerializedOperationQueue *operationQueue;
  HAP2SerializedOperationQueue *v7;
  _QWORD v8[4];
  id v9[2];
  id location;

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__HAP2AccessoryServerController_updateMaxRequestTimeout___block_invoke;
  v8[3] = &unk_1E894E078;
  objc_copyWeak(v9, &location);
  v9[1] = *(id *)&a3;
  v5 = (void *)MEMORY[0x1D17B7400](v8);
  if (self)
    operationQueue = self->_operationQueue;
  else
    operationQueue = 0;
  v7 = operationQueue;
  -[HAP2SerializedOperationQueue addBlock:](v7, "addBlock:", v5);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)secureTransport:(id)a3 didChangeState:(unint64_t)a4 error:(id)a5
{
  id v8;
  HAP2PropertyLock *propertyLock;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];

  v13 = a3;
  v8 = a5;
  if (!a4 || a4 == 3)
  {
    -[HAP2AccessoryServerController setSessionStartTime:]((uint64_t)self, 0);
    -[HAP2AccessoryServerController accessoryServer](self, "accessoryServer", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EFA37D98) & 1) != 0)
    {
      -[HAP2AccessoryServerController accessoryServer](self, "accessoryServer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 && objc_msgSend(v11, "isPaired"))
      {
        objc_msgSend(v11, "accessories");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", &__block_literal_global_337);

      }
    }
    else
    {

      v11 = 0;
    }

  }
  else if (a4 == 1 && self)
  {
    propertyLock = self->_propertyLock;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__HAP2AccessoryServerController_bumpSessionNumber__block_invoke;
    v14[3] = &unk_1E894DD08;
    v14[4] = self;
    -[HAP2PropertyLock performWritingBlock:](propertyLock, "performWritingBlock:", v14, v13);
  }

}

- (void)secureTransport:(id)a3 didReceiveEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  HAP2AsynchronousBlockOperation *v13;
  void *v14;
  HAP2SerializedOperationQueue *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[6];
  _BYTE buf[24];
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[HAP2AccessoryServerController encoding](self, "encoding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v6, "eventsForData:error:", v5, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v18;
  if (v7)
  {
    -[HAP2AccessoryServerController accessoryServer](self, "accessoryServer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EFA37D98) & 1) != 0)
    {
      -[HAP2AccessoryServerController accessoryServer](self, "accessoryServer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 && (objc_msgSend(v10, "isPaired") & 1) != 0)
      {
        if (-[HAP2AccessoryServerController isSessionExpired]((uint64_t)self))
        {
          if (hap2LogInitialize_onceToken != -1)
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
          v11 = hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = self;
            _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%@ Received event on session that lasted too long, restarting session", buf, 0xCu);
          }
          if (self)
          {
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v21 = __Block_byref_object_copy__17240;
            v22 = __Block_byref_object_dispose__17241;
            v23 = 0;
            v19[0] = MEMORY[0x1E0C809B0];
            v19[1] = 3221225472;
            v19[2] = __56__HAP2AccessoryServerController__scheduleRestartSession__block_invoke;
            v19[3] = &unk_1E894DEE8;
            v19[4] = self;
            v19[5] = buf;
            v12 = (void *)MEMORY[0x1D17B7400](v19);
            v13 = -[HAP2AsynchronousBlockOperation initWithName:block:]([HAP2AsynchronousBlockOperation alloc], "initWithName:block:", CFSTR("Restart security session"), v12);
            v14 = *(void **)(*(_QWORD *)&buf[8] + 40);
            *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v13;

            v15 = self->_operationQueue;
            -[HAP2SerializedOperationQueue addOperation:](v15, "addOperation:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

            _Block_object_dispose(buf, 8);
          }
        }
        objc_msgSend(v10, "handleEvents:", v7);
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {

      v10 = 0;
    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v17 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_error_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%@ Ignoring event when no longer paired", buf, 0xCu);
    }
    goto LABEL_22;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v16 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_error_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%@ Failed to parse event data: %@", buf, 0x16u);
  }
LABEL_23:

}

- (void)secureTransport:(id)a3 needsLocalPairingIdentityWithCompletion:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD, void *))a4;
  -[HAP2AccessoryServerController accessoryServer](self, "accessoryServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "browser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v13);
    goto LABEL_13;
  }
  if (HAPIsHH2Enabled_onceToken != -1)
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
  if (HAPIsHH2Enabled_hh2Enabled != 1)
    goto LABEL_11;
  -[HAP2AccessoryServerController accessoryServer](self, "accessoryServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_11:
    -[HAP2AccessoryServerController accessoryServer](self, "accessoryServer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deviceID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchControllerKeyForDeviceId:completion:", v14, v5);

LABEL_13:
    goto LABEL_14;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v12 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v11;
    _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEFAULT, "Using Pairing Identity: %@", (uint8_t *)&v15, 0xCu);
  }
  ((void (**)(id, void *, void *))v5)[2](v5, v11, 0);

LABEL_14:
}

- (void)secureTransport:(id)a3 needsRemotePairingIdentityForDeviceID:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(id, _QWORD, void *);
  uint8_t buf[4];
  HAP2AccessoryServerController *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, _QWORD, void *))a5;
  -[HAP2AccessoryServerController accessoryServer](self, "accessoryServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v17 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      _os_log_error_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%@ No accessory server", buf, 0xCu);
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = 2;
    goto LABEL_15;
  }
  objc_msgSend(v9, "deviceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToDeviceID:", v7);

  if ((v12 & 1) == 0)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v20 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v22 = v20;
      objc_msgSend(v10, "deviceID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = self;
      v29 = 2112;
      v30 = v23;
      v31 = 2112;
      v32 = v7;
      _os_log_error_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "%@ Accessory device ID doesn't match %@ -> %@", buf, 0x20u);

    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = 9;
LABEL_15:
    objc_msgSend(v18, "hapErrorWithCode:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v14);
    goto LABEL_22;
  }
  objc_msgSend(v10, "browser");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "storage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __98__HAP2AccessoryServerController_secureTransport_needsRemotePairingIdentityForDeviceID_completion___block_invoke;
    v24[3] = &unk_1E894CC70;
    v25 = v7;
    v26 = v8;
    objc_msgSend(v14, "fetchKeysForIdentifiers:completion:", v15, v24);

    v16 = v25;
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v21 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      _os_log_error_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%@ No storage server", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v16);
  }

LABEL_22:
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[HAP2AccessoryServerController accessoryServer](self, "accessoryServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)HAP2AccessoryServerController;
  -[HAP2LoggingObject description](&v10, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ [%@/%@]"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (HAP2AccessoryServerPrivate)accessoryServer
{
  return (HAP2AccessoryServerPrivate *)objc_loadWeakRetained((id *)&self->_accessoryServer);
}

- (void)setAccessoryServer:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryServer, a3);
}

- (HAP2AccessoryServerEncoding)encoding
{
  return self->_encoding;
}

- (HAP2AccessoryServerSecureTransport)transport
{
  return self->_transport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryFactory, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_accessoryCache, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_encoding, 0);
  objc_destroyWeak((id *)&self->_accessoryServer);
}

void __98__HAP2AccessoryServerController_secureTransport_needsRemotePairingIdentityForDeviceID_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  HAPPairingIdentity *v4;
  void *v5;
  HAPPairingIdentity *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v9);
    if (v3)
    {
      v4 = [HAPPairingIdentity alloc];
      objc_msgSend(*(id *)(a1 + 32), "deviceIDString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:permissions:](v4, "initWithIdentifier:publicKey:privateKey:permissions:", v5, v3, 0, 0);

      (*(void (**)(_QWORD, HAPPairingIdentity *, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v6, 0);
    }
    else
    {
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 12);
      v6 = (HAPPairingIdentity *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, HAPPairingIdentity *))(v8 + 16))(v8, 0, v6);
    }

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v3);
  }

}

- (uint64_t)isSessionExpired
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  if (result)
  {
    v1 = result;
    v5 = 0;
    v6 = &v5;
    v7 = 0x2020000000;
    v8 = 0;
    v2 = *(id *)(result + 72);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __49__HAP2AccessoryServerController_sessionStartTime__block_invoke;
    v4[3] = &unk_1E894DEE8;
    v4[4] = v1;
    v4[5] = &v5;
    objc_msgSend(v2, "performReadingBlock:", v4);

    v3 = v6[3];
    _Block_object_dispose(&v5, 8);
    if (v3)
    {
      if (v3 == 1)
      {
        return 1;
      }
      else
      {
        mach_absolute_time();
        return (unint64_t)(UpTicksToMilliseconds() - v3) > 0x240C83FF;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void __56__HAP2AccessoryServerController__scheduleRestartSession__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[4];
  __int128 v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((-[HAP2AccessoryServerController isSessionExpired](*(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "transport");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__HAP2AccessoryServerController__scheduleRestartSession__block_invoke_325;
    v5[3] = &unk_1E894C8F8;
    v6 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v2, "closeWithError:completion:", 0, v5);

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v3 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_INFO, "%@ Aborting restart operation", buf, 0xCu);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "finish");
  }
}

void __56__HAP2AccessoryServerController__scheduleRestartSession__block_invoke_325(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "transport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__HAP2AccessoryServerController__scheduleRestartSession__block_invoke_2;
  v3[3] = &unk_1E894C8F8;
  v4 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v2, "openWithCompletion:", v3);

}

uint64_t __56__HAP2AccessoryServerController__scheduleRestartSession__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v2 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1CCE01000, v2, OS_LOG_TYPE_INFO, "%@ Done restarting session", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "finish");
}

uint64_t __49__HAP2AccessoryServerController_sessionStartTime__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

- (uint64_t)setSessionStartTime:(uint64_t)result
{
  void *v2;
  _QWORD v3[6];

  if (result)
  {
    v2 = *(void **)(result + 72);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __53__HAP2AccessoryServerController_setSessionStartTime___block_invoke;
    v3[3] = &unk_1E894D3B0;
    v3[4] = result;
    v3[5] = a2;
    return objc_msgSend(v2, "performWritingBlock:", v3);
  }
  return result;
}

void __70__HAP2AccessoryServerController_secureTransport_didChangeState_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "services");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_338);

}

void __70__HAP2AccessoryServerController_secureTransport_didChangeState_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "characteristics");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_339);

}

uint64_t __70__HAP2AccessoryServerController_secureTransport_didChangeState_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEventNotificationsEnabled:", 0);
}

uint64_t __53__HAP2AccessoryServerController_setSessionStartTime___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __50__HAP2AccessoryServerController_bumpSessionNumber__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

void __57__HAP2AccessoryServerController_updateMaxRequestTimeout___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    -[HAP2AccessoryServerController _updateMaxRequestTimeout:](WeakRetained, *(double *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_updateMaxRequestTimeout:(id *)a1
{
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  int v16;
  id *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1[10], "assertCurrentQueue");
    objc_msgSend(a1, "accessoryServer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EFA37B20))
    {
      objc_msgSend(a1, "accessoryServer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

    v6 = objc_msgSend(v5, "isPaired");
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if ((v6 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        v16 = 138412546;
        v17 = a1;
        v18 = 2048;
        v19 = a2;
        _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%@ Setting max request timeout to %f seconds", (uint8_t *)&v16, 0x16u);
      }
      objc_msgSend(a1, "transport");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateMaxRequestTimeout:", a2);

      if (fabs(a2) >= 2.22044605e-16)
      {
        v9 = a1[8];
        if (v9)
        {
          v10 = v9;
          objc_msgSend(a1[8], "sleepInterval");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToNumber:", v12);

          if ((v13 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (hap2LogInitialize_onceToken != -1)
              dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
            v15 = hap2Log_accessory;
            if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
            {
              v16 = 138412546;
              v17 = a1;
              v18 = 2112;
              v19 = *(double *)&v14;
              _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%@ Updating cached sleep interval to: %@", (uint8_t *)&v16, 0x16u);
            }
            objc_msgSend(a1[8], "setSleepInterval:", v14);
            -[HAP2AccessoryServerController saveAccessoryCache]((uint64_t)a1);

          }
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      v16 = 138412290;
      v17 = a1;
      _os_log_debug_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%@ Ignoring max request timeout update for unpaired accessory", (uint8_t *)&v16, 0xCu);
    }

  }
}

- (void)saveAccessoryCache
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 80), "assertCurrentQueue");
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v2 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = a1;
    _os_log_impl(&dword_1CCE01000, v2, OS_LOG_TYPE_INFO, "%@ Request to save the accessory cache", buf, 0xCu);
  }
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend((id)a1, "accessoryServer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "browser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend((id)objc_opt_class(), "controllerIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      cacheFileIdentifierForAccessoryServer(v6, v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)MEMORY[0x1E0CB36F8];
      v9 = *(void **)(a1 + 64);
      v17 = 0;
      v10 = v9;
      objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v17;

      if (v11)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __51__HAP2AccessoryServerController_saveAccessoryCache__block_invoke;
        v16[3] = &unk_1E894DD58;
        v16[4] = a1;
        objc_msgSend(v5, "saveCacheForIdentifier:data:completion:", v7, v11, v16);
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v15 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v19 = a1;
          v20 = 2112;
          v21 = v12;
          _os_log_error_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%@ Unable to serialize accessory cache: %@", buf, 0x16u);
        }
      }

    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v14 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = a1;
        _os_log_error_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%@ Unable to get to the storage to save accessory cache", buf, 0xCu);
      }
    }

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v13 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = a1;
      _os_log_error_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "%@ No cache to save", buf, 0xCu);
    }
  }
}

void __51__HAP2AccessoryServerController_saveAccessoryCache__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v4 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_ERROR, "%@ Unable to save cache to disk: %@", (uint8_t *)&v6, 0x16u);
    }
  }

}

void __45__HAP2AccessoryServerController_closeSession__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[HAP2AccessoryServerController setFlagNotificationEnableConsistencyWarning:](*(_QWORD *)(a1 + 32), 0);
  if ((-[HAP2AccessoryServerController isSessionExpired](*(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v2 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1CCE01000, v2, OS_LOG_TYPE_INFO, "%@ Closing active session", buf, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "transport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__HAP2AccessoryServerController_closeSession__block_invoke_265;
  v5[3] = &unk_1E894C8F8;
  v6 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v4, "closeWithError:completion:", 0, v5);

}

uint64_t __45__HAP2AccessoryServerController_closeSession__block_invoke_268(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[10];
  return objc_msgSend(v1, "addOperation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD v24[5];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accessoryServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "conformsToProtocol:", &unk_1EFA37D98) & 1) == 0)
  {

    v3 = 0;
LABEL_11:
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "finish");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "accessoryServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || (objc_msgSend(v3, "isPaired") & 1) == 0)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke_2;
  v24[3] = &unk_1E894C998;
  v24[4] = *(_QWORD *)(a1 + 32);
  v6 = (void *)MEMORY[0x1D17B7400](v24);
  -[HAP2AccessoryServerController setFlagNotificationEnableConsistencyWarning:](*(_QWORD *)(a1 + 32), 1);
  objc_msgSend(v3, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v5;
  v20 = 3221225472;
  v21 = __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke_297;
  v22 = &unk_1E894D138;
  v8 = v4;
  v23 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v19);

  v9 = objc_msgSend(v8, "count", v19, v20, v21, v22);
  if (hap2LogInitialize_onceToken != -1)
  {
    v18 = v9;
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v9 = v18;
  }
  v10 = hap2Log_accessory;
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = v10;
      v13 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 138412546;
      v26 = v11;
      v27 = 2048;
      v28 = v13;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEFAULT, "%@ Disabling all %lu accessory characteristic notification(s)", buf, 0x16u);

    }
    v14 = *(void **)(a1 + 32);
    v15 = (void *)objc_msgSend(v8, "copy");
    v16 = (id)objc_msgSend(v14, "disableNotificationsForCharacteristics:options:completion:", v15, 2, v6);

  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
  {
    v17 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v26 = v17;
    _os_log_debug_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEBUG, "%@ Accessory has no characteristic notification enabled", buf, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "finish");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

LABEL_12:
}

void __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v4;
  NSObject *v5;
  uint64_t v6;
  const __CFString *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = CFSTR("success");
    if (v4)
      v7 = v4;
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%@ Disabled all notifications (%@)", (uint8_t *)&v8, 0x16u);
  }

}

- (uint64_t)setFlagNotificationEnableConsistencyWarning:(uint64_t)result
{
  void *v2;
  _QWORD v3[5];
  char v4;

  if (result)
  {
    v2 = *(void **)(result + 72);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __77__HAP2AccessoryServerController_setFlagNotificationEnableConsistencyWarning___block_invoke;
    v3[3] = &unk_1E894D770;
    v3[4] = result;
    v4 = a2;
    return objc_msgSend(v2, "performWritingBlock:", v3);
  }
  return result;
}

void __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke_297(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke_2_298;
  v4[3] = &unk_1E894C9C0;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke_2_298(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke_3;
  v4[3] = &unk_1E894D098;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __72__HAP2AccessoryServerController__disableAllCharacteristicsNotification___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "eventNotificationsEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t __77__HAP2AccessoryServerController_setFlagNotificationEnableConsistencyWarning___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __45__HAP2AccessoryServerController_closeSession__block_invoke_265(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v2 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1CCE01000, v2, OS_LOG_TYPE_INFO, "%@ Done closing session", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "finish");
}

void __64__HAP2AccessoryServerController_unpairedIdentifyWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[45];
  v3 = v2;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = hap2Log_accessory;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%@ Identify completed successfully", (uint8_t *)&v12, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = v4;
      objc_msgSend(v8, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v11;
      _os_log_error_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%@ Unpaired identify failed with error: %@", (uint8_t *)&v12, 0x16u);

    }
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __64__HAP2AccessoryServerController_unpairedIdentifyWithCompletion___block_invoke_262(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "cancelWithError:", v3);

}

- (id)_getPairingsCharacteristicForServer:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v16[5];
  _QWORD v17[5];
  __int128 v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "primaryAccessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__17240;
      v26 = __Block_byref_object_dispose__17241;
      v27 = 0;
      objc_msgSend(v7, "services");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __75__HAP2AccessoryServerController__getPairingsCharacteristicForServer_error___block_invoke;
      v17[3] = &unk_1E894D3D8;
      v17[4] = &buf;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v17);

      v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v11)
      {
        *(_QWORD *)&v18 = 0;
        *((_QWORD *)&v18 + 1) = &v18;
        v19 = 0x3032000000;
        v20 = __Block_byref_object_copy__17240;
        v21 = __Block_byref_object_dispose__17241;
        v22 = 0;
        objc_msgSend(v11, "characteristics");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v10;
        v16[1] = 3221225472;
        v16[2] = __75__HAP2AccessoryServerController__getPairingsCharacteristicForServer_error___block_invoke_246;
        v16[3] = &unk_1E894D1F0;
        v16[4] = &v18;
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

        a1 = *(id *)(*((_QWORD *)&v18 + 1) + 40);
        _Block_object_dispose(&v18, 8);

LABEL_19:
        _Block_object_dispose(&buf, 8);

        goto LABEL_20;
      }
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v14 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v18) = 138412290;
        *(_QWORD *)((char *)&v18 + 4) = a1;
        _os_log_error_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%@ Cannot find pairing service", (uint8_t *)&v18, 0xCu);
        if (a3)
          goto LABEL_14;
      }
      else if (a3)
      {
LABEL_14:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
        a1 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      a1 = 0;
      goto LABEL_19;
    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v13 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = a1;
      _os_log_error_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "%@ Cannot call remove pairing before reading the attribute database", (uint8_t *)&buf, 0xCu);
      if (a3)
        goto LABEL_9;
    }
    else if (a3)
    {
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
      a1 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

      goto LABEL_21;
    }
    a1 = 0;
    goto LABEL_20;
  }
LABEL_21:

  return a1;
}

void __60__HAP2AccessoryServerController_listPairingsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id *v3;
  void (**v4)(id, void *, _QWORD);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = (id *)*(id *)(a1 + 40);
  v4 = v2;
  if (v1)
  {
    objc_msgSend(*(id *)(v1 + 80), "assertCurrentQueue");
    if (v3 && (v5 = v3[45]) != 0)
    {
      v6 = v5;
      if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EFA49C00))
        v7 = v6;
      else
        v7 = 0;
      objc_msgSend(v7, "pairings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v8, 0);

    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v11 = v9;
        objc_msgSend(v3, "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412546;
        v14 = v1;
        v15 = 2112;
        v16 = v12;
        _os_log_error_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%@ List pairings failed with error: %@", (uint8_t *)&v13, 0x16u);

      }
      objc_msgSend(v3, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v10);

      v6 = 0;
    }

  }
}

void __60__HAP2AccessoryServerController_listPairingsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "cancelWithError:", v3);

}

void __75__HAP2AccessoryServerController__getPairingsCharacteristicForServer_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("00000055-0000-1000-8000-0026BB765291"));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __75__HAP2AccessoryServerController__getPairingsCharacteristicForServer_error___block_invoke_246(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("00000050-0000-1000-8000-0026BB765291"));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __55__HAP2AccessoryServerController_addPairing_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && (v3 = *(id *)(v2 + 360)) != 0)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v5 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = v5;
      objc_msgSend(v8, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v11;
      _os_log_error_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%@ Add pairing failed with error: %@", (uint8_t *)&v12, 0x16u);

    }
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    v4 = 0;
  }

}

void __55__HAP2AccessoryServerController_addPairing_completion___block_invoke_254(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "cancelWithError:", v3);

}

void __75__HAP2AccessoryServerController_removePairing_cleanupLocalData_completion___block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD *v7;
  void (**v8)(_QWORD);
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  _QWORD v17[4];
  __int128 v18;
  _QWORD v19[4];
  id v20;
  void *v21;
  _QWORD *v22;
  __int128 buf;
  void (*v24)(uint64_t, void *);
  void *v25;
  void *v26;
  void (**v27)(_QWORD);
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 72);
  v3 = *(void **)(a1 + 48);
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__HAP2AccessoryServerController_removePairing_cleanupLocalData_completion___block_invoke_2;
  v17[3] = &unk_1E894C8A8;
  v16 = *(_OWORD *)(a1 + 56);
  v5 = (id)v16;
  v18 = v16;
  v6 = v3;
  v7 = v17;
  if (v1)
  {
    v19[0] = v4;
    v19[1] = 3221225472;
    v19[2] = __108__HAP2AccessoryServerController__removePairingCompletionWithIdentity_cleanupLocalData_operation_completion___block_invoke;
    v19[3] = &unk_1E894D9E8;
    v20 = v6;
    v21 = v1;
    v22 = v7;
    v8 = (void (**)(_QWORD))MEMORY[0x1D17B7400](v19);
    if (v2)
    {
      objc_msgSend(v1, "accessoryServer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "browser");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v12 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v1;
          _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%@ Removing accessory database cache", (uint8_t *)&buf, 0xCu);
        }
        objc_msgSend((id)objc_opt_class(), "controllerIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        cacheFileIdentifierForAccessoryServer(v13, v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "storage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf = v4;
        *((_QWORD *)&buf + 1) = 3221225472;
        v24 = __108__HAP2AccessoryServerController__removePairingCompletionWithIdentity_cleanupLocalData_operation_completion___block_invoke_251;
        v25 = &unk_1E894D798;
        v26 = v1;
        v27 = v8;
        objc_msgSend(v15, "removeCacheForIdentifier:completion:", v14, &buf);

        goto LABEL_11;
      }

    }
    v8[2](v8);
LABEL_11:

  }
}

void __75__HAP2AccessoryServerController_removePairing_cleanupLocalData_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "cancelWithError:", v3);

}

void __75__HAP2AccessoryServerController_removePairing_cleanupLocalData_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = a2;
  objc_msgSend(v3, "finish");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __108__HAP2AccessoryServerController__removePairingCompletionWithIdentity_cleanupLocalData_operation_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && (v3 = *(id *)(v2 + 360)) != 0)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v5 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = v5;
      objc_msgSend(v8, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v11;
      _os_log_error_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%@ Remove pairing failed with error: %@", (uint8_t *)&v12, 0x16u);

    }
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    v4 = 0;
  }

}

void __108__HAP2AccessoryServerController__removePairingCompletionWithIdentity_cleanupLocalData_operation_completion___block_invoke_251(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __108__HAP2AccessoryServerController__removePairingCompletionWithIdentity_cleanupLocalData_operation_completion___block_invoke_2;
  v8[3] = &unk_1E894D9E8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v4 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 40);
  v5 = (void *)MEMORY[0x1D17B7400](v8);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(void **)(v6 + 80);
  else
    v7 = 0;
  objc_msgSend(v7, "addConcurrentBlock:", v5);

}

uint64_t __108__HAP2AccessoryServerController__removePairingCompletionWithIdentity_cleanupLocalData_operation_completion___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v2 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1CCE01000, v2, OS_LOG_TYPE_INFO, "%@ Cache removal finished with error: %@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    characteristicDescriptionFromCharacteristic(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%@  - %@", (uint8_t *)&v8, 0x16u);

  }
}

void __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke_237(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if ((objc_msgSend(v6, "properties") & 1) != 0)
  {
    objc_msgSend(v6, "instanceID");

    objc_msgSend(v6, "type");
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v15 = v13;
      v16 = 2112;
      v17 = v6;
      _os_log_error_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%@ Unable to change notification configuration characteristic: %@", buf, 0x16u);
    }
    v8 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to update notification configuration for characteristic %@."), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, v9, CFSTR("Characteristic does not support notifications."), 0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a4 = 1;
  }

}

- (id)_maybeBeginCharacteristicOperations:(void *)a3 error:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id location;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    if (v8)
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke;
      v33[3] = &unk_1E894D9E8;
      v33[4] = a1;
      v11 = &v35;
      v35 = v9;
      v34 = v8;
      v12 = (void *)MEMORY[0x1D17B7400](v33);
      objc_msgSend(a1[10], "addBlock:", v12);
      +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
      a1 = (id *)objc_claimAutoreleasedReturnValue();

      v13 = v34;
    }
    else if (objc_msgSend(v7, "count"))
    {
      v14 = (void *)MEMORY[0x1E0CB34C8];
      v15 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_3;
      v28[3] = &unk_1E894D9E8;
      v28[4] = a1;
      v30 = v10;
      v16 = v7;
      v29 = v16;
      objc_msgSend(v14, "blockOperationWithBlock:", v28);
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x3032000000;
      v26[3] = __Block_byref_object_copy__17240;
      v26[4] = __Block_byref_object_dispose__17241;
      v27 = 0;
      v23[0] = v15;
      v23[1] = 3221225472;
      v23[2] = __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_4;
      v23[3] = &unk_1E894C920;
      v25 = v26;
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v24 = v17;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v23);
      v18 = a1[10];
      objc_msgSend(v18, "addOperation:", v17);

      objc_initWeak(&location, v16);
      v20[0] = v15;
      v20[1] = 3221225472;
      v20[2] = __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_5;
      v20[3] = &unk_1E894DDF8;
      objc_copyWeak(&v21, &location);
      +[HAP2Cancelable cancelableWithBlock:](HAP2Cancelable, "cancelableWithBlock:", v20);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
      v11 = &v30;
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);

      _Block_object_dispose(v26, 8);
      v13 = v29;
    }
    else
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_2;
      v31[3] = &unk_1E894D5E0;
      v31[4] = a1;
      v11 = &v32;
      v32 = v10;
      v13 = (void *)MEMORY[0x1D17B7400](v31);
      objc_msgSend(a1[10], "addBlock:", v13);
      +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }

  }
  return a1;
}

void __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke_241(uint64_t a1, void *a2)
{
  id v3;

  -[HAP2AccessoryServerController _notificationOperationForRequest:operationDescription:options:](*(HAP2AccessoryServerControllerOperation **)(a1 + 32), a2, CFSTR("Disable-Notify"), *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6)
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_244);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __91__HAP2AccessoryServerController_disableNotificationsForCharacteristics_options_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(v4, "characteristic");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEventNotificationsEnabled:", 0);

  }
}

- (HAP2AccessoryServerControllerOperation)_notificationOperationForRequest:(void *)a3 operationDescription:(uint64_t)a4 options:
{
  HAP2AccessoryServerControllerOperation *v4;
  void *v6;
  id v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HAP2AccessoryServerControllerOperation *v25;
  void *v26;
  void *v27;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v4 = a1;
  if (a1)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = a3;
    v8 = a2;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "characteristics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __characteristicDescriptionsFromRequest_block_invoke;
    v32[3] = &unk_1E894C728;
    v33 = v12;
    v13 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v32);
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@: %@"), v10, v7, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v8, "characteristics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "characteristics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __95__HAP2AccessoryServerController__notificationOperationForRequest_operationDescription_options___block_invoke;
    v30[3] = &unk_1E894C728;
    v31 = v18;
    v20 = v18;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v30);

    -[HAP2AccessoryServerControllerOperation transport](v4, "transport");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "endpointForCharacteristics:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[HAP2AccessoryServerControllerOperation transport](v4, "transport");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "mimeTypeForCharacteristicRequests");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = [HAP2AccessoryServerControllerOperation alloc];
    -[HAP2AccessoryServerControllerOperation encoding](v4, "encoding");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServerControllerOperation transport](v4, "transport");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[HAP2AccessoryServerControllerOperation initWithName:controller:encoding:transport:request:endpoint:mimeType:timeout:options:](v25, "initWithName:controller:encoding:transport:request:endpoint:mimeType:timeout:options:", v15, v4, v26, v27, v8, v22, 0.0, v24, a4);

  }
  return v4;
}

void __95__HAP2AccessoryServerController__notificationOperationForRequest_operationDescription_options___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristic");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke(void **a1)
{
  -[HAP2AccessoryServerController _callCharacteristicCompletion:operations:error:](a1[4], a1[6], 0, a1[5]);
}

void __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_2(uint64_t a1)
{
  -[HAP2AccessoryServerController _callCharacteristicCompletion:operations:error:](*(void **)(a1 + 32), *(void **)(a1 + 40), MEMORY[0x1E0C9AA60], 0);
}

void __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_3(void **a1)
{
  -[HAP2AccessoryServerController _callCharacteristicCompletion:operations:error:](a1[4], a1[6], a1[5], 0);
}

void __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_QWORD *)(v5 + 40))
  {
    objc_msgSend(v3, "addDependency:");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
  }
  else
  {
    v6 = 0;
  }
  *(_QWORD *)(v5 + 40) = v4;
  v7 = v4;

  objc_msgSend(*(id *)(a1 + 32), "addDependency:", v7);
}

void __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_6;
  v6[3] = &unk_1E894C948;
  v7 = v3;
  v4 = v3;
  objc_msgSend(WeakRetained, "enumerateObjectsUsingBlock:", v6);

}

uint64_t __86__HAP2AccessoryServerController__maybeBeginCharacteristicOperations_error_completion___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancelWithError:", *(_QWORD *)(a1 + 32));
}

- (void)_callCharacteristicCompletion:(void *)a3 operations:(void *)a4 error:
{
  void (**v7)(id, _QWORD, id);
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t, _BYTE *);
  void *v18;
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    if (v9)
    {
      v7[2](v7, 0, v9);
    }
    else if (objc_msgSend(v8, "count"))
    {
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__17240;
      v33 = __Block_byref_object_dispose__17241;
      v34 = 0;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v24 = &v23;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__17240;
      v27 = __Block_byref_object_dispose__17241;
      v28 = 0;
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __80__HAP2AccessoryServerController__callCharacteristicCompletion_operations_error___block_invoke;
      v18 = &unk_1E894CA88;
      v19 = a1;
      v21 = &v23;
      v12 = v11;
      v20 = v12;
      v22 = &v29;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v15);
      v13 = (void *)v30[5];
      if (v13)
        -[HAP2AccessoryServerController _handleUpdatedValuesFromResponse:](a1, v13);
      if (v24[5])
      {
        ((void (*)(void (**)(id, _QWORD, id), _QWORD))v7[2])(v7, 0);
      }
      else
      {
        v14 = (void *)objc_msgSend(v12, "copy", v15, v16, v17, v18, v19);
        ((void (**)(id, void *, id))v7)[2](v7, v14, 0);

      }
      _Block_object_dispose(&v23, 8);

      _Block_object_dispose(&v29, 8);
    }
    else
    {
      v7[2](v7, MEMORY[0x1E0C9AA60], 0);
    }
  }

}

void __80__HAP2AccessoryServerController__callCharacteristicCompletion_operations_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  _QWORD *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _QWORD *v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[5];
  _QWORD *v38;
  id v39;
  _QWORD v40[5];
  _QWORD v41[6];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  _QWORD *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = objc_msgSend(v6, "isCancelled");
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v8 = hap2Log_accessory;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v43 = v12;
      v44 = 2112;
      v45 = v6;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%@ Operation completed successfully: %@", buf, 0x16u);
    }
    if (v6)
      v13 = (void *)v6[44];
    else
      v13 = 0;
    v14 = v13;
    if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EFA336F0))
    {
      if (v6)
        v15 = (void *)v6[44];
      else
        v15 = 0;
      v16 = v15;
    }
    else
    {
      v16 = 0;
    }

    if (v6)
      v17 = (void *)v6[45];
    else
      v17 = 0;
    v18 = v17;
    if ((objc_msgSend(v18, "conformsToProtocol:", &unk_1EFA35DE8) & 1) != 0)
    {
      if (v6)
        v19 = (void *)v6[45];
      else
        v19 = 0;
      v20 = v19;

      if (v20)
      {
        v21 = *(void **)(a1 + 40);
        objc_msgSend(v20, "characteristics");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObjectsFromArray:", v22);

        if (objc_msgSend(v20, "conformsToProtocol:", &unk_1EFA35E58))
          v23 = v20;
        else
          v23 = 0;
        v24 = v23;
        objc_msgSend(v24, "updatedValues");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
          {
            v26 = (void *)MEMORY[0x1E0C99DE8];
            objc_msgSend(v24, "updatedValues");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "arrayWithCapacity:", objc_msgSend(v27, "count"));
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v30 = *(void **)(v29 + 40);
            *(_QWORD *)(v29 + 40) = v28;

          }
          objc_msgSend(v24, "updatedValues");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31;
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __80__HAP2AccessoryServerController__callCharacteristicCompletion_operations_error___block_invoke_321;
          v41[3] = &unk_1E894CA10;
          v33 = *(_QWORD *)(a1 + 56);
          v41[4] = *(_QWORD *)(a1 + 32);
          v41[5] = v33;
          v34 = v41;
        }
        else
        {
          objc_msgSend(v20, "characteristics");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31;
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __80__HAP2AccessoryServerController__callCharacteristicCompletion_operations_error___block_invoke_323;
          v40[3] = &unk_1E894CA38;
          v40[4] = *(_QWORD *)(a1 + 32);
          v34 = v40;
        }
        objc_msgSend(v31, "enumerateObjectsUsingBlock:", v34);

        goto LABEL_33;
      }
    }
    else
    {

    }
    objc_msgSend(v16, "characteristics");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __80__HAP2AccessoryServerController__callCharacteristicCompletion_operations_error___block_invoke_324;
    v37[3] = &unk_1E894CA60;
    v37[4] = *(_QWORD *)(a1 + 32);
    v38 = v6;
    v39 = *(id *)(a1 + 40);
    objc_msgSend(v35, "enumerateObjectsUsingBlock:", v37);

LABEL_33:
    goto LABEL_34;
  }
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
  {
    v36 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v43 = v36;
    v44 = 2112;
    v45 = v6;
    _os_log_debug_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%@ Operation was canceled: %@", buf, 0x16u);
  }
  objc_msgSend(v6, "error");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  *a4 = 1;
LABEL_34:

}

- (void)_handleUpdatedValuesFromResponse:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "accessoryServer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EFA37D98) & 1) != 0)
    {
      objc_msgSend(a1, "accessoryServer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 && (objc_msgSend(v5, "isPaired") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = MEMORY[0x1E0C809B0];
        v11 = 3221225472;
        v12 = __66__HAP2AccessoryServerController__handleUpdatedValuesFromResponse___block_invoke;
        v13 = &unk_1E894C9E8;
        v7 = v6;
        v14 = v7;
        v15 = a1;
        objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v10);
        if (objc_msgSend(v7, "count", v10, v11, v12, v13))
        {
          v8 = (void *)objc_msgSend(v7, "copy");
          objc_msgSend(v5, "handleUpdatedCharacteristicValues:", v8);

        }
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {

      v5 = 0;
    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v9 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = a1;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%@ Accessory server has become nil or unpaired", buf, 0xCu);
    }
    goto LABEL_13;
  }
LABEL_14:

}

void __66__HAP2AccessoryServerController__handleUpdatedValuesFromResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v5 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = v5;
      objc_msgSend(v3, "characteristic");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v6;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_error_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%@ Ignoring failed read for characteristic %@: %@", (uint8_t *)&v12, 0x20u);

    }
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v3, "characteristic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
}

void __80__HAP2AccessoryServerController__callCharacteristicCompletion_operations_error___block_invoke_321(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  _BYTE v14[24];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = (void *)hap2Log_accessory;
  v6 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = v5;
      objc_msgSend(v3, "characteristic");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      characteristicDescriptionFromCharacteristic(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v14 = 138412802;
      *(_QWORD *)&v14[4] = v7;
      *(_WORD *)&v14[12] = 2112;
      *(_QWORD *)&v14[14] = v10;
      *(_WORD *)&v14[22] = 2112;
      v15 = v11;
      v12 = "%@  - %@ (%@)";
LABEL_8:
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, v12, v14, 0x20u);

    }
  }
  else if (v6)
  {
    v13 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    objc_msgSend(v3, "characteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    characteristicDescriptionFromCharacteristic(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v14 = 138412803;
    *(_QWORD *)&v14[4] = v13;
    *(_WORD *)&v14[12] = 2112;
    *(_QWORD *)&v14[14] = v10;
    *(_WORD *)&v14[22] = 2113;
    v15 = v11;
    v12 = "%@  - %@ -> %{private}@";
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3, *(_OWORD *)v14, *(_QWORD *)&v14[16], v15);

}

void __80__HAP2AccessoryServerController__callCharacteristicCompletion_operations_error___block_invoke_323(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = (void *)hap2Log_accessory;
  v6 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = v5;
      objc_msgSend(v3, "characteristic");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      characteristicDescriptionFromCharacteristic(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v7;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      v12 = "%@  - %@ (%@)";
LABEL_8:
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v14, 0x20u);

    }
  }
  else if (v6)
  {
    v13 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    objc_msgSend(v3, "characteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    characteristicDescriptionFromCharacteristic(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412803;
    v15 = v13;
    v16 = 2112;
    v17 = v10;
    v18 = 2113;
    v19 = v11;
    v12 = "%@  - %@ -> %{private}@";
    goto LABEL_8;
  }

}

void __80__HAP2AccessoryServerController__callCharacteristicCompletion_operations_error___block_invoke_324(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    objc_msgSend(v3, "characteristic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    characteristicDescriptionFromCharacteristic(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v5;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%@  - %@ (%@)", (uint8_t *)&v13, 0x20u);

  }
  objc_msgSend(v3, "characteristic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
}

void __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "eventNotificationsEnabled");
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = (void *)hap2Log_accessory;
  v6 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = v5;
      characteristicDescriptionFromCharacteristic(v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v7;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%@ Detected duplicate enable notify for %@", (uint8_t *)&v14, 0x16u);

    }
    +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

  }
  else if (v6)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = v5;
    characteristicDescriptionFromCharacteristic(v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%@  - %@", (uint8_t *)&v14, 0x16u);

  }
}

uint64_t __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_218(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v2 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1CCE01000, v2, OS_LOG_TYPE_INFO, "%@ Returning characteristics with notifications already enabled", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_220(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if ((objc_msgSend(v6, "properties") & 1) != 0)
  {
    objc_msgSend(v6, "instanceID");

    objc_msgSend(v6, "type");
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v15 = v13;
      v16 = 2112;
      v17 = v6;
      _os_log_error_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%@ Unable to change notification configuration characteristic: %@", buf, 0x16u);
    }
    v8 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to update notification configuration for characteristic %@."), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, v9, CFSTR("Characteristic does not support notifications."), 0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a4 = 1;
  }

}

void __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_228(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6)
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_230_17341);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_231(uint64_t a1, void *a2)
{
  id v3;

  -[HAP2AccessoryServerController _notificationOperationForRequest:operationDescription:options:](*(HAP2AccessoryServerControllerOperation **)(a1 + 32), a2, CFSTR("Enable-Notify"), *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)_createOperationsToReadCharacteristics:(uint64_t)a3 timeout:(_QWORD *)a4 options:(double)a5 error:
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t, _BYTE *);
  void *v21;
  void *v22;
  id v23;
  uint64_t *v24;
  double v25;
  uint64_t v26;
  _QWORD v27[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v9 = a2;
  v10 = v9;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__17240;
    v32 = __Block_byref_object_dispose__17241;
    v33 = 0;
    v12 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __94__HAP2AccessoryServerController__createOperationsToReadCharacteristics_timeout_options_error___block_invoke;
    v27[3] = &unk_1E894C6D8;
    *(double *)&v27[6] = a5;
    v27[4] = a1;
    v27[5] = &v28;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v27);
    if (!v29[5])
    {
      objc_msgSend(a1, "encoding");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "groupingsForReadRequestsForCharacteristics:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v12;
      v19 = 3221225472;
      v20 = __94__HAP2AccessoryServerController__createOperationsToReadCharacteristics_timeout_options_error___block_invoke_211;
      v21 = &unk_1E894C700;
      v25 = a5;
      v26 = a3;
      v22 = a1;
      v24 = &v28;
      v23 = v11;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", &v18);

    }
    if (a4)
    {
      v15 = (void *)v29[5];
      if (v15)
        *a4 = objc_retainAutorelease(v15);
    }
    v16 = (void *)objc_msgSend(v11, "copy", v18, v19, v20, v21, v22);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_235(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_2_236(uint64_t a1, void *a2)
{
  -[HAP2AccessoryServerController _handleUpdatedValuesFromResponse:](*(void **)(a1 + 32), a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "cancelWithError:", v4);
  objc_msgSend(*(id *)(a1 + 40), "cancelWithError:", v4);

}

void __94__HAP2AccessoryServerController__createOperationsToReadCharacteristics_timeout_options_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "instanceID");

  objc_msgSend(v6, "type");
  v7 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  if ((objc_msgSend(v6, "properties") & 2) == 0)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v8 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v16 = v14;
      v17 = 2112;
      v18 = v6;
      _os_log_error_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%@ Unable to read characteristic (does not support secured reads): %@", buf, 0x16u);
    }
    v9 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to read from characteristic %@."), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 11, v10, CFSTR("Characteristic does not support secured reads."), 0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    *a4 = 1;
  }

}

void __94__HAP2AccessoryServerController__createOperationsToReadCharacteristics_timeout_options_error___block_invoke_211(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HAP2ControllerReadRequest *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  HAP2AccessoryServerControllerReadOperation *v25;
  void *v26;
  void *v27;
  HAP2AccessoryServerControllerReadOperation *v28;
  void *v30;
  void *v31;
  void *v32;
  id *v33;
  HAP2AccessoryServerControllerReadOperation *v34;
  _QWORD v35[4];
  id v36;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v32 = *(void **)(v6 + 40);
  v33 = (id *)(v6 + 40);
  if (v5)
  {
    v7 = *(double *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 64);
    v9 = (void *)MEMORY[0x1E0C99DE8];
    v10 = a2;
    objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __88__HAP2AccessoryServerController__readOperationForCharacteristics_timeout_options_error___block_invoke;
    v35[3] = &unk_1E894D098;
    v12 = v11;
    v36 = v12;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v35);
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v12;
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ Read: %@"), v15, v16);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "transport");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "endpointForCharacteristics:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "transport");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "mimeTypeForCharacteristicRequests");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = -[HAP2ControllerReadRequest initWithCharacteristics:]([HAP2ControllerReadRequest alloc], "initWithCharacteristics:", v10);
    objc_msgSend(v5, "accessoryServer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "conformsToProtocol:", &unk_1EFA37D98))
    {
      objc_msgSend(v5, "accessoryServer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }

    if (objc_msgSend(v23, "isConfirming"))
      v24 = v8;
    else
      v24 = v8 | 4;
    v25 = [HAP2AccessoryServerControllerReadOperation alloc];
    objc_msgSend(v5, "encoding");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transport");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[HAP2AccessoryServerControllerReadOperation initWithName:controller:encoding:transport:readRequest:endpoint:mimeType:timeout:options:](v25, "initWithName:controller:encoding:transport:readRequest:endpoint:mimeType:timeout:options:", v30, v5, v26, v27, v21, v18, v7, v20, v24);

  }
  else
  {
    v34 = 0;
  }
  objc_storeStrong(v33, v32);
  v28 = v34;
  if (v34)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v34);
    v28 = v34;
  }
  else
  {
    *a4 = 1;
  }

}

void __88__HAP2AccessoryServerController__readOperationForCharacteristics_timeout_options_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  characteristicDescriptionFromCharacteristic(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __75__HAP2AccessoryServerController_isFlagNotificationEnableConsistencyWarning__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 9);
  return result;
}

void __90__HAP2AccessoryServerController_enableNotificationsForCharacteristics_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(v4, "characteristic");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEventNotificationsEnabled:", 1);

  }
}

void __90__HAP2AccessoryServerController_writeValuesForCharacteristics_timeout_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    objc_msgSend(v3, "characteristic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    characteristicDescriptionFromCharacteristic(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412803;
    v11 = v5;
    v12 = 2112;
    v13 = v8;
    v14 = 2113;
    v15 = v9;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%@  - %@ -> %{private}@", (uint8_t *)&v10, 0x20u);

  }
}

void __90__HAP2AccessoryServerController_writeValuesForCharacteristics_timeout_options_completion___block_invoke_216(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  HAP2AccessoryServerControllerTimedWriteOperation *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  HAP2AccessoryServerControllerOperation *v39;
  void *v40;
  void *v41;
  HAP2AccessoryServerControllerTimedWriteOperation *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  id obj;
  _QWORD v54[5];
  id v55;
  id v56;
  uint64_t *v57;
  uint64_t *v58;
  _QWORD *v59;
  _QWORD v60[5];
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;

  v5 = *(HAP2AccessoryServerControllerTimedWriteOperation **)(a1 + 32);
  v6 = *(double *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v8 + 40);
  v9 = (id *)(v8 + 40);
  obj = v10;
  v11 = a2;
  if (v5)
  {
    v66 = 0;
    v67 = &v66;
    v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__17240;
    v70 = __Block_byref_object_dispose__17241;
    v71 = 0;
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 0;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x3032000000;
    v60[3] = __Block_byref_object_copy__17240;
    v60[4] = __Block_byref_object_dispose__17241;
    +[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance");
    v51 = v7;
    v61 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __94__HAP2AccessoryServerController__writeOperationForCharacteristicTuples_timeout_options_error___block_invoke;
    v54[3] = &unk_1E894C970;
    v54[4] = v5;
    v57 = &v66;
    v58 = &v62;
    v59 = v60;
    v14 = v12;
    v55 = v14;
    v15 = v13;
    v56 = v15;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v54);
    v16 = (void *)v67[5];
    if (v16)
    {
      v5 = 0;
      obj = objc_retainAutorelease(v16);
    }
    else if (*((_BYTE *)v63 + 24))
    {
      v49 = v11;
      v47 = v15;
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = v14;
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ Timed-Write: %@"), v20, v21);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      -[HAP2AccessoryServerControllerTimedWriteOperation encoding](v5, "encoding");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "prepareWriteRequestForCharacteristics:ttl:error:", v49, &obj, 2.5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[HAP2AccessoryServerControllerTimedWriteOperation encoding](v5, "encoding");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "executeWriteRequestForCharacteristics:error:", v49, &obj);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          -[HAP2AccessoryServerControllerTimedWriteOperation transport](v5, "transport");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "endpointForCharacteristics:", v47);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          -[HAP2AccessoryServerControllerTimedWriteOperation transport](v5, "transport");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "mimeTypeForCharacteristicRequests");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          v42 = [HAP2AccessoryServerControllerTimedWriteOperation alloc];
          -[HAP2AccessoryServerControllerTimedWriteOperation encoding](v5, "encoding");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAP2AccessoryServerControllerTimedWriteOperation transport](v5, "transport");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = -[HAP2AccessoryServerControllerTimedWriteOperation initWithName:controller:encoding:transport:prepareRequest:executeRequest:endpoint:mimeType:timeout:options:](v42, "initWithName:controller:encoding:transport:prepareRequest:executeRequest:endpoint:mimeType:timeout:options:", v45, v5, v28, v29, v23, v25, v6, v44, v43, v51);

        }
        else
        {
          v5 = 0;
        }

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v30 = (void *)MEMORY[0x1E0CB3940];
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("%@ Write: %@"), v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      -[HAP2AccessoryServerControllerTimedWriteOperation encoding](v5, "encoding");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "writeRequestForCharacteristics:shouldEncrypt:error:", v11, 1, &obj);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        v50 = v34;
        -[HAP2AccessoryServerControllerTimedWriteOperation transport](v5, "transport");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "endpointForCharacteristics:", v15);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        -[HAP2AccessoryServerControllerTimedWriteOperation transport](v5, "transport");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "mimeTypeForCharacteristicRequests");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = [HAP2AccessoryServerControllerOperation alloc];
        -[HAP2AccessoryServerControllerTimedWriteOperation encoding](v5, "encoding");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2AccessoryServerControllerTimedWriteOperation transport](v5, "transport");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = -[HAP2AccessoryServerControllerOperation initWithName:controller:encoding:transport:request:endpoint:mimeType:timeout:options:](v39, "initWithName:controller:encoding:transport:request:endpoint:mimeType:timeout:options:", v50, v5, v40, v41, v36, v48, v6, v46, v51);

        v34 = v50;
      }
      else
      {
        v5 = 0;
      }

    }
    _Block_object_dispose(v60, 8);

    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);

  }
  objc_storeStrong(v9, obj);
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  else
    *a4 = 1;

}

void __94__HAP2AccessoryServerController__writeOperationForCharacteristicTuples_timeout_options_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "characteristic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "properties") & 4) != 0)
  {
    if ((objc_msgSend(v7, "properties") & 0x20) != 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    objc_msgSend(v7, "type");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("00000131-0000-1000-8000-0026BB765291")) & 1) != 0)
      goto LABEL_18;
    objc_msgSend(v7, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "isEqualToString:", CFSTR("00000138-0000-1000-8000-0026BB765291")))
    {
      objc_msgSend(v7, "type");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "isEqualToString:", CFSTR("00000143-0000-1000-8000-0026BB765291")))
      {
        objc_msgSend(v7, "type");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("00000262-0000-1000-8000-0026BB765291")) & 1) == 0)
        {
          objc_msgSend(v7, "type");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "isEqualToString:", CFSTR("00000264-0000-1000-8000-0026BB765291")) & 1) == 0)
          {
            objc_msgSend(v7, "type");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("00000704-0000-1000-8000-0026BB765291"));

            if ((v23 & 1) != 0)
              goto LABEL_19;
            v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
            objc_msgSend(v6, "characteristic");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "type");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "hap_validatedAndNormalizedUUIDString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "getDefaultCharacteristicProperties:", v27);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14 && (objc_msgSend(v14, "unsignedIntegerValue") & 0x80) == 0)
              objc_msgSend(v6, "setIncludeResponseValue:", 0);
LABEL_18:

LABEL_19:
            v19 = *(void **)(a1 + 40);
            characteristicDescriptionFromCharacteristic(v7);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v20);

            objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
            goto LABEL_20;
          }

        }
      }

    }
    goto LABEL_18;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v8 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    v21 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v29 = v21;
    v30 = 2112;
    v31 = v7;
    _os_log_error_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%@ Unable to write characteristic (does not support secured writes): %@", buf, 0x16u);
  }
  v9 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to write to characteristic %@."), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 10, v10, CFSTR("Characteristic does not support secured writes."), 0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  *a4 = 1;
LABEL_20:

}

void __89__HAP2AccessoryServerController_readValuesForCharacteristics_timeout_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    characteristicDescriptionFromCharacteristic(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%@  - %@", (uint8_t *)&v8, 0x16u);

  }
}

void __69__HAP2AccessoryServerController_readAttributeDatabaseWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD *v3;
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  HAP2AccessoryServerAccessoryCache *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  HAP2AccessoryServerAccessoryCache *v43;
  void *v44;
  HAP2AccessoryServerAccessoryCache *v45;
  uint64_t v46;
  void *v47;
  id v48;
  BOOL v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint8_t v60[4];
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  const char *v65;
  _BYTE buf[24];
  void *v67;
  uint64_t v68;
  id v69;
  id v70;
  uint64_t *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  if (v1)
  {
    if (v3)
      v5 = (void *)v3[45];
    else
      v5 = 0;
    v6 = v5;
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v1;
        _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%@ Received accessory database response", buf, 0xCu);
      }
      *(_BYTE *)(v1 + 10) = 0;
      objc_msgSend((id)v1, "accessoryServer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1EFA37D98) & 1) != 0)
      {
        objc_msgSend((id)v1, "accessoryServer");
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          if ((objc_msgSend(v9, "isPaired") & 1) != 0)
          {
            if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EFA36860))
              v10 = v6;
            else
              v10 = 0;
            v48 = v10;
            objc_msgSend(v48, "attributeDatabase");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v50, "count"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = 0;
            v55 = &v54;
            v56 = 0x3032000000;
            v57 = __Block_byref_object_copy__17240;
            v58 = __Block_byref_object_dispose__17241;
            v59 = 0;
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __77__HAP2AccessoryServerController__handleAttributeDatabaseResponse_completion___block_invoke;
            v67 = &unk_1E894C670;
            v68 = v1;
            v9 = v9;
            v69 = v9;
            v71 = &v54;
            v52 = v11;
            v70 = v52;
            objc_msgSend(v50, "enumerateKeysAndObjectsUsingBlock:", buf);
            objc_msgSend(v52, "sortUsingComparator:", &__block_literal_global_198);
            if (!objc_msgSend(v52, "count")
              || (objc_msgSend(v52, "objectAtIndexedSubscript:", 0),
                  v12 = (void *)objc_claimAutoreleasedReturnValue(),
                  v13 = objc_msgSend(v12, "isPrimary"),
                  v12,
                  (v13 & 1) == 0))
            {
              if (hap2LogInitialize_onceToken != -1)
                dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
              v14 = hap2Log_accessory;
              if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v60 = 138412290;
                v61 = v1;
                _os_log_error_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%@ Didn't find a primary accessory", v60, 0xCu);
              }
              if (!v55[5])
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 7);
                v15 = objc_claimAutoreleasedReturnValue();
                v16 = (void *)v55[5];
                v55[5] = v15;

              }
            }
            if ((unint64_t)objc_msgSend(v52, "count") >= 2)
            {
              if (hap2LogInitialize_onceToken != -1)
                dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
              v17 = (id)hap2Log_accessory;
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                v46 = objc_msgSend(v52, "count");
                *(_DWORD *)v60 = 138412546;
                v61 = v1;
                v62 = 2048;
                v63 = v46;
                _os_log_error_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%@ Accessory returned %lu accessories, only 1 supported at this time", v60, 0x16u);
              }

              if (!v55[5])
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 15);
                v18 = objc_claimAutoreleasedReturnValue();
                v19 = (void *)v55[5];
                v55[5] = v18;

              }
            }
            v20 = *(id *)(v1 + 64);
            objc_msgSend(v20, "accessoryCache");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v55[5])
            {
              if (v21)
              {
                if (hap2LogInitialize_onceToken != -1)
                  dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
                v22 = hap2Log_accessory;
                if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v60 = 138412290;
                  v61 = v1;
                  _os_log_error_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "%@ Invalidating accessory cache after error instantiating it and trying again", v60, 0xCu);
                }
                v23 = *(id *)(v1 + 64);
                objc_msgSend(v23, "invalidateAccessoryCache");

                -[HAP2AccessoryServerController saveAccessoryCache](v1);
                objc_msgSend(v9, "clearAccessories");
                v24 = (id)objc_msgSend((id)v1, "readAttributeDatabaseWithCompletion:", v4);
              }
              else
              {
                v4[2](v4, 0);
              }
            }
            else
            {
              v47 = (void *)objc_msgSend(v52, "copy");
              if (hap2LogInitialize_onceToken != -1)
                dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
              v34 = (id)hap2Log_accessory;
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                v35 = objc_msgSend(v47, "count");
                v36 = objc_msgSend(v47, "count");
                v37 = "ies";
                *(_DWORD *)v60 = 138412802;
                v61 = v1;
                if (v36 == 1)
                  v37 = "y";
                v62 = 2048;
                v63 = v35;
                v64 = 2080;
                v65 = v37;
                _os_log_impl(&dword_1CCE01000, v34, OS_LOG_TYPE_INFO, "%@ Found %lu accessor%s", v60, 0x20u);
              }

              if (!v21)
              {
                v38 = *(void **)(v1 + 64);
                if (v38)
                {
                  v39 = v38;
                  objc_msgSend((id)v1, "accessoryServer");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HAP2AccessoryServerAccessoryCache updateWithMetadata:discoveredAccessories:](v39, "updateWithMetadata:discoveredAccessories:", v40, v47);
                }
                else
                {
                  v43 = [HAP2AccessoryServerAccessoryCache alloc];
                  objc_msgSend((id)v1, "accessoryServer");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = -[HAP2AccessoryServerAccessoryCache initWithMetadata:discoveredAccessories:sleepInterval:](v43, "initWithMetadata:discoveredAccessories:sleepInterval:", v44, v47, 0);

                  v39 = v45;
                  v40 = *(void **)(v1 + 64);
                  *(_QWORD *)(v1 + 64) = v39;
                }

                -[HAP2AccessoryServerController saveAccessoryCache](v1);
              }
              ((void (*)(void (**)(id, _QWORD), void *, _QWORD))v4[2])(v4, v47, 0);

            }
            _Block_object_dispose(&v54, 8);

          }
          else
          {
            if (hap2LogInitialize_onceToken != -1)
              dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
            v30 = hap2Log_accessory;
            if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v1;
              _os_log_error_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_ERROR, "%@ Accessory server is no longer paired", buf, 0xCu);
            }
            objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (*)(void (**)(id, _QWORD), _QWORD, void *))v4[2])(v4, 0, v31);

          }
LABEL_47:

          goto LABEL_48;
        }
      }
      else
      {

      }
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v26 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v1;
        _os_log_error_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, "%@ Unexpected accessory type", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(id, _QWORD), _QWORD, id))v4[2])(v4, 0, v9);
      goto LABEL_47;
    }
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v41 = v7;
      objc_msgSend(v3, "error");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v1;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v42;
      _os_log_error_impl(&dword_1CCE01000, v41, OS_LOG_TYPE_ERROR, "%@ Failed to fetch attribute database: %@", buf, 0x16u);

    }
    if (*(_BYTE *)(v1 + 10))
    {
LABEL_40:
      *(_BYTE *)(v1 + 10) = 0;
      objc_msgSend(v3, "error");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(id, _QWORD), _QWORD, void *))v4[2])(v4, 0, v25);

LABEL_48:
      goto LABEL_49;
    }
    objc_msgSend(v3, "error");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "domain");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v28, "isEqualToString:", CFSTR("HAPErrorDomain")) & 1) != 0)
    {
      objc_msgSend(v3, "error");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "code") == 9)
      {
LABEL_54:

        goto LABEL_40;
      }
      objc_msgSend(v3, "error");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v53, "code") == 15)
      {

        goto LABEL_54;
      }
      objc_msgSend(v3, "error");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v51, "code") == 2;

      if (v49)
        goto LABEL_40;
    }
    else
    {

    }
    *(_BYTE *)(v1 + 10) = 1;
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v32 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v1;
      _os_log_error_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_ERROR, "%@ Retrying attribute database read", buf, 0xCu);
    }
    v33 = (id)objc_msgSend((id)v1, "readAttributeDatabaseWithCompletion:", v4);
    goto LABEL_48;
  }
LABEL_49:

}

void __69__HAP2AccessoryServerController_readAttributeDatabaseWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "cancelWithError:", v3);

}

void __77__HAP2AccessoryServerController__handleAttributeDatabaseResponse_completion___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = objc_msgSend(v7, "unsignedIntegerValue");
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    v11 = *(void **)(v10 + 88);
  else
    v11 = 0;
  objc_msgSend(v11, "accessoryWithAccessoryServer:instanceID:discoveredServices:", *(_QWORD *)(a1 + 40), v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v13 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      v18 = 138412802;
      v19 = v17;
      v20 = 2112;
      v21 = v7;
      v22 = 2112;
      v23 = v8;
      _os_log_error_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "%@ Failed to validate accessory with instance id %@: %@", (uint8_t *)&v18, 0x20u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 7);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    *a4 = 1;
  }

}

uint64_t __77__HAP2AccessoryServerController__handleAttributeDatabaseResponse_completion___block_invoke_196(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "instanceID");
  v6 = objc_msgSend(v4, "instanceID");

  if (v5 < v6)
    return -1;
  else
    return 1;
}

+ (HAP2AccessoryServerController)new
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (NSString)controllerIdentifier
{
  return (NSString *)CFSTR("thread");
}

uint64_t __59__HAP2AccessoryServerController_isReadingAttributeDatabase__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (uint64_t)setReadingAttributeDatabase:(uint64_t)result
{
  void *v2;
  _QWORD v3[5];
  char v4;

  if (result)
  {
    v2 = *(void **)(result + 72);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __61__HAP2AccessoryServerController_setReadingAttributeDatabase___block_invoke;
    v3[3] = &unk_1E894D770;
    v3[4] = result;
    v4 = a2;
    return objc_msgSend(v2, "performWritingBlock:", v3);
  }
  return result;
}

uint64_t __61__HAP2AccessoryServerController_setReadingAttributeDatabase___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

- (uint64_t)sessionNumber
{
  uint64_t v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x2020000000;
    v8 = 0;
    v2 = *(id *)(a1 + 72);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __46__HAP2AccessoryServerController_sessionNumber__block_invoke;
    v4[3] = &unk_1E894DEE8;
    v4[4] = v1;
    v4[5] = &v5;
    objc_msgSend(v2, "performReadingBlock:", v4);

    v1 = v6[3];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

uint64_t __46__HAP2AccessoryServerController_sessionNumber__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (uint64_t)currentAccessoryIPTryCount
{
  uint64_t v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x2020000000;
    v8 = 0;
    v2 = *(id *)(a1 + 72);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __59__HAP2AccessoryServerController_currentAccessoryIPTryCount__block_invoke;
    v4[3] = &unk_1E894DEE8;
    v4[4] = v1;
    v4[5] = &v5;
    objc_msgSend(v2, "performReadingBlock:", v4);

    v1 = v6[3];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

uint64_t __59__HAP2AccessoryServerController_currentAccessoryIPTryCount__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

- (uint64_t)setCurrentAccessoryIPTryCount:(uint64_t)result
{
  void *v2;
  _QWORD v3[6];

  if (result)
  {
    v2 = *(void **)(result + 72);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __63__HAP2AccessoryServerController_setCurrentAccessoryIPTryCount___block_invoke;
    v3[3] = &unk_1E894D3B0;
    v3[4] = result;
    v3[5] = a2;
    return objc_msgSend(v2, "performWritingBlock:", v3);
  }
  return result;
}

uint64_t __63__HAP2AccessoryServerController_setCurrentAccessoryIPTryCount___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 56) = *(_QWORD *)(result + 40);
  return result;
}

void __68__HAP2AccessoryServerController_lookupAccessoryCacheWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__HAP2AccessoryServerController_lookupAccessoryCacheWithCompletion___block_invoke_2;
  v13[3] = &unk_1E894CAB0;
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v15 = v8;
  v9 = v6;
  v16 = v9;
  v18 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 40);
  v10 = (void *)MEMORY[0x1D17B7400](v13);
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    v12 = *(void **)(v11 + 80);
  else
    v12 = 0;
  objc_msgSend(v12, "addConcurrentBlock:", v10);

}

void __68__HAP2AccessoryServerController_lookupAccessoryCacheWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _UNKNOWN **v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  id *v43;
  void *v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  _BYTE v53[10];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1E0CB3710];
    v3 = objc_opt_class();
    v4 = *(_QWORD *)(a1 + 32);
    v49 = 0;
    objc_msgSend(v2, "unarchivedObjectOfClass:fromData:error:", v3, v4, &v49);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v49;
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 40);
      if (v7)
        objc_storeStrong((id *)(v7 + 64), v5);
      objc_msgSend(v5, "peripheralInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "configNumber");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 56), "configNumber"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToNumber:", v10);

      v12 = &selRef_new;
      if ((v11 & 1) == 0)
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v13 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          v14 = *(_QWORD *)(a1 + 40);
          v15 = v13;
          objc_msgSend(v5, "peripheralInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "configNumber");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "unsignedIntValue");
          v19 = objc_msgSend(*(id *)(a1 + 56), "configNumber");
          *(_DWORD *)buf = 138412802;
          v51 = v14;
          v12 = &selRef_new;
          v52 = 1024;
          *(_DWORD *)v53 = v18;
          *(_WORD *)&v53[4] = 1024;
          *(_DWORD *)&v53[6] = v19;
          _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%@ Invalidating stored cache due to updated c# (%u -> %u)", buf, 0x18u);

        }
        objc_msgSend(v5, "invalidateAccessoryCache");
        objc_msgSend(*(id *)(a1 + 40), "accessoryServer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "conformsToProtocol:", v12[311]))
        {
          objc_msgSend(*(id *)(a1 + 40), "accessoryServer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = 0;
        }

        objc_msgSend(v21, "clearAccessories");
      }
      objc_msgSend(v5, "peripheralInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "advertisedProtocolVersion");

      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithMajorVersion:minorVersion:updateVersion:", v25 / 0xA, v25 % 0xA, 0);
      objc_msgSend(*(id *)(a1 + 56), "protocolVersion");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqualToVersion:", v27);

      if ((v28 & 1) == 0)
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v29 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          v30 = *(_QWORD *)(a1 + 40);
          v31 = *(void **)(a1 + 56);
          v32 = v29;
          objc_msgSend(v31, "protocolVersion");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v51 = v30;
          v52 = 2112;
          *(_QWORD *)v53 = v26;
          *(_WORD *)&v53[8] = 2112;
          v54 = v33;
          _os_log_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_INFO, "%@ Invalidating stored cache due to updated protocol version (%@ -> %@)", buf, 0x20u);

        }
        objc_msgSend(v5, "invalidateAccessoryCache");
        objc_msgSend(*(id *)(a1 + 40), "accessoryServer");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v34, "conformsToProtocol:", v12[311]))
        {
          objc_msgSend(*(id *)(a1 + 40), "accessoryServer");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v35 = 0;
        }

        objc_msgSend(v35, "clearAccessories");
      }
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v36 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        v37 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v51 = v37;
        _os_log_impl(&dword_1CCE01000, v36, OS_LOG_TYPE_INFO, "%@ Found valid cache", buf, 0xCu);
      }
      objc_msgSend(v5, "sleepInterval");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v39 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          v40 = *(_QWORD *)(a1 + 40);
          v41 = v39;
          objc_msgSend(v5, "sleepInterval");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v51 = v40;
          v52 = 2112;
          *(_QWORD *)v53 = v42;
          _os_log_impl(&dword_1CCE01000, v41, OS_LOG_TYPE_INFO, "%@ Found cached sleep interval: %@", buf, 0x16u);

        }
        v43 = *(id **)(a1 + 40);
        objc_msgSend(v5, "sleepInterval");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "doubleValue");
        -[HAP2AccessoryServerController _updateMaxRequestTimeout:](v43, v45);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v23 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v48 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v51 = v48;
        v52 = 2112;
        *(_QWORD *)v53 = v6;
        _os_log_error_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%@ Unable to decode found accessory cache: %@", buf, 0x16u);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v22 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      v46 = *(_QWORD *)(a1 + 40);
      v47 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v51 = v46;
      v52 = 2112;
      *(_QWORD *)v53 = v47;
      _os_log_debug_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_DEBUG, "%@ No saved cache at all: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

- (void)openTransportWithResume:(void *)a3 completion:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v5 = a3;
  if (a1)
  {
    objc_msgSend(a1[10], "assertCurrentQueue");
    if (HAPIsHH2Enabled_onceToken != -1)
      dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
    if (HAPIsHH2Enabled_hh2Enabled == 1)
    {
      objc_msgSend(a1, "accessoryServer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "initializeKeyBagIfNecessary");

    }
    if ((a2 & 1) == 0)
      -[HAP2AccessoryServerController setCurrentAccessoryIPTryCount:]((uint64_t)a1, 1);
    v8 = -[HAP2AccessoryServerController sessionNumber]((uint64_t)a1);
    objc_msgSend(a1, "transport");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__HAP2AccessoryServerController_openTransportWithResume_completion___block_invoke;
    v10[3] = &unk_1E894CB28;
    v10[4] = a1;
    v12 = v8;
    v11 = v5;
    objc_msgSend(v9, "openWithCompletion:", v10);

  }
}

void __68__HAP2AccessoryServerController_openTransportWithResume_completion___block_invoke(_QWORD *a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  char v26;

  v7 = a3;
  v8 = a4;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __68__HAP2AccessoryServerController_openTransportWithResume_completion___block_invoke_2;
  v20 = &unk_1E894CB00;
  v9 = v7;
  v10 = a1[4];
  v21 = v9;
  v22 = v10;
  v11 = v8;
  v13 = (void *)a1[5];
  v12 = a1[6];
  v23 = v11;
  v25 = v12;
  v24 = v13;
  v26 = a2;
  v14 = (void *)MEMORY[0x1D17B7400](&v17);
  v15 = a1[4];
  if (v15)
    v16 = *(void **)(v15 + 80);
  else
    v16 = 0;
  objc_msgSend(v16, "addConcurrentBlock:", v14, v17, v18, v19, v20);

}

void __68__HAP2AccessoryServerController_openTransportWithResume_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  _BYTE buf[24];
  void *v42;
  _BYTE v43[20];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "accessoryServer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "accessoryServer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSessionInfoWithNumIPsResolved:numIPsTried:numBonjourNames:", objc_msgSend(*(id *)(a1 + 32), "numIPAddresses"), objc_msgSend(*(id *)(a1 + 32), "numIPAddressesTried"), objc_msgSend(*(id *)(a1 + 32), "numBonjourNames"));

    }
  }
  if (*(_QWORD *)(a1 + 48))
    goto LABEL_5;
  v10 = *(_QWORD *)(a1 + 64);
  if (v10 == -[HAP2AccessoryServerController sessionNumber](*(_QWORD *)(a1 + 40)))
  {
    if (!*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 40), "accessoryServer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "accessoryServer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "deviceID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "deviceIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "associateAccessoryWithControllerKeyUsingAccessoryIdentifier:", v15);

LABEL_10:
      v16 = *(_QWORD *)(a1 + 40);
      v17 = -[HAP2AccessoryServerController currentAccessoryIPTryCount](v16);
      -[HAP2AccessoryServerController setCurrentAccessoryIPTryCount:](v16, v17 + 1);
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48));
      return;
    }
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "accessoryServer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldRetryPVDueToAuthenticationError:", *(_QWORD *)(a1 + 48));

    if (v9)
    {
      -[HAP2AccessoryServerController openTransportWithResume:completion:](*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 56));
      return;
    }
    goto LABEL_10;
  }
  v18 = *(_QWORD *)(a1 + 32);
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v19 = (void *)hap2Log_accessory;
  v20 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO);
  if (v18)
  {
    if (v20)
    {
      v21 = *(_QWORD *)(a1 + 40);
      v22 = v19;
      v23 = -[HAP2AccessoryServerController currentAccessoryIPTryCount](v21);
      v24 = objc_msgSend(*(id *)(a1 + 32), "numIPAddresses");
      v25 = objc_msgSend(*(id *)(a1 + 32), "numIPAddressesTried");
      v26 = objc_msgSend(*(id *)(a1 + 32), "numBonjourNames");
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2048;
      v42 = (void *)v24;
      *(_WORD *)v43 = 2048;
      *(_QWORD *)&v43[2] = v25;
      *(_WORD *)&v43[10] = 2048;
      *(_QWORD *)&v43[12] = v26;
      _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_INFO, "%@ Open established a new session after trying %lu IP address(es) (total=%lu, tried=%lu with %lu names)", buf, 0x34u);

    }
  }
  else if (v20)
  {
    v27 = *(_QWORD *)(a1 + 40);
    v28 = v19;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v27;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = -[HAP2AccessoryServerController currentAccessoryIPTryCount](v27);
    _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_INFO, "%@ Open established a new session after trying %lu IP address(es)", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "accessoryServer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "conformsToProtocol:", &unk_1EFA37D98))
  {
    objc_msgSend(*(id *)(a1 + 40), "accessoryServer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }

  mach_absolute_time();
  v31 = UpTicksToMilliseconds();
  -[HAP2AccessoryServerController setSessionStartTime:](*(_QWORD *)(a1 + 40), v31);
  v32 = *(_QWORD *)(a1 + 40);
  if (!v32)
    goto LABEL_31;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = *(id *)(v32 + 72);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __59__HAP2AccessoryServerController_isReadingAttributeDatabase__block_invoke;
  v42 = &unk_1E894DEE8;
  *(_QWORD *)v43 = v32;
  *(_QWORD *)&v43[8] = &v37;
  objc_msgSend(v33, "performReadingBlock:", buf);

  LODWORD(v33) = *((unsigned __int8 *)v38 + 24);
  _Block_object_dispose(&v37, 8);
  if (!(_DWORD)v33)
  {
    v34 = *(id **)(a1 + 40);
    if (!v34)
    {
LABEL_31:
      objc_msgSend(v30, "handleReestablishedSession");
      goto LABEL_32;
    }
    objc_msgSend(v34[10], "assertCurrentQueue");
    objc_msgSend(v34, "accessoryServer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "conformsToProtocol:", &unk_1EFA37D98))
    {
      objc_msgSend(v34, "accessoryServer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36 || !objc_msgSend(v36, "isPaired"))
        goto LABEL_30;
      objc_msgSend(v36, "accessories");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "enumerateObjectsUsingBlock:", &__block_literal_global_334);
    }
    else
    {
      v36 = 0;
    }

LABEL_30:
    goto LABEL_31;
  }
LABEL_32:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __60__HAP2AccessoryServerController__handleReestablishedSession__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "services");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_335);

}

void __60__HAP2AccessoryServerController__handleReestablishedSession__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "characteristics");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_336);

}

uint64_t __60__HAP2AccessoryServerController__handleReestablishedSession__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEventNotificationsEnabled:", 0);
}

@end
