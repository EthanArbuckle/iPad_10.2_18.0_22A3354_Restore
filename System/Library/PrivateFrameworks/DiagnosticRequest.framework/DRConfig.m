@implementation DRConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[DRConfig build](self, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("build"));

  -[DRConfig teamID](self, "teamID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("teamID"));

  -[DRConfig configDescription](self, "configDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("configDescription"));

  -[DRConfig configUUID](self, "configUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("configUUID"));

  -[DRConfig payload](self, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("payload"));

  objc_msgSend(v4, "encodeBool:forKey:", -[DRConfig payloadIsJSON](self, "payloadIsJSON"), CFSTR("payloadIsJSON"));
  objc_msgSend(v4, "encodeBool:forKey:", -[DRConfig skippedHysteresis](self, "skippedHysteresis"), CFSTR("skipHysteresis"));
  -[DRConfig receivedDate](self, "receivedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("receivedDate"));

  -[DRConfig startDate](self, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("startDate"));

  -[DRConfig endDate](self, "endDate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("endDate"));

}

- (DRConfig)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  DRConfig *v13;
  uint64_t v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("build"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("teamID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("payloadIsJSON"));
  v9 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("skipHysteresis"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("receivedDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE1(v15) = v9;
  LOBYTE(v15) = v8;
  v13 = -[DRConfig initWithBuild:teamID:configDescription:configUUID:receivedDate:startDate:endDate:payload:payloadIsJSON:skipHysteresis:](self, "initWithBuild:teamID:configDescription:configUUID:receivedDate:startDate:endDate:payload:payloadIsJSON:skipHysteresis:", v16, v4, v5, v6, v10, v11, v12, v7, v15);

  return v13;
}

- (DRConfig)initWithBuild:(id)a3 teamID:(id)a4 configDescription:(id)a5 configUUID:(id)a6 receivedDate:(id)a7 startDate:(id)a8 endDate:(id)a9 payload:(id)a10 payloadIsJSON:(BOOL)a11 skipHysteresis:(BOOL)a12
{
  id v19;
  id v20;
  NSObject *v21;
  DRConfig *v22;
  DRConfig *v24;
  void *v25;
  void *v26;
  NSDictionary *v27;
  NSDictionary *payloadDictionaryRepresentation;
  void *v29;
  NSObject *v30;
  const __CFString *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;
  uint8_t buf[4];
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v37 = a4;
  v36 = a5;
  v35 = a6;
  v20 = a7;
  v34 = a8;
  v33 = a9;
  v32 = a10;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!_argIsNonNil((uint64_t)v19, (uint64_t)"build")
    || !_argIsNonNil((uint64_t)v37, (uint64_t)"teamID")
    || !_argIsNonNil((uint64_t)v36, (uint64_t)"configDescription")
    || !_argIsNonNil((uint64_t)v35, (uint64_t)"configUUID")
    || !_argIsNonNil((uint64_t)v34, (uint64_t)"startDate")
    || !_argIsNonNil((uint64_t)v33, (uint64_t)"endDate")
    || !_argIsNonNil((uint64_t)v32, (uint64_t)"payload"))
  {
    goto LABEL_14;
  }
  if (objc_msgSend(v34, "compare:", v33) == -1)
  {
    v39.receiver = self;
    v39.super_class = (Class)DRConfig;
    v24 = -[DRConfig init](&v39, sel_init);
    self = v24;
    if (v24)
    {
      objc_storeStrong((id *)&v24->_build, a3);
      objc_storeStrong((id *)&self->_teamID, a4);
      objc_storeStrong((id *)&self->_configDescription, a5);
      objc_storeStrong((id *)&self->_configUUID, a6);
      objc_storeStrong((id *)&self->_receivedDate, v20);
      objc_storeStrong((id *)&self->_startDate, a8);
      objc_storeStrong((id *)&self->_endDate, a9);
      objc_storeStrong((id *)&self->_payload, a10);
      self->_payloadIsJSON = a11;
      self->_skippedHysteresis = a12;
      if (-[DRConfig payloadIsJSON](self, "payloadIsJSON"))
      {
        v25 = (void *)MEMORY[0x1E0CB36D8];
        -[DRConfig payload](self, "payload");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        objc_msgSend(v25, "JSONObjectWithData:options:error:", v26, 0, &v38);
        v27 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        v21 = v38;
        payloadDictionaryRepresentation = self->_payloadDictionaryRepresentation;
        self->_payloadDictionaryRepresentation = v27;

        -[DRConfig payloadDictionaryRepresentation](self, "payloadDictionaryRepresentation");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
          DPLogHandle_TaskingManagerError();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v30))
          {
            v31 = CFSTR("Unknown");
            if (v21)
              v31 = (const __CFString *)v21;
            *(_DWORD *)buf = 138543362;
            v41 = v31;
            _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidJSONPayload", "Payload was marked as valid JSON, but could not be processed due to error: %{public}@", buf, 0xCu);
          }

          goto LABEL_13;
        }

      }
    }
    self = self;
    v22 = self;
    goto LABEL_15;
  }
  DPLogHandle_TaskingMessageError();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRConfigInitError", "Start date >= end date", buf, 2u);
  }
LABEL_13:

LABEL_14:
  v22 = 0;
LABEL_15:

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[DRConfig isEqualToConfig:](self, "isEqualToConfig:", v4);

  return v5;
}

- (BOOL)isEqualToConfig:(id)a3
{
  DRConfig *v4;
  DRConfig *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  _BOOL4 v21;
  _BOOL4 v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  BOOL v35;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;

  v4 = (DRConfig *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v35 = 1;
  }
  else
  {
    if (!v4)
      goto LABEL_12;
    -[DRConfig build](self, "build");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRConfig build](v5, "build");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (!v8)
      goto LABEL_12;
    -[DRConfig teamID](self, "teamID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRConfig teamID](v5, "teamID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (!v11)
      goto LABEL_12;
    -[DRConfig configDescription](self, "configDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRConfig configDescription](v5, "configDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if (!v14)
      goto LABEL_12;
    -[DRConfig configUUID](self, "configUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRConfig configUUID](v5, "configUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_12;
    -[DRConfig payload](self, "payload");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRConfig payload](v5, "payload");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (!v20)
      goto LABEL_12;
    v21 = -[DRConfig payloadIsJSON](self, "payloadIsJSON");
    if (v21 != -[DRConfig payloadIsJSON](v5, "payloadIsJSON"))
      goto LABEL_12;
    v22 = -[DRConfig skippedHysteresis](self, "skippedHysteresis");
    if (v22 != -[DRConfig skippedHysteresis](v5, "skippedHysteresis"))
      goto LABEL_12;
    -[DRConfig receivedDate](self, "receivedDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSince1970");
    v25 = v24;
    -[DRConfig receivedDate](v5, "receivedDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "timeIntervalSince1970");
    v28 = v27;

    if (v25 != v28)
      goto LABEL_12;
    -[DRConfig startDate](self, "startDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "timeIntervalSince1970");
    v31 = v30;
    -[DRConfig startDate](v5, "startDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "timeIntervalSince1970");
    v34 = v33;

    if (v31 == v34)
    {
      -[DRConfig endDate](self, "endDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "timeIntervalSince1970");
      v39 = v38;
      -[DRConfig endDate](v5, "endDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "timeIntervalSince1970");
      v35 = v39 == v41;

    }
    else
    {
LABEL_12:
      v35 = 0;
    }
  }

  return v35;
}

- (DRConfig)initWithJSONDict:(id)a3 receivedDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  DRConfig *v22;
  NSObject *v23;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t v32[16];
  uint8_t v33[16];
  uint8_t v34[16];
  uint8_t v35[16];
  uint8_t buf[16];
  uint8_t v37[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("build"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      DPLogHandle_TaskingMessageError();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRConfigJSONInitError", "Invalid build", buf, 2u);
      }
      v22 = 0;
      goto LABEL_41;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("teamID"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      DPLogHandle_TaskingMessageError();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)v35 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRConfigJSONInitError", "Invalid teamID", v35, 2u);
      }
      v22 = 0;
      goto LABEL_40;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("configDescription"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      DPLogHandle_TaskingMessageError();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)v34 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRConfigJSONInitError", "Invalid configDescription", v34, 2u);
      }
      v22 = 0;
      goto LABEL_39;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("configUUID"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("base64EncodedPayload"));
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("payloadIsJSON"));
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x1E0C9AAA0];
          if (v13)
            v15 = (void *)v13;
          else
            v15 = (void *)MEMORY[0x1E0C9AAA0];
          v31 = v15;
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("skipHysteresis"));
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
            v14 = (void *)v16;
          _dateFromJSONDict(v6, (uint64_t)CFSTR("startDate"));
          v17 = objc_claimAutoreleasedReturnValue();
          _dateFromJSONDict(v6, (uint64_t)CFSTR("endDate"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          _dateFromJSONDict(v6, (uint64_t)CFSTR("receivedDate"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v14;
          v26 = v18;
          v27 = (void *)v17;
          if (v18)
          {
            v19 = v18;

            v7 = v19;
          }
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v12, 0);
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v11);
          v21 = objc_msgSend(v31, "BOOLValue");
          BYTE1(v25) = objc_msgSend(v30, "BOOLValue");
          LOBYTE(v25) = v21;
          self = -[DRConfig initWithBuild:teamID:configDescription:configUUID:receivedDate:startDate:endDate:payload:payloadIsJSON:skipHysteresis:](self, "initWithBuild:teamID:configDescription:configUUID:receivedDate:startDate:endDate:payload:payloadIsJSON:skipHysteresis:", v8, v9, v10, v20, v7, v27, v29, v28, v25);

          v22 = self;
          goto LABEL_38;
        }
      }
      DPLogHandle_TaskingMessageError();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v23))
      {
        *(_WORD *)v32 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRConfigJSONInitError", "Invalid base64PayloadString", v32, 2u);
      }

    }
    else
    {
      DPLogHandle_TaskingMessageError();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)v33 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRConfigJSONInitError", "Invalid configUUIDString", v33, 2u);
      }
    }
    v22 = 0;
