@implementation ATAudioTapDescription

- (id)initBaseTapInternalWithFormat:(id)a3
{
  id v5;
  ATAudioTapDescription *v6;
  ATAudioTapDescription *v7;
  NSArray *processIdentifiers;
  NSArray *v9;
  uint64_t v10;
  NSUUID *UUID;
  uint64_t v12;
  NSString *name;
  NSString *sceneIdentifier;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATAudioTapDescription;
  v6 = -[ATAudioTapDescription init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    processIdentifiers = v6->_processIdentifiers;
    v9 = (NSArray *)MEMORY[0x1E0C9AA60];
    v6->_tapType = 0;
    v6->_processIdentifiers = v9;

    objc_storeStrong((id *)&v7->_format, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    UUID = v7->_UUID;
    v7->_UUID = (NSUUID *)v10;

    -[NSUUID UUIDString](v7->_UUID, "UUIDString");
    v12 = objc_claimAutoreleasedReturnValue();
    name = v7->_name;
    v7->_name = (NSString *)v12;

    v7->_audioSessionID = 0;
    v7->_sessionType = 0;
    sceneIdentifier = v7->_sceneIdentifier;
    v7->_sceneIdentifier = 0;

    v7->_preSpatial = 0;
  }

  return v7;
}

- (BOOL)setProcessIdentifiersChecked:(id)a3
{
  NSArray *v4;
  char v5;
  void *v6;
  int64_t v7;
  NSArray *v8;
  NSArray *processIdentifiers;

  v4 = (NSArray *)a3;
  v5 = ValidatePIDs(v4);
  if ((v5 & 1) != 0)
  {
    -[NSArray firstObject](v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue") == -1;

    self->_tapType = v7;
    v8 = (NSArray *)-[NSArray copy](v4, "copy");
    processIdentifiers = self->_processIdentifiers;
    self->_processIdentifiers = v8;

  }
  return v5;
}

- (id)initTapInternalWithFormat:(id)a3 PIDs:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[ATAudioTapDescription initBaseTapInternalWithFormat:](self, "initBaseTapInternalWithFormat:", v6);
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "setProcessIdentifiersChecked:", v7) & 1) == 0)
  {

    v9 = 0;
  }

  return v9;
}

- (id)initProcessTapWithFormat:(id)a3 PID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[2];

  v4 = *(_QWORD *)&a4;
  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ATAudioTapDescription initTapInternalWithFormat:PIDs:](self, "initTapInternalWithFormat:PIDs:", v6, v8);

  return v9;
}

- (id)initSystemTapWithFormat:(id)a3
{
  _QWORD *v3;
  void *v4;
  void *v5;

  v3 = -[ATAudioTapDescription initBaseTapInternalWithFormat:](self, "initBaseTapInternalWithFormat:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)v3[4];
    v3[3] = 1;
    v3[4] = &unk_1E4527980;

  }
  return v4;
}

