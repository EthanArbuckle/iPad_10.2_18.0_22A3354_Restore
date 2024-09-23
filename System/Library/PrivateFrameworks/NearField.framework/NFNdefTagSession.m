@implementation NFNdefTagSession

- (BOOL)startBluetoothLEPairingWithDeviceAddress:(id)a3 role:(unsigned __int8)a4 optionalOOBData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  const void **v23;
  uint64_t Logger;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  void *v37;
  BOOL v38;
  const void **v39;
  uint64_t v40;
  void (*v41)(uint64_t, const char *, ...);
  objc_class *v42;
  id v43;
  _BOOL4 v44;
  const char *v45;
  const char *v46;
  BOOL v47;
  uint64_t v48;
  objc_class *v49;
  int v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v56;
  id v57;
  id v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int16 v64;
  unsigned __int8 v65;
  uint8_t v66[128];
  uint8_t buf[4];
  int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  +[NFNdefRecord emptyRecord](NFNdefRecord, "emptyRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTypeNameFormat:", 2);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", "application/vnd.bluetooth.le.oob", 32);
  objc_msgSend(v10, "setType:", v11);

  objc_msgSend(v10, "setMessageBegin:", 1);
  objc_msgSend(v10, "setMessageEnd:", 1);
  v64 = 7170;
  v65 = a4;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", &v64, 3);
  if (!v8)
    goto LABEL_4;
  if (objc_msgSend(v8, "length") == 7)
  {
    *(_WORD *)buf = 6920;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", buf, 2);
    objc_msgSend(v13, "appendData:", v8);
    objc_msgSend(v12, "appendData:", v13);

LABEL_4:
    v57 = v9;
    v58 = v8;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v61 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = objc_retainAutorelease(v19);
            v21 = *(unsigned __int8 *)objc_msgSend(v20, "bytes");
            if (objc_msgSend(v20, "length") - 1 == v21)
              objc_msgSend(v12, "appendData:", v20);
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      }
      while (v16);
    }

    objc_msgSend(v10, "setPayload:", v12);
    objc_msgSend(v10, "setShortRecord:", (unint64_t)objc_msgSend(v12, "length") < 0x100);
    v22 = objc_opt_new();
    -[NSObject addRecord:](v22, "addRecord:", v10);
    v23 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v25 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      objc_msgSend(v10, "asData");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 45;
      if (isMetaClass)
        v31 = 43;
      v25(6, "%c[%{public}s %{public}s]:%i %{public}@", v31, ClassName, Name, 62, v30);

    }
    dispatch_get_specific(*v23);
    NFSharedLogGetLogger();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = object_getClass(self);
      if (class_isMetaClass(v33))
        v34 = 43;
      else
        v34 = 45;
      v35 = object_getClassName(self);
      v36 = sel_getName(a2);
      objc_msgSend(v10, "asData");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110146;
      v68 = v34;
      v69 = 2082;
      v70 = v35;
      v71 = 2082;
      v72 = v36;
      v73 = 1024;
      v74 = 62;
      v75 = 2114;
      v76 = (uint64_t)v37;
      _os_log_impl(&dword_19B5EB000, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

    }
    v38 = -[NFNdefTagSession startEmulationWithNdefMessage:withMessageType:error:](self, "startEmulationWithNdefMessage:withMessageType:error:", v22, 0, 0);
    v9 = v57;
    v8 = v58;
    goto LABEL_34;
  }
  v39 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  v40 = NFLogGetLogger();
  if (v40)
  {
    v41 = (void (*)(uint64_t, const char *, ...))v40;
    v42 = object_getClass(self);
    v43 = v9;
    v44 = class_isMetaClass(v42);
    v45 = object_getClassName(self);
    v46 = sel_getName(a2);
    v56 = objc_msgSend(v8, "length");
    v47 = !v44;
    v9 = v43;
    v48 = 45;
    if (!v47)
      v48 = 43;
    v41(3, "%c[%{public}s %{public}s]:%i Invalid deviceAddress length: %lu", v48, v45, v46, 37, v56);
  }
  dispatch_get_specific(*v39);
  NFSharedLogGetLogger();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v49 = object_getClass(self);
    if (class_isMetaClass(v49))
      v50 = 43;
    else
      v50 = 45;
    v51 = object_getClassName(self);
    v52 = v8;
    v53 = sel_getName(a2);
    v54 = objc_msgSend(v52, "length");
    *(_DWORD *)buf = 67110146;
    v68 = v50;
    v69 = 2082;
    v70 = v51;
    v71 = 2082;
    v72 = v53;
    v8 = v52;
    v73 = 1024;
    v74 = 37;
    v75 = 2048;
    v76 = v54;
    _os_log_impl(&dword_19B5EB000, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid deviceAddress length: %lu", buf, 0x2Cu);
  }
  v38 = 0;
