@implementation MLE5OutputPortBinder

- (void)setPixelBufferPool:(id)a3
{
  objc_storeStrong((id *)&self->_pixelBufferPool, a3);
}

- (MLE5OutputPortBinder)initWithPort:(e5rt_io_port *)a3 featureDescription:(id)a4
{
  id v7;
  MLE5OutputPortBinder *v8;
  MLE5OutputPortBinder *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *serialQueue;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MLE5OutputPortBinder;
  v8 = -[MLE5OutputPortBinder init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_portHandle = a3;
    objc_storeStrong((id *)&v8->_featureDescription, a4);
    v10 = dispatch_queue_create("com.apple.coreml.MLE5Engine.outputPortBinder", 0);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v10;

    *(_WORD *)&v9->_outputBackingWasDirectlyBound = 256;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_temporarilyBoundPixelBuffer);
  self->_temporarilyBoundPixelBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)MLE5OutputPortBinder;
  -[MLE5OutputPortBinder dealloc](&v3, sel_dealloc);
}

- (BOOL)_reusableForCopyBoundOutputBacking
{
  return !-[MLE5OutputPortBinder boundFeatureDirectly](self, "boundFeatureDirectly");
}

- (BOOL)_reusableForDirectlyBoundOutputBacking:(id)a3
{
  id v4;
  NSObject *v5;
  e5rt_io_port *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned __int8 v9;
  uint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  uint64_t **v14;
  uint64_t *v15;
  unint64_t v16;
  NSObject *v17;
  uint64_t v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  __CFString *v30;
  void *v31;
  uint64_t (*v32)(id, e5rt_io_port *);
  char v33;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  __CFString *v38;
  __int16 v39;
  __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v5, OS_LOG_TYPE_ERROR, "outputBacking should not be nil here.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("outputBacking should not be nil here."));
  }
  v6 = -[MLE5OutputPortBinder portHandle](self, "portHandle");
  v7 = MLE5PortTraitOf();
  v8 = MLE5FeatureTraitOfBackingObject(v4);
  {
    outputReusabilityFunctionTable(void)::table = 0u;
    *(_OWORD *)&qword_1EE427008 = 0u;
    dword_1EE427018 = 1065353216;
  }
  if (outputReusabilityFunctionTable(void)::onceToken != -1)
    dispatch_once(&outputReusabilityFunctionTable(void)::onceToken, &__block_literal_global_44);
  v10 = v8;
  if (!*((_QWORD *)&outputReusabilityFunctionTable(void)::table + 1))
    goto LABEL_27;
  v11 = ((unint64_t)v7 << 24) | ((unint64_t)v8 << 16);
  v12 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&outputReusabilityFunctionTable(void)::table + 8));
  v12.i16[0] = vaddlv_u8(v12);
  if (v12.u32[0] > 1uLL)
  {
    v13 = ((unint64_t)v7 << 24) | ((unint64_t)v8 << 16);
    if (v11 >= *((_QWORD *)&outputReusabilityFunctionTable(void)::table + 1))
      v13 = v11 % *((_QWORD *)&outputReusabilityFunctionTable(void)::table + 1);
  }
  else
  {
    v13 = v11 & (*((_QWORD *)&outputReusabilityFunctionTable(void)::table + 1) - 1);
  }
  v14 = *(uint64_t ***)(outputReusabilityFunctionTable(void)::table + 8 * v13);
  if (!v14 || (v15 = *v14) == 0)
  {
LABEL_27:
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v7;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = off_1E3D661B8[v7];
      v20 = off_1E3D661D0[v8];
      *(_DWORD *)buf = 138412546;
      v38 = v19;
      v39 = 2112;
      v40 = v20;
      _os_log_error_impl(&dword_19C486000, v17, OS_LOG_TYPE_ERROR, "The output feature backing type is not supported. (Port trait %@, Output backing feature trait %@.)", buf, 0x16u);

    }
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = off_1E3D661B8[v18];
    v24 = off_1E3D661D0[v10];
    objc_msgSend(v22, "stringWithFormat:", CFSTR("The output feature backing type is not supported. (Port trait %@, Output backing feature trait %@.)"), v23, v24, v35);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v26);
    v27 = (id)objc_claimAutoreleasedReturnValue();

    v28 = v27;
    goto LABEL_30;
  }
  while (1)
  {
    v16 = v15[1];
    if (v11 == v16)
      break;
    if (v12.u32[0] > 1uLL)
    {
      if (v16 >= *((_QWORD *)&outputReusabilityFunctionTable(void)::table + 1))
        v16 %= *((_QWORD *)&outputReusabilityFunctionTable(void)::table + 1);
    }
    else
    {
      v16 &= *((_QWORD *)&outputReusabilityFunctionTable(void)::table + 1) - 1;
    }
    if (v16 != v13)
      goto LABEL_27;
LABEL_26:
    v15 = (uint64_t *)*v15;
    if (!v15)
      goto LABEL_27;
  }
  if (*((unsigned __int8 *)v15 + 16) != v7 || *((unsigned __int8 *)v15 + 17) != v8 || *((_BYTE *)v15 + 18) || v15[3])
    goto LABEL_26;
  while (1)
  {
    v32 = (uint64_t (*)(id, e5rt_io_port *))v15[4];
    if (v32)
      break;
    v28 = 0;
LABEL_30:
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v28, "localizedDescription");
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v30;
      _os_log_error_impl(&dword_19C486000, v29, OS_LOG_TYPE_ERROR, "Could not check the output port reusability. This is a missing handling of a certain condition (CoreML.framework's logic error). Error: %@.", buf, 0xCu);

    }
    v31 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(v28, "localizedDescription");
    v6 = (e5rt_io_port *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Could not check the output port reusability. This is a missing handling of a certain condition (CoreML.framework's logic error). Error: %@."), v6);

    __break(1u);
  }
  v33 = v32(v4, v6);

  return v33;
}