- (id)initSystemTapWithFormat:(id)a3 excludePIDs:(id)a4
{
  id v7;
  id *v8;
  id *v9;

  v7 = a4;
  v8 = -[ATAudioTapDescription initSystemTapWithFormat:](self, "initSystemTapWithFormat:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong(v8 + 5, a4);

  return v9;
}

- (id)initPreSpatialTapInternalWithFormat:(id)a3 PIDs:(id)a4 sessionID:(unsigned int)a5 sessionType:(unsigned int)a6 sceneID:(id)a7
{
  id v12;
  NSArray *v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (NSArray *)a4;
  v14 = a7;
  v15 = -[ATAudioTapDescription initBaseTapInternalWithFormat:](self, "initBaseTapInternalWithFormat:", v12);
  if (v15)
  {
    if (v13)
    {
      if (ValidatePIDs(v13))
      {
        -[NSArray firstObject](v13, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "intValue");

        if (v17 != -1)
        {
          v18 = -[NSArray copy](v13, "copy");
          v19 = (void *)*((_QWORD *)v15 + 4);
          *((_QWORD *)v15 + 4) = v18;

          v20 = 0;
LABEL_20:
          *((_QWORD *)v15 + 3) = v20;
          *((_DWORD *)v15 + 3) = a5;
          *((_DWORD *)v15 + 4) = a6;
          objc_storeStrong((id *)v15 + 9, a7);
          *((_BYTE *)v15 + 8) = 1;
          goto LABEL_23;
        }
        gATAudioTapLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v23 = 136315394;
          v24 = "ATAudioTap.mm";
          v25 = 1024;
          v26 = 137;
          _os_log_impl(&dword_1A0F4D000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d Pre-spatial sytstem tap is not supported", (uint8_t *)&v23, 0x12u);
        }

LABEL_22:
        v15 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      if (!(a6 | a5) && v14)
      {
        v20 = 3;
        goto LABEL_20;
      }
      if (a5 - 1 <= 0xFFFFFFFD && !a6 && !v14)
      {
        v20 = 2;
        goto LABEL_20;
      }
      if (!a5 && a6 && !v14)
      {
        v20 = 4;
        goto LABEL_20;
      }
    }

    goto LABEL_22;
  }
LABEL_23:

  return v15;
}

- (id)initPreSpatialProcessTapWithFormat:(id)a3 PID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[2];

  v4 = *(_QWORD *)&a4;
  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ATAudioTapDescription initPreSpatialTapInternalWithFormat:PIDs:sessionID:sessionType:sceneID:](self, "initPreSpatialTapInternalWithFormat:PIDs:sessionID:sessionType:sceneID:", v6, v8, 0, 0, 0);

  return v9;
}

- (id)initPreSpatialProcessTapWithFormat:(id)a3 PIDs:(id)a4
{
  return -[ATAudioTapDescription initPreSpatialTapInternalWithFormat:PIDs:sessionID:sessionType:sceneID:](self, "initPreSpatialTapInternalWithFormat:PIDs:sessionID:sessionType:sceneID:", a3, a4, 0, 0, 0);
}

- (id)initPreSpatialAudioSessionTapWithFormat:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  ATAudioTapDescription *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if ((v4 - 1) > 0xFFFFFFFD)
  {
    v7 = 0;
  }
  else
  {
    self = (ATAudioTapDescription *)-[ATAudioTapDescription initPreSpatialTapInternalWithFormat:PIDs:sessionID:sessionType:sceneID:](self, "initPreSpatialTapInternalWithFormat:PIDs:sessionID:sessionType:sceneID:", v6, 0, v4, 0, 0);
    v7 = self;
  }

  return v7;
}