LABEL_34:

  return v38;
}

- (BOOL)startBluetoothLESecureConnectionWithDeviceAddress:(id)a3 optionalOOBData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  void *v21;
  const void **v22;
  uint64_t Logger;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  void *v28;
  const char *Name;
  uint64_t v30;
  objc_class *v31;
  int v32;
  const char *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  BOOL v37;
  void *v38;
  void *v39;
  const void **v40;
  uint64_t v41;
  void (*v42)(uint64_t, const char *, ...);
  objc_class *v43;
  _BOOL4 v44;
  const char *v45;
  const char *v46;
  void *v47;
  BOOL v48;
  uint64_t v49;
  NSObject *v50;
  objc_class *v51;
  int v52;
  const char *v53;
  const char *v54;
  void *v55;
  const char *v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v62;
  __int16 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  int buf;
  int v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  int v77;
  __int16 v78;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[NFNdefRecord emptyRecord](NFNdefRecord, "emptyRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTypeNameFormat:", 2);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", "application/vnd.bluetooth.secure.le.oob", 39);
  objc_msgSend(v7, "setType:", v8);

  objc_msgSend(v7, "setMessageBegin:", 1);
  objc_msgSend(v7, "setMessageEnd:", 1);
  v9 = (void *)objc_opt_new();
  v62 = v5;
  if (v5 && objc_msgSend(v5, "length") != 6)
  {
    v22 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v24 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      v28 = v9;
      Name = sel_getName(a2);
      v58 = objc_msgSend(v62, "length");
      v57 = Name;
      v9 = v28;
      v30 = 45;
      if (isMetaClass)
        v30 = 43;
      v24(3, "%c[%{public}s %{public}s]:%i Invalid deviceAddress length: %lu", v30, ClassName, v57, 80, v58);
    }
    dispatch_get_specific(*v22);
    NFSharedLogGetLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v31 = object_getClass(self);
      if (class_isMetaClass(v31))
        v32 = 43;
      else
        v32 = 45;
      v33 = object_getClassName(self);
      v34 = v6;
      v35 = sel_getName(a2);
      v20 = v62;
      v36 = objc_msgSend(v62, "length");
      buf = 67110146;
      v71 = v32;
      v72 = 2082;
      v73 = v33;
      v74 = 2082;
      v75 = v35;
      v6 = v34;
      v76 = 1024;
      v77 = 80;
      v78 = 2048;
      v79 = v36;
      _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid deviceAddress length: %lu", (uint8_t *)&buf, 0x2Cu);
      v37 = 0;
    }
    else
    {
      v37 = 0;
      v20 = v62;
    }
  }
  else
  {
    v60 = v9;
    v10 = objc_opt_new();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v59 = v6;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v66 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = objc_retainAutorelease(v16);
            v18 = *(unsigned __int8 *)objc_msgSend(v17, "bytes");
            if (objc_msgSend(v17, "length") - 1 == v18)
              -[NSObject appendData:](v10, "appendData:", v17);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      }
      while (v13);
    }

    v19 = -[NSObject length](v10, "length") + 2;
    v20 = v62;
    if (v62)
    {
      v64 = v19 + objc_msgSend(v62, "length");
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", &v64, 2);
      v9 = v60;
      objc_msgSend(v60, "appendData:", v21);

      objc_msgSend(v60, "appendData:", v62);
    }
    else
    {
      v64 = v19;
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", &v64, 2);
      v9 = v60;
      objc_msgSend(v60, "appendData:", v38);

    }
    objc_msgSend(v9, "appendData:", v10);
    objc_msgSend(v7, "setPayload:", v9);
    objc_msgSend(v7, "setShortRecord:", (unint64_t)objc_msgSend(v9, "length") < 0x100);
    v39 = (void *)objc_opt_new();
    objc_msgSend(v39, "addRecord:", v7);
    v40 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v41 = NFLogGetLogger();
    if (v41)
    {
      v42 = (void (*)(uint64_t, const char *, ...))v41;
      v43 = object_getClass(self);
      v44 = class_isMetaClass(v43);
      v45 = object_getClassName(self);
      v46 = sel_getName(a2);
      objc_msgSend(v7, "asData");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = !v44;
      v9 = v60;
      v20 = v62;
      v49 = 45;
      if (!v48)
        v49 = 43;
      v42(6, "%c[%{public}s %{public}s]:%i %{public}@", v49, v45, v46, 112, v47);

    }
    dispatch_get_specific(*v40);
    NFSharedLogGetLogger();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = object_getClass(self);
      if (class_isMetaClass(v51))
        v52 = 43;
      else
        v52 = 45;
      v53 = object_getClassName(self);
      v54 = sel_getName(a2);
      objc_msgSend(v7, "asData");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 67110146;
      v71 = v52;
      v72 = 2082;
      v73 = v53;
      v74 = 2082;
      v75 = v54;
      v76 = 1024;
      v77 = 112;
      v78 = 2114;
      v79 = (uint64_t)v55;
      _os_log_impl(&dword_19B5EB000, v50, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", (uint8_t *)&buf, 0x2Cu);

    }
    v37 = -[NFNdefTagSession startEmulationWithNdefMessage:withMessageType:error:](self, "startEmulationWithNdefMessage:withMessageType:error:", v39, 1, 0);

    v6 = v59;
  }

  return v37;
}

