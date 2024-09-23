@implementation MTRDeviceControllerLocalTestStorage

+ (BOOL)localTestStorageEnabled
{
  uint64_t v2;
  void *v3;
  const char *v4;
  char v5;

  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_BOOLForKey_(v3, v4, (uint64_t)CFSTR("enableTestStorage"));

  return v5;
}

+ (void)setLocalTestStorageEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  const char *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  _BOOL8 v9;
  uint8_t buf[4];
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBool_forKey_(v4, v5, v3, CFSTR("enableTestStorage"));
  sub_234117B80(0, "NotSpecified");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v11 = v3;
    _os_log_impl(&dword_233BF3000, v6, OS_LOG_TYPE_DEFAULT, "MTRDeviceControllerLocalTestStorage setLocalTestStorageEnabled %d", buf, 8u);
  }

  if (sub_234114844(2u))
  {
    v9 = v3;
    sub_2341147D0(0, 2);
  }
  if (objc_msgSend_BOOLForKey_(v4, v7, (uint64_t)CFSTR("enableTestStorage"), v9) != v3)
  {
    sub_234117B80(0, "NotSpecified");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v11 = v3;
      _os_log_impl(&dword_233BF3000, v8, OS_LOG_TYPE_ERROR, "MTRDeviceControllerLocalTestStorage setLocalTestStorageEnabled %d failed", buf, 8u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
  }

}

- (MTRDeviceControllerLocalTestStorage)initWithPassThroughStorage:(id)a3
{
  id v5;
  MTRDeviceControllerLocalTestStorage *v6;
  MTRDeviceControllerLocalTestStorage *v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTRDeviceControllerLocalTestStorage;
  v6 = -[MTRDeviceControllerLocalTestStorage init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_passThroughStorage, a3);
    sub_234117B80(0, "NotSpecified");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_233BF3000, v8, OS_LOG_TYPE_DEFAULT, "MTRDeviceControllerLocalTestStorage initialized with pass-through storage %@", buf, 0xCu);
    }

    if (sub_234114844(2u))
      sub_2341147D0(0, 2);
  }

  return v7;
}

- (id)controller:(id)a3 valueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  MTRDeviceControllerStorageDelegate *passThroughStorage;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  uint8_t v24[8];
  uint64_t v25;

  v10 = a3;
  v13 = a4;
  if (a6)
  {
    passThroughStorage = self->_passThroughStorage;
    if (passThroughStorage)
    {
      objc_msgSend_controller_valueForKey_securityLevel_sharingType_(passThroughStorage, v11, (uint64_t)v10, v13, a5, a6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_234117B80(0, "NotSpecified");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_233BF3000, v22, OS_LOG_TYPE_ERROR, "MTRDeviceControllerLocalTestStorage valueForKey: shared type but no pass-through storage", v24, 2u);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
      v15 = 0;
    }
  }
  else
  {
    objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataForKey_(v16, v17, (uint64_t)v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD1620];
    MTRDeviceControllerStorageClasses();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v19, v21, (uint64_t)v20, v18, &v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (BOOL)controller:(id)a3 storeValue:(id)a4 forKey:(id)a5 securityLevel:(unint64_t)a6 sharingType:(unint64_t)a7
{
  id v12;
  id v13;
  const char *v14;
  id v15;
  MTRDeviceControllerStorageDelegate *passThroughStorage;
  void *v17;
  const char *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v15 = a5;
  if (a7)
  {
    passThroughStorage = self->_passThroughStorage;
    if (passThroughStorage)
    {
      LOBYTE(a7) = objc_msgSend_controller_storeValue_forKey_securityLevel_sharingType_(passThroughStorage, v14, (uint64_t)v12, v13, v15, a6, a7);
    }
    else
    {
      sub_234117B80(0, "NotSpecified");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233BF3000, v22, OS_LOG_TYPE_ERROR, "MTRDeviceControllerLocalTestStorage storeValue: shared type but no pass-through storage", buf, 2u);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
      LOBYTE(a7) = 0;
    }
  }
  else
  {
    v26 = 0;
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x24BDD1618], v14, (uint64_t)v13, 1, &v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v26;
    a7 = v20 == 0;
    if (v20)
    {
      sub_234117B80(0, "NotSpecified");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v20;
        _os_log_impl(&dword_233BF3000, v21, OS_LOG_TYPE_ERROR, "MTRDeviceControllerLocalTestStorage storeValue: failed to convert value object to data %@", buf, 0xCu);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
    }
    else
    {
      objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v18, v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v23, v24, (uint64_t)v17, v15);

    }
  }

  return a7;
}