- (id)initPreSpatialSessionTypeTapWithFormat:(id)a3 sessionType:(unsigned int)a4
{
  id v6;
  ATAudioTapDescription *v7;

  v6 = a3;
  if (a4 == 1)
  {
    self = (ATAudioTapDescription *)-[ATAudioTapDescription initPreSpatialTapInternalWithFormat:PIDs:sessionID:sessionType:sceneID:](self, "initPreSpatialTapInternalWithFormat:PIDs:sessionID:sessionType:sceneID:", v6, 0, 0, 1, 0);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)initPreSpatialSceneIdentifierTapWithFormat:(id)a3 sceneIdentifier:(id)a4
{
  return -[ATAudioTapDescription initPreSpatialTapInternalWithFormat:PIDs:sessionID:sessionType:sceneID:](self, "initPreSpatialTapInternalWithFormat:PIDs:sessionID:sessionType:sceneID:", a3, 0, 0, 0, a4);
}

- (id)initScreenSharingTapWithFormat:(id)a3
{
  id result;

  result = -[ATAudioTapDescription initBaseTapInternalWithFormat:](self, "initBaseTapInternalWithFormat:", a3);
  if (result)
  {
    *((_QWORD *)result + 3) = 5;
    *((_BYTE *)result + 8) = 0;
  }
  return result;
}

- (int)processIdentifier
{
  void *v3;
  int v4;

  if (!-[NSArray count](self->_processIdentifiers, "count"))
    return 0;
  -[NSArray firstObject](self->_processIdentifiers, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setProcessIdentifier:(int)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATAudioTapDescription setProcessIdentifiers:](self, "setProcessIdentifiers:", v5);

}

- (void)setProcessIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[ATAudioTapDescription setProcessIdentifiersChecked:](self, "setProcessIdentifiersChecked:", v4))
  {
    gATAudioTapLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315650;
      v7 = "ATAudioTap.mm";
      v8 = 1024;
      v9 = 272;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Error setting processIdentifiers: %@", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", LODWORD(self->_tapType), CFSTR("tapType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_processIdentifiers, CFSTR("processIdentifiers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_excludedPIDs, CFSTR("excludedPIDs"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_UUID, CFSTR("UUID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_format, CFSTR("format"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_audioSessionID, CFSTR("audioSessionID"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_sessionType, CFSTR("sessionType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_preSpatial, CFSTR("preSpatial"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sceneIdentifier, CFSTR("sceneIdentifier"));

}

- (ATAudioTapDescription)initWithCoder:(id)a3
{
  id v4;
  ATAudioTapDescription *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *processIdentifiers;
  uint64_t v11;
  NSArray *excludedPIDs;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  NSUUID *UUID;
  void *v17;
  id v18;
  uint64_t v19;
  AVAudioFormat *format;
  uint64_t v21;
  NSString *sceneIdentifier;
  objc_super v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ATAudioTapDescription;
  v5 = -[ATAudioTapDescription init](&v24, sel_init);
  if (v5)
  {
    v5->_tapType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("tapType"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("processIdentifiers"));
    v9 = objc_claimAutoreleasedReturnValue();
    processIdentifiers = v5->_processIdentifiers;
    v5->_processIdentifiers = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("excludedPIDs"));
    v11 = objc_claimAutoreleasedReturnValue();
    excludedPIDs = v5->_excludedPIDs;
    v5->_excludedPIDs = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v13 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v15 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v15;

    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v17 = (void *)getAVAudioFormatClass(void)::softClass;
    v29 = getAVAudioFormatClass(void)::softClass;
    if (!getAVAudioFormatClass(void)::softClass)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = ___ZL21getAVAudioFormatClassv_block_invoke_9581;
      v25[3] = &unk_1E4519C48;
      v25[4] = &v26;
      ___ZL21getAVAudioFormatClassv_block_invoke_9581((uint64_t)v25);
      v17 = (void *)v27[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v26, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("format"));
    v19 = objc_claimAutoreleasedReturnValue();
    format = v5->_format;
    v5->_format = (AVAudioFormat *)v19;

    v5->_audioSessionID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("audioSessionID"));
    v5->_sessionType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("sessionType"));
    v5->_preSpatial = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preSpatial"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneIdentifier"));
    v21 = objc_claimAutoreleasedReturnValue();
    sceneIdentifier = v5->_sceneIdentifier;
    v5->_sceneIdentifier = (NSString *)v21;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  ATAudioTapDescription *v4;
  ATAudioTapDescription *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  _BOOL4 v18;
  char v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;

  v4 = (ATAudioTapDescription *)a3;
  if (v4 == self)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x1E0C99E60];
      -[ATAudioTapDescription processIdentifiers](v5, "processIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWithArray:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0C99E60];
      -[ATAudioTapDescription processIdentifiers](self, "processIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[ATAudioTapDescription tapType](v5, "tapType");
      if (v12 == -[ATAudioTapDescription tapType](self, "tapType") && objc_msgSend(v8, "isEqual:", v11))
      {
        -[ATAudioTapDescription name](v5, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATAudioTapDescription name](self, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:", v14))
        {
LABEL_13:
          v19 = 0;
LABEL_14:

LABEL_19:
          goto LABEL_20;
        }
        -[ATAudioTapDescription UUID](v5, "UUID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATAudioTapDescription UUID](self, "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v35, "isEqual:", v15))
        {
LABEL_12:

          goto LABEL_13;
        }
        -[ATAudioTapDescription format](v5, "format");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATAudioTapDescription format](self, "format");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v34, "isEqual:")
          || (v16 = -[ATAudioTapDescription audioSessionID](v5, "audioSessionID"),
              v16 != -[ATAudioTapDescription audioSessionID](self, "audioSessionID"))
          || (v17 = -[ATAudioTapDescription sessionType](v5, "sessionType"),
              v17 != -[ATAudioTapDescription sessionType](self, "sessionType"))
          || (v18 = -[ATAudioTapDescription isPreSpatial](v5, "isPreSpatial"),
              v18 != -[ATAudioTapDescription isPreSpatial](self, "isPreSpatial")))
        {

          goto LABEL_12;
        }
        -[ATAudioTapDescription sceneIdentifier](v5, "sceneIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATAudioTapDescription sceneIdentifier](self, "sceneIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (v20 != 0) ^ (v21 != 0);

        if ((v32 & 1) == 0)
        {
          -[ATAudioTapDescription sceneIdentifier](v5, "sceneIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23)
            goto LABEL_24;
          -[ATAudioTapDescription sceneIdentifier](self, "sceneIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24
            || (-[ATAudioTapDescription sceneIdentifier](v5, "sceneIdentifier"),
                v25 = (void *)objc_claimAutoreleasedReturnValue(),
                -[ATAudioTapDescription sceneIdentifier](self, "sceneIdentifier"),
                v26 = (void *)objc_claimAutoreleasedReturnValue(),
                v27 = objc_msgSend(v25, "isEqual:", v26),
                v26,
                v25,
                (v27 & 1) != 0))
          {
LABEL_24:
            v28 = (void *)MEMORY[0x1E0C99E60];
            -[ATAudioTapDescription excludedPIDs](v5, "excludedPIDs");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setWithArray:", v29);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v30 = (void *)MEMORY[0x1E0C99E60];
            -[ATAudioTapDescription excludedPIDs](self, "excludedPIDs");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setWithArray:", v31);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = objc_msgSend(v13, "isEqual:", v14);
            goto LABEL_14;
          }
        }
      }
      v19 = 0;
      goto LABEL_19;
    }
    v19 = 0;
  }
