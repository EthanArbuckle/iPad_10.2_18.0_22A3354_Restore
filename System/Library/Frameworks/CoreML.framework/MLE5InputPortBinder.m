@implementation MLE5InputPortBinder

- (void)setPixelBufferPool:(id)a3
{
  objc_storeStrong((id *)&self->_pixelBufferPool, a3);
}

- (MLE5InputPortBinder)initWithPort:(e5rt_io_port *)a3 featureDescription:(id)a4
{
  id v7;
  MLE5InputPortBinder *v8;
  MLE5InputPortBinder *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MLE5InputPortBinder;
  v8 = -[MLE5InputPortBinder init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_portHandle = a3;
    objc_storeStrong((id *)&v8->_featureDescription, a4);
    v9->_bindingMode = 0;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_temporarilyBoundPixelBuffer);
  self->_temporarilyBoundPixelBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)MLE5InputPortBinder;
  -[MLE5InputPortBinder dealloc](&v3, sel_dealloc);
}

- (BOOL)_reusableForFeatureValue:(id)a3 directMode:(unsigned __int8)a4
{
  int v4;
  id v6;
  char v7;
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
  __CFString *v19;
  __CFString *v20;
  uint64_t (*v21)(id, void *, e5rt_io_port *);
  void *v22;
  int v23;
  __CFString *v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4 != 1)
  {
    if (v4 != 2)
      goto LABEL_29;
    v7 = -[MLE5InputPortBinder bindingMode](self, "bindingMode") == 2;
    goto LABEL_30;
  }
  -[MLE5InputPortBinder portHandle](self, "portHandle");
  v8 = MLE5PortTraitOf();
  v9 = MLE5FeatureTraitOf(v6);
  {
    inputReusabilityFunctionTable(void)::table = 0u;
    *(_OWORD *)&qword_1EE427440 = 0u;
    dword_1EE427450 = 1065353216;
  }
  if (inputReusabilityFunctionTable(void)::onceToken != -1)
    dispatch_once(&inputReusabilityFunctionTable(void)::onceToken, &__block_literal_global_40);
  if (!*((_QWORD *)&inputReusabilityFunctionTable(void)::table + 1))
    goto LABEL_26;
  v11 = ((unint64_t)v8 << 24) | ((unint64_t)v9 << 16);
  v12 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&inputReusabilityFunctionTable(void)::table + 8));
  v12.i16[0] = vaddlv_u8(v12);
  if (v12.u32[0] > 1uLL)
  {
    v13 = ((unint64_t)v8 << 24) | ((unint64_t)v9 << 16);
    if (v11 >= *((_QWORD *)&inputReusabilityFunctionTable(void)::table + 1))
      v13 = v11 % *((_QWORD *)&inputReusabilityFunctionTable(void)::table + 1);
  }
  else
  {
    v13 = v11 & (*((_QWORD *)&inputReusabilityFunctionTable(void)::table + 1) - 1);
  }
  v14 = *(uint64_t ***)(inputReusabilityFunctionTable(void)::table + 8 * v13);
  if (!v14 || (v15 = *v14) == 0)
  {
LABEL_26:
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = off_1E3D661B8[v8];
      v20 = off_1E3D661D0[v9];
      v23 = 138412546;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      _os_log_error_impl(&dword_19C486000, v17, OS_LOG_TYPE_ERROR, "The input feature value is invalid or unsupported. (Port trait %@, feature trait %@.)", (uint8_t *)&v23, 0x16u);

    }
    goto LABEL_29;
  }
  while (1)
  {
    v16 = v15[1];
    if (v11 == v16)
      break;
    if (v12.u32[0] > 1uLL)
    {
      if (v16 >= *((_QWORD *)&inputReusabilityFunctionTable(void)::table + 1))
        v16 %= *((_QWORD *)&inputReusabilityFunctionTable(void)::table + 1);
    }
    else
    {
      v16 &= *((_QWORD *)&inputReusabilityFunctionTable(void)::table + 1) - 1;
    }
    if (v16 != v13)
      goto LABEL_26;
LABEL_25:
    v15 = (uint64_t *)*v15;
    if (!v15)
      goto LABEL_26;
  }
  if (*((unsigned __int8 *)v15 + 16) != v8 || *((unsigned __int8 *)v15 + 17) != v9 || *((_BYTE *)v15 + 18) || v15[3])
    goto LABEL_25;
  v21 = (uint64_t (*)(id, void *, e5rt_io_port *))v15[4];
  if (v21)
  {
    -[MLE5InputPortBinder directlyBoundFeatureValue](self, "directlyBoundFeatureValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v21(v6, v22, -[MLE5InputPortBinder portHandle](self, "portHandle"));

    goto LABEL_30;
  }
LABEL_29:
  v7 = 0;
LABEL_30:

  return v7;
}

