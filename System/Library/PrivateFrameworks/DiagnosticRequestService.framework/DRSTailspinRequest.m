@implementation DRSTailspinRequest

+ (id)requiredSystemResourceName
{
  return kDRSRequestResourceTailspin;
}

- (id)debugDescription
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _BOOL4 v12;
  const __CFString *v13;
  void *v14;
  objc_super v16;

  -[DRSTailspinRequest minMAT](self, "minMAT");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[DRSTailspinRequest minMAT](self, "minMAT");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("-");
    if (v5)
      v7 = (const __CFString *)v5;
    v8 = (__CFString *)objc_msgSend(v4, "initWithFormat:", CFSTR("MAT[%@, -)"), v7);

  }
  else
  {
    v8 = &stru_1EA3D37D0;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  v16.receiver = self;
  v16.super_class = (Class)DRSTailspinRequest;
  -[DRSRequest debugDescription](&v16, sel_debugDescription);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DRSTailspinRequest includeOsLog](self, "includeOsLog"))
    v11 = CFSTR("OSLog");
  else
    v11 = CFSTR("No OSLog");
  v12 = -[DRSTailspinRequest includeOsSignpost](self, "includeOsSignpost");
  v13 = CFSTR("No OSSignpost");
  if (v12)
    v13 = CFSTR("OSSignpost");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ %@ %@ %@"), v10, v11, v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_configureRequestMO:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DRSTailspinRequest;
  -[DRSRequest _configureRequestMO:](&v7, sel__configureRequestMO_, v4);
  v5 = v4;
  objc_msgSend(v5, "setIncludeOsLog:", -[DRSTailspinRequest includeOsLog](self, "includeOsLog"));
  objc_msgSend(v5, "setIncludeOsSignpost:", -[DRSTailspinRequest includeOsSignpost](self, "includeOsSignpost"));
  -[DRSTailspinRequest minMAT](self, "minMAT");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinMAT:", v6);

}

+ (Class)_moClass
{
  return (Class)objc_opt_class();
}

+ (id)entityName
{
  return CFSTR("DRSTailspinRequestMO");
}

- (unint64_t)expectedType
{
  return 1;
}

- (DRSTailspinRequest)initWithXPCDict:(id)a3
{
  id v4;
  DRSTailspinRequest *v5;
  void *v6;
  uint64_t v7;
  NSNumber *minMAT;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DRSTailspinRequest;
  v5 = -[DRSRequest initWithXPCDict:](&v10, sel_initWithXPCDict_, v4);
  if (v5)
  {
    v5->_includeOsSignpost = xpc_dictionary_get_BOOL(v4, "IncludeOSSignpost");
    v5->_includeOsLog = xpc_dictionary_get_BOOL(v4, "IncludeOSLog");
    xpc_dictionary_get_value(v4, "MinMAT");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v4, "MinMAT"));
      v7 = objc_claimAutoreleasedReturnValue();
      minMAT = v5->_minMAT;
      v5->_minMAT = (NSNumber *)v7;

    }
    v5->_scrubbed = objc_msgSend((id)objc_opt_class(), "_shouldScrub");
  }

  return v5;
}

- (id)_initWithTailspinRequestMO_ON_MOC_QUEUE:(id)a3
{
  id v4;
  _BYTE *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DRSTailspinRequest;
  v5 = -[DRSRequest _initWithRequestMO_ON_MOC_QUEUE:](&v9, sel__initWithRequestMO_ON_MOC_QUEUE_, v4);
  if (v5)
  {
    v5[145] = objc_msgSend(v4, "includeOsLog");
    v5[144] = objc_msgSend(v4, "includeOsSignpost");
    objc_msgSend(v4, "minMAT");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 19);
    *((_QWORD *)v5 + 19) = v6;

    v5[146] = objc_msgSend(v4, "scrubbed");
  }

  return v5;
}

+ (BOOL)_shouldScrub
{
  if (_shouldScrub_onceToken != -1)
    dispatch_once(&_shouldScrub_onceToken, &__block_literal_global_619);
  return (_shouldScrub_shouldScrub & 1) == 0;
}

uint64_t __34__DRSTailspinRequest__shouldScrub__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  _shouldScrub_shouldScrub = result;
  return result;
}

- (id)_tailspinOptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[DRSTailspinRequest minMAT](self, "minMAT");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DRSTailspinRequest minMAT](self, "minMAT");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0DE8AF0]);

  }
  if (-[DRSTailspinRequest includeOsLog](self, "includeOsLog"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DE8AC8]);
  if (-[DRSTailspinRequest includeOsSignpost](self, "includeOsSignpost"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DE8AD0]);
  if (objc_msgSend((id)objc_opt_class(), "_shouldScrub"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DE8B10]);
  if ((objc_msgSend((id)objc_opt_class(), "enforceMinTraceBufferDuration") & 1) == 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1EA3E3980, *MEMORY[0x1E0DE8AF8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DE8AC0]);
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[DRSRequest teamID](self, "teamID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSRequest issueCategory](self, "issueCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSRequest issueDescription](self, "issueDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@/%@: %@"), v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0DE8B08]);

  if (objc_msgSend(v3, "count"))
    v11 = v3;
  else
    v11 = 0;

  return v11;
}