- (BOOL)startBluetoothLESecureConnectionWithOOBData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const void **v17;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  void *v31;
  BOOL v32;
  void *v35;
  __int16 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[NFNdefRecord emptyRecord](NFNdefRecord, "emptyRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTypeNameFormat:", 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", "application/vnd.bluetooth.secure.le.oob", 39);
  objc_msgSend(v4, "setType:", v5);

  objc_msgSend(v4, "setMessageBegin:", 1);
  objc_msgSend(v4, "setMessageEnd:", 1);
  v35 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = objc_retainAutorelease(v12);
          v14 = *(unsigned __int8 *)objc_msgSend(v13, "bytes");
          if (objc_msgSend(v13, "length") - 1 == v14)
            objc_msgSend(v6, "appendData:", v13);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v9);
  }

  v37 = objc_msgSend(v6, "length") + 2;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", &v37, 2);
  objc_msgSend(v35, "appendData:", v15);

  objc_msgSend(v35, "appendData:", v6);
  objc_msgSend(v4, "setPayload:", v35);
  objc_msgSend(v4, "setShortRecord:", (unint64_t)objc_msgSend(v35, "length") < 0x100);
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "addRecord:", v4);
  v17 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v19 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    objc_msgSend(v4, "asData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 45;
    if (isMetaClass)
      v25 = 43;
    v19(6, "%c[%{public}s %{public}s]:%i %{public}@", v25, ClassName, Name, 150, v24);

  }
  dispatch_get_specific(*v17);
  NFSharedLogGetLogger();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = object_getClass(self);
    if (class_isMetaClass(v27))
      v28 = 43;
    else
      v28 = 45;
    v29 = object_getClassName(self);
    v30 = sel_getName(a2);
    objc_msgSend(v4, "asData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110146;
    v43 = v28;
    v44 = 2082;
    v45 = v29;
    v46 = 2082;
    v47 = v30;
    v48 = 1024;
    v49 = 150;
    v50 = 2114;
    v51 = v31;
    _os_log_impl(&dword_19B5EB000, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

  }
  v32 = -[NFNdefTagSession startEmulationWithNdefMessage:withMessageType:](self, "startEmulationWithNdefMessage:withMessageType:", v16, 1);

  return v32;
}

