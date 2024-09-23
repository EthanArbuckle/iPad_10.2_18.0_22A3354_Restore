@implementation HKImportExclusionDeviceDataSource

+ (BOOL)isDeviceTypeAllowedForHKFeatureIdentifierOxygenSaturationRecording:(id)a3
{
  return objc_msgSend(&unk_1E389D8B8, "containsObject:", a3);
}

+ (BOOL)isDeviceSerialNumberOnAllowedListForHKFeatureIdentifierOxygenSaturationRecording:(id)a3
{
  id v3;
  size_t v4;
  int v5;
  void *v6;
  char *p_p;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  unsigned int v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  size_t v27;
  void *__p;
  size_t v30;
  unsigned __int8 v31;
  int v32;
  unsigned __int16 v33;
  unsigned int v34;
  unsigned __int16 v35;

  v3 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v3, "UTF8String"));
  v4 = v31;
  v5 = (char)v31;
  v6 = __p;
  if ((v31 & 0x80u) == 0)
    p_p = (char *)&__p;
  else
    p_p = (char *)__p;
  if ((v31 & 0x80u) != 0)
    v4 = v30;
  v35 = 0;
  v34 = 0;
  if (v4 == 10)
  {
    v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = p_p[v8] - 48;
      if (v10 > 0x29 || ((0x3D77DD802FFuLL >> v10) & 1) == 0)
        break;
      v9 = qword_19A44B790[v10] + 27 * v9;
      if (++v8 == 10)
      {
        for (i = 5; i != -1; --i)
        {
          *((_BYTE *)&v34 + i) = v9;
          v9 >>= 8;
        }
        v12 = v34 | ((unint64_t)v35 << 32);
        goto LABEL_15;
      }
    }
  }
  v12 = 0;
LABEL_15:
  v32 = v12;
  v33 = WORD2(v12);
  if (v5 < 0)
    operator delete(v6);
  if (v32 | v33)
  {
    v13 = 107186;
    v14 = (char *)&hk_HKFeatureIdentifierOxygenSaturationRecording::allowed_encoded_serial_numbers;
    do
    {
      v15 = 0;
      v16 = v13 >> 1;
      v17 = &v14[6 * (v13 >> 1)];
      while (1)
      {
        v18 = v17[v15];
        v19 = *((unsigned __int8 *)&v32 + v15);
        if (v18 != v19)
          break;
        if (++v15 == 6)
          goto LABEL_25;
      }
      v20 = v13 + ~v16;
      if (v18 < v19)
      {
        v16 = v20;
        v14 = v17 + 6;
      }
LABEL_25:
      v13 = v16;
    }
    while (v16);
    if (v14 == (char *)&unk_19A44B78A)
    {
      v24 = 0;
    }
    else
    {
      v21 = 0;
      while (1)
      {
        v22 = *((unsigned __int8 *)&v32 + v21);
        v23 = v14[v21];
        if (v22 != v23)
          break;
        if (++v21 == 6)
        {
          v24 = 1;
          goto LABEL_44;
        }
      }
      v24 = v22 >= v23;
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    LOBYTE(v34) = 0;
    v25 = std::__lower_bound[abi:ne180100]<std::_ClassicAlgPolicy,std::string_view const*,std::string_view const*,std::string,std::__identity,std::__less<void,void>>((uint64_t)&hk_HKFeatureIdentifierOxygenSaturationRecording::additional_allowed_serial_numbers, (uint64_t)&__block_literal_global_26, &__p);
    if ((_UNKNOWN *)v25 == &__block_literal_global_26)
    {
      v24 = 0;
    }
    else
    {
      if ((v31 & 0x80u) == 0)
        v26 = &__p;
      else
        v26 = __p;
      if ((v31 & 0x80u) == 0)
        v27 = v31;
      else
        v27 = v30;
      v24 = (int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(*(const void **)v25, *(_QWORD *)(v25 + 8), v26, v27) << 24) < 1;
    }
    if ((char)v31 < 0)
      operator delete(__p);
  }
LABEL_44:

  return v24;
}

- (HKImportExclusionDeviceDataSource)initWithPairedDeviceRegistry:(id)a3
{
  id v5;
  HKImportExclusionDeviceDataSource *v6;
  HKImportExclusionDeviceDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKImportExclusionDeviceDataSource;
  v6 = -[HKImportExclusionDeviceDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pairedDeviceRegistry, a3);

  return v7;
}