- (BOOL)_dumpTailspinToDirectory:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  int v13;
  id v14;
  char v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  int *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  const char *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  char v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  NSObject *v33;
  __CFString *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  BOOL v38;
  NSObject *v40;
  NSObject *v41;
  __CFString *v42;
  id v43;
  id v44;
  NSObject *v45;
  uint8_t buf[4];
  NSObject *v47;
  __int16 v48;
  const __CFString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = [v4 alloc];
  -[DRSRequest requestID](self, "requestID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("dpTailspin_%@.tailspin"), v8);

  objc_msgSend(v5, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v10);
  v12 = open((const char *)-[NSObject UTF8String](v11, "UTF8String"), 514, 438);
  if (v12 == -1)
  {
    v20 = objc_alloc(MEMORY[0x1E0CB3940]);
    v21 = __error();
    v22 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("Could not open file handle for new tailspin due to error: %s"), strerror(*v21));
    v44 = 0;
    -[DRSRequest updateToState:errorDescription:errorOut:](self, "updateToState:errorDescription:errorOut:", 4352, v22, &v44);
    v14 = v44;

    DPLogHandle_TailspinError();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v16))
    {
LABEL_26:
      v38 = 0;
      goto LABEL_27;
    }
    -[DRSRequest errorDescription](self, "errorDescription");
    v23 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v23;
    v24 = "TailspinCreationFailure";
    v25 = "%{public}@";
    v26 = v16;
    goto LABEL_16;
  }
  v13 = v12;
  -[DRSTailspinRequest _tailspinOptions](self, "_tailspinOptions");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = tailspin_dump_output_with_options_sync();
  close(v13);
  if ((v15 & 1) == 0)
  {
    -[DRSRequest updateToState:errorDescription:errorOut:](self, "updateToState:errorDescription:errorOut:", 4352, CFSTR("Dumping tailspin failed"), 0);
    DPLogHandle_TailspinError();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v27))
    {
      -[DRSRequest errorDescription](self, "errorDescription");
      v28 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v28;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TailspinCreationFailure", "%{public}@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject fileExistsAtPath:](v16, "fileExistsAtPath:", v11))
    {
      v43 = 0;
      v29 = -[NSObject removeItemAtPath:error:](v16, "removeItemAtPath:error:", v11, &v43);
      v23 = v43;
      DPLogHandle_TailspinError();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = os_signpost_enabled(v30);
      if ((v29 & 1) != 0)
      {
        if (v31)
        {
          *(_DWORD *)buf = 138543362;
          v47 = v11;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FailedTailspinCleanup", "Removed failed tailspin file: '%{public}@'", buf, 0xCu);
        }
      }
      else if (v31)
      {
        -[NSObject localizedDescription](v23, "localizedDescription");
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)v35;
        v37 = CFSTR("Unknown");
        if (v35)
          v37 = (const __CFString *)v35;
        *(_DWORD *)buf = 138543618;
        v47 = v11;
        v48 = 2114;
        v49 = v37;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FailedTailspinCleanupFailed", "Failed to remove '%{public}@' due to error: %{public}@", buf, 0x16u);

      }
      goto LABEL_25;
    }
    DPLogHandle_TailspinError();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v23))
    {
LABEL_25:

      goto LABEL_26;
    }
    *(_DWORD *)buf = 138543362;
    v47 = v11;
    v24 = "FailedTailspinCleanupNotNecessary";
    v25 = "Nothing to remove at '%{public}@";
    v26 = v23;
LABEL_16:
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v24, v25, buf, 0xCu);
    goto LABEL_25;
  }
  v16 = -[DRSLog _initWithLogPath:transferOwnership:]([DRSLog alloc], "_initWithLogPath:transferOwnership:", v11, 1);
  if (!v16)
  {
    DPLogHandle_TailspinError();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v32))
    {
      objc_msgSend(0, "path");
      v33 = objc_claimAutoreleasedReturnValue();
      -[DRSRequest requestID](self, "requestID");
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v33;
      v48 = 2114;
      v49 = v34;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TailspinSizeError", "Could not lookup size of %{public, name=path}@ for Request ID: %{public}@", buf, 0x16u);

    }
    goto LABEL_26;
  }
  -[DRSRequest logs](self, "logs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    -[DRSRequest logs](self, "logs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v16);
  }
  else
  {
    v45 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSRequest setLogs:](self, "setLogs:", v19);
  }

  DPLogHandle_Tailspin();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v40))
  {
    -[DRSRequest logPath](self, "logPath");
    v41 = objc_claimAutoreleasedReturnValue();
    -[DRSRequest requestID](self, "requestID");
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v41;
    v48 = 2114;
    v49 = v42;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v40, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TailspinSaved", "Tailspin saved to %{public, name=path}@ for Request ID: %{public}@", buf, 0x16u);

  }
  v38 = -[DRSRequest updateToState:errorDescription:errorOut:](self, "updateToState:errorDescription:errorOut:", 1, 0, 0);
