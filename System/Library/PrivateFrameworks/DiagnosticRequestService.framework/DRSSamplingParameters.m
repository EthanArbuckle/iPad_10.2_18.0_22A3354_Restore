@implementation DRSSamplingParameters

- (DRSSamplingParameters)initWithSamplingPercentage:(double)a3
{
  DRSSamplingParameters *v4;
  NSObject *v5;
  const char *v6;
  DRSSamplingParameters *v7;
  DRSSamplingParameters *v8;
  objc_super v10;
  uint8_t buf[4];
  double v12;
  uint64_t v13;

  v4 = self;
  v13 = *MEMORY[0x1E0C80C00];
  if (a3 < 0.0)
  {
    DPLogHandle_TaskingMessageError();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134217984;
      v12 = a3;
      v6 = "Invalid sampling < 0%% (%f)";
LABEL_7:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SamplingParameterFailedInit", v6, buf, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (a3 > 100.0)
  {
    DPLogHandle_TaskingMessageError();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134217984;
      v12 = a3;
      v6 = "Invalid sampling > 100%% (%f)";
      goto LABEL_7;
    }
LABEL_8:

    v7 = 0;
    goto LABEL_12;
  }
  v10.receiver = self;
  v10.super_class = (Class)DRSSamplingParameters;
  v8 = -[DRSSamplingParameters init](&v10, sel_init);
  if (v8)
    v8->_samplingPercentage = a3;
  v4 = v8;
  v7 = v4;
LABEL_12:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[DRSSamplingParameters isEqualToSamplingParameters:](self, "isEqualToSamplingParameters:", v4);

  return v5;
}

- (BOOL)isEqualToSamplingParameters:(id)a3
{
  DRSSamplingParameters *v4;
  DRSSamplingParameters *v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;

  v4 = (DRSSamplingParameters *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4)
  {
    -[DRSSamplingParameters samplingPercentage](v4, "samplingPercentage");
    v7 = v6;
    -[DRSSamplingParameters samplingPercentage](self, "samplingPercentage");
    v9 = v7 == v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (DRSSamplingParameters)initWithJSONDict:(id)a3
{
  NSObject *v4;
  DRSSamplingParameters *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v10;
  __int16 v11;
  uint8_t buf[16];

  if (!a3)
  {
    DPLogHandle_TaskingMessageError();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SamplingParameterFailedJSONInit", "nil JSON dict", buf, 2u);
    }
    goto LABEL_13;
  }
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("samplingPercentage"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    DPLogHandle_TaskingMessageError();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      v11 = 0;
      v7 = "JSON missing sampling percentage";
      v8 = (uint8_t *)&v11;
LABEL_11:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SamplingParameterFailedJSONInit", v7, v8, 2u);
    }
LABEL_12:

LABEL_13:
    v5 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    DPLogHandle_TaskingMessageError();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      v10 = 0;
      v7 = "Sampling percentage is wrong class";
      v8 = (uint8_t *)&v10;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  -[NSObject doubleValue](v4, "doubleValue");
  self = -[DRSSamplingParameters initWithSamplingPercentage:](self, "initWithSamplingPercentage:");
  v5 = self;
LABEL_14:

  return v5;
}

- (id)jsonDictRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("samplingPercentage");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[DRSSamplingParameters samplingPercentage](self, "samplingPercentage");
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescription
{
  void *v2;
  void *v3;

  -[DRSSamplingParameters jsonDictRepresentation](self, "jsonDictRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)samplingPercentage
{
  return self->_samplingPercentage;
}

@end
