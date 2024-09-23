@implementation CMContinuityCaptureCapabilities

+ (id)capabilitiesForCurrentDevice
{
  char BoolAnswer;
  uint64_t UserPreferenceDisabled;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  __int128 v17;
  uint64_t v18;

  BoolAnswer = AVGestaltGetBoolAnswer();
  UserPreferenceDisabled = FigContinuityCaptureGetUserPreferenceDisabled();
  if ((BoolAnswer & 1) != 0)
  {
    v4 = UserPreferenceDisabled;
    if ((_DWORD)UserPreferenceDisabled)
    {
      CMContinuityCaptureLog(2);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        v15 = "User has opted out of Continuity Capture";
LABEL_24:
        _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v17, 2u);
      }
    }
    else
    {
      if (GestaltGetDeviceClass() != 3 || (_os_feature_enabled_impl() & 1) != 0)
      {
        v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        +[CMContinuityCaptureDeviceCapabilities capabilitiesForEntityType:](CMContinuityCaptureDeviceCapabilities, "capabilitiesForEntityType:", 1);
        v6 = objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v7 = (void *)v6;
          -[NSObject addObject:](v5, "addObject:", v6);
          +[CMContinuityCaptureDeviceCapabilities capabilitiesForEntityType:](CMContinuityCaptureDeviceCapabilities, "capabilitiesForEntityType:", 2);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            -[NSObject addObject:](v5, "addObject:", v8);
          }
          else
          {
            CMContinuityCaptureLog(2);
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
            {
              LOWORD(v17) = 0;
              _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_INFO, "ContinuityCaptureEntityTypeDeskcamVideo not available on this device", (uint8_t *)&v17, 2u);
            }

          }
          +[CMContinuityCaptureDeviceCapabilities capabilitiesForEntityType:](CMContinuityCaptureDeviceCapabilities, "capabilitiesForEntityType:", 3);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v5, "addObject:", v10);
          goto LABEL_12;
        }
        CMContinuityCaptureLog(2);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          +[CMContinuityCaptureCapabilities capabilitiesForCurrentDevice].cold.1();

LABEL_26:
        v7 = 0;
        v8 = 0;
        v10 = 0;
LABEL_12:
        v11 = objc_alloc((Class)objc_opt_class());
        v17 = xmmword_227CED700;
        v18 = 1;
        v12 = (void *)objc_msgSend(v11, "initWithCapabilitiesVersion:devicesCapabilities:userDisabled:", &v17, v5, v4);

        goto LABEL_13;
      }
      CMContinuityCaptureLog(2);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        v15 = "Feature flag Laguna/ContinuityCapture_iPad disabled";
        goto LABEL_24;
      }
    }

    v5 = 0;
    goto LABEL_26;
  }
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_INFO, "Device does not support Continuity Capture", (uint8_t *)&v17, 2u);
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (CMContinuityCaptureCapabilities)initWithCapabilitiesVersion:(id *)a3 devicesCapabilities:(id)a4 userDisabled:(BOOL)a5
{
  id v8;
  char *v9;
  CMContinuityCaptureCapabilities *v10;
  __int128 v11;
  uint64_t v12;
  NSArray *devicesCapabilities;
  objc_super v15;

  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CMContinuityCaptureCapabilities;
  v9 = -[CMContinuityCaptureCapabilities init](&v15, sel_init);
  v10 = (CMContinuityCaptureCapabilities *)v9;
  if (v9)
  {
    v11 = *(_OWORD *)&a3->var0;
    *((_QWORD *)v9 + 3) = a3->var2;
    *(_OWORD *)(v9 + 8) = v11;
    v12 = objc_msgSend(v8, "copy");
    devicesCapabilities = v10->_devicesCapabilities;
    v10->_devicesCapabilities = (NSArray *)v12;

    v10->_userDisabled = a5;
  }

  return v10;
}

