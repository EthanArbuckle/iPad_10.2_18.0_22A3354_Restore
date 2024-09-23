@implementation DRSTeamTasking

- (DRSTeamTasking)initWithTeamID:(id)a3 config:(id)a4 defaultSamplingParameters:(id)a5 perTimezoneSamplingParameters:(id)a6 perHardwareModelSamplingParamters:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  NSObject *v21;
  const char *v22;
  DRSTeamTasking *v23;
  NSObject *v24;
  void *v25;
  DRSTeamTasking *v26;
  DRSTeamTasking *v28;
  id *p_isa;
  id v30;
  id v31;
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (!v12)
  {
    DPLogHandle_TaskingMessageError();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      v22 = "nil teamID";
      goto LABEL_13;
    }
LABEL_14:

    v23 = 0;
LABEL_18:
    v26 = self;
    goto LABEL_19;
  }
  if (!v13)
  {
    DPLogHandle_TaskingMessageError();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      v22 = "nil config";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v30 = v15;
  v31 = v16;
  v18 = v14;
  objc_msgSend(v13, "teamID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", v12);

  if ((v20 & 1) == 0)
  {
    DPLogHandle_TaskingMessageError();
    v24 = objc_claimAutoreleasedReturnValue();
    v17 = v31;
    if (os_signpost_enabled(v24))
    {
      objc_msgSend(v13, "teamID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v25;
      v36 = 2114;
      v37 = v12;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSTeamTasking", "Config team ID (%{public}@) does not match TeamTasking team ID (%{public}@)", buf, 0x16u);

    }
    v23 = 0;
    v14 = v18;
    v15 = v30;
    goto LABEL_18;
  }
  v14 = v18;
  v15 = v30;
  v17 = v31;
  if (!v14 && !v30 && !v31)
  {
    DPLogHandle_TaskingMessageError();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      v22 = "nil defaultSamplingParameters AND perTimezoneSamplingParameters AND perHWModelSamplingParameters";
LABEL_13:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSTeamTasking", v22, buf, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (v30 && v31)
  {
    DPLogHandle_TaskingMessageError();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v21))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v22 = "Nonnull perTimezoneSamplingParameters AND perHWModelSamplingParameters";
    goto LABEL_13;
  }
  v33.receiver = self;
  v33.super_class = (Class)DRSTeamTasking;
  v28 = -[DRSTeamTasking init](&v33, sel_init);
  p_isa = (id *)&v28->super.isa;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_teamID, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
  }
  v26 = p_isa;
  v23 = v26;
  v17 = v31;
LABEL_19:

  return v23;
}

- (id)samplingParametersForTimezoneAbbreviation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DRSTeamTasking perTimezoneSamplingParameters](self, "perTimezoneSamplingParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[DRSTeamTasking defaultSamplingParameters](self, "defaultSamplingParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)samplingParametersForHardwareModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DRSTeamTasking perHWModelSamplingParameters](self, "perHWModelSamplingParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[DRSTeamTasking defaultSamplingParameters](self, "defaultSamplingParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)samplingParametersForHWModel:(id)a3 timezoneAbbreviation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[DRSTeamTasking perTimezoneSamplingParameters](self, "perTimezoneSamplingParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[DRSTeamTasking samplingParametersForTimezoneAbbreviation:](self, "samplingParametersForTimezoneAbbreviation:", v7);
  else
    -[DRSTeamTasking samplingParametersForHardwareModel:](self, "samplingParametersForHardwareModel:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[DRSTeamTasking isEqualToTeamTasking:](self, "isEqualToTeamTasking:", v4);

  return v5;
}

- (BOOL)isEqualToTeamTasking:(id)a3
{
  DRSTeamTasking *v4;
  DRSTeamTasking *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char IsNil;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  char v30;
  char v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;

  v4 = (DRSTeamTasking *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 != self)
    {
      -[DRSTeamTasking teamID](self, "teamID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSTeamTasking teamID](v5, "teamID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (!v8)
        goto LABEL_12;
      -[DRSTeamTasking config](self, "config");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSTeamTasking config](v5, "config");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToConfig:", v10);

      if (!v11)
        goto LABEL_12;
      -[DRSTeamTasking defaultSamplingParameters](self, "defaultSamplingParameters");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSTeamTasking defaultSamplingParameters](v5, "defaultSamplingParameters");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      IsNil = _oneIsNil((uint64_t)v12, (uint64_t)v13);

      if ((IsNil & 1) != 0)
        goto LABEL_12;
      -[DRSTeamTasking defaultSamplingParameters](self, "defaultSamplingParameters");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        -[DRSTeamTasking defaultSamplingParameters](self, "defaultSamplingParameters");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSTeamTasking defaultSamplingParameters](v5, "defaultSamplingParameters");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqualToSamplingParameters:", v18);

        if (!v19)
          goto LABEL_12;
      }
      -[DRSTeamTasking perTimezoneSamplingParameters](self, "perTimezoneSamplingParameters");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSTeamTasking perTimezoneSamplingParameters](v5, "perTimezoneSamplingParameters");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = _oneIsNil((uint64_t)v20, (uint64_t)v21);

      if ((v22 & 1) != 0)
        goto LABEL_12;
      -[DRSTeamTasking perTimezoneSamplingParameters](self, "perTimezoneSamplingParameters");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;
        -[DRSTeamTasking perTimezoneSamplingParameters](self, "perTimezoneSamplingParameters");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSTeamTasking perTimezoneSamplingParameters](v5, "perTimezoneSamplingParameters");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "isEqualToDictionary:", v26);

        if (!v27)
          goto LABEL_12;
      }
      -[DRSTeamTasking perHWModelSamplingParameters](self, "perHWModelSamplingParameters");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSTeamTasking perHWModelSamplingParameters](v5, "perHWModelSamplingParameters");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = _oneIsNil((uint64_t)v28, (uint64_t)v29);

      if ((v30 & 1) != 0)
        goto LABEL_12;
      -[DRSTeamTasking perHWModelSamplingParameters](self, "perHWModelSamplingParameters");
      v32 = objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        v33 = (void *)v32;
        -[DRSTeamTasking perHWModelSamplingParameters](self, "perHWModelSamplingParameters");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSTeamTasking perHWModelSamplingParameters](v5, "perHWModelSamplingParameters");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v34, "isEqualToDictionary:", v35);

        goto LABEL_16;
      }
    }
    v31 = 1;
    goto LABEL_16;
  }