+ (id)generateBluetoothLESecureNdefPayloadWithOOBData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const void **v19;
  uint64_t Logger;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  const char *Name;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[NFNdefRecord emptyRecord](NFNdefRecord, "emptyRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTypeNameFormat:", 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", "application/vnd.bluetooth.secure.le.oob", 39);
  objc_msgSend(v4, "setType:", v5);

  objc_msgSend(v4, "setMessageBegin:", 1);
  objc_msgSend(v4, "setMessageEnd:", 1);
  v35 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v19 = (const void **)MEMORY[0x1E0DE7900];
          dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
          Logger = NFLogGetLogger();
          if (Logger)
          {
            v21 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(a1);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(a1);
            Name = sel_getName(a2);
            v25 = 45;
            if (isMetaClass)
              v25 = 43;
            v21(3, "%c[%{public}s %{public}s]:%i Wrong data type in oobdata", v25, ClassName, Name, 176);
          }
          dispatch_get_specific(*v19);
          NFSharedLogGetLogger();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v27 = object_getClass(a1);
            if (class_isMetaClass(v27))
              v28 = 43;
            else
              v28 = 45;
            v29 = object_getClassName(a1);
            v30 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v41 = v28;
            v42 = 2082;
            v43 = v29;
            v44 = 2082;
            v45 = v30;
            v46 = 1024;
            v47 = 176;
            _os_log_impl(&dword_19B5EB000, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Wrong data type in oobdata", buf, 0x22u);
          }

          v18 = (void *)objc_opt_new();
          v16 = v35;
          goto LABEL_22;
        }
        v13 = objc_retainAutorelease(v12);
        v14 = *(unsigned __int8 *)objc_msgSend(v13, "bytes");
        if (objc_msgSend(v13, "length") - 1 == v14)
          objc_msgSend(v6, "appendData:", v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      if (v9)
        continue;
      break;
    }
  }

  *(_WORD *)buf = objc_msgSend(v6, "length") + 2;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", buf, 2);
  v16 = v35;
  objc_msgSend(v35, "appendData:", v15);

  objc_msgSend(v35, "appendData:", v6);
  objc_msgSend(v4, "setPayload:", v35);
  objc_msgSend(v4, "setShortRecord:", (unint64_t)objc_msgSend(v35, "length") < 0x100);
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "addRecord:", v4);
  objc_msgSend(v17, "asData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  return v18;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NFNdefTagSession *obj;

  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  objc_sync_exit(obj);
}

- (NFNdefTagSessionDelegate)delegate
{
  NFNdefTagSession *v2;
  id WeakRetained;

  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (NFNdefTagSessionDelegate *)WeakRetained;
}

- (void)endSession
{
  objc_super v3;

  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)NFNdefTagSession;
  -[NFSession endSession](&v3, sel_endSession);
}

- (void)didEndUnexpectedly
{
  NSObject *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NFNdefTagSession;
  -[NFSession callbackQueue](&v5, sel_callbackQueue);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__NFNdefTagSession_didEndUnexpectedly__block_invoke;
  block[3] = &unk_1E3B51A60;
  block[4] = self;
  dispatch_async(v3, block);

}

id __38__NFNdefTagSession_didEndUnexpectedly__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  objc_super v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ndefTagSessionDidEndUnexpectedly:", *(_QWORD *)(a1 + 32));

  }
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)NFNdefTagSession;
  return objc_msgSendSuper2(&v6, sel_didEndUnexpectedly);
}

- (void)didTagStateChange:(unsigned int)a3
{
  NSObject *v5;
  _QWORD v6[5];
  unsigned int v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NFNdefTagSession;
  -[NFSession callbackQueue](&v8, sel_callbackQueue);
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__NFNdefTagSession_didTagStateChange___block_invoke;
  v6[3] = &unk_1E3B53390;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __38__NFNdefTagSession_didTagStateChange___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ndefTagSession:didTagStateChange:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));

  }
}

- (BOOL)startEmulationWithNdefMessage:(id)a3
{
  void *v4;

  objc_msgSend(a3, "asData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[NFNdefTagSession startEmulation:withMessageType:error:](self, "startEmulation:withMessageType:error:", v4, 0, 0);

  return (char)self;
}

- (BOOL)startEmulationWithNdefMessage:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "asData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[NFNdefTagSession startEmulation:withMessageType:error:](self, "startEmulation:withMessageType:error:", v6, 0, a4);

  return (char)a4;
}