- (BOOL)reusableForOutputBacking:(id)a3 willBindDirectly:(BOOL *)a4
{
  id v6;
  int64_t v7;
  BOOL v8;
  BOOL v9;

  v6 = a3;
  v7 = -[MLE5OutputPortBinder _outputModeForOutputBacking:error:](self, "_outputModeForOutputBacking:error:", v6, 0);
  if (v7 == 1)
  {
    v8 = -[MLE5OutputPortBinder _reusableForDirectlyBoundOutputBacking:](self, "_reusableForDirectlyBoundOutputBacking:", v6);
    v9 = 1;
    if (!a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  v8 = v7 == 2 && -[MLE5OutputPortBinder _reusableForCopyBoundOutputBacking](self, "_reusableForCopyBoundOutputBacking");
  v9 = 0;
  if (a4)
LABEL_8:
    *a4 = v9;
LABEL_9:

  return v8;
}

- (unsigned)_directModeForOutputBacking:(id)a3 error:(id *)a4
{
  id v6;
  e5rt_io_port *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned __int8 v10;
  uint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  uint64_t **v15;
  uint64_t *v16;
  unint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  __CFString *v28;
  __CFString *v29;
  uint64_t (*v30)(e5rt_io_port *, id, id *);
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  __CFString *v34;
  __int16 v35;
  __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[MLE5OutputPortBinder portHandle](self, "portHandle");
  v8 = MLE5PortTraitOf();
  v9 = MLE5FeatureTraitOfBackingObject(v6);
  {
    directOutputBackingModeFunctionTable(void)::table = 0u;
    *(_OWORD *)&qword_1EE427038 = 0u;
    dword_1EE427048 = 1065353216;
  }
  if (directOutputBackingModeFunctionTable(void)::onceToken != -1)
    dispatch_once(&directOutputBackingModeFunctionTable(void)::onceToken, &__block_literal_global_17983);
  v11 = v9;
  if (!*((_QWORD *)&directOutputBackingModeFunctionTable(void)::table + 1))
    goto LABEL_23;
  v12 = ((unint64_t)v8 << 24) | ((unint64_t)v9 << 16);
  v13 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&directOutputBackingModeFunctionTable(void)::table + 8));
  v13.i16[0] = vaddlv_u8(v13);
  if (v13.u32[0] > 1uLL)
  {
    v14 = ((unint64_t)v8 << 24) | ((unint64_t)v9 << 16);
    if (v12 >= *((_QWORD *)&directOutputBackingModeFunctionTable(void)::table + 1))
      v14 = v12 % *((_QWORD *)&directOutputBackingModeFunctionTable(void)::table + 1);
  }
  else
  {
    v14 = v12 & (*((_QWORD *)&directOutputBackingModeFunctionTable(void)::table + 1) - 1);
  }
  v15 = *(uint64_t ***)(directOutputBackingModeFunctionTable(void)::table + 8 * v14);
  if (!v15 || (v16 = *v15) == 0)
  {
LABEL_23:
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v8;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v28 = off_1E3D661B8[v8];
      v29 = off_1E3D661D0[v9];
      *(_DWORD *)buf = 138412546;
      v34 = v28;
      v35 = 2112;
      v36 = v29;
      _os_log_error_impl(&dword_19C486000, v18, OS_LOG_TYPE_ERROR, "The output feature is not supported. (Port trait %@, output backing feature trait %@.)", buf, 0x16u);

    }
    if (a4)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = off_1E3D661B8[v19];
      v23 = off_1E3D661D0[v11];
      objc_msgSend(v21, "stringWithFormat:", CFSTR("The output feature is not supported. (Port trait %@, output backing feature trait %@.)"), v22, v23, v31);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v25);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_27;
  }
  while (1)
  {
    v17 = v16[1];
    if (v12 == v17)
      break;
    if (v13.u32[0] > 1uLL)
    {
      if (v17 >= *((_QWORD *)&directOutputBackingModeFunctionTable(void)::table + 1))
        v17 %= *((_QWORD *)&directOutputBackingModeFunctionTable(void)::table + 1);
    }
    else
    {
      v17 &= *((_QWORD *)&directOutputBackingModeFunctionTable(void)::table + 1) - 1;
    }
    if (v17 != v14)
      goto LABEL_23;
LABEL_22:
    v16 = (uint64_t *)*v16;
    if (!v16)
      goto LABEL_23;
  }
  if (*((unsigned __int8 *)v16 + 16) != v8 || *((unsigned __int8 *)v16 + 17) != v9 || *((_BYTE *)v16 + 18) || v16[3])
    goto LABEL_22;
  v30 = (uint64_t (*)(e5rt_io_port *, id, id *))v16[4];
  if (v30)
  {
    v26 = v30(v7, v6, a4);
    goto LABEL_28;
  }