- (CMContinuityCaptureCapabilities)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  CMContinuityCaptureDeviceCapabilities *v25;
  CMContinuityCaptureDeviceCapabilities *v26;
  CMContinuityCaptureCapabilities *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v36;
  unsigned int v37;
  uint64_t v38;
  void *v39;
  CMContinuityCaptureCapabilities *v40;
  void *v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE buf[24];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CapabilitiesVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CapabiltiesMinorVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CapabiltiesPatchVersion"));
  v8 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v8;
  if (v6)
  {
    v9 = (void *)v8;
    v10 = objc_msgSend(v6, "integerValue");
    v11 = 0;
    if (v7)
    {
      *((_QWORD *)&v42 + 1) = 0;
      if (v9)
      {
        v11 = objc_msgSend(v7, "integerValue");
        *((_QWORD *)&v42 + 1) = objc_msgSend(v9, "integerValue");
      }
    }
    else
    {
      *((_QWORD *)&v42 + 1) = 0;
    }
    CMContinuityCaptureLog(2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%ld.%ld.%ld]"), v10, v11, *((_QWORD *)&v42 + 1));
      v43 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%ld.%ld.%ld]"), 3, 303, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_INFO, "Remote Device Version %@, Current Device version %@", buf, 0x16u);

      v11 = v43;
    }
    v38 = v10;

  }
  else
  {
    v38 = 0;
    v11 = 0;
    *((_QWORD *)&v42 + 1) = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserDisabled"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Devices"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v37 = v16;
    *(_QWORD *)&v42 = v11;
    v39 = v7;
    v40 = self;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v45 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          v25 = -[CMContinuityCaptureDeviceCapabilities initWithDictionaryRepresentation:]([CMContinuityCaptureDeviceCapabilities alloc], "initWithDictionaryRepresentation:", v24);
          if (!v25)
          {
            CMContinuityCaptureLog(2);
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              -[CMContinuityCaptureCapabilities initWithDictionaryRepresentation:].cold.2(v24, v28, v29, v30, v31, v32, v33, v34);

            v27 = 0;
            self = v40;
            goto LABEL_23;
          }
          v26 = v25;
          objc_msgSend(v5, "addObject:", v25);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        if (v21)
          continue;
        break;
      }
    }

    *(_QWORD *)buf = v38;
    *(_OWORD *)&buf[8] = v42;
    self = -[CMContinuityCaptureCapabilities initWithCapabilitiesVersion:devicesCapabilities:userDisabled:](v40, "initWithCapabilitiesVersion:devicesCapabilities:userDisabled:", buf, v5, v37);
    v27 = self;
LABEL_23:
    v7 = v39;
  }
  else
  {
    CMContinuityCaptureLog(2);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureCapabilities initWithDictionaryRepresentation:].cold.1();

    v27 = 0;
  }

  return v27;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_capabilitiesVersion.major);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("CapabilitiesVersion"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_capabilitiesVersion.minor);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("CapabiltiesMinorVersion"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_capabilitiesVersion.patch);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("CapabiltiesPatchVersion"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_userDisabled);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("UserDisabled"));

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_devicesCapabilities;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "dictionaryRepresentation", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("Devices"));
  return v3;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%ld.%ld.%ld]"), self->_capabilitiesVersion.major, self->_capabilitiesVersion.minor, self->_capabilitiesVersion.patch);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("V:%@, D:%d"), v4, self->_userDisabled);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSArray count](self->_devicesCapabilities, "count"))
    objc_msgSend(v5, "appendString:", CFSTR(" "));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_devicesCapabilities;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "debugDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("(%@)"), v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return (NSString *)v5;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureCapabilities debugDescription](self, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)capabilitiesVersion
{
  *($93270A8783F91AF9136665ABBDC0A449 *)retstr = *($93270A8783F91AF9136665ABBDC0A449 *)&self->var1;
  return self;
}

- (NSArray)devicesCapabilities
{
  return self->_devicesCapabilities;
}

- (BOOL)userDisabled
{
  return self->_userDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesCapabilities, 0);
}

+ (void)capabilitiesForCurrentDevice
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "Could not create capabilities for ContinuityCaptureEntityTypeDefaultVideo", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)initWithDictionaryRepresentation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, v0, v1, "Missing CMContinuityCaptureCapabilitiesKey_Devices", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, a2, a3, "Could not create device capabilities with: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
