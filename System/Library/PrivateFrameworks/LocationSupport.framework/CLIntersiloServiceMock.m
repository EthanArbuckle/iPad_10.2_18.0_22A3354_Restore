@implementation CLIntersiloServiceMock

- (void)beginService
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CLIntersiloServiceMock setKeyedPayloads:](self, "setKeyedPayloads:", v3);

}

- (void)endService
{
  -[CLIntersiloServiceMock setKeyedPayloads:](self, "setKeyedPayloads:", 0);
}

- (void)setPayload:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v6 = a4;
  -[CLIntersiloServiceMock keyedPayloads](self, "keyedPayloads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    sub_1A1A0BAA4();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = &unk_1A1A18FAF;
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "self.keyedPayloads";
      _os_log_impl(&dword_1A19F4000, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Overrider didn't call up to super for beginService?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A0BAA4();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = &unk_1A1A18FAF;
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "self.keyedPayloads";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Overrider didn't call up to super for beginService?", "{\"msg%{public}.0s\":\"Overrider didn't call up to super for beginService?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A0BAA4();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = &unk_1A1A18FAF;
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "self.keyedPayloads";
      _os_log_impl(&dword_1A19F4000, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Overrider didn't call up to super for beginService?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_17:

    abort_report_np();
  }
  -[CLIntersiloServiceMock keyedPayloads](self, "keyedPayloads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    sub_1A1A0BAA4();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = &unk_1A1A18FAF;
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "![self.keyedPayloads objectForKey:key]";
      _os_log_impl(&dword_1A19F4000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Only one payload per key at at time\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A0BAA4();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v15))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = &unk_1A1A18FAF;
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "![self.keyedPayloads objectForKey:key]";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Only one payload per key at at time", "{\"msg%{public}.0s\":\"Only one payload per key at at time\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A0BAA4();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = &unk_1A1A18FAF;
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "![self.keyedPayloads objectForKey:key]";
      _os_log_impl(&dword_1A19F4000, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Only one payload per key at at time\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_17;
  }
  -[CLIntersiloServiceMock keyedPayloads](self, "keyedPayloads");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v16, v6);

  objc_msgSend(v16, "setInUse:", 1);
}

- (id)getPayloadForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CLIntersiloServiceMock keyedPayloads](self, "keyedPayloads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    sub_1A1A0BAA4();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v12 = 0;
      v13 = 2082;
      v14 = &unk_1A1A18FAF;
      v15 = 2082;
      v16 = "assert";
      v17 = 2081;
      v18 = "payload";
      _os_log_impl(&dword_1A19F4000, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"A payload must be ready for this key\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A0BAA4();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 68289539;
      v12 = 0;
      v13 = 2082;
      v14 = &unk_1A1A18FAF;
      v15 = 2082;
      v16 = "assert";
      v17 = 2081;
      v18 = "payload";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "A payload must be ready for this key", "{\"msg%{public}.0s\":\"A payload must be ready for this key\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A0BAA4();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v12 = 0;
      v13 = 2082;
      v14 = &unk_1A1A18FAF;
      v15 = 2082;
      v16 = "assert";
      v17 = 2081;
      v18 = "payload";
      _os_log_impl(&dword_1A19F4000, v10, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"A payload must be ready for this key\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }

  return v6;
}

- (void)removePayloadForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[CLIntersiloServiceMock keyedPayloads](self, "keyedPayloads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    sub_1A1A0BAA4();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v12 = 0;
      v13 = 2082;
      v14 = &unk_1A1A18FAF;
      v15 = 2082;
      v16 = "assert";
      v17 = 2081;
      v18 = "payload";
      _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"A payload must be around to remove for this key\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A0BAA4();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 68289539;
      v12 = 0;
      v13 = 2082;
      v14 = &unk_1A1A18FAF;
      v15 = 2082;
      v16 = "assert";
      v17 = 2081;
      v18 = "payload";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "A payload must be around to remove for this key", "{\"msg%{public}.0s\":\"A payload must be around to remove for this key\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A0BAA4();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v12 = 0;
      v13 = 2082;
      v14 = &unk_1A1A18FAF;
      v15 = 2082;
      v16 = "assert";
      v17 = 2081;
      v18 = "payload";
      _os_log_impl(&dword_1A19F4000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"A payload must be around to remove for this key\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }
  -[CLIntersiloServiceMock keyedPayloads](self, "keyedPayloads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v10);

}

- (void)setPayload:(id)a3 forSelector:(SEL)a4
{
  id v6;
  id v7;

  v6 = a3;
  NSStringFromSelector(a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CLIntersiloServiceMock setPayload:forKey:](self, "setPayload:forKey:", v6, v7);

}

- (id)syncgetPayloadForSelector:(SEL)a3
{
  void *v4;
  void *v5;

  NSStringFromSelector(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLIntersiloServiceMock getPayloadForKey:](self, "getPayloadForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getPayloadForSelector:(SEL)a3
{
  void *v4;
  void *v5;

  NSStringFromSelector(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLIntersiloServiceMock getPayloadForKey:](self, "getPayloadForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)removePayloadForSelector:(SEL)a3
{
  id v4;

  NSStringFromSelector(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CLIntersiloServiceMock removePayloadForKey:](self, "removePayloadForKey:", v4);

}

- (NSMutableDictionary)keyedPayloads
{
  return self->_keyedPayloads;
}

- (void)setKeyedPayloads:(id)a3
{
  objc_storeStrong((id *)&self->_keyedPayloads, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyedPayloads, 0);
}

@end