LABEL_27:
  v26 = 0;
LABEL_28:

  return v26;
}

- (int64_t)_outputModeForOutputBacking:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t is_dynamic;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int64_t v13;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t last_error_message;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MLE5OutputPortBinder portHandle](self, "portHandle");
  is_dynamic = e5rt_io_port_is_dynamic();
  if ((_DWORD)is_dynamic)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[MLE5OutputPortBinder featureDescription](self, "featureDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v18 = v16;
      v19 = 2080;
      last_error_message = e5rt_get_last_error_message();
      v21 = 1024;
      v22 = is_dynamic;
      _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "Unable to query if output feature %@'s output shape is data dependent or not. E5RT: %s (%d)", buf, 0x1Cu);

    }
    v9 = (void *)MEMORY[0x1E0C99DA0];
    -[MLE5OutputPortBinder featureDescription](self, "featureDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Unable to query if output feature %@'s output shape is data dependent or not. E5RT: %s (%d)"), v11, e5rt_get_last_error_message(), is_dynamic);

  }
  if (v6)
  {
    v12 = -[MLE5OutputPortBinder _directModeForOutputBacking:error:](self, "_directModeForOutputBacking:error:", v6, a4);
    if (v12 == 1)
      v13 = 1;
    else
      v13 = 2 * (v12 == 2);
  }
  else
  {
    v13 = 2;
  }

  return v13;
}

