@implementation NFFieldNotificationECP2_0

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 odaRequired;
  id v5;
  objc_super v6;

  odaRequired = self->_odaRequired;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", odaRequired, CFSTR("odaRequired"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_terminalMode, CFSTR("terminalMode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_terminalType, CFSTR("terminalType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_terminalSubType, CFSTR("terminalSubType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tciArray, CFSTR("tciArray"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_openLoopSchemeBitfield, CFSTR("openLoopSchemeBitfield"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeKitSchemeDataPayload, CFSTR("homeKitSchemeDataPayload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_readerIdentifier, CFSTR("readerIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pairingMode, CFSTR("pairingMode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ignoreRFTechOnIsEqual, CFSTR("ignoreRFTechOnIsEqual"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("userInfo"));
  v6.receiver = self;
  v6.super_class = (Class)NFFieldNotificationECP2_0;
  -[NFFieldNotification encodeWithCoder:](&v6, sel_encodeWithCoder_, v5);

}

- (NFFieldNotificationECP2_0)initWithCoder:(id)a3
{
  id v4;
  NFFieldNotificationECP2_0 *v5;
  uint64_t v6;
  NSArray *tciArray;
  void *v8;
  uint64_t v9;
  NSData *openLoopSchemeBitfield;
  uint64_t v11;
  NSData *homeKitSchemeDataPayload;
  uint64_t v13;
  NSData *readerIdentifier;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSMutableDictionary *userInfo;
  uint64_t v26;
  id v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NFFieldNotificationECP2_0;
  v5 = -[NFFieldNotification initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_odaRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("odaRequired"));
    v5->_terminalMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("terminalMode"));
    v5->_terminalType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("terminalType"));
    v5->_terminalSubType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("terminalSubType"));
    objc_msgSend(MEMORY[0x1E0DE78C0], "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(), CFSTR("tciArray"));
    v6 = objc_claimAutoreleasedReturnValue();
    tciArray = v5->_tciArray;
    v5->_tciArray = (NSArray *)v6;

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("openLoopSchemeBitfield"));
    v9 = objc_claimAutoreleasedReturnValue();
    openLoopSchemeBitfield = v5->_openLoopSchemeBitfield;
    v5->_openLoopSchemeBitfield = (NSData *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeKitSchemeDataPayload"));
    v11 = objc_claimAutoreleasedReturnValue();
    homeKitSchemeDataPayload = v5->_homeKitSchemeDataPayload;
    v5->_homeKitSchemeDataPayload = (NSData *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSData *)v13;

    v5->_pairingMode = objc_msgSend(v4, "decodeIntForKey:", CFSTR("pairingMode"));
    v5->_ignoreRFTechOnIsEqual = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreRFTechOnIsEqual"));
    v27 = objc_alloc(MEMORY[0x1E0C99E60]);
    v26 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = (void *)objc_msgSend(v27, "initWithObjects:", v26, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("userInfo"));
    v23 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSMutableDictionary *)v23;

  }
  return v5;
}