LABEL_27:

  return v38;
}

- (id)requestType
{
  return CFSTR("Tailspin");
}

- (id)logType
{
  void *v2;
  unint64_t v3;
  __CFString **v4;

  -[DRSRequest logs](self, "logs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = kDRLogType_MultipleLogs;
  if (v3 < 2)
    v4 = kDRLogType_Tailspin;
  return *v4;
}

- (BOOL)_performPostClientLogWork:(id)a3 dampeningOutcome:(unint64_t)a4 isLogUploadEnabled:(BOOL)a5
{
  id v7;
  BOOL v8;
  uint64_t v9;
  BOOL v10;

  v7 = a3;
  switch(a4)
  {
    case 0uLL:
      v8 = -[DRSTailspinRequest _dumpTailspinToDirectory:](self, "_dumpTailspinToDirectory:", v7);
      goto LABEL_13;
    case 1uLL:
      v9 = 4096;
      goto LABEL_12;
    case 2uLL:
      v9 = 4097;
      goto LABEL_12;
    case 3uLL:
      v9 = 4098;
      goto LABEL_12;
    case 4uLL:
      v9 = 4099;
      goto LABEL_12;
    case 5uLL:
      v9 = 4100;
      goto LABEL_12;
    case 6uLL:
      v9 = 4101;
      goto LABEL_12;
    case 7uLL:
      v9 = 4102;
      goto LABEL_12;
    case 8uLL:
      v9 = 4103;
      goto LABEL_12;
    default:
      v9 = 0;
LABEL_12:
      v8 = -[DRSRequest updateToState:errorDescription:errorOut:](self, "updateToState:errorDescription:errorOut:", v9, 0, 0);
LABEL_13:
      v10 = v8;

      return v10;
  }
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  char IsNil;
  char v12;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DRSTailspinRequest;
  if (-[DRSRequest isEqualToRequest:](&v18, sel_isEqualToRequest_, v4))
  {
    v5 = v4;
    v6 = -[DRSTailspinRequest includeOsSignpost](self, "includeOsSignpost");
    if (v6 != objc_msgSend(v5, "includeOsSignpost"))
      goto LABEL_6;
    v7 = -[DRSTailspinRequest includeOsLog](self, "includeOsLog");
    if (v7 != objc_msgSend(v5, "includeOsLog"))
      goto LABEL_6;
    v8 = -[DRSTailspinRequest scrubbed](self, "scrubbed");
    if (v8 != objc_msgSend(v5, "scrubbed"))
      goto LABEL_6;
    -[DRSTailspinRequest minMAT](self, "minMAT");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minMAT");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    IsNil = _oneIsNil((uint64_t)v9, (uint64_t)v10);

    if ((IsNil & 1) == 0)
    {
      -[DRSTailspinRequest minMAT](self, "minMAT");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        -[DRSTailspinRequest minMAT](self, "minMAT");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "minMAT");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v16, "isEqualToNumber:", v17);

      }
      else
      {
        v12 = 1;
      }
    }
    else
    {
LABEL_6:
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)enforceMinTraceBufferDuration
{
  NSObject *v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  _minBufferDurationQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__DRSTailspinRequest_enforceMinTraceBufferDuration__block_invoke;
  block[3] = &unk_1EA3D0F00;
  block[4] = &v5;
  dispatch_sync(v2, block);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __51__DRSTailspinRequest_enforceMinTraceBufferDuration__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = gDRSTailspinRequestEnforceMinTraceBufferDuration;
  return result;
}

+ (void)setEnforceMinTraceBufferDuration:(BOOL)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  _QWORD block[4];
  BOOL v8;

  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInternal");

  if (v5)
  {
    _minBufferDurationQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__DRSTailspinRequest_setEnforceMinTraceBufferDuration___block_invoke;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    v8 = a3;
    dispatch_sync(v6, block);

  }
}

uint64_t __55__DRSTailspinRequest_setEnforceMinTraceBufferDuration___block_invoke(uint64_t result)
{
  gDRSTailspinRequestEnforceMinTraceBufferDuration = *(_BYTE *)(result + 32);
  return result;
}

+ (void)resetEnforceMinTraceBufferDuration
{
  NSObject *v2;

  _minBufferDurationQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v2, &__block_literal_global_629);

}

void __56__DRSTailspinRequest_resetEnforceMinTraceBufferDuration__block_invoke()
{
  gDRSTailspinRequestEnforceMinTraceBufferDuration = 1;
}

- (BOOL)includeOsSignpost
{
  return self->_includeOsSignpost;
}

- (BOOL)includeOsLog
{
  return self->_includeOsLog;
}

- (BOOL)scrubbed
{
  return self->_scrubbed;
}

- (NSNumber)minMAT
{
  return self->_minMAT;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minMAT, 0);
}

@end