- (BOOL)_directlyBindOutputBacking:(id)a3 error:(id *)a4
{
  id v6;
  e5rt_io_port *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned __int8 v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  uint64_t **v14;
  uint64_t *v15;
  unint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  char v24;
  __CFString *v26;
  uint64_t (*v27)(e5rt_io_port *, id, id *);
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[MLE5OutputPortBinder portHandle](self, "portHandle");
  -[MLE5OutputPortBinder portHandle](self, "portHandle");
  v8 = MLE5PortTraitOf();
  v9 = MLE5FeatureTraitOfBackingObject(v6);
  {
    outputBackingBindFunctionTable(void)::table = 0u;
    *(_OWORD *)&qword_1EE426FD8 = 0u;
    dword_1EE426FE8 = 1065353216;
  }
  if (outputBackingBindFunctionTable(void)::onceToken != -1)
    dispatch_once(&outputBackingBindFunctionTable(void)::onceToken, &__block_literal_global_15);
  if (!*((_QWORD *)&outputBackingBindFunctionTable(void)::table + 1))
    goto LABEL_23;
  v11 = ((unint64_t)v8 << 24) | ((unint64_t)v9 << 16);
  v12 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&outputBackingBindFunctionTable(void)::table + 8));
  v12.i16[0] = vaddlv_u8(v12);
  if (v12.u32[0] > 1uLL)
  {
    v13 = ((unint64_t)v8 << 24) | ((unint64_t)v9 << 16);
    if (v11 >= *((_QWORD *)&outputBackingBindFunctionTable(void)::table + 1))
      v13 = v11 % *((_QWORD *)&outputBackingBindFunctionTable(void)::table + 1);
  }
  else
  {
    v13 = v11 & (*((_QWORD *)&outputBackingBindFunctionTable(void)::table + 1) - 1);
  }
  v14 = *(uint64_t ***)(outputBackingBindFunctionTable(void)::table + 8 * v13);
  if (!v14 || (v15 = *v14) == 0)
  {
LABEL_23:
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v8;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v26 = off_1E3D661B8[v8];
      *(_DWORD *)buf = 138412290;
      v31 = v26;
      _os_log_error_impl(&dword_19C486000, v17, OS_LOG_TYPE_ERROR, "The output feature type is not supported. (Port trait %@.)", buf, 0xCu);

    }
    if (a4)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0CB2D50];
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = off_1E3D661B8[v18];
      objc_msgSend(v20, "stringWithFormat:", CFSTR("The output feature type is not supported. (Port trait %@.)"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v23);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v15[1];
    if (v11 == v16)
      break;
    if (v12.u32[0] > 1uLL)
    {
      if (v16 >= *((_QWORD *)&outputBackingBindFunctionTable(void)::table + 1))
        v16 %= *((_QWORD *)&outputBackingBindFunctionTable(void)::table + 1);
    }
    else
    {
      v16 &= *((_QWORD *)&outputBackingBindFunctionTable(void)::table + 1) - 1;
    }
    if (v16 != v13)
      goto LABEL_23;
LABEL_22:
    v15 = (uint64_t *)*v15;
    if (!v15)
      goto LABEL_23;
  }
  if (*((unsigned __int8 *)v15 + 16) != v8 || *((unsigned __int8 *)v15 + 17) != v9 || *((_BYTE *)v15 + 18) || v15[3])
    goto LABEL_22;
  v27 = (uint64_t (*)(e5rt_io_port *, id, id *))v15[4];
  if (v27)
  {
    v24 = v27(v7, v6, a4);
    goto LABEL_28;
  }
LABEL_27:
  v24 = 0;
LABEL_28:

  return v24;
}