- (NFFieldNotificationECP2_0)initWithDictionary:(id)a3
{
  id v5;
  NFFieldNotificationECP2_0 *v6;
  void *v7;
  const void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *v11;
  _BOOL4 v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  const char *v20;
  id v21;
  unsigned __int8 *v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  unint64_t terminalType;
  unsigned int v27;
  const void **v28;
  uint64_t Logger;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v34;
  objc_class *v35;
  int v36;
  const char *v37;
  const char *v38;
  NFFieldNotificationECP2_0 *v39;
  void *v40;
  uint64_t v41;
  NSArray *tciArray;
  void *v43;
  void *v44;
  uint64_t v45;
  NSMutableDictionary *userInfo;
  NSData *openLoopSchemeBitfield;
  NSData *homeKitSchemeDataPayload;
  unint64_t v49;
  uint64_t v50;
  NSObject *p_super;
  const void **v52;
  uint64_t v53;
  void (*v54)(uint64_t, const char *, ...);
  objc_class *v55;
  _BOOL4 v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  objc_class *v60;
  int v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  NSObject *v66;
  uint32_t v67;
  uint64_t v68;
  NSData *v69;
  unsigned int terminalSubType;
  const void **v71;
  uint64_t v72;
  void (*v73)(uint64_t, const char *, ...);
  objc_class *v74;
  _BOOL4 v75;
  const char *v76;
  uint64_t v77;
  objc_class *v78;
  int v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  NSData *v83;
  uint64_t v84;
  NSObject *v85;
  uint64_t v86;
  BOOL v87;
  const void **v88;
  uint64_t v89;
  void (*v90)(uint64_t, const char *, ...);
  objc_class *v91;
  _BOOL4 v92;
  const char *v93;
  uint64_t v94;
  NSObject *v95;
  objc_class *v96;
  int v97;
  const char *v98;
  const char *v99;
  const void **v100;
  uint64_t v101;
  void (*v102)(uint64_t, const char *, ...);
  objc_class *v103;
  _BOOL4 v104;
  const char *v105;
  uint64_t v106;
  objc_class *v107;
  int v108;
  const char *v109;
  const char *v110;
  const char *v112;
  const char *Name;
  const char *v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  objc_super v118;
  uint8_t buf[4];
  int v120;
  __int16 v121;
  const char *v122;
  __int16 v123;
  const char *v124;
  __int16 v125;
  int v126;
  __int16 v127;
  uint64_t v128;
  _QWORD v129[2];

  v129[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v118.receiver = self;
  v118.super_class = (Class)NFFieldNotificationECP2_0;
  v6 = -[NFFieldNotification initWithDictionary:](&v118, sel_initWithDictionary_, v5);
  if (!v6)
    goto LABEL_101;
  objc_msgSend(v5, "objectForKey:", CFSTR("ECPData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "length") > 4)
  {
    -[NFFieldNotification setNotificationType:](v6, "setNotificationType:", 3);
    v21 = objc_retainAutorelease(v7);
    v22 = (unsigned __int8 *)objc_msgSend(v21, "bytes");
    v23 = v22[2];
    v24 = v23 & 0xF;
    if (objc_msgSend(v21, "length") - 5 != v24)
    {
      v28 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v30 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v6);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v6);
        Name = sel_getName(a2);
        v34 = 45;
        if (isMetaClass)
          v34 = 43;
        v30(4, "%c[%{public}s %{public}s]:%i Invalid terminal type data length", v34, ClassName, Name, 532);
      }
      dispatch_get_specific(*v28);
      NFSharedLogGetLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      v35 = object_getClass(v6);
      if (class_isMetaClass(v35))
        v36 = 43;
      else
        v36 = 45;
      v37 = object_getClassName(v6);
      v38 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v120 = v36;
      v121 = 2082;
      v122 = v37;
      v123 = 2082;
      v124 = v38;
      v125 = 1024;
      v126 = 532;
      v20 = "%c[%{public}s %{public}s]:%i Invalid terminal type data length";
      goto LABEL_25;
    }
    v6->_odaRequired = (v23 & 0x40) == 0;
    v6->_terminalType = v22[3];
    v6->_terminalMode = (v23 >> 5) & 4;
    v6->_terminalSubType = v22[4];
    v6->_pairingMode = 0;
    objc_msgSend(v5, "objectForKey:", CFSTR("IgnoreRFTechOnIsEqual"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_ignoreRFTechOnIsEqual = objc_msgSend(v25, "BOOLValue");

    -[NFFieldNotificationECP2_0 _initCategoryWithType:](v6, "_initCategoryWithType:", v6->_terminalType);
    terminalType = v6->_terminalType;
    if (terminalType == 2)
    {
      if ((v6->_terminalSubType - 8) > 3u)
        v27 = 0;
      else
        v27 = dword_19B68AAF0[(char)(v6->_terminalSubType - 8)];
      v6->_pairingMode = v27;
      terminalType = v6->_terminalType;
    }
    if (terminalType > 2 || v24 < 3)
    {
      if (!(_DWORD)v24)
        goto LABEL_38;
    }
    else
    {
      objc_msgSend(v21, "subdataWithRange:", 5, 3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v129[0] = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 1);
      v41 = objc_claimAutoreleasedReturnValue();
      tciArray = v6->_tciArray;
      v6->_tciArray = (NSArray *)v41;

      terminalType = v6->_terminalType;
    }
    if (terminalType == 5 && !v6->_terminalSubType)
    {
      objc_msgSend(v21, "subdataWithRange:", 5, v24);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NFFieldNotificationECP2_0 _parseCHTerminalTypeData:](v6, "_parseCHTerminalTypeData:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v44, "count"))
      {
        v45 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v44);
        userInfo = v6->_userInfo;
        v6->_userInfo = (NSMutableDictionary *)v45;

      }
    }
LABEL_38:
    openLoopSchemeBitfield = v6->_openLoopSchemeBitfield;
    v6->_openLoopSchemeBitfield = 0;

    homeKitSchemeDataPayload = v6->_homeKitSchemeDataPayload;
    v6->_homeKitSchemeDataPayload = 0;

    v49 = v6->_terminalType;
    if (v49 == 1)
    {
      if (objc_msgSend(v21, "length") == 13)
      {
        objc_msgSend(v21, "subdataWithRange:", 8, 5);
        v50 = objc_claimAutoreleasedReturnValue();
        p_super = &v6->_openLoopSchemeBitfield->super;
        v6->_openLoopSchemeBitfield = (NSData *)v50;
        goto LABEL_99;
      }
      v49 = v6->_terminalType;
    }
    if (v49 == 2 && v6->_terminalSubType == 4)
    {
      if ((unint64_t)objc_msgSend(v21, "length") <= 0xF)
      {
        v52 = (const void **)MEMORY[0x1E0DE7900];
        dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
        v53 = NFLogGetLogger();
        if (v53)
        {
          v54 = (void (*)(uint64_t, const char *, ...))v53;
          v55 = object_getClass(v6);
          v56 = class_isMetaClass(v55);
          v57 = object_getClassName(v6);
          v58 = sel_getName(a2);
          v117 = objc_msgSend(v21, "length");
          v59 = 45;
          if (v56)
            v59 = 43;
          v54(4, "%c[%{public}s %{public}s]:%i Invalid data length %lu", v59, v57, v58, 591, v117);
        }
        dispatch_get_specific(*v52);
        NFSharedLogGetLogger();
        p_super = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          goto LABEL_99;
        v60 = object_getClass(v6);
        if (class_isMetaClass(v60))
          v61 = 43;
        else
          v61 = 45;
        v62 = object_getClassName(v6);
        v63 = sel_getName(a2);
        v64 = objc_msgSend(v21, "length");
        *(_DWORD *)buf = 67110146;
        v120 = v61;
        v121 = 2082;
        v122 = v62;
        v123 = 2082;
        v124 = v63;
        v125 = 1024;
        v126 = 591;
        v127 = 2048;
        v128 = v64;
        v65 = "%c[%{public}s %{public}s]:%i Invalid data length %lu";
        v66 = p_super;
        v67 = 44;
        goto LABEL_98;
      }
      objc_msgSend(v21, "subdataWithRange:", 2, 14);
      v82 = objc_claimAutoreleasedReturnValue();
      v83 = v6->_homeKitSchemeDataPayload;
      v6->_homeKitSchemeDataPayload = (NSData *)v82;

      if ((_DWORD)v24 == 11)
      {
LABEL_68:
        objc_msgSend(v21, "subdataWithRange:", 8, 8);
        v84 = objc_claimAutoreleasedReturnValue();
        p_super = &v6->_readerIdentifier->super;
        v6->_readerIdentifier = (NSData *)v84;
        goto LABEL_99;
      }
      v100 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      v101 = NFLogGetLogger();
      if (v101)
      {
        v102 = (void (*)(uint64_t, const char *, ...))v101;
        v103 = object_getClass(v6);
        v104 = class_isMetaClass(v103);
        v105 = object_getClassName(v6);
        v116 = sel_getName(a2);
        v106 = 45;
        if (v104)
          v106 = 43;
        v102(4, "%c[%{public}s %{public}s]:%i Expected reader identifier but ECP frame does not contain it.", v106, v105, v116, 601);
      }
      dispatch_get_specific(*v100);
      NFSharedLogGetLogger();
      p_super = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        goto LABEL_99;
      v107 = object_getClass(v6);
      if (class_isMetaClass(v107))
        v108 = 43;
      else
        v108 = 45;
      v109 = object_getClassName(v6);
      v110 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v120 = v108;
      v121 = 2082;
      v122 = v109;
      v123 = 2082;
      v124 = v110;
      v125 = 1024;
      v126 = 601;
      v65 = "%c[%{public}s %{public}s]:%i Expected reader identifier but ECP frame does not contain it.";
    }
    else
    {
      v68 = objc_opt_new();
      v69 = v6->_openLoopSchemeBitfield;
      v6->_openLoopSchemeBitfield = (NSData *)v68;

      if (v6->_terminalType != 2)
        goto LABEL_100;
      terminalSubType = v6->_terminalSubType;
      if (terminalSubType > 0xB)
        goto LABEL_100;
      if (((1 << terminalSubType) & 0xCF0) == 0)
      {
        if (terminalSubType != 1 || !-[NSArray count](v6->_tciArray, "count"))
          goto LABEL_100;
        -[NSArray objectAtIndexedSubscript:](v6->_tciArray, "objectAtIndexedSubscript:", 0);
        v85 = objc_claimAutoreleasedReturnValue();
        p_super = v85;
        if (v85 && (unint64_t)-[NSObject length](v85, "length") >= 3)
        {
          p_super = objc_retainAutorelease(p_super);
          v86 = -[NSObject bytes](p_super, "bytes");
          v87 = *(_WORD *)v86 == 3841 && *(unsigned __int8 *)(v86 + 2) == 255;
          if (v87)
          {
            v88 = (const void **)MEMORY[0x1E0DE7900];
            dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
            v89 = NFLogGetLogger();
            if (v89)
            {
              v90 = (void (*)(uint64_t, const char *, ...))v89;
              v91 = object_getClass(v6);
              v92 = class_isMetaClass(v91);
              v93 = object_getClassName(v6);
              v115 = sel_getName(a2);
              v87 = !v92;
              v88 = (const void **)MEMORY[0x1E0DE7900];
              v94 = 45;
              if (!v87)
                v94 = 43;
              v90(6, "%c[%{public}s %{public}s]:%i Charger TCI detected", v94, v93, v115, 629);
            }
            dispatch_get_specific(*v88);
            NFSharedLogGetLogger();
            v95 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
            {
              v96 = object_getClass(v6);
              if (class_isMetaClass(v96))
                v97 = 43;
              else
                v97 = 45;
              v98 = object_getClassName(v6);
              v99 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              v120 = v97;
              v121 = 2082;
              v122 = v98;
              v123 = 2082;
              v124 = v99;
              v125 = 1024;
              v126 = 629;
              _os_log_impl(&dword_19B5EB000, v95, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Charger TCI detected", buf, 0x22u);
            }

            v6->_terminalType = 0;
            v6->_terminalSubType = 1;
            -[NFFieldNotification setCategory:](v6, "setCategory:", 5);
          }
        }
LABEL_99:

LABEL_100:
LABEL_101:
        v39 = v6;
        goto LABEL_102;
      }
      if ((_DWORD)v24 == 11)
        goto LABEL_68;
      v71 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      v72 = NFLogGetLogger();
      if (v72)
      {
        v73 = (void (*)(uint64_t, const char *, ...))v72;
        v74 = object_getClass(v6);
        v75 = class_isMetaClass(v74);
        v76 = object_getClassName(v6);
        v114 = sel_getName(a2);
        v77 = 45;
        if (v75)
          v77 = 43;
        v73(4, "%c[%{public}s %{public}s]:%i Expected reader identifier but ECP frame does not contain it.", v77, v76, v114, 621);
      }
      dispatch_get_specific(*v71);
      NFSharedLogGetLogger();
      p_super = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        goto LABEL_99;
      v78 = object_getClass(v6);
      if (class_isMetaClass(v78))
        v79 = 43;
      else
        v79 = 45;
      v80 = object_getClassName(v6);
      v81 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v120 = v79;
      v121 = 2082;
      v122 = v80;
      v123 = 2082;
      v124 = v81;
      v125 = 1024;
      v126 = 621;
      v65 = "%c[%{public}s %{public}s]:%i Expected reader identifier but ECP frame does not contain it.";
    }
    v66 = p_super;
    v67 = 34;
LABEL_98:
    _os_log_impl(&dword_19B5EB000, v66, OS_LOG_TYPE_ERROR, v65, buf, v67);
    goto LABEL_99;
  }
  v8 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  v9 = NFLogGetLogger();
  if (v9)
  {
    v10 = (void (*)(uint64_t, const char *, ...))v9;
    v11 = object_getClass(v6);
    v12 = class_isMetaClass(v11);
    v13 = object_getClassName(v6);
    v112 = sel_getName(a2);
    v14 = 45;
    if (v12)
      v14 = 43;
    v10(4, "%c[%{public}s %{public}s]:%i Frame packet length shorter than expected", v14, v13, v112, 505);
  }
  dispatch_get_specific(*v8);
  NFSharedLogGetLogger();
  v15 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    goto LABEL_26;
  v16 = object_getClass(v6);
  if (class_isMetaClass(v16))
    v17 = 43;
  else
    v17 = 45;
  v18 = object_getClassName(v6);
  v19 = sel_getName(a2);
  *(_DWORD *)buf = 67109890;
  v120 = v17;
  v121 = 2082;
  v122 = v18;
  v123 = 2082;
  v124 = v19;
  v125 = 1024;
  v126 = 505;
  v20 = "%c[%{public}s %{public}s]:%i Frame packet length shorter than expected";
LABEL_25:
  _os_log_impl(&dword_19B5EB000, v15, OS_LOG_TYPE_ERROR, v20, buf, 0x22u);
LABEL_26:

  v39 = 0;
LABEL_102:

  return v39;
}

- (NFFieldNotificationECP2_0)initWithNotificationType:(unint64_t)a3 rfTechnology:(unsigned int)a4 typeFSystemCode:(unsigned __int16)a5 creationDate:(id)a6 cachedBeforeRFReset:(BOOL)a7 odaRequired:(BOOL)a8 terminalMode:(unsigned int)a9 terminalType:(unint64_t)a10 terminalSubType:(unsigned __int8)a11 tciArray:(id)a12 openLoopSchemeBitfield:(id)a13 homeKitSchemeDataPayload:(id)a14 readerIdentifier:(id)a15 pairingMode:(unsigned int)a16 terminalTypeData:(id)a17 ignoreRFTechOnIsEqual:(BOOL)a18 userInfo:(id)a19
{
  uint64_t v19;
  uint64_t v20;
  id v23;
  id v24;
  NFFieldNotificationECP2_0 *v25;
  NFFieldNotificationECP2_0 *v26;
  NFFieldNotificationECP2_0 *v27;
  _BOOL4 v31;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v31 = a7;
  v19 = a5;
  v20 = *(_QWORD *)&a4;
  v35 = a12;
  v34 = a13;
  v33 = a14;
  v32 = a15;
  v23 = a17;
  v24 = a19;
  v36.receiver = self;
  v36.super_class = (Class)NFFieldNotificationECP2_0;
  v25 = -[NFFieldNotification initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:](&v36, sel_initWithNotificationType_rfTechnology_typeFSystemCode_creationDate_cachedBeforeRFReset_, a3, v20, v19, a6, v31);
  v26 = v25;
  if (v25)
  {
    v25->_odaRequired = a8;
    v25->_terminalMode = a9;
    v25->_terminalType = a10;
    v25->_terminalSubType = a11;
    objc_storeStrong((id *)&v25->_tciArray, a12);
    objc_storeStrong((id *)&v26->_openLoopSchemeBitfield, a13);
    objc_storeStrong((id *)&v26->_homeKitSchemeDataPayload, a14);
    objc_storeStrong((id *)&v26->_readerIdentifier, a15);
    v26->_pairingMode = a16;
    objc_storeStrong((id *)&v26->_terminalTypeData, a17);
    v26->_ignoreRFTechOnIsEqual = a18;
    objc_storeStrong((id *)&v26->_userInfo, a19);
    -[NFFieldNotificationECP2_0 _initCategoryWithType:](v26, "_initCategoryWithType:", a10);
    v27 = v26;
  }

  return v26;
}

- (void)_initCategoryWithType:(unint64_t)a3
{
  unint64_t v3;

  if (a3 - 1 >= 5)
    v3 = 0;
  else
    v3 = a3 + 3;
  -[NFFieldNotification setCategory:](self, "setCategory:", v3);
}

- (id)description
{
  void *v3;
  id v4;
  const char *ClassName;
  _BOOL8 odaRequired;
  uint64_t terminalMode;
  unint64_t terminalType;
  uint64_t terminalSubType;
  NSMutableDictionary *v10;
  const __CFString *v11;
  unsigned int v12;
  _BOOL8 v13;
  unint64_t v14;
  unint64_t v15;
  NSArray *v16;
  NSArray *tciArray;
  NSData *openLoopSchemeBitfield;
  const __CFString *v19;
  const char *v20;
  unsigned int v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  NSArray *v25;
  NSData *homeKitSchemeDataPayload;
  unsigned int v27;
  _BOOL8 v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  NSData *v32;
  void *v33;
  void *v34;
  uint64_t pairingMode;
  const __CFString *v36;
  _BOOL8 v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSMutableDictionary *userInfo;
  uint64_t v42;
  _BOOL8 v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  NSArray *v47;
  NSData *readerIdentifier;
  const char *v50;
  void *v51;
  _BOOL8 v52;
  uint64_t v53;
  uint64_t v54;
  _BOOL8 v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  NSMutableDictionary *v60;
  NSArray *v61;
  unint64_t v62;
  void *v63;
  uint64_t v64;
  NSData *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  const __CFString *v71;
  id v72;
  id v73;

  v3 = (void *)objc_opt_new();
  if ((-[NFFieldNotification rfTechnology](self, "rfTechnology") & 1) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("A,"));
  if ((-[NFFieldNotification rfTechnology](self, "rfTechnology") & 2) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("B,"));
  if ((-[NFFieldNotification rfTechnology](self, "rfTechnology") & 4) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("F,"));
  if ((-[NFFieldNotification rfTechnology](self, "rfTechnology") & 0x10) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("V,"));
  if ((-[NFFieldNotification rfTechnology](self, "rfTechnology") & 8) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("ECP,"));
  if (!objc_msgSend(v3, "length"))
    objc_msgSend(v3, "appendString:", CFSTR("None"));
  switch(self->_terminalType)
  {
    case 0uLL:
      v4 = objc_alloc(MEMORY[0x1E0CB3940]);
      ClassName = object_getClassName(self);
      odaRequired = self->_odaRequired;
      terminalMode = self->_terminalMode;
      terminalType = self->_terminalType;
      terminalSubType = self->_terminalSubType;
      -[NFFieldNotification _creationDateString](self, "_creationDateString");
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v60 = v10;
      v62 = -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset");
      v56 = terminalType;
      v58 = terminalSubType;
      v52 = odaRequired;
      v54 = terminalMode;
      v11 = CFSTR("<%s: tech=[%@], oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, date=%@, cached=%d>");
      goto LABEL_23;
    case 1uLL:
      v72 = objc_alloc(MEMORY[0x1E0CB3940]);
      v69 = object_getClassName(self);
      v12 = -[NFFieldNotification typeFSystemCode](self, "typeFSystemCode");
      v13 = self->_odaRequired;
      v14 = self->_terminalMode;
      v15 = self->_terminalType;
      v16 = (NSArray *)self->_terminalSubType;
      tciArray = self->_tciArray;
      openLoopSchemeBitfield = self->_openLoopSchemeBitfield;
      -[NFFieldNotification _creationDateString](self, "_creationDateString");
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v67 = (unint64_t)v10;
      v68 = -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset");
      v63 = tciArray;
      v65 = openLoopSchemeBitfield;
      v59 = v15;
      v61 = v16;
      v55 = v13;
      v57 = v14;
      v51 = v3;
      v53 = v12;
      v19 = CFSTR("<%s: tech=[%@] sc=0x%X, oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, tcis=%@, openLoop=%@, date=%@, cached=%d>");
      v50 = v69;
      goto LABEL_27;
    case 2uLL:
      if (self->_terminalSubType == 4)
      {
        v72 = objc_alloc(MEMORY[0x1E0CB3940]);
        v20 = object_getClassName(self);
        v21 = -[NFFieldNotification typeFSystemCode](self, "typeFSystemCode");
        v22 = self->_odaRequired;
        v23 = self->_terminalMode;
        v24 = self->_terminalType;
        v25 = (NSArray *)self->_terminalSubType;
        homeKitSchemeDataPayload = self->_homeKitSchemeDataPayload;
        -[NFFieldNotification _creationDateString](self, "_creationDateString");
        v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v65 = (NSData *)v10;
        v67 = -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset");
        v61 = v25;
        v63 = homeKitSchemeDataPayload;
        v57 = v23;
        v59 = v24;
        v53 = v21;
        v55 = v22;
        v19 = CFSTR("<%s: tech=%@ sc=0x%X, oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, homeKitPayload=%@, date=%@, cached=%d>");
      }
      else
      {
        pairingMode = (int)self->_pairingMode;
        if (pairingMode > 2)
          v36 = &stru_1E3B54F18;
        else
          v36 = off_1E3B533F0[pairingMode];
        v71 = v36;
        v72 = objc_alloc(MEMORY[0x1E0CB3940]);
        v20 = object_getClassName(self);
        v43 = self->_odaRequired;
        v44 = self->_terminalMode;
        v45 = self->_terminalType;
        v46 = self->_terminalSubType;
        v47 = self->_tciArray;
        readerIdentifier = self->_readerIdentifier;
        -[NFFieldNotification _creationDateString](self, "_creationDateString");
        v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v67 = (unint64_t)v10;
        v68 = -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset");
        v63 = (void *)v71;
        v65 = readerIdentifier;
        v59 = v46;
        v61 = v47;
        v55 = v44;
        v57 = v45;
        v53 = v43;
        v19 = CFSTR("<%s: tech=[%@], oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, tcis=%@, pairingMode=%@ readerIdentifier=%@, date=%@, cached=%d>");
      }
      v50 = v20;
      v51 = v3;
LABEL_27:
      v42 = objc_msgSend(v72, "initWithFormat:", v19, v50, v51, v53, v55, v57, v59, v61, v63, v65, v67, v68);
      goto LABEL_28;
    case 5uLL:
      if (self->_terminalSubType)
        goto LABEL_19;
      v4 = objc_alloc(MEMORY[0x1E0CB3940]);
      ClassName = object_getClassName(self);
      v37 = self->_odaRequired;
      v38 = self->_terminalMode;
      v39 = self->_terminalType;
      v40 = self->_terminalSubType;
      userInfo = self->_userInfo;
      -[NFFieldNotification _creationDateString](self, "_creationDateString");
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v62 = (unint64_t)v10;
      v64 = -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset");
      v58 = v40;
      v60 = userInfo;
      v54 = v38;
      v56 = v39;
      v52 = v37;
      v11 = CFSTR("<%s: tech=[%@], oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, userInfo=%@, date=%@, cached=%d>");
LABEL_23:
      v42 = objc_msgSend(v4, "initWithFormat:", v11, ClassName, v3, v52, v54, v56, v58, v60, v62, v64, v66, v68);
LABEL_28:
      v34 = (void *)v42;
      break;
    default:
LABEL_19:
      v73 = objc_alloc(MEMORY[0x1E0CB3940]);
      v70 = object_getClassName(self);
      v27 = -[NFFieldNotification typeFSystemCode](self, "typeFSystemCode");
      v28 = self->_odaRequired;
      v29 = self->_terminalMode;
      v30 = self->_terminalType;
      v31 = self->_terminalSubType;
      -[NSData debugDescription](self->_terminalTypeData, "debugDescription");
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v32 = self->_readerIdentifier;
      -[NFFieldNotification _creationDateString](self, "_creationDateString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v73, "initWithFormat:", CFSTR("<%s: tech=[%@] sc=0x%X, oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, terminalTypeData=%@, readerIdentifier=%@, date=%@, cached=%d>"), v70, v3, v27, v28, v29, v30, v31, v10, v32, v33, -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset"));

      break;
  }

  return v34;
}

- (BOOL)isEqual:(id)a3
{
  NFFieldNotificationECP2_0 *v5;
  NFFieldNotificationECP2_0 *v6;
  _BOOL4 v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  unsigned int v36;
  unsigned __int8 v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  unsigned __int8 v46;
  const void **v48;
  uint64_t Logger;
  void (*v50)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v54;
  NSObject *v55;
  objc_class *v56;
  int v57;
  const char *Name;
  objc_super v59;
  objc_super v60;
  uint8_t buf[4];
  int v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = (NFFieldNotificationECP2_0 *)a3;
  if (v5 == self)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = -[NFFieldNotificationECP2_0 odaRequired](v6, "odaRequired");
      if (v7 != -[NFFieldNotificationECP2_0 odaRequired](self, "odaRequired"))
        goto LABEL_47;
      v8 = -[NFFieldNotificationECP2_0 terminalType](v6, "terminalType");
      if (v8 != -[NFFieldNotificationECP2_0 terminalType](self, "terminalType"))
        goto LABEL_47;
      v9 = -[NFFieldNotificationECP2_0 terminalSubType](v6, "terminalSubType");
      if (v9 != -[NFFieldNotificationECP2_0 terminalSubType](self, "terminalSubType"))
        goto LABEL_47;
      v10 = -[NFFieldNotificationECP2_0 terminalMode](v6, "terminalMode");
      if (v10 != -[NFFieldNotificationECP2_0 terminalMode](self, "terminalMode"))
        goto LABEL_47;
      -[NFFieldNotificationECP2_0 tciArray](v6, "tciArray");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      -[NFFieldNotificationECP2_0 tciArray](self, "tciArray");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v12 != v14)
        goto LABEL_47;
      -[NFFieldNotificationECP2_0 tciArray](v6, "tciArray");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        -[NFFieldNotificationECP2_0 tciArray](v6, "tciArray");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NFFieldNotificationECP2_0 tciArray](self, "tciArray");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToArray:", v17);

        if (!v18)
          goto LABEL_47;
      }
      else
      {

      }
      -[NFFieldNotificationECP2_0 openLoopSchemeBitfield](v6, "openLoopSchemeBitfield");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length");
      -[NFFieldNotificationECP2_0 openLoopSchemeBitfield](self, "openLoopSchemeBitfield");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "length");

      if (v21 != v23)
        goto LABEL_47;
      -[NFFieldNotificationECP2_0 openLoopSchemeBitfield](v6, "openLoopSchemeBitfield");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = (void *)v24;
        -[NFFieldNotificationECP2_0 openLoopSchemeBitfield](v6, "openLoopSchemeBitfield");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NFFieldNotificationECP2_0 openLoopSchemeBitfield](self, "openLoopSchemeBitfield");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "isEqualToData:", v27);

        if (!v28)
          goto LABEL_47;
      }
      -[NFFieldNotificationECP2_0 readerIdentifier](v6, "readerIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v29, "length");
      -[NFFieldNotificationECP2_0 readerIdentifier](self, "readerIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "length");

      if (v30 != (void *)v32)
        goto LABEL_47;
      -[NFFieldNotificationECP2_0 readerIdentifier](v6, "readerIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v33, "length"))
      {
        -[NFFieldNotificationECP2_0 readerIdentifier](v6, "readerIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NFFieldNotificationECP2_0 readerIdentifier](self, "readerIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v30, "isEqualToData:", v34);

        if (!v35)
          goto LABEL_47;
      }
      else
      {

      }
      v36 = -[NFFieldNotificationECP2_0 pairingMode](v6, "pairingMode");
      if (v36 != -[NFFieldNotificationECP2_0 pairingMode](self, "pairingMode"))
      {
LABEL_47:
        v19 = 0;
LABEL_48:

        goto LABEL_49;
      }
      if (-[NFFieldNotificationECP2_0 terminalType](self, "terminalType") != 5
        || -[NFFieldNotificationECP2_0 terminalSubType](self, "terminalSubType"))
      {
LABEL_25:
        if (-[NFFieldNotificationECP2_0 ignoreRFTechOnIsEqual](self, "ignoreRFTechOnIsEqual"))
        {
          v60.receiver = self;
          v60.super_class = (Class)NFFieldNotificationECP2_0;
          v37 = -[NFFieldNotification isEqualWithoutRFTech:](&v60, sel_isEqualWithoutRFTech_, v6);
        }
        else
        {
          v59.receiver = self;
          v59.super_class = (Class)NFFieldNotificationECP2_0;
          v37 = -[NFFieldNotification isEqual:](&v59, sel_isEqual_, v6);
        }
        v19 = v37;
        goto LABEL_48;
      }
      -[NFFieldNotificationECP2_0 userInfo](self, "userInfo");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "count");
      if (v39
        || (-[NFFieldNotificationECP2_0 userInfo](v6, "userInfo"),
            v30 = (void *)objc_claimAutoreleasedReturnValue(),
            !objc_msgSend(v30, "count")))
      {
        -[NFFieldNotificationECP2_0 userInfo](self, "userInfo");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v40, "count"))
        {
          -[NFFieldNotificationECP2_0 userInfo](v6, "userInfo");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "count");

          if (!v39)
          if (!v42)
            goto LABEL_47;
        }
        else
        {

          if (!v39)
        }
        -[NFFieldNotificationECP2_0 userInfo](v6, "userInfo");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKey:", CFSTR("CHCfgBytes"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        -[NFFieldNotificationECP2_0 userInfo](self, "userInfo");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKey:", CFSTR("CHCfgBytes"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v38 || !v30) && (!v38 || v30))
        {
          v45 = objc_msgSend(v38, "unsignedShortValue");
          if (v45 != objc_msgSend(v30, "unsignedShortValue"))
          {
            v46 = objc_msgSend(v38, "unsignedShortValue");
            if (((objc_msgSend(v30, "unsignedShortValue") ^ v46) & 3) != 0)
              goto LABEL_46;
            v48 = (const void **)MEMORY[0x1E0DE7900];
            dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
            Logger = NFLogGetLogger();
            if (Logger)
            {
              v50 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v54 = 45;
              if (isMetaClass)
                v54 = 43;
              v50(4, "%c[%{public}s %{public}s]:%i Contains undefined RFU bits but existing feature definition matches", v54, ClassName, Name, 869);
            }
            dispatch_get_specific(*v48);
            NFSharedLogGetLogger();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              v56 = object_getClass(self);
              if (class_isMetaClass(v56))
                v57 = 43;
              else
                v57 = 45;
              *(_DWORD *)buf = 67109890;
              v62 = v57;
              v63 = 2082;
              v64 = object_getClassName(self);
              v65 = 2082;
              v66 = sel_getName(a2);
              v67 = 1024;
              v68 = 869;
              _os_log_impl(&dword_19B5EB000, v55, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Contains undefined RFU bits but existing feature definition matches", buf, 0x22u);
            }

          }
          goto LABEL_25;
        }
      }