- (BOOL)reusableForFeatureValue:(id)a3 willBindDirectly:(BOOL *)a4
{
  id v6;
  unsigned int v7;
  unsigned int v8;
  unsigned __int8 v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  uint64_t **v13;
  uint64_t *v14;
  unint64_t v15;
  NSObject *v16;
  BOOL v17;
  __CFString *v19;
  __CFString *v20;
  unsigned int (*v21)(id, e5rt_io_port *);
  uint64_t (*DirectInputModeFunction)(id, e5rt_io_port *, _QWORD);
  uint64_t v23;
  int v24;
  __CFString *v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MLE5InputPortBinder portHandle](self, "portHandle");
  v7 = MLE5PortTraitOf();
  v8 = MLE5FeatureTraitOf(v6);
  {
    portCompatibilityFunctionTable(void)::table = 0u;
    *(_OWORD *)&qword_1EE427408 = 0u;
    dword_1EE427418 = 1065353216;
  }
  if (portCompatibilityFunctionTable(void)::onceToken != -1)
    dispatch_once(&portCompatibilityFunctionTable(void)::onceToken, &__block_literal_global_13838);
  if (!*((_QWORD *)&portCompatibilityFunctionTable(void)::table + 1))
    goto LABEL_23;
  v10 = ((unint64_t)v7 << 24) | ((unint64_t)v8 << 16);
  v11 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&portCompatibilityFunctionTable(void)::table + 8));
  v11.i16[0] = vaddlv_u8(v11);
  if (v11.u32[0] > 1uLL)
  {
    v12 = ((unint64_t)v7 << 24) | ((unint64_t)v8 << 16);
    if (v10 >= *((_QWORD *)&portCompatibilityFunctionTable(void)::table + 1))
      v12 = v10 % *((_QWORD *)&portCompatibilityFunctionTable(void)::table + 1);
  }
  else
  {
    v12 = v10 & (*((_QWORD *)&portCompatibilityFunctionTable(void)::table + 1) - 1);
  }
  v13 = *(uint64_t ***)(portCompatibilityFunctionTable(void)::table + 8 * v12);
  if (!v13 || (v14 = *v13) == 0)
  {
LABEL_23:
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = off_1E3D661B8[v7];
      v20 = off_1E3D661D0[v8];
      v24 = 138412546;
      v25 = v19;
      v26 = 2112;
      v27 = v20;
      _os_log_error_impl(&dword_19C486000, v16, OS_LOG_TYPE_ERROR, "The feature is invalid or unsupported. (port trait %@, feature trait %@.)", (uint8_t *)&v24, 0x16u);

    }
    goto LABEL_26;
  }
  while (1)
  {
    v15 = v14[1];
    if (v10 == v15)
      break;
    if (v11.u32[0] > 1uLL)
    {
      if (v15 >= *((_QWORD *)&portCompatibilityFunctionTable(void)::table + 1))
        v15 %= *((_QWORD *)&portCompatibilityFunctionTable(void)::table + 1);
    }
    else
    {
      v15 &= *((_QWORD *)&portCompatibilityFunctionTable(void)::table + 1) - 1;
    }
    if (v15 != v12)
      goto LABEL_23;
LABEL_22:
    v14 = (uint64_t *)*v14;
    if (!v14)
      goto LABEL_23;
  }
  if (*((unsigned __int8 *)v14 + 16) != v7 || *((unsigned __int8 *)v14 + 17) != v8 || *((_BYTE *)v14 + 18) || v14[3])
    goto LABEL_22;
  v21 = (unsigned int (*)(id, e5rt_io_port *))v14[4];
  if (!v21
    || !v21(v6, -[MLE5InputPortBinder portHandle](self, "portHandle"))
    || (DirectInputModeFunction = (uint64_t (*)(id, e5rt_io_port *, _QWORD))MLE5FindDirectInputModeFunction(v7, v8, 0)) == 0)
  {
LABEL_26:
    v17 = 0;
    goto LABEL_27;
  }
  v23 = DirectInputModeFunction(v6, -[MLE5InputPortBinder portHandle](self, "portHandle"), 0);
  v17 = -[MLE5InputPortBinder _reusableForFeatureValue:directMode:](self, "_reusableForFeatureValue:directMode:", v6, v23);
  if (a4)
    *a4 = (_DWORD)v23 == 1;
LABEL_27:

  return v17;
}

