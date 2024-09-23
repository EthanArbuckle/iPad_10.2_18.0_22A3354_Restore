@implementation _ANEProgramIOSurfacesMapper

+ (_ANEProgramIOSurfacesMapper)mapperWithController:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithController:", v4);

  return (_ANEProgramIOSurfacesMapper *)v5;
}

- (_ANEProgramIOSurfacesMapper)initWithController:(id)a3
{
  id v5;
  _ANEProgramIOSurfacesMapper *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_ANEProgramIOSurfacesMapper;
  v6 = -[_ANEProgramIOSurfacesMapper init](&v8, sel_init);
  if (v6)
  {
    v6->_programHandle = objc_msgSend(v5, "programHandle");
    objc_storeStrong((id *)&v6->_controller, a3);
    -[_ANEDeviceController start](v6->_controller, "start");
  }

  return v6;
}

+ (void)initialize
{
  if (+[_ANEProgramIOSurfacesMapper initialize]::onceToken != -1)
    dispatch_once(&+[_ANEProgramIOSurfacesMapper initialize]::onceToken, &__block_literal_global_3);
}

+ (_ANEProgramIOSurfacesMapper)new
{
  return 0;
}

- (_ANEProgramIOSurfacesMapper)init
{

  return 0;
}

+ (_ANEProgramIOSurfacesMapper)mapperWithProgramHandle:(unint64_t)a3
{
  void *v4;
  void *v5;

  +[_ANEDeviceController controllerWithProgramHandle:](_ANEDeviceController, "controllerWithProgramHandle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithController:", v4);

  return (_ANEProgramIOSurfacesMapper *)v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_ANEProgramIOSurfacesMapper controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  v4.receiver = self;
  v4.super_class = (Class)_ANEProgramIOSurfacesMapper;
  -[_ANEProgramIOSurfacesMapper dealloc](&v4, sel_dealloc);
}