LABEL_38:

LABEL_39:
LABEL_40:

LABEL_41:
    goto LABEL_42;
  }
  DPLogHandle_TaskingMessageError();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)v37 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRConfigJSONInitError", "nil JSON dict", v37, 2u);
  }
  v22 = 0;
LABEL_42:

  return v22;
}

- (id)jsonDictRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[10];
  _QWORD v24[12];

  v24[10] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("build");
  -[DRConfig build](self, "build");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v23[1] = CFSTR("teamID");
  -[DRConfig teamID](self, "teamID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  v23[2] = CFSTR("configDescription");
  -[DRConfig configDescription](self, "configDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v20;
  v23[3] = CFSTR("configUUID");
  -[DRConfig configUUID](self, "configUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v18;
  v23[4] = CFSTR("receivedDate");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[DRConfig receivedDate](self, "receivedDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSince1970");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v4;
  v23[5] = CFSTR("startDate");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[DRConfig startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v7;
  v23[6] = CFSTR("endDate");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[DRConfig endDate](self, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v10;
  v23[7] = CFSTR("base64EncodedPayload");
  -[DRConfig payload](self, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v12;
  v23[8] = CFSTR("payloadIsJSON");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DRConfig payloadIsJSON](self, "payloadIsJSON"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v13;
  v23[9] = CFSTR("skipHysteresis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DRConfig skippedHysteresis](self, "skippedHysteresis"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_storeStrong((id *)&self->_build, a3);
}

- (NSString)configDescription
{
  return self->_configDescription;
}

- (NSUUID)configUUID
{
  return self->_configUUID;
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSDictionary)payloadDictionaryRepresentation
{
  return self->_payloadDictionaryRepresentation;
}

- (BOOL)skippedHysteresis
{
  return self->_skippedHysteresis;
}

- (BOOL)payloadIsJSON
{
  return self->_payloadIsJSON;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_receivedDate, 0);
  objc_storeStrong((id *)&self->_configUUID, 0);
  objc_storeStrong((id *)&self->_configDescription, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
}

@end
