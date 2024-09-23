@implementation CMCaptureFrameSenderEndpoints

- (BOOL)addEndpoint:(id)a3 endpointUniqueID:(id)a4 endpointType:(id)a5 endpointPID:(int)a6 endpointProxyPID:(int)a7 endpointAuditToken:(id)a8 endpointProxyAuditToken:(id)a9 endpointCameraUniqueID:(id)a10
{
  uint64_t v10;
  BOOL v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v10 = *(_QWORD *)&a6;
  v31 = *MEMORY[0x1E0C80C00];
  v14 = -[CMCaptureFrameSenderEndpoints _pruneStalePIDsFromDictionary](self, "_pruneStalePIDsFromDictionary");
  v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
  v16 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_frameSenderEndpoints, "objectForKeyedSubscript:", v15);
  if (!v16)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_frameSenderEndpoints, "setObject:forKeyedSubscript:", v16, v15);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
LABEL_5:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v19)
        objc_enumerationMutation(v16);
      if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v20), "objectForKeyedSubscript:", CFSTR("endpoint-uid")), "isEqualToString:", a4) & 1) != 0)break;
      if (v18 == ++v20)
      {
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v18)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    cfse_addEndpointInfo(v15, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a7), (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a8, (uint64_t)a9, (const __CFString *)a10, v16);
    if (dword_1ECFE9790)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      v14 = 1;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      return 1;
    }
  }
  return v14;
}

- (BOOL)_pruneStalePIDsFromDictionary
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18[16];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[NSMutableDictionary allKeys](self->_frameSenderEndpoints, "allKeys");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "intValue");
        v18[0] = 0;
        objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", objc_msgSend(MEMORY[0x1E0D87D70], "identifierWithPid:", v8), v18);
        if (v18[0] && objc_msgSend(v18[0], "code") == 3)
        {
          if (dword_1ECFE9790)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v5 |= -[CMCaptureFrameSenderEndpoints removeAllEndpointsWithPID:pruneStalePIDs:](self, "removeAllEndpointsWithPID:pruneStalePIDs:", v8, 0, v11, v12);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5 & 1;
}

- (CMCaptureFrameSenderEndpoints)init
{
  CMCaptureFrameSenderEndpoints *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMCaptureFrameSenderEndpoints;
  v2 = -[CMCaptureFrameSenderEndpoints init](&v4, sel_init);
  if (v2)
    v2->_frameSenderEndpoints = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v2;
}

- (CMCaptureFrameSenderEndpoints)initWithXPCArrayOfFrameSenderEndpoints:(id)a3
{
  CMCaptureFrameSenderEndpoints *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  _QWORD applier[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMCaptureFrameSenderEndpoints;
  v4 = -[CMCaptureFrameSenderEndpoints init](&v9, sel_init);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = MEMORY[0x1E0C809B0];
    v4->_frameSenderEndpoints = v5;
    applier[0] = v6;
    applier[1] = 3221225472;
    applier[2] = __72__CMCaptureFrameSenderEndpoints_initWithXPCArrayOfFrameSenderEndpoints___block_invoke;
    applier[3] = &unk_1E491E8E8;
    applier[4] = v4;
    xpc_array_apply(a3, applier);
  }
  return v4;
}

uint64_t __72__CMCaptureFrameSenderEndpoints_initWithXPCArrayOfFrameSenderEndpoints___block_invoke(int a1, int a2, xpc_object_t xdict)
{
  xpc_dictionary_get_value(xdict, "endpoint");
  FigXPCMessageCopyCFString();
  FigXPCMessageCopyCFString();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", xpc_dictionary_get_int64(xdict, "endpoint-pid"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", xpc_dictionary_get_int64(xdict, "endpoint-proxy-pid"));
  FigXPCMessageCopyCFData();
  FigXPCMessageCopyCFData();
  FigXPCMessageCopyCFString();

  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMCaptureFrameSenderEndpoints;
  -[CMCaptureFrameSenderEndpoints dealloc](&v3, sel_dealloc);
}

- (NSDictionary)endpointsByPID
{
  -[CMCaptureFrameSenderEndpoints _pruneStalePIDsFromDictionary](self, "_pruneStalePIDsFromDictionary");
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_frameSenderEndpoints, "copy");
}

- (BOOL)removeAllEndpointsWithPID:(int)a3
{
  return -[CMCaptureFrameSenderEndpoints removeAllEndpointsWithPID:pruneStalePIDs:](self, "removeAllEndpointsWithPID:pruneStalePIDs:", *(_QWORD *)&a3, 1);
}