- (BOOL)startEmulationWithNdefMessage:(id)a3 withMessageType:(unsigned int)a4
{
  uint64_t v4;
  void *v6;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(a3, "asData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = -[NFNdefTagSession startEmulation:withMessageType:error:](self, "startEmulation:withMessageType:error:", v6, v4, 0);

  return v4;
}

- (BOOL)startEmulationWithNdefMessage:(id)a3 withMessageType:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  void *v8;

  v6 = *(_QWORD *)&a4;
  objc_msgSend(a3, "asData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[NFNdefTagSession startEmulation:withMessageType:error:](self, "startEmulation:withMessageType:error:", v8, v6, a5);

  return (char)a5;
}

- (BOOL)startEmulation:(id)a3
{
  return -[NFNdefTagSession startEmulation:withMessageType:error:](self, "startEmulation:withMessageType:error:", a3, 0, 0);
}

- (BOOL)startEmulation:(id)a3 error:(id *)a4
{
  return -[NFNdefTagSession startEmulation:withMessageType:error:](self, "startEmulation:withMessageType:error:", a3, 0, a4);
}

- (BOOL)startEmulation:(id)a3 withMessageType:(unsigned int)a4
{
  return -[NFNdefTagSession startEmulation:withMessageType:error:](self, "startEmulation:withMessageType:error:", a3, *(_QWORD *)&a4, 0);
}

- (BOOL)startEmulation:(id)a3 withMessageType:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  _QWORD v16[8];
  _QWORD v17[7];
  os_activity_scope_state_s state;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = _os_activity_create(&dword_19B5EB000, "startEmulation:withMessageType:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__14;
  v21 = __Block_byref_object_dispose__14;
  v22 = 0;
  -[NFSession proxy](self, "proxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__NFNdefTagSession_startEmulation_withMessageType_error___block_invoke;
  v17[3] = &unk_1E3B51488;
  v17[4] = self;
  v17[5] = &state;
  v17[6] = a2;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __57__NFNdefTagSession_startEmulation_withMessageType_error___block_invoke_18;
  v16[3] = &unk_1E3B517E0;
  v16[4] = self;
  v16[5] = &state;
  v16[6] = &v23;
  v16[7] = a2;
  objc_msgSend(v13, "startEmulation:withMessageType:completion:", v9, v6, v16);

  if (a5)
    *a5 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v14 = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

void __57__NFNdefTagSession_startEmulation_withMessageType_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 105, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 105;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __57__NFNdefTagSession_startEmulation_withMessageType_error___block_invoke_18(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 109, v4);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 109;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (BOOL)stopEmulation
{
  return -[NFNdefTagSession stopEmulationWithError:](self, "stopEmulationWithError:", 0);
}

- (BOOL)stopEmulationWithError:(id *)a3
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  _QWORD v12[8];
  _QWORD v13[7];
  os_activity_scope_state_s state;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = _os_activity_create(&dword_19B5EB000, "stopEmulationWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__14;
  v17 = __Block_byref_object_dispose__14;
  v18 = 0;
  -[NFSession proxy](self, "proxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__NFNdefTagSession_stopEmulationWithError___block_invoke;
  v13[3] = &unk_1E3B51488;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = a2;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __43__NFNdefTagSession_stopEmulationWithError___block_invoke_19;
  v12[3] = &unk_1E3B517E0;
  v12[4] = self;
  v12[5] = &state;
  v12[6] = &v19;
  v12[7] = a2;
  objc_msgSend(v9, "stopEmulationWithCompletion:", v12);

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v10 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __43__NFNdefTagSession_stopEmulationWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 136, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 136;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __43__NFNdefTagSession_stopEmulationWithError___block_invoke_19(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 140, v4);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 140;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (BOOL)setTagMessage:(id)a3
{
  void *v4;

  objc_msgSend(a3, "asData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[NFNdefTagSession setTagData:error:](self, "setTagData:error:", v4, 0);

  return (char)self;
}

- (BOOL)setTagMessage:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "asData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[NFNdefTagSession setTagData:error:](self, "setTagData:error:", v6, a4);

  return (char)a4;
}

- (BOOL)setTagData:(id)a3
{
  return -[NFNdefTagSession setTagData:error:](self, "setTagData:error:", a3, 0);
}

- (BOOL)setTagData:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  _QWORD v14[8];
  _QWORD v15[7];
  os_activity_scope_state_s state;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v7 = a3;
  v8 = _os_activity_create(&dword_19B5EB000, "setTagData:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__14;
  v19 = __Block_byref_object_dispose__14;
  v20 = 0;
  -[NFSession proxy](self, "proxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __37__NFNdefTagSession_setTagData_error___block_invoke;
  v15[3] = &unk_1E3B51488;
  v15[4] = self;
  v15[5] = &state;
  v15[6] = a2;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __37__NFNdefTagSession_setTagData_error___block_invoke_20;
  v14[3] = &unk_1E3B517E0;
  v14[4] = self;
  v14[5] = &state;
  v14[6] = &v21;
  v14[7] = a2;
  objc_msgSend(v11, "setTagContent:completion:", v7, v14);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v12 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __37__NFNdefTagSession_setTagData_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 177, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 177;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __37__NFNdefTagSession_setTagData_error___block_invoke_20(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 181, v4);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 181;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (id)getTagData
{
  return -[NFNdefTagSession getTagDataWithError:](self, "getTagDataWithError:", 0);
}

- (id)getTagDataWithError:(id *)a3
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[8];
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  os_activity_scope_state_s state;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = _os_activity_create(&dword_19B5EB000, "getTagDataWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__14;
  v23 = __Block_byref_object_dispose__14;
  v24 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__14;
  v18 = __Block_byref_object_dispose__14;
  v19 = 0;
  -[NFSession proxy](self, "proxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__NFNdefTagSession_getTagDataWithError___block_invoke;
  v13[3] = &unk_1E3B51488;
  v13[4] = self;
  v13[5] = &v14;
  v13[6] = a2;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __40__NFNdefTagSession_getTagDataWithError___block_invoke_21;
  v12[3] = &unk_1E3B51830;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = &state;
  v12[7] = a2;
  objc_msgSend(v9, "getTagContentWithCompletion:", v12);

  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
  v10 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&state, 8);
  return v10;
}

void __40__NFNdefTagSession_getTagDataWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 207, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 207;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __40__NFNdefTagSession_getTagDataWithError___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v8 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 211, v7);
    }
    dispatch_get_specific(*v8);
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(*(id *)(a1 + 32));
      v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v22 = v16;
      v23 = 2082;
      v24 = v17;
      v25 = 2082;
      v26 = v18;
      v27 = 1024;
      v28 = 211;
      v29 = 2114;
      v30 = v7;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }

}

- (id)getTagMessage
{
  return -[NFNdefTagSession getTagMessageWithError:](self, "getTagMessageWithError:", 0);
}

- (id)getTagMessageWithError:(id *)a3
{
  void *v3;
  NFNdefMessage *v4;
  id v5;
  NFNdefMessage *v6;

  -[NFNdefTagSession getTagDataWithError:](self, "getTagDataWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [NFNdefMessage alloc];
    v5 = objc_retainAutorelease(v3);
    v6 = -[NFNdefMessage initWithBytes:length:](v4, "initWithBytes:length:", objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)enableWrite:(BOOL)a3
{
  return -[NFNdefTagSession enableWrite:error:](self, "enableWrite:error:", a3, 0);
}

- (BOOL)enableWrite:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  _QWORD v14[8];
  _QWORD v15[7];
  os_activity_scope_state_s state;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v5 = a3;
  v8 = _os_activity_create(&dword_19B5EB000, "enableWrite:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__14;
  v19 = __Block_byref_object_dispose__14;
  v20 = 0;
  -[NFSession proxy](self, "proxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __38__NFNdefTagSession_enableWrite_error___block_invoke;
  v15[3] = &unk_1E3B51488;
  v15[4] = self;
  v15[5] = &state;
  v15[6] = a2;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __38__NFNdefTagSession_enableWrite_error___block_invoke_23;
  v14[3] = &unk_1E3B517E0;
  v14[4] = self;
  v14[5] = &state;
  v14[6] = &v21;
  v14[7] = a2;
  objc_msgSend(v11, "enableWrite:completion:", v5, v14);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v12 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __38__NFNdefTagSession_enableWrite_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 250, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 250;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __38__NFNdefTagSession_enableWrite_error___block_invoke_23(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 254, v4);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(*(id *)(a1 + 32));
      v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v19 = v13;
      v20 = 2082;
      v21 = v14;
      v22 = 2082;
      v23 = v15;
      v24 = 1024;
      v25 = 254;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