- (BOOL)bindAndReturnError:(id *)a3
{
  MLFeatureValue *featureValue;
  void *v6;
  int64_t v7;
  e5rt_io_port *v8;
  void *v9;
  BOOL v10;
  BOOL v11;

  featureValue = self->_featureValue;
  self->_featureValue = 0;

  -[MLE5OutputPortBinder outputBacking](self, "outputBacking");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MLE5OutputPortBinder _outputModeForOutputBacking:error:](self, "_outputModeForOutputBacking:error:", v6, a3);
  if (v7 == 1)
  {
    if (-[MLE5OutputPortBinder _reusableForDirectlyBoundOutputBacking:](self, "_reusableForDirectlyBoundOutputBacking:", v6)|| (CVPixelBufferRelease(self->_temporarilyBoundPixelBuffer), self->_temporarilyBoundPixelBuffer = 0, -[MLE5OutputPortBinder _directlyBindOutputBacking:error:](self, "_directlyBindOutputBacking:error:", v6, a3)))
    {
      v11 = 1;
      -[MLE5OutputPortBinder setOutputBackingWasDirectlyBound:](self, "setOutputBackingWasDirectlyBound:", 1);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v7 == 2)
  {
    if (-[MLE5OutputPortBinder _reusableForCopyBoundOutputBacking](self, "_reusableForCopyBoundOutputBacking"))
      goto LABEL_7;
    CVPixelBufferRelease(self->_temporarilyBoundPixelBuffer);
    self->_temporarilyBoundPixelBuffer = 0;
    v8 = -[MLE5OutputPortBinder portHandle](self, "portHandle");
    -[MLE5OutputPortBinder pixelBufferPool](self, "pixelBufferPool");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MLE5BindEmptyMemoryObjectToPort((uint64_t)v8, v9, &self->_temporarilyBoundPixelBuffer, a3);

    if (v10)
      goto LABEL_7;
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  if (v7 != 3)
    goto LABEL_11;
LABEL_7:
  -[MLE5OutputPortBinder setOutputBackingWasDirectlyBound:](self, "setOutputBackingWasDirectlyBound:", 0);
  v11 = 1;
LABEL_12:

  return v11;
}

- (MLFeatureValue)featureValue
{
  NSObject *v3;
  _QWORD block[5];

  -[MLE5OutputPortBinder serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MLE5OutputPortBinder_featureValue__block_invoke;
  block[3] = &unk_1E3D66E48;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_featureValue;
}

- (id)_makeFeatureValueAndReturnError:(id *)a3
{
  e5rt_io_port *v5;
  void *v6;
  void *v7;
  void *v8;

  kdebug_trace();
  v5 = -[MLE5OutputPortBinder portHandle](self, "portHandle");
  -[MLE5OutputPortBinder outputBacking](self, "outputBacking");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5OutputPortBinder featureDescription](self, "featureDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MLE5OutputPortBinder outputBackingWasDirectlyBound](self, "outputBackingWasDirectlyBound"))
  {
    -[MLE5OutputPortBinder _makeFeatureValueFromOutputBacking:error:](self, "_makeFeatureValueFromOutputBacking:error:", v6, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLE5OutputPortBinder setBoundFeatureDirectly:](self, "setBoundFeatureDirectly:", 1);
  }
  else if (v6)
  {
    if (-[MLE5OutputPortBinder _copyOutputFromPort:toOutputBacking:featureDescription:error:](self, "_copyOutputFromPort:toOutputBacking:featureDescription:error:", v5, v6, v7, a3))
    {
      -[MLE5OutputPortBinder _makeFeatureValueFromOutputBacking:error:](self, "_makeFeatureValueFromOutputBacking:error:", v6, a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLE5OutputPortBinder setBoundFeatureDirectly:](self, "setBoundFeatureDirectly:", 0);
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    -[MLE5OutputPortBinder _makeFeatureValueFromPort:featureDescription:error:](self, "_makeFeatureValueFromPort:featureDescription:error:", v5, v7, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  kdebug_trace();
  return v8;
}

- (id)_makeFeatureValueFromOutputBacking:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = MLE5FeatureTraitOfBackingObject(v5);
  if ((v6 - 1) < 2)
  {
    +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;
    if (v7)
      goto LABEL_11;
    goto LABEL_6;
  }
  if ((v6 - 3) < 2)
  {
    +[MLFeatureValue featureValueWithPixelBuffer:](MLFeatureValue, "featureValueWithPixelBuffer:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "Failed to create MLFeatureValue from the specified output backing object %@", buf, 0xCu);
  }

  if (a4)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create MLFeatureValue from the specified output backing object %@"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)_copyOutputFromPort:(e5rt_io_port *)a3 toOutputBacking:(id)a4 featureDescription:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  unsigned int v11;
  unsigned int v12;
  unsigned __int8 v13;
  uint64_t v14;
  unint64_t v15;
  uint8x8_t v16;
  unint64_t v17;
  uint64_t **v18;
  uint64_t *i;
  unint64_t v20;
  NSObject *v21;
  uint64_t v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t v32;
  _BYTE buf[12];
  __int16 v34;
  __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = MLE5PortTraitOf();
  v12 = MLE5FeatureTraitOfBackingObject(v9);
  {
    outputCopyFunctionTable(void)::table = 0u;
    *(_OWORD *)&qword_1EE4316D8 = 0u;
    dword_1EE4316E8 = 1065353216;
  }
  if (outputCopyFunctionTable(void)::onceToken != -1)
    dispatch_once(&outputCopyFunctionTable(void)::onceToken, &__block_literal_global_45);
  v14 = v12;
  if (*((_QWORD *)&outputCopyFunctionTable(void)::table + 1))
  {
    v15 = ((unint64_t)v11 << 24) | ((unint64_t)v12 << 16);
    v16 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&outputCopyFunctionTable(void)::table + 8));
    v16.i16[0] = vaddlv_u8(v16);
    if (v16.u32[0] > 1uLL)
    {
      v17 = ((unint64_t)v11 << 24) | ((unint64_t)v12 << 16);
      if (v15 >= *((_QWORD *)&outputCopyFunctionTable(void)::table + 1))
        v17 = v15 % *((_QWORD *)&outputCopyFunctionTable(void)::table + 1);
    }
    else
    {
      v17 = v15 & (*((_QWORD *)&outputCopyFunctionTable(void)::table + 1) - 1);
    }
    v18 = *(uint64_t ***)(outputCopyFunctionTable(void)::table + 8 * v17);
    if (v18)
    {
      for (i = *v18; i; i = (uint64_t *)*i)
      {
        v20 = i[1];
        if (v15 == v20)
        {
          if (*((unsigned __int8 *)i + 16) == v11
            && *((unsigned __int8 *)i + 17) == v12
            && !*((_BYTE *)i + 18)
            && !i[3])
          {
            goto LABEL_26;
          }
        }
        else
        {
          if (v16.u32[0] > 1uLL)
          {
            if (v20 >= *((_QWORD *)&outputCopyFunctionTable(void)::table + 1))
              v20 %= *((_QWORD *)&outputCopyFunctionTable(void)::table + 1);
          }
          else
          {
            v20 &= *((_QWORD *)&outputCopyFunctionTable(void)::table + 1) - 1;
          }
          if (v20 != v17)
            break;
        }
      }
    }
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v11;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v23 = off_1E3D661B8[v11];
    v24 = off_1E3D661D0[v12];
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v23;
    v34 = 2112;
    v35 = v24;
    _os_log_error_impl(&dword_19C486000, v21, OS_LOG_TYPE_ERROR, "The output feature backing type is not supported. (Port trait %@, Output backing feature trait %@.)", buf, 0x16u);

  }
  a3 = (e5rt_io_port *)MEMORY[0x1E0CB35C8];
  v32 = *MEMORY[0x1E0CB2D50];
  v25 = (void *)MEMORY[0x1E0CB3940];
  v26 = off_1E3D661B8[v22];
  v27 = off_1E3D661D0[v14];
  objc_msgSend(v25, "stringWithFormat:", CFSTR("The output feature backing type is not supported. (Port trait %@, Output backing feature trait %@.)"), v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v32, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[e5rt_io_port errorWithDomain:code:userInfo:](a3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v29);
  *a6 = (id)objc_claimAutoreleasedReturnValue();

  __break(1u);
LABEL_26:
  v30 = ((uint64_t (*)(e5rt_io_port *, id, id, id *))i[4])(a3, v9, v10, a6);

  return v30;
}

- (id)_makeFeatureValueFromPort:(e5rt_io_port *)a3 featureDescription:(id)a4 error:(id *)a5
{
  id v7;
  unsigned int v8;
  uint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  uint64_t **v15;
  uint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v28;
  void *v29;
  uint64_t (*v30)(e5rt_io_port *, void *, id *);
  e5rt_io_port *v31;
  void *v32;
  unsigned int v33;
  unsigned __int8 v34;
  unint64_t v35;
  uint8x8_t v36;
  unint64_t v37;
  uint64_t **v38;
  uint64_t *v39;
  unint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  void *v49;
  void (*v50)(e5rt_io_port *, void *, id *);
  e5rt_io_port *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint8_t buf[4];
  __CFString *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = MLE5PortTraitOf();
  v9 = objc_msgSend(v7, "type");
  {
    directOutputModeFunctionTable(void)::table = 0u;
    *(_OWORD *)&qword_1ED001130 = 0u;
    dword_1ED001140 = 1065353216;
  }
  if (directOutputModeFunctionTable(void)::onceToken != -1)
    dispatch_once(&directOutputModeFunctionTable(void)::onceToken, &__block_literal_global_43);
  v11 = v8;
  if (!*((_QWORD *)&directOutputModeFunctionTable(void)::table + 1))
    goto LABEL_23;
  v12 = v9 | ((unint64_t)v8 << 24);
  v13 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&directOutputModeFunctionTable(void)::table + 8));
  v13.i16[0] = vaddlv_u8(v13);
  if (v13.u32[0] > 1uLL)
  {
    v14 = v9 | ((unint64_t)v8 << 24);
    if (v12 >= *((_QWORD *)&directOutputModeFunctionTable(void)::table + 1))
      v14 = v12 % *((_QWORD *)&directOutputModeFunctionTable(void)::table + 1);
  }
  else
  {
    v14 = v12 & (*((_QWORD *)&directOutputModeFunctionTable(void)::table + 1) - 1);
  }
  v15 = *(uint64_t ***)(directOutputModeFunctionTable(void)::table + 8 * v14);
  if (!v15 || (v16 = *v15) == 0)
  {
LABEL_23:
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v28 = off_1E3D661B8[v8];
      +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", v9);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v56 = v28;
      v57 = 2112;
      v58 = v29;
      _os_log_error_impl(&dword_19C486000, v19, OS_LOG_TYPE_ERROR, "The output feature type is not supported. (Port trait %@, Feature type %@.)", buf, 0x16u);

    }
    if (a5)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v53 = *MEMORY[0x1E0CB2D50];
      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = off_1E3D661B8[v11];
      +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("The output feature type is not supported. (Port trait %@, Feature type %@.)"), v22, v23, v53);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v25);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_27;
  }
  while (1)
  {
    v18 = v16[1];
    if (v12 == v18)
      break;
    if (v13.u32[0] > 1uLL)
    {
      if (v18 >= *((_QWORD *)&directOutputModeFunctionTable(void)::table + 1))
        v18 %= *((_QWORD *)&directOutputModeFunctionTable(void)::table + 1);
    }
    else
    {
      v18 &= *((_QWORD *)&directOutputModeFunctionTable(void)::table + 1) - 1;
    }
    if (v18 != v14)
      goto LABEL_23;
LABEL_22:
    v16 = (uint64_t *)*v16;
    if (!v16)
      goto LABEL_23;
  }
  if (*((unsigned __int8 *)v16 + 16) != v8 || *((_BYTE *)v16 + 17) || *((_BYTE *)v16 + 18) || v16[3] != v9)
    goto LABEL_22;
  v30 = (uint64_t (*)(e5rt_io_port *, void *, id *))v16[4];
  if (!v30)
    goto LABEL_27;
  v31 = -[MLE5OutputPortBinder portHandle](self, "portHandle");
  -[MLE5OutputPortBinder featureDescription](self, "featureDescription");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v30(v31, v32, a5);

  if (!v33)
    goto LABEL_27;
  -[MLE5OutputPortBinder setBoundFeatureDirectly:](self, "setBoundFeatureDirectly:", v33 == 1);
  {
    outputFeatureValueFunctionTable(void)::table = 0u;
    *(_OWORD *)&qword_1ED001160 = 0u;
    dword_1ED001170 = 1065353216;
  }
  if (outputFeatureValueFunctionTable(void)::onceToken != -1)
    dispatch_once(&outputFeatureValueFunctionTable(void)::onceToken, &__block_literal_global_49);
  if (!*((_QWORD *)&outputFeatureValueFunctionTable(void)::table + 1))
    goto LABEL_53;
  v17 = (unint64_t)v8 << 24;
  v35 = v17 | ((unint64_t)v33 << 8) | v9;
  v36 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&outputFeatureValueFunctionTable(void)::table + 8));
  v36.i16[0] = vaddlv_u8(v36);
  if (v36.u32[0] > 1uLL)
  {
    v37 = v17 | ((unint64_t)v33 << 8) | v9;
    if (v35 >= *((_QWORD *)&outputFeatureValueFunctionTable(void)::table + 1))
      v37 = v35 % *((_QWORD *)&outputFeatureValueFunctionTable(void)::table + 1);
  }
  else
  {
    v37 = v35 & (*((_QWORD *)&outputFeatureValueFunctionTable(void)::table + 1) - 1);
  }
  v38 = *(uint64_t ***)(outputFeatureValueFunctionTable(void)::table + 8 * v37);
  if (!v38 || (v39 = *v38) == 0)
  {
LABEL_53:
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v48 = off_1E3D661B8[v8];
      +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", v9);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v56 = v48;
      v57 = 2112;
      v58 = v49;
      _os_log_error_impl(&dword_19C486000, v41, OS_LOG_TYPE_ERROR, "The output feature value is not supported. (Port trait %@, feature type %@.)", buf, 0x16u);

    }
    if (a5)
    {
      v42 = (void *)MEMORY[0x1E0CB35C8];
      v53 = *MEMORY[0x1E0CB2D50];
      v43 = (void *)MEMORY[0x1E0CB3940];
      v44 = off_1E3D661B8[v11];
      +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", v9);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stringWithFormat:", CFSTR("The output feature value is not supported. (Port trait %@, feature type %@.)"), v44, v45, v53);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v46;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v47);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_27;
  }
  while (2)
  {
    v40 = v39[1];
    if (v35 != v40)
    {
      if (v36.u32[0] > 1uLL)
      {
        if (v40 >= *((_QWORD *)&outputFeatureValueFunctionTable(void)::table + 1))
          v40 %= *((_QWORD *)&outputFeatureValueFunctionTable(void)::table + 1);
      }
      else
      {
        v40 &= *((_QWORD *)&outputFeatureValueFunctionTable(void)::table + 1) - 1;
      }
      if (v40 != v37)
        goto LABEL_53;
      goto LABEL_52;
    }
    if (*((unsigned __int8 *)v39 + 16) != v8
      || *((_BYTE *)v39 + 17)
      || *((unsigned __int8 *)v39 + 18) != v33
      || v39[3] != v9)
    {
LABEL_52:
      v39 = (uint64_t *)*v39;
      if (!v39)
        goto LABEL_53;
      continue;
    }
    break;
  }
  v50 = (void (*)(e5rt_io_port *, void *, id *))v39[4];
  if (!v50)
  {
LABEL_27:
    v26 = 0;
    goto LABEL_28;
  }
  v51 = -[MLE5OutputPortBinder portHandle](self, "portHandle");
  -[MLE5OutputPortBinder featureDescription](self, "featureDescription");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v50(v51, v52, a5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33 == 1)
  {
    CVPixelBufferRelease(self->_temporarilyBoundPixelBuffer);
    self->_temporarilyBoundPixelBuffer = 0;
  }