LABEL_46:

      goto LABEL_47;
    }
    v19 = 0;
  }
LABEL_49:

  return v19;
}

- (id)_parseCHTerminalTypeData:(id)a3
{
  id v5;
  unsigned __int8 *v6;
  const void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *v10;
  _BOOL4 v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  _BOOL4 v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const void **v31;
  uint64_t Logger;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v37;
  objc_class *v38;
  int v39;
  NSObject *v40;
  const void **v41;
  uint64_t v42;
  void (*v43)(uint64_t, const char *, ...);
  objc_class *v44;
  _BOOL4 v45;
  const char *v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  int v50;
  uint64_t v51;
  const void **v52;
  uint64_t v53;
  void (*v54)(uint64_t, const char *, ...);
  objc_class *v55;
  _BOOL4 v56;
  uint64_t v57;
  NSObject *v58;
  objc_class *v59;
  int v60;
  const char *v61;
  const char *v62;
  const void **v63;
  uint64_t v64;
  void (*v65)(uint64_t, const char *, ...);
  objc_class *v66;
  _BOOL4 v67;
  const char *v68;
  uint64_t v69;
  NSObject *v70;
  objc_class *v71;
  int v72;
  const char *v73;
  const char *v74;
  const char *v76;
  const char *v77;
  const char *v78;
  const char *Name;
  const char *v80;
  const char *v81;
  const char *v82;
  uint8_t buf[4];
  int v84;
  __int16 v85;
  const char *v86;
  __int16 v87;
  const char *v88;
  __int16 v89;
  int v90;
  __int16 v91;
  int v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v5 = objc_retainAutorelease(a3);
  v6 = (unsigned __int8 *)objc_msgSend(v5, "bytes");
  if ((unint64_t)objc_msgSend(v5, "length") > 2)
  {
    v18 = *v6;
    if (!*v6)
    {
      v31 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v33 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v37 = 45;
        if (isMetaClass)
          v37 = 43;
        v33(6, "%c[%{public}s %{public}s]:%i Minimal version not met", v37, ClassName, Name, 897);
      }
      dispatch_get_specific(*v31);
      NFSharedLogGetLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
      v38 = object_getClass(self);
      if (class_isMetaClass(v38))
        v39 = 43;
      else
        v39 = 45;
      *(_DWORD *)buf = 67109890;
      v84 = v39;
      v85 = 2082;
      v86 = object_getClassName(self);
      v87 = 2082;
      v88 = sel_getName(a2);
      v89 = 1024;
      v90 = 897;
      v17 = "%c[%{public}s %{public}s]:%i Minimal version not met";
      goto LABEL_31;
    }
    v14 = objc_opt_new();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", v18);
    -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v19, CFSTR("CHVersion"));

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v6 + 1)) >> 16);
    -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v20, CFSTR("CHCfgBytes"));

    if ((unint64_t)objc_msgSend(v5, "length") > 8)
    {
      if ((unint64_t)objc_msgSend(v5, "length") >= 0xA)
      {
        v41 = (const void **)MEMORY[0x1E0DE7900];
        dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
        v42 = NFLogGetLogger();
        if (v42)
        {
          v43 = (void (*)(uint64_t, const char *, ...))v42;
          v44 = object_getClass(self);
          v45 = class_isMetaClass(v44);
          v46 = object_getClassName(self);
          v80 = sel_getName(a2);
          v47 = 45;
          if (v45)
            v47 = 43;
          v43(4, "%c[%{public}s %{public}s]:%i Truncates excess to expected data length", v47, v46, v80, 913);
        }
        dispatch_get_specific(*v41);
        NFSharedLogGetLogger();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v49 = object_getClass(self);
          if (class_isMetaClass(v49))
            v50 = 43;
          else
            v50 = 45;
          *(_DWORD *)buf = 67109890;
          v84 = v50;
          v85 = 2082;
          v86 = object_getClassName(self);
          v87 = 2082;
          v88 = sel_getName(a2);
          v89 = 1024;
          v90 = 913;
          _os_log_impl(&dword_19B5EB000, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Truncates excess to expected data length", buf, 0x22u);
        }

      }
      v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v6 + 3, 6);
      if (v51)
      {
        v28 = v51;
        if ((_DWORD)v18 != 1)
        {
          v52 = (const void **)MEMORY[0x1E0DE7900];
          dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
          v53 = NFLogGetLogger();
          if (v53)
          {
            v54 = (void (*)(uint64_t, const char *, ...))v53;
            v55 = object_getClass(self);
            v56 = class_isMetaClass(v55);
            v76 = object_getClassName(self);
            v81 = sel_getName(a2);
            v57 = 45;
            if (v56)
              v57 = 43;
            v54(4, "%c[%{public}s %{public}s]:%i Assume random in detected version %{public}d", v57, v76, v81, 925, v18);
          }
          dispatch_get_specific(*v52);
          NFSharedLogGetLogger();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            v59 = object_getClass(self);
            if (class_isMetaClass(v59))
              v60 = 43;
            else
              v60 = 45;
            v61 = object_getClassName(self);
            v62 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            v84 = v60;
            v85 = 2082;
            v86 = v61;
            v87 = 2082;
            v88 = v62;
            v89 = 1024;
            v90 = 925;
            v91 = 1026;
            v92 = v18;
            _os_log_impl(&dword_19B5EB000, v58, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Assume random in detected version %{public}d", buf, 0x28u);
          }

        }
        -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v28, CFSTR("CHRemoteRandom"));
        v40 = v14;
        goto LABEL_68;
      }
      v63 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      v64 = NFLogGetLogger();
      if (v64)
      {
        v65 = (void (*)(uint64_t, const char *, ...))v64;
        v66 = object_getClass(self);
        v67 = class_isMetaClass(v66);
        v68 = object_getClassName(self);
        v82 = sel_getName(a2);
        v69 = 45;
        if (v67)
          v69 = 43;
        v65(3, "%c[%{public}s %{public}s]:%i out of resource", v69, v68, v82, 918);
      }
      dispatch_get_specific(*v63);
      NFSharedLogGetLogger();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        v71 = object_getClass(self);
        if (class_isMetaClass(v71))
          v72 = 43;
        else
          v72 = 45;
        v73 = object_getClassName(self);
        v74 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v84 = v72;
        v85 = 2082;
        v86 = v73;
        v87 = 2082;
        v88 = v74;
        v89 = 1024;
        v90 = 918;
        _os_log_impl(&dword_19B5EB000, v70, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i out of resource", buf, 0x22u);
      }

      v28 = 0;
    }
    else
    {
      v21 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      v22 = NFLogGetLogger();
      if (v22)
      {
        v23 = (void (*)(uint64_t, const char *, ...))v22;
        v24 = object_getClass(self);
        v25 = class_isMetaClass(v24);
        v26 = object_getClassName(self);
        v78 = sel_getName(a2);
        v27 = 45;
        if (v25)
          v27 = 43;
        v23(6, "%c[%{public}s %{public}s]:%i Missing random", v27, v26, v78, 907);
      }
      dispatch_get_specific(*v21);
      NFSharedLogGetLogger();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = object_getClass(self);
        if (class_isMetaClass(v29))
          v30 = 43;
        else
          v30 = 45;
        *(_DWORD *)buf = 67109890;
        v84 = v30;
        v85 = 2082;
        v86 = object_getClassName(self);
        v87 = 2082;
        v88 = sel_getName(a2);
        v89 = 1024;
        v90 = 907;
        _os_log_impl(&dword_19B5EB000, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing random", buf, 0x22u);
      }
    }
    v40 = 0;