- (BOOL)validateRequest:(id)a3 model:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int v24;
  void *v25;
  unsigned int v26;
  BOOL v27;
  NSObject *v28;
  void *v30;
  void *v31;
  const char *aSelector;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  unsigned int v38;
  uint8_t v39[40];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "validate") & 1) != 0)
  {
    objc_msgSend(v6, "procedureIndex");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    aSelector = a2;
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    v10 = objc_msgSend(v6, "ioSurfacesCount");
    if ((unint64_t)(v10 - 129) <= 0xFFFFFFFFFFFFFF7FLL)
    {
      +[_ANELog common](_ANELog, "common");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ANEProgramIOSurfacesMapper validateRequest:model:].cold.1(v12, v39, v10, v11);
      }

    }
    objc_msgSend(v7, "inputSymbolIndicesForProcedureIndex:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputIndexArray");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    if (v15)
    {
      v16 = 0;
      v17 = 0;
      while (1)
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "unsignedIntegerValue");

        if ((objc_msgSend(v13, "containsIndex:", v19) & 1) == 0)
          break;
        v16 = ++v17;
        if (v15 <= v17)
          goto LABEL_10;
      }
      +[_ANELog common](_ANELog, "common");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v34 = v30;
        v35 = 1024;
        v36 = v17;
        v37 = 1024;
        v38 = v19;
        _os_log_error_impl(&dword_1D3352000, v20, OS_LOG_TYPE_ERROR, "%@: request.inputIndexArray[%u]=%u is invalid", buf, 0x18u);

      }
      v27 = 0;
    }
    else
    {
LABEL_10:
      objc_msgSend(v7, "outputSymbolIndicesForProcedureIndex:", v9);
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "outputIndexArray");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");
      if (v22)
      {
        v23 = 0;
        v24 = 0;
        while (1)
        {
          objc_msgSend(v21, "objectAtIndexedSubscript:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "unsignedIntegerValue");

          if ((-[NSObject containsIndex:](v20, "containsIndex:", v26) & 1) == 0)
            break;
          v23 = ++v24;
          if (v22 <= v24)
            goto LABEL_14;
        }
        +[_ANELog common](_ANELog, "common");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(aSelector);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v34 = v31;
          v35 = 1024;
          v36 = v24;
          v37 = 1024;
          v38 = v26;
          _os_log_error_impl(&dword_1D3352000, v28, OS_LOG_TYPE_ERROR, "%@: request.outputIndexArray[%u]=%u is invalid", buf, 0x18u);

        }
        v27 = 0;
      }
      else
      {
LABEL_14:
        v27 = 1;
      }

    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)prepareANEMemoryMappingParams:(ANEMemoryMappingParamsStruct *)a3 request:(id)a4
{
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  ANEBufferStruct *v13;
  BOOL v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  ANEBufferStruct *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a4;
  bzero(a3, 0xC18uLL);
  a3->var2 = objc_msgSend(v27, "ioSurfacesCount");
  objc_msgSend(v27, "procedureIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  a3->var3 = objc_msgSend(v6, "unsignedIntValue");

  a3->var1 = -[_ANEProgramIOSurfacesMapper programHandle](self, "programHandle");
  objc_msgSend(v27, "inputIndexArray");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v26, "count");
  if (v7)
  {
    v8 = 0;
    v9 = 1;
    do
    {
      objc_msgSend(v27, "inputArray");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      a3->var0[v8].var0 = (__IOSurface *)objc_msgSend(v11, "ioSurface");

      objc_msgSend(v26, "objectAtIndexedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = &a3->var0[v8];
      v13->var1 = objc_msgSend(v12, "unsignedIntValue");

      v13->var3 = 1;
      v8 = v9;
      v14 = v7 > v9++;
    }
    while (v14);
  }
  objc_msgSend(v27, "outputIndexArray");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  if (v16)
  {
    v17 = 0;
    v18 = 1;
    do
    {
      objc_msgSend(v27, "outputArray");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v17 + v7;
      a3->var0[v17 + v7].var0 = (__IOSurface *)objc_msgSend(v20, "ioSurface");

      objc_msgSend(v15, "objectAtIndexedSubscript:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = &a3->var0[v21];
      v23->var1 = objc_msgSend(v22, "unsignedIntValue");

      v23->var3 = 2;
      v17 = v18;
      v14 = v16 > v18++;
    }
    while (v14);
  }
  objc_msgSend(v27, "weightsBuffer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v27, "weightsBuffer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    a3->var0[v16 + v7].var0 = (__IOSurface *)objc_msgSend(v25, "ioSurface");

    a3->var0[v16 + v7].var3 = 8;
  }

}

- (BOOL)mapIOSurfacesWithModel:(id)a3 request:(id)a4 cacheInference:(BOOL)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  _QWORD block[5];
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint8_t *v27;
  SEL v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    +[_ANELog common](_ANELog, "common");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v41 = v15;
      _os_log_impl(&dword_1D3352000, v14, OS_LOG_TYPE_INFO, "%@: No support for VirtualClient yet.", buf, 0xCu);

    }
    goto LABEL_5;
  }
  if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
  {
    +[_ANELog common](_ANELog, "common");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ANEProgramIOSurfacesMapper mapIOSurfacesWithModel:request:cacheInference:error:].cold.1(v17, (uint64_t)buf, v16);
    }

    if (a6)
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ANEErrors hostTooOld:](_ANEErrors, "hostTooOld:", v18);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_5:
      LOBYTE(a6) = 0;
    }
  }
  else
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__1;
    v38 = __Block_byref_object_dispose__1;
    v39 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    v19 = (void *)MEMORY[0x1D824DB90]();
    v20 = -[_ANEProgramIOSurfacesMapper validateRequest:model:](self, "validateRequest:model:", v12, v11);
    if (v20)
    {
      -[_ANEProgramIOSurfacesMapper prepareANEMemoryMappingParams:request:](self, "prepareANEMemoryMappingParams:request:", buf, v12);
      v21 = gANEMemoryMapperQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83___ANEProgramIOSurfacesMapper_mapIOSurfacesWithModel_request_cacheInference_error___block_invoke;
      block[3] = &unk_1E9516230;
      v29 = a5;
      v27 = buf;
      v28 = a2;
      block[4] = self;
      v25 = &v30;
      v24 = v12;
      v26 = &v34;
      dispatch_sync(v21, block);

    }
    objc_autoreleasePoolPop(v19);
    if (v20)
    {
      if (a6)
        *a6 = objc_retainAutorelease((id)v35[5]);
      LOBYTE(a6) = *((_BYTE *)v31 + 24) != 0;
    }
    else
    {
      LOBYTE(a6) = 0;
    }
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);

  }
  return (char)a6;
}