LABEL_12:
  v31 = 0;
LABEL_16:

  return v31;
}

- (id)_jsonDictRepresentation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[DRSTeamTasking config](self, "config");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jsonDictRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  -[DRSTeamTasking defaultSamplingParameters](self, "defaultSamplingParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DRSTeamTasking defaultSamplingParameters](self, "defaultSamplingParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "jsonDictRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[DRSTeamTasking perTimezoneSamplingParameters](self, "perTimezoneSamplingParameters");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSTeamTasking perTimezoneSamplingParameters](self, "perTimezoneSamplingParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __42__DRSTeamTasking__jsonDictRepresentation___block_invoke;
    v21[3] = &unk_1EA3D2958;
    v8 = v10;
    v22 = v8;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v21);

  }
  -[DRSTeamTasking perHWModelSamplingParameters](self, "perHWModelSamplingParameters");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSTeamTasking perHWModelSamplingParameters](self, "perHWModelSamplingParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __42__DRSTeamTasking__jsonDictRepresentation___block_invoke_2;
    v19[3] = &unk_1EA3D2958;
    v12 = v13;
    v20 = v12;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);

  }
  v23 = CFSTR("teamID");
  -[DRSTeamTasking teamID](self, "teamID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  if (v5)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v5, CFSTR("config"));
  if (v6)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v6, CFSTR("defaultSamplingParameters"));
  if (v8)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v8, CFSTR("perTimezoneSamplingParameters"));
  if (v12)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, CFSTR("perHWModelSamplingParameters"));

  return v17;
}

void __42__DRSTeamTasking__jsonDictRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "jsonDictRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

void __42__DRSTeamTasking__jsonDictRepresentation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "jsonDictRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (id)jsonDictRepresentation
{
  return -[DRSTeamTasking _jsonDictRepresentation:](self, "_jsonDictRepresentation:", 1);
}

- (id)jsonDictRepresentationAbbreviated
{
  return -[DRSTeamTasking _jsonDictRepresentation:](self, "_jsonDictRepresentation:", 0);
}

- (id)debugDescription
{
  void *v2;
  void *v3;

  -[DRSTeamTasking jsonDictRepresentation](self, "jsonDictRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (DRSTeamTasking)initWithJSONDict:(id)a3 receivedDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  DRSSamplingParameters *v12;
  NSObject *v13;
  const char *v14;
  DRSTeamTasking *v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD v27[4];
  id v28;
  uint8_t *v29;
  _QWORD v30[4];
  id v31;
  uint8_t *v32;
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  char v36;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("teamID"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      DPLogHandle_TaskingMessageError();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "Invalid team ID", buf, 2u);
      }
      goto LABEL_13;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("config"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      DPLogHandle_TaskingMessageError();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "Invalid configDict", buf, 2u);
      }

      v15 = 0;
      v10 = v9;
      goto LABEL_45;
    }
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D258]), "initWithJSONDict:receivedDate:", v9, v7);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("defaultSamplingParameters"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        DPLogHandle_TaskingMessageError();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v13))
        {
          *(_WORD *)buf = 0;
          v14 = "Invalid defaultSamplingParametersDict";
          goto LABEL_27;
        }