- (id)isActiveWatchProdFusedWithBehavior:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  if (objc_msgSend(v4, "isAppleWatch"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isProdFused"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKImportExclusionDeviceDataSource activePairedDevice](self, "activePairedDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v7 = (_QWORD *)getNRDevicePropertySigningFuseSymbolLoc_ptr;
      v13 = getNRDevicePropertySigningFuseSymbolLoc_ptr;
      if (!getNRDevicePropertySigningFuseSymbolLoc_ptr)
      {
        v8 = (void *)NanoRegistryLibrary_3();
        v7 = dlsym(v8, "NRDevicePropertySigningFuse");
        v11[3] = (uint64_t)v7;
        getNRDevicePropertySigningFuseSymbolLoc_ptr = (uint64_t)v7;
      }
      _Block_object_dispose(&v10, 8);
      if (!v7)
        -[HKImportExclusionDeviceDataSource isActiveWatchProdFusedWithBehavior:].cold.1();
      objc_msgSend(v6, "valueForProperty:", *v7, v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)activePairedDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HKImportExclusionDeviceDataSource pairedDeviceRegistry](self, "pairedDeviceRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getNRPairedDeviceRegistryClass_0(), "activeDeviceSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NRPairedDeviceRegistry)pairedDeviceRegistry
{
  NRPairedDeviceRegistry *pairedDeviceRegistry;

  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  if (pairedDeviceRegistry)
    return pairedDeviceRegistry;
  objc_msgSend(getNRPairedDeviceRegistryClass_0(), "sharedInstance");
  return (NRPairedDeviceRegistry *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)isImportAllowedForActiveWatchWithBehavior:(id)a3 featureIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isAppleWatch"))
  {
    objc_msgSend(v6, "currentDeviceProductType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentDeviceSerialNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_14;
    goto LABEL_12;
  }
  -[HKImportExclusionDeviceDataSource activePairedDevice](self, "activePairedDevice");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v12 = (_QWORD *)getNRDevicePropertyProductTypeSymbolLoc_ptr_1;
    v23 = getNRDevicePropertyProductTypeSymbolLoc_ptr_1;
    if (!getNRDevicePropertyProductTypeSymbolLoc_ptr_1)
    {
      v13 = (void *)NanoRegistryLibrary_3();
      v12 = dlsym(v13, "NRDevicePropertyProductType");
      v21[3] = (uint64_t)v12;
      getNRDevicePropertyProductTypeSymbolLoc_ptr_1 = (uint64_t)v12;
    }
    _Block_object_dispose(&v20, 8);
    if (!v12)
      -[HKImportExclusionDeviceDataSource isImportAllowedForActiveWatchWithBehavior:featureIdentifier:].cold.1();
    objc_msgSend(v11, "valueForProperty:", *v12, v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v14 = (_QWORD *)getNRDevicePropertySerialNumberSymbolLoc_ptr;
    v23 = getNRDevicePropertySerialNumberSymbolLoc_ptr;
    if (!getNRDevicePropertySerialNumberSymbolLoc_ptr)
    {
      v15 = (void *)NanoRegistryLibrary_3();
      v14 = dlsym(v15, "NRDevicePropertySerialNumber");
      v21[3] = (uint64_t)v14;
      getNRDevicePropertySerialNumberSymbolLoc_ptr = (uint64_t)v14;
    }
    _Block_object_dispose(&v20, 8);
    if (!v14)
      -[HKImportExclusionDeviceDataSource isImportAllowedForActiveWatchWithBehavior:featureIdentifier:].cold.2();
    objc_msgSend(v11, "valueForProperty:", *v14, v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_14;
LABEL_12:
    if (-[HKImportExclusionDeviceDataSource isDeviceTypeNotOnImportExclusionList:featureIdentifier:](self, "isDeviceTypeNotOnImportExclusionList:featureIdentifier:", v8, v7))
    {
      v16 = (void *)MEMORY[0x1E0C9AAB0];
      goto LABEL_21;
    }
LABEL_14:
    if (!v9)
    {
      v16 = (void *)MEMORY[0x1E0C9AAA0];
LABEL_22:

      goto LABEL_23;
    }
    v17 = (void *)MEMORY[0x1E0CB37E8];
    v18 = -[HKImportExclusionDeviceDataSource isDeviceSerialNumberOnTIBList:featureIdentifier:](self, "isDeviceSerialNumberOnTIBList:featureIdentifier:", v9, v7)|| -[HKImportExclusionDeviceDataSource isDeviceSerialNumberOnPreImportExclusionList:featureIdentifier:](self, "isDeviceSerialNumberOnPreImportExclusionList:featureIdentifier:", v9, v7);
    objc_msgSend(v17, "numberWithInt:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

    goto LABEL_22;
  }
  v16 = 0;
LABEL_23:

  return v16;
}

- (BOOL)isDeviceTypeNotOnImportExclusionList:(id)a3 featureIdentifier:(id)a4
{
  id v5;
  char v6;

  v5 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("OxygenSaturationRecording")))
    v6 = objc_msgSend((id)objc_opt_class(), "isDeviceTypeAllowedForHKFeatureIdentifierOxygenSaturationRecording:", v5);
  else
    v6 = 1;

  return v6;
}

- (BOOL)isDeviceSerialNumberOnTIBList:(id)a3 featureIdentifier:(id)a4
{
  id v5;
  char v6;

  v5 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("OxygenSaturationRecording")))
    v6 = objc_msgSend((id)objc_opt_class(), "isDeviceSerialNumberOnTIBListForHKFeatureIdentifierOxygenSaturationRecording:", v5);
  else
    v6 = 0;

  return v6;
}