- (BOOL)unmapIOSurfacesWithModel:(id)a3 request:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  _QWORD block[9];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[_ANELog common](_ANELog, "common");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v13;
      _os_log_impl(&dword_1D3352000, v12, OS_LOG_TYPE_INFO, "%@: No support for VirtualClient yet.", buf, 0xCu);

    }
    goto LABEL_5;
  }
  if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
  {
    +[_ANELog common](_ANELog, "common");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ANEProgramIOSurfacesMapper mapIOSurfacesWithModel:request:cacheInference:error:].cold.1(v15, (uint64_t)buf, v14);
    }

    if (a5)
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ANEErrors hostTooOld:](_ANEErrors, "hostTooOld:", v16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_5:
      LOBYTE(a5) = 0;
    }
  }
  else
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__1;
    v30 = __Block_byref_object_dispose__1;
    v31 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v17 = (void *)MEMORY[0x1D824DB90]();
    v18 = -[_ANEProgramIOSurfacesMapper validateRequest:model:](self, "validateRequest:model:", v10, v9);
    if (v18)
    {
      -[_ANEProgramIOSurfacesMapper prepareANEMemoryMappingParams:request:](self, "prepareANEMemoryMappingParams:request:", buf, v10);
      objc_msgSend(v10, "transactionHandle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v19, "unsignedIntegerValue");

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70___ANEProgramIOSurfacesMapper_unmapIOSurfacesWithModel_request_error___block_invoke;
      block[3] = &unk_1E9516258;
      block[7] = buf;
      block[8] = a2;
      block[4] = self;
      block[5] = &v22;
      block[6] = &v26;
      dispatch_sync((dispatch_queue_t)gANEMemoryMapperQueue, block);
    }
    objc_autoreleasePoolPop(v17);
    if (v18)
    {
      if (a5)
        *a5 = objc_retainAutorelease((id)v27[5]);
      LOBYTE(a5) = *((_BYTE *)v23 + 24) != 0;
    }
    else
    {
      LOBYTE(a5) = 0;
    }
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);

  }
  return (char)a5;
}

- (_ANEDeviceController)deviceController
{
  return self->_deviceController;
}

- (_ANEDeviceController)controller
{
  return self->_controller;
}

- (unint64_t)programHandle
{
  return self->_programHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_deviceController, 0);
}

- (void)validateRequest:(uint64_t)a3 model:(os_log_t)log .cold.1(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138412802;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a3;
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 128;
  _os_log_error_impl(&dword_1D3352000, log, OS_LOG_TYPE_ERROR, "%@: [request ioSurfacesCount]=%lu is invalid. Expected: (1 - %d)", buf, 0x1Cu);

  OUTLINED_FUNCTION_2_0();
}

- (void)mapIOSurfacesWithModel:(NSObject *)a3 request:cacheInference:error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_6(&dword_1D3352000, a2, a3, "%@: Virtual Machine environment detected but no virtualClient available.", (uint8_t *)a2);

  OUTLINED_FUNCTION_2_0();
}

@end