LABEL_28:

LABEL_13:
        v15 = 0;
LABEL_45:

        goto LABEL_46;
      }
      v12 = -[DRSSamplingParameters initWithJSONDict:]([DRSSamplingParameters alloc], "initWithJSONDict:", v11);
      if (!v12)
      {
        DPLogHandle_TaskingMessageError();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v13))
        {
          *(_WORD *)buf = 0;
          v14 = "Invalid defaultSamplingParameters";
LABEL_27:
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", v14, buf, 2u);
          goto LABEL_28;
        }
        goto LABEL_28;
      }
    }
    else
    {
      v12 = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("perTimezoneSamplingParameters"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        DPLogHandle_TaskingMessageError();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v24))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "Invalid perTimezoneSamplingParametersDict", buf, 2u);
        }

        v19 = 0;
        goto LABEL_43;
      }
      *(_QWORD *)buf = 0;
      v34 = buf;
      v35 = 0x2020000000;
      v36 = 0;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __48__DRSTeamTasking_initWithJSONDict_receivedDate___block_invoke;
      v30[3] = &unk_1EA3D2980;
      v32 = buf;
      v19 = v18;
      v31 = v19;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v30);
      v20 = v34[24];

      _Block_object_dispose(buf, 8);
      if (v20)
      {
LABEL_43:
        v15 = 0;
        goto LABEL_44;
      }
    }
    else
    {
      v19 = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("perHWModelSamplingParameters"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      v17 = 0;
LABEL_38:

      self = -[DRSTeamTasking initWithTeamID:config:defaultSamplingParameters:perTimezoneSamplingParameters:perHardwareModelSamplingParamters:](self, "initWithTeamID:config:defaultSamplingParameters:perTimezoneSamplingParameters:perHardwareModelSamplingParamters:", v8, v10, v12, v19, v17);
      v15 = self;
LABEL_44:

      goto LABEL_45;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      v34 = buf;
      v35 = 0x2020000000;
      v36 = 0;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __48__DRSTeamTasking_initWithJSONDict_receivedDate___block_invoke_50;
      v27[3] = &unk_1EA3D2980;
      v29 = buf;
      v17 = v22;
      v28 = v17;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v27);
      v23 = v34[24];

      _Block_object_dispose(buf, 8);
      if (!v23)
        goto LABEL_38;
    }
    else
    {
      DPLogHandle_TaskingMessageError();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "Invalid perHWModelSamplingParametersDict", buf, 2u);
      }

      v17 = 0;
    }

    goto LABEL_43;
  }
  DPLogHandle_TaskingMessageError();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "nil JSON dict", buf, 2u);
  }
  v15 = 0;
LABEL_46:

  return v15;
}

void __48__DRSTeamTasking_initWithJSONDict_receivedDate___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  DRSSamplingParameters *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = -[DRSSamplingParameters initWithJSONDict:]([DRSSamplingParameters alloc], "initWithJSONDict:", v8);
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);
    }
    else
    {
      DPLogHandle_TaskingMessageError();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "Invalid perTimezoneSamplingParameters value", v12, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }

  }
  else
  {
    DPLogHandle_TaskingMessageError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "Invalid perTimezoneSamplingParametersDict value", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __48__DRSTeamTasking_initWithJSONDict_receivedDate___block_invoke_50(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  DRSSamplingParameters *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = -[DRSSamplingParameters initWithJSONDict:]([DRSSamplingParameters alloc], "initWithJSONDict:", v8);
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);
    }
    else
    {
      DPLogHandle_TaskingMessageError();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "Invalid perHWModelSamplingParametersDict value", v12, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }

  }
  else
  {
    DPLogHandle_TaskingMessageError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamTaskingMessageJSONInit", "Invalid perHWModelSamplingParametersDict value", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (NSString)teamID
{
  return self->_teamID;
}

- (DRConfig)config
{
  return self->_config;
}

- (DRSSamplingParameters)defaultSamplingParameters
{
  return self->_defaultSamplingParameters;
}

- (NSDictionary)perTimezoneSamplingParameters
{
  return self->_perTimezoneSamplingParameters;
}

- (NSDictionary)perHWModelSamplingParameters
{
  return self->_perHWModelSamplingParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perHWModelSamplingParameters, 0);
  objc_storeStrong((id *)&self->_perTimezoneSamplingParameters, 0);
  objc_storeStrong((id *)&self->_defaultSamplingParameters, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
}

@end