- (BOOL)controller:(id)a3 removeValueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  MTRDeviceControllerStorageDelegate *passThroughStorage;
  char v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint8_t v20[16];

  v10 = a3;
  v13 = a4;
  if (a6)
  {
    passThroughStorage = self->_passThroughStorage;
    if (passThroughStorage)
    {
      v15 = objc_msgSend_controller_removeValueForKey_securityLevel_sharingType_(passThroughStorage, v11, (uint64_t)v10, v13, a5, a6);
    }
    else
    {
      sub_234117B80(0, "NotSpecified");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_233BF3000, v18, OS_LOG_TYPE_ERROR, "MTRDeviceControllerLocalTestStorage removeValueForKey: shared type but no pass-through storage", v20, 2u);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
      v15 = 0;
    }
  }
  else
  {
    objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectForKey_(v16, v17, (uint64_t)v13);

    v15 = 1;
  }

  return v15;
}

- (id)valuesForController:(id)a3 securityLevel:(unint64_t)a4 sharingType:(unint64_t)a5
{
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint8_t v18[16];

  v10 = a3;
  if (a5)
  {
    if (self->_passThroughStorage && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend_valuesForController_securityLevel_sharingType_(self->_passThroughStorage, v11, (uint64_t)v10, a4, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_234117B80(0, "NotSpecified");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_233BF3000, v13, OS_LOG_TYPE_ERROR, "MTRDeviceControllerLocalTestStorage valuesForController: shared type but no pass-through storage", v18, 2u);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
      v12 = 0;
    }
  }
  else
  {
    objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryRepresentation(v14, v15, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (BOOL)controller:(id)a3 storeValues:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6
{
  const char *v10;
  uint64_t v11;
  const char *v12;
  char v13;
  NSObject *v14;
  id v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  id v26;
  const char *v27;
  NSObject *v28;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v32 = a4;
  if (a6)
  {
    if (self->_passThroughStorage && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = objc_msgSend_controller_storeValues_securityLevel_sharingType_(self->_passThroughStorage, v12, (uint64_t)v31, v32, a5, a6);
    }
    else
    {
      sub_234117B80(0, "NotSpecified");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_ERROR, "MTRDeviceControllerLocalTestStorage valuesForController: shared type but no pass-through storage", buf, 2u);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
      v13 = 0;
    }
  }
  else
  {
    objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v10, v11);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v15 = v32;
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v35, v41, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v36;
      v13 = 1;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v36 != v19)
            objc_enumerationMutation(v15);
          v21 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          v22 = (void *)MEMORY[0x24BDD1618];
          objc_msgSend_objectForKeyedSubscript_(v15, v17, v21, v30);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0;
          objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v22, v24, (uint64_t)v23, 1, &v34);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v34;

          if (v26)
          {
            sub_234117B80(0, "NotSpecified");
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v40 = v26;
              _os_log_impl(&dword_233BF3000, v28, OS_LOG_TYPE_ERROR, "MTRDeviceControllerLocalTestStorage storeValues: failed to convert value object to data %@", buf, 0xCu);
            }

            if (sub_234114844(1u))
            {
              v30 = v26;
              sub_2341147D0(0, 1);
            }
            v13 = 0;
          }
          else
          {
            objc_msgSend_setObject_forKey_(v33, v27, (uint64_t)v25, v21);
          }

        }
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v35, v41, 16);
      }
      while (v18);
    }
    else
    {
      v13 = 1;
    }

  }
  return v13 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passThroughStorage, 0);
}

@end