- (BOOL)removeAllEndpointsWithPID:(int)a3 pruneStalePIDs:(BOOL)a4
{
  uint64_t v4;
  CMCaptureFrameSenderEndpoints *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v13;
  uint64_t v14;
  id obj;
  uint64_t v16;
  CMCaptureFrameSenderEndpoints *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  HIDWORD(v14) = a4;
  v4 = *(_QWORD *)&a3;
  v5 = self;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_frameSenderEndpoints, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"));
  v7 = v6 != 0;
  if (v6)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_frameSenderEndpoints, "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)-[NSMutableDictionary allKeys](v5->_frameSenderEndpoints, "allKeys");
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v18)
  {
    v16 = *(_QWORD *)v22;
    v17 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v20 = v8;
        v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](v5->_frameSenderEndpoints, "objectForKeyedSubscript:");
        if (objc_msgSend(v9, "count"))
        {
          v10 = 0;
          do
          {
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v10), "objectForKeyedSubscript:", CFSTR("endpoint-proxy-pid")), "intValue") == (_DWORD)v4)
            {
              if (dword_1ECFE9790)
              {
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              objc_msgSend(v9, "removeObjectAtIndex:", v10, v13, v14);
              v7 = 1;
            }
            else
            {
              ++v10;
            }
          }
          while (v10 < objc_msgSend(v9, "count"));
        }
        v5 = v17;
        if (!objc_msgSend(v9, "count"))
          -[NSMutableDictionary setObject:forKeyedSubscript:](v17->_frameSenderEndpoints, "setObject:forKeyedSubscript:", 0, v19);
        ++v8;
      }
      while (v20 + 1 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v18);
  }
  if (HIDWORD(v14))
    v7 |= -[CMCaptureFrameSenderEndpoints _pruneStalePIDsFromDictionary](v5, "_pruneStalePIDsFromDictionary");
  return v7 & 1;
}

- (BOOL)removeEndpointWithUniqueID:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (void *)-[NSMutableDictionary allKeys](self->_frameSenderEndpoints, "allKeys");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v11 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_frameSenderEndpoints, "objectForKeyedSubscript:", v10);
        if (objc_msgSend(v11, "count"))
        {
          v12 = 0;
          while (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", v12), "objectForKeyedSubscript:", CFSTR("endpoint-uid")), "isEqualToString:", a3))
          {
            if (++v12 >= (unint64_t)objc_msgSend(v11, "count"))
              goto LABEL_10;
          }
          objc_msgSend(v11, "removeObjectAtIndex:", v12);
          if (dword_1ECFE9790)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          if (!objc_msgSend(v11, "count", v16, v17))
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_frameSenderEndpoints, "setObject:forKeyedSubscript:", 0, v10);
          v13 = 1;
          return v13 | -[CMCaptureFrameSenderEndpoints _pruneStalePIDsFromDictionary](self, "_pruneStalePIDsFromDictionary");
        }
LABEL_10:
        ;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v13 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }
  return v13 | -[CMCaptureFrameSenderEndpoints _pruneStalePIDsFromDictionary](self, "_pruneStalePIDsFromDictionary");
}

- (id)createXPCArrayOfFrameSenderEndpoints
{
  xpc_object_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  xpc_object_t v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = xpc_array_create(0, 0);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)-[NSMutableDictionary allValues](self->_frameSenderEndpoints, "allValues");
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v18)
  {
    v17 = *(_QWORD *)v25;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(obj);
        v19 = v4;
        v5 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v4);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v21;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v21 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
              v11 = xpc_dictionary_create(0, 0, 0);
              v12 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("endpoint"));
              if (v10)
                xpc_dictionary_set_value(v11, "endpoint", v12);
              if (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("endpoint-uid")))
                FigXPCMessageSetCFString();
              if (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("endpoint-type")))
                FigXPCMessageSetCFString();
              v13 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("endpoint-pid"));
              if (v13)
                xpc_dictionary_set_int64(v11, "endpoint-pid", (int)objc_msgSend(v13, "intValue"));
              v14 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("endpoint-proxy-pid"));
              if (v14)
                xpc_dictionary_set_int64(v11, "endpoint-proxy-pid", (int)objc_msgSend(v14, "intValue"));
              if (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("endpoint-audit-token")))
                FigXPCMessageSetCFData();
              if (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("endpoint-proxy-audit-token")))
                FigXPCMessageSetCFData();
              if (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("endpoint-camera-uid")))
                FigXPCMessageSetCFString();
              xpc_array_append_value(v3, v11);
              xpc_release(v11);
              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v7);
        }
        v4 = v19 + 1;
      }
      while (v19 + 1 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v18);
  }
  return v3;
}

@end
