@implementation CLIntersiloService

- (CLServiceVendor)vendor
{
  return self->_vendor;
}

- (CLIntersiloService)initWithInboundProtocol:(id)a3 outboundProtocol:(id)a4
{
  id v6;
  id v7;
  CLIntersiloService *v8;
  CLIntersiloService *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CLIntersiloService;
  v8 = -[CLIntersiloService init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v6 && v7)
    {
      +[CLIntersiloInterface sharedInterface](CLIntersiloInterface, "sharedInterface");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = &unk_1EE64DEC0;
      v17[1] = &unk_1EE64D7D8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "extendSelectorInfoWithProtocol:bases:", v6, v11);

      +[CLIntersiloInterface sharedInterface](CLIntersiloInterface, "sharedInterface");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = &unk_1EE64D7D8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "extendSelectorInfoWithProtocol:bases:", v7, v13);

    }
    else
    {
      v12 = v8;
      v9 = 0;
    }

  }
  return v9;
}

- (CLSilo)silo
{
  return self->_silo;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setVendor:(id)a3
{
  CLServiceVendor *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (CLServiceVendor *)a3;
  if (self->_vendor)
  {
    sub_1A1A0BAA4();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = &unk_1A1A18FAF;
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "!_vendor";
      _os_log_impl(&dword_1A19F4000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"The vendor associated with a CLIntersiloService may not be changed once set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A0BAA4();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = &unk_1A1A18FAF;
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "!_vendor";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "The vendor associated with a CLIntersiloService may not be changed once set", "{\"msg%{public}.0s\":\"The vendor associated with a CLIntersiloService may not be changed once set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A0BAA4();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = &unk_1A1A18FAF;
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "!_vendor";
      _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"The vendor associated with a CLIntersiloService may not be changed once set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }
  self->_vendor = v4;

}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)setSilo:(id)a3
{
  CLSilo *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (CLSilo *)a3;
  if (self->_silo)
  {
    sub_1A1A0BAA4();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = &unk_1A1A18FAF;
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "!_silo";
      _os_log_impl(&dword_1A19F4000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"The silo associated with a CLIntersiloService may not be changed once set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A0BAA4();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = &unk_1A1A18FAF;
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "!_silo";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "The silo associated with a CLIntersiloService may not be changed once set", "{\"msg%{public}.0s\":\"The silo associated with a CLIntersiloService may not be changed once set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A0BAA4();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = &unk_1A1A18FAF;
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "!_silo";
      _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"The silo associated with a CLIntersiloService may not be changed once set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }
  self->_silo = v4;

}

+ (id)getSilo
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1ECE24CB0 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "((void *)0)";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB660);
    }
    v3 = qword_1ECE24CA8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "((void *)0)";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB660);
    }
    v4 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "((void *)0)";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FB660);
  }
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (qword_1ECE24CB0 != -1)
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FB660);
  v6 = (void *)qword_1ECE24CA8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
  {
    v7 = v6;
    v15 = 68289282;
    *(_WORD *)v16 = 2082;
    *(_QWORD *)&v16[2] = &unk_1A1A18FAF;
    *(_WORD *)&v16[10] = 2114;
    *(_QWORD *)&v16[12] = objc_opt_class();
    v8 = *(id *)&v16[12];
    _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"-becameFatallyBlocked:index: was not overriden\", \"class\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);

    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FB660);
  }
  v9 = (void *)qword_1ECE24CA8;
  if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
  {
    v10 = v9;
    v11 = (void *)objc_opt_class();
    v15 = 68289282;
    *(_WORD *)v16 = 2082;
    *(_QWORD *)&v16[2] = &unk_1A1A18FAF;
    *(_WORD *)&v16[10] = 2114;
    *(_QWORD *)&v16[12] = v11;
    v12 = v11;
    _os_signpost_emit_with_name_impl(&dword_1A19F4000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "-becameFatallyBlocked:index: was not overriden", "{\"msg%{public}.0s\":\"-becameFatallyBlocked:index: was not overriden\", \"class\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);

  }
  v13 = a4 + 1;
  if (v13 < objc_msgSend(v5, "count", v15, *(_OWORD *)v16, *(_QWORD *)&v16[16]))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "becameFatallyBlocked:index:", v5, v13);

  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (qword_1ECE24CB0 != -1)
    goto LABEL_11;
  while (1)
  {
    v7 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2082;
      v15 = "assert";
      v16 = 2081;
      v17 = "((void *)0)";
      _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB660);
    }
    v8 = qword_1ECE24CA8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
    {
      *(_DWORD *)buf = 68289539;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2082;
      v15 = "assert";
      v16 = 2081;
      v17 = "((void *)0)";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB660);
    }
    v9 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2082;
      v15 = "assert";
      v16 = 2081;
      v17 = "((void *)0)";
      _os_log_impl(&dword_1A19F4000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FB660);
  }
}

- (CLIntersiloService)init
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1ECE24CB0 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "((void *)0)";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB660);
    }
    v3 = qword_1ECE24CA8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "((void *)0)";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB660);
    }
    v4 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "((void *)0)";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FB660);
  }
}

+ (BOOL)isSupported
{
  return 1;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)CLIntersiloService;
  -[CLIntersiloService debugDescription](&v9, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLIntersiloService universe](self, "universe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "silo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\nSilo: %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_silo, 0);
}

@end