LABEL_68:

    goto LABEL_69;
  }
  v7 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  v8 = NFLogGetLogger();
  if (v8)
  {
    v9 = (void (*)(uint64_t, const char *, ...))v8;
    v10 = object_getClass(self);
    v11 = class_isMetaClass(v10);
    v12 = object_getClassName(self);
    v77 = sel_getName(a2);
    v13 = 45;
    if (v11)
      v13 = 43;
    v9(6, "%c[%{public}s %{public}s]:%i Missing minimum required length", v13, v12, v77, 889);
  }
  dispatch_get_specific(*v7);
  NFSharedLogGetLogger();
  v14 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    goto LABEL_32;
  v15 = object_getClass(self);
  if (class_isMetaClass(v15))
    v16 = 43;
  else
    v16 = 45;
  *(_DWORD *)buf = 67109890;
  v84 = v16;
  v85 = 2082;
  v86 = object_getClassName(self);
  v87 = 2082;
  v88 = sel_getName(a2);
  v89 = 1024;
  v90 = 889;
  v17 = "%c[%{public}s %{public}s]:%i Missing minimum required length";
LABEL_31:
  _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_DEFAULT, v17, buf, 0x22u);
LABEL_32:
  v40 = 0;
LABEL_69:

  return v40;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NFFieldNotificationECP2_0 *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  NFFieldNotificationECP2_0 *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = [NFFieldNotificationECP2_0 alloc];
  v5 = -[NFFieldNotification notificationType](self, "notificationType");
  v6 = -[NFFieldNotification rfTechnology](self, "rfTechnology");
  v7 = -[NFFieldNotification typeFSystemCode](self, "typeFSystemCode");
  -[NFFieldNotification creationDate](self, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset");
  LOBYTE(v15) = self->_ignoreRFTechOnIsEqual;
  LODWORD(v14) = self->_pairingMode;
  LOBYTE(v13) = self->_terminalSubType;
  LODWORD(v12) = self->_terminalMode;
  v10 = -[NFFieldNotificationECP2_0 initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:odaRequired:terminalMode:terminalType:terminalSubType:tciArray:openLoopSchemeBitfield:homeKitSchemeDataPayload:readerIdentifier:pairingMode:terminalTypeData:ignoreRFTechOnIsEqual:userInfo:](v4, "initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:odaRequired:terminalMode:terminalType:terminalSubType:tciArray:openLoopSchemeBitfield:homeKitSchemeDataPayload:readerIdentifier:pairingMode:terminalTypeData:ignoreRFTechOnIsEqual:userInfo:", v5, v6, v7, v8, v9, self->_odaRequired, v12, self->_terminalType, v13, self->_tciArray, self->_openLoopSchemeBitfield, self->_homeKitSchemeDataPayload, self->_readerIdentifier, v14, self->_terminalTypeData,
          v15,
          self->_userInfo);

  return v10;
}

- (BOOL)odaRequired
{
  return self->_odaRequired;
}

- (unsigned)terminalMode
{
  return self->_terminalMode;
}

- (unint64_t)terminalType
{
  return self->_terminalType;
}

- (unsigned)terminalSubType
{
  return self->_terminalSubType;
}

- (NSArray)tciArray
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSData)openLoopSchemeBitfield
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (NSData)homeKitSchemeDataPayload
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (NSData)readerIdentifier
{
  return self->_readerIdentifier;
}

- (unsigned)pairingMode
{
  return self->_pairingMode;
}

- (NSData)terminalTypeData
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)ignoreRFTechOnIsEqual
{
  return self->_ignoreRFTechOnIsEqual;
}

- (void)setIgnoreRFTechOnIsEqual:(BOOL)a3
{
  self->_ignoreRFTechOnIsEqual = a3;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_terminalTypeData, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitSchemeDataPayload, 0);
  objc_storeStrong((id *)&self->_openLoopSchemeBitfield, 0);
  objc_storeStrong((id *)&self->_tciArray, 0);
}

@end