LABEL_20:

  return v19;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  uint64_t v23;

  switch(-[ATAudioTapDescription tapType](self, "tapType"))
  {
    case 1:
      v3 = (void *)MEMORY[0x1E0CB3940];
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription UUID](self, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription format](self, "format");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription excludedPIDs](self, "excludedPIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@@%p: system tap - name:%@, UUID:%@, format:%@, excluded pids:%@>"), v5, self, v6, v7, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[ATAudioTapDescription audioSessionID](self, "audioSessionID");
      -[ATAudioTapDescription name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription UUID](self, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription format](self, "format");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription excludedPIDs](self, "excludedPIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@@%p: audio session tap - sessionID:0x%x name:%@, UUID:%@, format:%@, excluded pids:%@>"), v5, self, v17, v6, v7, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      v18 = (void *)MEMORY[0x1E0CB3940];
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription sceneIdentifier](self, "sceneIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription UUID](self, "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription format](self, "format");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription excludedPIDs](self, "excludedPIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@@%p: scene identifier tap - sceneID:%@, name:%@, UUID:%@, format:%@, excluded pids:%@>"), v5, self, v6, v7, v8, v9, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 4:
      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[ATAudioTapDescription sessionType](self, "sessionType");
      -[ATAudioTapDescription name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription UUID](self, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription format](self, "format");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription excludedPIDs](self, "excludedPIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@@%p: session type tap - session type:%u, name:%@, UUID:%@, format:%@, excluded pids:%@>"), v5, self, v23, v6, v7, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v20 = (void *)v10;
      break;
    default:
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription processIdentifiers](self, "processIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription UUID](self, "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription format](self, "format");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTapDescription excludedPIDs](self, "excludedPIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@@%p: process tap - pids:%@, name:%@, UUID:%@, format:%@, excluded pids:%@>"), v5, self, v6, v7, v8, v9, v13);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v20 = (void *)v14;

      break;
  }

  return v20;
}

- (int64_t)tapType
{
  return self->_tapType;
}

- (NSArray)processIdentifiers
{
  return self->_processIdentifiers;
}

- (NSArray)excludedPIDs
{
  return self->_excludedPIDs;
}

- (void)setExcludedPIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (BOOL)isPreSpatial
{
  return self->_preSpatial;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (unsigned)sessionType
{
  return self->_sessionType;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_excludedPIDs, 0);
  objc_storeStrong((id *)&self->_processIdentifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
