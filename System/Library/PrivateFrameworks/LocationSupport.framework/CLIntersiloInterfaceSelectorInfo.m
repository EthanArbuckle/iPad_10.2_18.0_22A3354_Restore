@implementation CLIntersiloInterfaceSelectorInfo

- (int)lastArgBlockIndex
{
  return self->_lastArgBlockIndex;
}

- (NSMethodSignature)sig
{
  return self->_sig;
}

- (int)returnAddressIndex
{
  return self->_returnAddressIndex;
}

- (CLIntersiloInterfaceSelectorInfo)initWithSelector:(SEL)a3 andMethodSignature:(id)a4
{
  id v7;
  int v8;
  CLIntersiloInterfaceSelectorInfo *v9;
  CLIntersiloInterfaceSelectorInfo *v10;
  id *p_sig;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CLIntersiloInterfaceSelectorInfo *v18;
  CLIntersiloInterfaceSelectorInfo *result;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  objc_super v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  const char *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = objc_msgSend(v7, "numberOfArguments");
  if (v8 < 32)
  {
    v47.receiver = self;
    v47.super_class = (Class)CLIntersiloInterfaceSelectorInfo;
    v9 = -[CLIntersiloInterfaceSelectorInfo init](&v47, sel_init);
    v10 = v9;
    if (!v9)
    {
LABEL_22:

      return v10;
    }
    v9->_sel = a3;
    p_sig = (id *)&v9->_sig;
    objc_storeStrong((id *)&v9->_sig, a4);
    NSStringFromSelector(v10->_sel);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*p_sig, "methodReturnLength"))
    {
      if ((objc_msgSend(v12, "hasPrefix:", CFSTR("syncget")) & 1) != 0)
      {
        if (v8 < 3)
          goto LABEL_21;
        goto LABEL_16;
      }
      sub_1A1A05938();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        v38 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
        *(_DWORD *)buf = 68289795;
        v49 = 0;
        v50 = 2082;
        v51 = &unk_1A1A18FAF;
        v52 = 2081;
        v53 = (const char *)v38;
        v54 = 2082;
        v55 = "assert";
        v56 = 2081;
        v57 = "0 == returnValueSize";
        _os_log_impl(&dword_1A19F4000, v37, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Methods returning non-void must begin 'syncget...'\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      sub_1A1A05938();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v39))
      {
        v40 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
        *(_DWORD *)buf = 68289795;
        v49 = 0;
        v50 = 2082;
        v51 = &unk_1A1A18FAF;
        v52 = 2081;
        v53 = (const char *)v40;
        v54 = 2082;
        v55 = "assert";
        v56 = 2081;
        v57 = "0 == returnValueSize";
        _os_signpost_emit_with_name_impl(&dword_1A19F4000, v39, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Methods returning non-void must begin 'syncget...'", "{\"msg%{public}.0s\":\"Methods returning non-void must begin 'syncget...'\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      sub_1A1A05938();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v41 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
        *(_DWORD *)buf = 68289795;
        v49 = 0;
        v50 = 2082;
        v51 = &unk_1A1A18FAF;
        v52 = 2081;
        v53 = (const char *)v41;
        v54 = 2082;
        v55 = "assert";
        v56 = 2081;
        v57 = "0 == returnValueSize";
        _os_log_impl(&dword_1A19F4000, v30, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Methods returning non-void must begin 'syncget...'\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }
    }
    else if (objc_msgSend(v12, "hasPrefix:", CFSTR("syncget")))
    {
      sub_1A1A05938();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      {
        v43 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
        *(_DWORD *)buf = 68289795;
        v49 = 0;
        v50 = 2082;
        v51 = &unk_1A1A18FAF;
        v52 = 2081;
        v53 = (const char *)v43;
        v54 = 2082;
        v55 = "assert";
        v56 = 2081;
        v57 = "0 != returnValueSize";
        _os_log_impl(&dword_1A19F4000, v42, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Methods beginning 'syncget...' must return non-void\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      sub_1A1A05938();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v44))
      {
        v45 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
        *(_DWORD *)buf = 68289795;
        v49 = 0;
        v50 = 2082;
        v51 = &unk_1A1A18FAF;
        v52 = 2081;
        v53 = (const char *)v45;
        v54 = 2082;
        v55 = "assert";
        v56 = 2081;
        v57 = "0 != returnValueSize";
        _os_signpost_emit_with_name_impl(&dword_1A19F4000, v44, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Methods beginning 'syncget...' must return non-void", "{\"msg%{public}.0s\":\"Methods beginning 'syncget...' must return non-void\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      sub_1A1A05938();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v46 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
        *(_DWORD *)buf = 68289795;
        v49 = 0;
        v50 = 2082;
        v51 = &unk_1A1A18FAF;
        v52 = 2081;
        v53 = (const char *)v46;
        v54 = 2082;
        v55 = "assert";
        v56 = 2081;
        v57 = "0 != returnValueSize";
        _os_log_impl(&dword_1A19F4000, v30, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Methods beginning 'syncget...' must return non-void\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }
    }
    else
    {
      if (v8 < 3)
      {
LABEL_21:
        v18 = v10;

        goto LABEL_22;
      }
      if ((objc_msgSend(v12, "hasSuffixInsensitive:", CFSTR("doAsync:")) & 1) != 0)
      {
LABEL_16:
        v16 = v8;
        v17 = 2;
        while (1)
        {
          if (!strcmp("R@", (const char *)objc_msgSend(*p_sig, "getArgumentTypeAtIndex:", v17)))
          {
            if (v10->_returnAddressIndex)
            {
              sub_1A1A05938();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 68289539;
                v49 = 0;
                v50 = 2082;
                v51 = &unk_1A1A18FAF;
                v52 = 2082;
                v53 = "assert";
                v54 = 2081;
                v55 = "0 == _returnAddressIndex";
                _os_log_impl(&dword_1A19F4000, v20, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
              }

              sub_1A1A05938();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v21))
              {
                *(_DWORD *)buf = 68289539;
                v49 = 0;
                v50 = 2082;
                v51 = &unk_1A1A18FAF;
                v52 = 2082;
                v53 = "assert";
                v54 = 2081;
                v55 = "0 == _returnAddressIndex";
                _os_signpost_emit_with_name_impl(&dword_1A19F4000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
              }

              sub_1A1A05938();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 68289539;
                v49 = 0;
                v50 = 2082;
                v51 = &unk_1A1A18FAF;
                v52 = 2082;
                v53 = "assert";
                v54 = 2081;
                v55 = "0 == _returnAddressIndex";
                _os_log_impl(&dword_1A19F4000, v22, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
              }

              result = (CLIntersiloInterfaceSelectorInfo *)abort_report_np();
              goto LABEL_65;
            }
            v10->_returnAddressIndex = v17;
          }
          if (v16 == ++v17)
            goto LABEL_21;
        }
      }
      v13 = objc_msgSend(v12, "rangeOfString:options:", CFSTR("withReply:"), 1);
      v14 = strcmp((const char *)objc_msgSend(*p_sig, "getArgumentTypeAtIndex:", (v8 - 1)), "@?");
      if (!v14)
        v10->_lastArgBlockIndex = v8 - 1;
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v10->_lastArgBlockIndex = -v10->_lastArgBlockIndex;
        goto LABEL_16;
      }
      v15 = objc_msgSend(v12, "length");
      if (v13 == v15 - objc_msgSend(CFSTR("withReply:"), "length"))
      {
        if (!v14)
          goto LABEL_16;
        sub_1A1A05938();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
          v33 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          *(_DWORD *)buf = 68289795;
          v49 = 0;
          v50 = 2082;
          v51 = &unk_1A1A18FAF;
          v52 = 2081;
          v53 = (const char *)v33;
          v54 = 2082;
          v55 = "assert";
          v56 = 2081;
          v57 = "isLastArgBlockType";
          _os_log_impl(&dword_1A19F4000, v32, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"withReply: argument name should only take block type argument\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
        }

        sub_1A1A05938();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v34))
        {
          v35 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          *(_DWORD *)buf = 68289795;
          v49 = 0;
          v50 = 2082;
          v51 = &unk_1A1A18FAF;
          v52 = 2081;
          v53 = (const char *)v35;
          v54 = 2082;
          v55 = "assert";
          v56 = 2081;
          v57 = "isLastArgBlockType";
          _os_signpost_emit_with_name_impl(&dword_1A19F4000, v34, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "withReply: argument name should only take block type argument", "{\"msg%{public}.0s\":\"withReply: argument name should only take block type argument\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
        }

        sub_1A1A05938();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v36 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          *(_DWORD *)buf = 68289795;
          v49 = 0;
          v50 = 2082;
          v51 = &unk_1A1A18FAF;
          v52 = 2081;
          v53 = (const char *)v36;
          v54 = 2082;
          v55 = "assert";
          v56 = 2081;
          v57 = "isLastArgBlockType";
          _os_log_impl(&dword_1A19F4000, v30, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"withReply: argument name should only take block type argument\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
        }
      }
      else
      {
        sub_1A1A05938();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          v27 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          *(_DWORD *)buf = 68289795;
          v49 = 0;
          v50 = 2082;
          v51 = &unk_1A1A18FAF;
          v52 = 2081;
          v53 = (const char *)v27;
          v54 = 2082;
          v55 = "assert";
          v56 = 2081;
          v57 = "subStringRange.location == (selStr.length - subString.length)";
          _os_log_impl(&dword_1A19F4000, v26, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"withReply: can only be used at the end of a method name\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
        }

        sub_1A1A05938();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v28))
        {
          v29 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          *(_DWORD *)buf = 68289795;
          v49 = 0;
          v50 = 2082;
          v51 = &unk_1A1A18FAF;
          v52 = 2081;
          v53 = (const char *)v29;
          v54 = 2082;
          v55 = "assert";
          v56 = 2081;
          v57 = "subStringRange.location == (selStr.length - subString.length)";
          _os_signpost_emit_with_name_impl(&dword_1A19F4000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "withReply: can only be used at the end of a method name", "{\"msg%{public}.0s\":\"withReply: can only be used at the end of a method name\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
        }

        sub_1A1A05938();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          *(_DWORD *)buf = 68289795;
          v49 = 0;
          v50 = 2082;
          v51 = &unk_1A1A18FAF;
          v52 = 2081;
          v53 = (const char *)v31;
          v54 = 2082;
          v55 = "assert";
          v56 = 2081;
          v57 = "subStringRange.location == (selStr.length - subString.length)";
          _os_log_impl(&dword_1A19F4000, v30, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"withReply: can only be used at the end of a method name\", \"selStr\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
        }
      }
    }

    result = (CLIntersiloInterfaceSelectorInfo *)abort_report_np();
    goto LABEL_65;
  }
  sub_1A1A05938();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 68289539;
    v49 = 0;
    v50 = 2082;
    v51 = &unk_1A1A18FAF;
    v52 = 2082;
    v53 = "assert";
    v54 = 2081;
    v55 = "32 > numArguments";
    _os_log_impl(&dword_1A19F4000, v23, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Too many arguments to selector in IntersiloInterface\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  sub_1A1A05938();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v24))
  {
    *(_DWORD *)buf = 68289539;
    v49 = 0;
    v50 = 2082;
    v51 = &unk_1A1A18FAF;
    v52 = 2082;
    v53 = "assert";
    v54 = 2081;
    v55 = "32 > numArguments";
    _os_signpost_emit_with_name_impl(&dword_1A19F4000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Too many arguments to selector in IntersiloInterface", "{\"msg%{public}.0s\":\"Too many arguments to selector in IntersiloInterface\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  sub_1A1A05938();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289539;
    v49 = 0;
    v50 = 2082;
    v51 = &unk_1A1A18FAF;
    v52 = 2082;
    v53 = "assert";
    v54 = 2081;
    v55 = "32 > numArguments";
    _os_log_impl(&dword_1A19F4000, v25, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Too many arguments to selector in IntersiloInterface\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  result = (CLIntersiloInterfaceSelectorInfo *)abort_report_np();
LABEL_65:
  __break(1u);
  return result;
}

- (NSString)typeStr
{
  return (NSString *)MEMORY[0x1E0DE7D20](self->_sig, sel__cTypeString);
}

- (id)description
{
  return NSStringFromSelector(-[CLIntersiloInterfaceSelectorInfo sel](self, "sel"));
}

- (SEL)sel
{
  return self->_sel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sig, 0);
}

@end
