@implementation CLIntersiloServiceMockPayload

- (CLIntersiloServiceMockPayload)initWithExpectation:(id)a3 inputDictionary:(id)a4
{
  id v7;
  id v8;
  CLIntersiloServiceMockPayload *v9;
  CLIntersiloServiceMockPayload *v10;
  uint64_t v11;
  NSDictionary *outputDictionary;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLIntersiloServiceMockPayload;
  v9 = -[CLIntersiloServiceMockPayload init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_expectation, a3);
    objc_storeStrong((id *)&v10->_inputDictionary, a4);
    v11 = objc_opt_new();
    outputDictionary = v10->_outputDictionary;
    v10->_outputDictionary = (NSDictionary *)v11;

  }
  return v10;
}

- (void)setOutput:(id)a3 forKey:(id)a4
{
  -[NSDictionary setObject:forKey:](self->_outputDictionary, "setObject:forKey:", a3, a4);
}

- (void)setInUse:(BOOL)a3
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_inUse)
  {
    sub_1A1A0BAA4();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v7 = 0;
      v8 = 2082;
      v9 = &unk_1A1A18FAF;
      v10 = 2082;
      v11 = "assert";
      v12 = 2081;
      v13 = "!_inUse";
      _os_log_impl(&dword_1A19F4000, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Payloads can't be reused!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A0BAA4();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      *(_DWORD *)buf = 68289539;
      v7 = 0;
      v8 = 2082;
      v9 = &unk_1A1A18FAF;
      v10 = 2082;
      v11 = "assert";
      v12 = 2081;
      v13 = "!_inUse";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Payloads can't be reused!", "{\"msg%{public}.0s\":\"Payloads can't be reused!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A0BAA4();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v7 = 0;
      v8 = 2082;
      v9 = &unk_1A1A18FAF;
      v10 = 2082;
      v11 = "assert";
      v12 = 2081;
      v13 = "!_inUse";
      _os_log_impl(&dword_1A19F4000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Payloads can't be reused!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }
  self->_inUse = a3;
}

- (XCTestExpectation)expectation
{
  return self->_expectation;
}

- (NSDictionary)inputDictionary
{
  return self->_inputDictionary;
}

- (NSDictionary)outputDictionary
{
  return self->_outputDictionary;
}

- (BOOL)inUse
{
  return self->_inUse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDictionary, 0);
  objc_storeStrong((id *)&self->_inputDictionary, 0);
  objc_storeStrong((id *)&self->_expectation, 0);
}

@end