LABEL_28:

  return v26;
}

- (void)reset
{
  MLFeatureValue *featureValue;
  id outputBacking;

  featureValue = self->_featureValue;
  self->_featureValue = 0;

  outputBacking = self->_outputBacking;
  self->_outputBacking = 0;

  CVPixelBufferRelease(self->_temporarilyBoundPixelBuffer);
  self->_temporarilyBoundPixelBuffer = 0;
  -[MLE5OutputPortBinder setOutputBackingWasDirectlyBound:](self, "setOutputBackingWasDirectlyBound:", 0);
  -[MLE5OutputPortBinder setBoundFeatureDirectly:](self, "setBoundFeatureDirectly:", 1);
}

- (MLPixelBufferPool)pixelBufferPool
{
  return self->_pixelBufferPool;
}

- (id)outputBacking
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setOutputBacking:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)outputBackingWasDirectlyBound
{
  return self->_outputBackingWasDirectlyBound;
}

- (void)setOutputBackingWasDirectlyBound:(BOOL)a3
{
  self->_outputBackingWasDirectlyBound = a3;
}

- (BOOL)boundFeatureDirectly
{
  return self->_boundFeatureDirectly;
}

- (void)setBoundFeatureDirectly:(BOOL)a3
{
  self->_boundFeatureDirectly = a3;
}

- (e5rt_io_port)portHandle
{
  return self->_portHandle;
}

- (MLFeatureDescription)featureDescription
{
  return (MLFeatureDescription *)objc_getProperty(self, a2, 56, 1);
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_featureDescription, 0);
  objc_storeStrong(&self->_outputBacking, 0);
  objc_storeStrong((id *)&self->_pixelBufferPool, 0);
  objc_storeStrong((id *)&self->_featureValue, 0);
}

void __36__MLE5OutputPortBinder_featureValue__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[2])
  {
    objc_msgSend(v2, "_makeFeatureValueAndReturnError:", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

  }
}

@end