- (BOOL)bindMemoryObjectForFeatureValue:(id)a3 error:(id *)a4
{
  id v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t (*DirectInputModeFunction)(id, e5rt_io_port *, id *);
  uint64_t v10;
  int v11;
  uint64_t *InputBindFunction;
  e5rt_io_port *v13;
  void *v14;
  e5rt_io_port *v16;
  void *v17;

  v6 = a3;
  -[MLE5InputPortBinder portHandle](self, "portHandle");
  v7 = MLE5PortTraitOf();
  v8 = MLE5FeatureTraitOf(v6);
  DirectInputModeFunction = (uint64_t (*)(id, e5rt_io_port *, id *))MLE5FindDirectInputModeFunction(v7, v8, a4);
  if (!DirectInputModeFunction)
    goto LABEL_9;
  v10 = DirectInputModeFunction(v6, -[MLE5InputPortBinder portHandle](self, "portHandle"), a4);
  if (-[MLE5InputPortBinder _reusableForFeatureValue:directMode:](self, "_reusableForFeatureValue:directMode:", v6, v10))
  {
LABEL_3:
    LOBYTE(v11) = 1;
    goto LABEL_10;
  }
  -[MLE5InputPortBinder setBindingMode:](self, "setBindingMode:", 0);
  if ((_DWORD)v10 == 2)
  {
    CVPixelBufferRelease(self->_temporarilyBoundPixelBuffer);
    v16 = -[MLE5InputPortBinder portHandle](self, "portHandle");
    -[MLE5InputPortBinder pixelBufferPool](self, "pixelBufferPool");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MLE5BindEmptyMemoryObjectToPort((uint64_t)v16, v17, &self->_temporarilyBoundPixelBuffer, a4);

    if (!v11)
      goto LABEL_10;
    -[MLE5InputPortBinder setDirectlyBoundFeatureValue:](self, "setDirectlyBoundFeatureValue:", 0);
    -[MLE5InputPortBinder setBindingMode:](self, "setBindingMode:", 2);
    goto LABEL_3;
  }
  if ((_DWORD)v10 != 1 || (InputBindFunction = MLE5FindInputBindFunction(v7, v8, 1u, a4)) == 0)
  {
LABEL_9:
    LOBYTE(v11) = 0;
    goto LABEL_10;
  }
  v13 = -[MLE5InputPortBinder portHandle](self, "portHandle");
  -[MLE5InputPortBinder featureDescription](self, "featureDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = ((uint64_t (*)(id, e5rt_io_port *, void *, id *))InputBindFunction)(v6, v13, v14, a4);

  if (v11)
  {
    -[MLE5InputPortBinder setDirectlyBoundFeatureValue:](self, "setDirectlyBoundFeatureValue:", v6);
    LOBYTE(v11) = 1;
    -[MLE5InputPortBinder setBindingMode:](self, "setBindingMode:", 1);
  }
LABEL_10:

  return v11;
}

- (BOOL)copyFeatureValue:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  e5rt_io_port *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t *InputBindFunction;
  void *v12;
  char v13;
  uint8_t v15[16];

  v6 = a3;
  if (-[MLE5InputPortBinder bindingMode](self, "bindingMode") != 2)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_19C486000, v7, OS_LOG_TYPE_ERROR, "Tried to copy feature value to port for directly bound feature value.", v15, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Tried to copy feature value to port for directly bound feature value."));
  }
  v8 = -[MLE5InputPortBinder portHandle](self, "portHandle");
  v9 = MLE5PortTraitOf();
  v10 = MLE5FeatureTraitOf(v6);
  InputBindFunction = MLE5FindInputBindFunction(v9, v10, 2u, a4);
  if (InputBindFunction)
  {
    -[MLE5InputPortBinder featureDescription](self, "featureDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = ((uint64_t (*)(id, e5rt_io_port *, void *, id *))InputBindFunction)(v6, v8, v12, a4);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)reset
{
  -[MLE5InputPortBinder setDirectlyBoundFeatureValue:](self, "setDirectlyBoundFeatureValue:", 0);
  -[MLE5InputPortBinder setBindingMode:](self, "setBindingMode:", 0);
  CVPixelBufferRelease(self->_temporarilyBoundPixelBuffer);
  self->_temporarilyBoundPixelBuffer = 0;
}

- (MLPixelBufferPool)pixelBufferPool
{
  return self->_pixelBufferPool;
}

- (unsigned)bindingMode
{
  return self->_bindingMode;
}

- (void)setBindingMode:(unsigned __int8)a3
{
  self->_bindingMode = a3;
}

- (e5rt_io_port)portHandle
{
  return self->_portHandle;
}

- (MLFeatureDescription)featureDescription
{
  return (MLFeatureDescription *)objc_getProperty(self, a2, 40, 1);
}

- (MLFeatureValue)directlyBoundFeatureValue
{
  return self->_directlyBoundFeatureValue;
}

- (void)setDirectlyBoundFeatureValue:(id)a3
{
  objc_storeStrong((id *)&self->_directlyBoundFeatureValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directlyBoundFeatureValue, 0);
  objc_storeStrong((id *)&self->_featureDescription, 0);
  objc_storeStrong((id *)&self->_pixelBufferPool, 0);
}

@end