- (BOOL)isDeviceSerialNumberOnPreImportExclusionList:(id)a3 featureIdentifier:(id)a4
{
  id v5;
  char v6;

  v5 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("OxygenSaturationRecording")))
    v6 = objc_msgSend((id)objc_opt_class(), "isDeviceSerialNumberOnAllowedListForHKFeatureIdentifierOxygenSaturationRecording:", v5);
  else
    v6 = 0;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, 0);
}

+ (BOOL)isDeviceSerialNumberOnTIBListForHKFeatureIdentifierOxygenSaturationRecording:(id)a3
{
  id v3;
  size_t v4;
  int v5;
  void *v6;
  char *p_p;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  unsigned int v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  size_t v27;
  void *__p;
  size_t v30;
  unsigned __int8 v31;
  int v32;
  unsigned __int16 v33;
  unsigned int v34;
  unsigned __int16 v35;

  v3 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v3, "UTF8String"));
  v4 = v31;
  v5 = (char)v31;
  v6 = __p;
  if ((v31 & 0x80u) == 0)
    p_p = (char *)&__p;
  else
    p_p = (char *)__p;
  if ((v31 & 0x80u) != 0)
    v4 = v30;
  v35 = 0;
  v34 = 0;
  if (v4 == 10)
  {
    v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = p_p[v8] - 48;
      if (v10 > 0x29 || ((0x3D77DD802FFuLL >> v10) & 1) == 0)
        break;
      v9 = qword_19A44C9B8[v10] + 27 * v9;
      if (++v8 == 10)
      {
        for (i = 5; i != -1; --i)
        {
          *((_BYTE *)&v34 + i) = v9;
          v9 >>= 8;
        }
        v12 = v34 | ((unint64_t)v35 << 32);
        goto LABEL_15;
      }
    }
  }
  v12 = 0;
LABEL_15:
  v32 = v12;
  v33 = WORD2(v12);
  if (v5 < 0)
    operator delete(v6);
  if (v32 | v33)
  {
    v13 = 102;
    v14 = (char *)&hk_HKFeatureIdentifierOxygenSaturationRecording::allowed_encoded_serial_numbers_tib;
    do
    {
      v15 = 0;
      v16 = v13 >> 1;
      v17 = &v14[6 * (v13 >> 1)];
      while (1)
      {
        v18 = v17[v15];
        v19 = *((unsigned __int8 *)&v32 + v15);
        if (v18 != v19)
          break;
        if (++v15 == 6)
          goto LABEL_25;
      }
      v20 = v13 + ~v16;
      if (v18 < v19)
      {
        v16 = v20;
        v14 = v17 + 6;
      }
LABEL_25:
      v13 = v16;
    }
    while (v16);
    if (v14 == (char *)&unk_19A44C9B2)
    {
      v24 = 0;
    }
    else
    {
      v21 = 0;
      while (1)
      {
        v22 = *((unsigned __int8 *)&v32 + v21);
        v23 = v14[v21];
        if (v22 != v23)
          break;
        if (++v21 == 6)
        {
          v24 = 1;
          goto LABEL_44;
        }
      }
      v24 = v22 >= v23;
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    LOBYTE(v34) = 0;
    v25 = std::__lower_bound[abi:ne180100]<std::_ClassicAlgPolicy,std::string_view const*,std::string_view const*,std::string,std::__identity,std::__less<void,void>>((uint64_t)&hk_HKFeatureIdentifierOxygenSaturationRecording::additional_allowed_serial_numbers_tib, (uint64_t)HKConceptAttributeValueTrue, &__p);
    if ((__CFString **)v25 == HKConceptAttributeValueTrue)
    {
      v24 = 0;
    }
    else
    {
      if ((v31 & 0x80u) == 0)
        v26 = &__p;
      else
        v26 = __p;
      if ((v31 & 0x80u) == 0)
        v27 = v31;
      else
        v27 = v30;
      v24 = (int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(*(const void **)v25, *(_QWORD *)(v25 + 8), v26, v27) << 24) < 1;
    }
    if ((char)v31 < 0)
      operator delete(__p);
  }
LABEL_44:

  return v24;
}

- (void)isActiveWatchProdFusedWithBehavior:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertySigningFuse(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKImportExclusionDeviceDataSource.m"), 22, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

- (void)isImportAllowedForActiveWatchWithBehavior:featureIdentifier:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertyProductType(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKImportExclusionDeviceDataSource.m"), 20, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

- (void)isImportAllowedForActiveWatchWithBehavior:featureIdentifier:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRDevicePropertySerialNumber(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKImportExclusionDeviceDataSource.m"), 21, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

@end
