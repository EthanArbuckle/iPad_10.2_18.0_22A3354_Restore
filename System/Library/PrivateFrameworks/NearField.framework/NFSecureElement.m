@implementation NFSecureElement

+ (id)embeddedSecureElement
{
  return +[NFSecureElement embeddedSecureElementWithError:](NFSecureElement, "embeddedSecureElementWithError:", 0);
}

- (id)info
{
  -[NFSecureElement _updateIfDirty](self, "_updateIfDirty");
  return self->_info;
}

- (NSString)serialNumber
{
  -[NFSecureElement _updateIfDirty](self, "_updateIfDirty");
  return -[NFHardwareSecureElementInfo serialNumber](self->_info, "serialNumber");
}

- (void)_updateIfDirty
{
  id v2;

  if (self->_isDirty)
  {
    self->_isDirty = 0;
    +[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "refreshSecureElementsWithError:", 0);

  }
}

+ (id)embeddedSecureElementWithError:(id *)a3
{
  void *v4;
  void *v5;

  +[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secureElementWithIdentifier:error:", CFSTR("embedded"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_initWithInfo:(id)a3
{
  id v5;
  NFSecureElement *v6;
  NFSecureElement *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFSecureElement;
  v6 = -[NFSecureElement init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_info, a3);

  return v7;
}

+ (id)icefallSecureElement
{
  return 0;
}

+ (id)cachedEmbeddedSecureElementSerialNumber:(id *)a3
{
  void *v4;
  void *v5;

  +[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedEmbeddedSecureElementSerialNumber:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)embeddedSecureElementSerialNumber
{
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  const void **v9;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  const char *Name;
  id v28;
  id v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  +[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v4, "cachedEmbeddedSecureElementSerialNumber:", &v29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v29;

  if (v6)
    v7 = 1;
  else
    v7 = v5 == 0;
  if (v7 || !objc_msgSend(v5, "lengthOfBytesUsingEncoding:", 4))
  {
    v9 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v15 = 45;
      if (isMetaClass)
        v15 = 43;
      v11(6, "%c[%{public}s %{public}s]:%i Cache misses; performs full query", v15, ClassName, Name, 66);
    }
    dispatch_get_specific(*v9);
    NFSharedLogGetLogger();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = object_getClass(a1);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      v19 = object_getClassName(a1);
      v20 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v31 = v18;
      v32 = 2082;
      v33 = v19;
      v34 = 2082;
      v35 = v20;
      v36 = 1024;
      v37 = 66;
      _os_log_impl(&dword_19B5EB000, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Cache misses; performs full query",
        buf,
        0x22u);
    }

    +[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v6;
    objc_msgSend(v21, "secureElementWithIdentifier:error:", CFSTR("embedded"), &v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v28;

    if (v23)
    {
      v8 = 0;
    }
    else
    {
      v24 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v22, "serialNumber");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "NF_dataWithHexString:", v25);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "NF_dataWithHexString:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (unsigned)supportedTechnologies
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  +[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secureElementsWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 |= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "supportedTechnologies");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)identifier
{
  -[NFSecureElement _updateIfDirty](self, "_updateIfDirty");
  return -[NFHardwareSecureElementInfo identifier](self->_info, "identifier");
}

- (NSString)systemOSSerialNumber
{
  -[NFSecureElement _updateIfDirty](self, "_updateIfDirty");
  return -[NFHardwareSecureElementInfo systemOSSerialNumber](self->_info, "systemOSSerialNumber");
}

- (NSString)rsaCertificate
{
  -[NFSecureElement _updateIfDirty](self, "_updateIfDirty");
  return -[NFHardwareSecureElementInfo rsaCertificate](self->_info, "rsaCertificate");
}

- (NSString)eccCertificate
{
  -[NFSecureElement _updateIfDirty](self, "_updateIfDirty");
  return -[NFHardwareSecureElementInfo ecdsaCertificate](self->_info, "ecdsaCertificate");
}

- (NSString)eckaCertificate
{
  -[NFSecureElement _updateIfDirty](self, "_updateIfDirty");
  return -[NFHardwareSecureElementInfo eckaCertificate](self->_info, "eckaCertificate");
}

- (BOOL)isProductionSigned
{
  -[NFSecureElement _updateIfDirty](self, "_updateIfDirty");
  return -[NFHardwareSecureElementInfo signingKeyType](self->_info, "signingKeyType") == 2;
}

- (BOOL)isInRestrictedMode
{
  -[NFSecureElement _updateIfDirty](self, "_updateIfDirty");
  return -[NFHardwareSecureElementInfo restrictedMode](self->_info, "restrictedMode");
}

- (unint64_t)OSVersion
{
  -[NFSecureElement _updateIfDirty](self, "_updateIfDirty");
  return -[NFHardwareSecureElementInfo OSVersion](self->_info, "OSVersion");
}

- (unint64_t)fullOSVersion
{
  -[NFSecureElement _updateIfDirty](self, "_updateIfDirty");
  return -[NFHardwareSecureElementInfo fullOSVersion](self->_info, "fullOSVersion");
}

- (NSNumber)sequenceCounter
{
  -[NFSecureElement _updateIfDirty](self, "_updateIfDirty");
  return -[NFHardwareSecureElementInfo sequenceCounter](self->_info, "sequenceCounter");
}

- (BOOL)available
{
  -[NFSecureElement _updateIfDirty](self, "_updateIfDirty");
  if (-[NFHardwareSecureElementInfo jcopTooOld](self->_info, "jcopTooOld"))
    return 0;
  else
    return !-[NFHardwareSecureElementInfo osUpdateMode](self->_info, "osUpdateMode");
}

- (unsigned)supportedTechnologies
{
  char v3;
  int v4;
  int v5;

  v3 = -[NFHardwareSecureElementInfo supportedTechnologies](self->_info, "supportedTechnologies");
  v4 = -[NFHardwareSecureElementInfo supportedTechnologies](self->_info, "supportedTechnologies") & 2 | v3 & 1;
  v5 = -[NFHardwareSecureElementInfo supportedTechnologies](self->_info, "supportedTechnologies") & 4;
  return v4 | v5 | -[NFHardwareSecureElementInfo supportedTechnologies](self->_info, "supportedTechnologies") & 8;
}

- (void)_setIsInRestrictedMode:(BOOL)a3
{
  -[NFHardwareSecureElementInfo _setIsInRestrictedMode:](self->_info, "_setIsInRestrictedMode:", a3);
}

- (void)_setIsInRestrictedPerformanceMode:(BOOL)a3
{
  -[NFHardwareSecureElementInfo _setIsInRestrictedMode:](self->_info, "_setIsInRestrictedMode:", a3);
}

- (void)_markDirty
{
  self->_isDirty = 1;
}

- (void)_updateSecureElementInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
  self->_isDirty = 0;
}

- (id)manifestQueryBlob
{
  void *v3;

  -[NFSecureElement _updateIfDirty](self, "_updateIfDirty");
  if (-[NFHardwareSecureElementInfo personalisable](self->_info, "personalisable"))
  {
    -[NFHardwareSecureElementInfo manifestQuery](self->_info, "manifestQuery");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (unsigned)hwType
{
  unint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;

  -[NFSecureElement _updateIfDirty](self, "_updateIfDirty");
  v3 = -[NFHardwareSecureElementInfo seType](self->_info, "seType");
  if (v3 == 6)
    return 5;
  if (v3 != 2)
    return 0;
  +[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controllerInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v5, "siliconName") <= 6)
    v6 = 3;
  else
    v6 = 4;

  return v6;
}

- (BOOL)isSeshatAvailabledInRestrictedMode
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  BOOL v6;

  -[NFSecureElement sequenceCounter](self, "sequenceCounter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  v5 = -[NFSecureElement hwType](self, "hwType");
  v6 = v5 != 3 || v4 > 0x38B;
  if (v5 == 4)
    v6 = v4 > 0x48B;
  return v5 >= 3 && v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

@end
