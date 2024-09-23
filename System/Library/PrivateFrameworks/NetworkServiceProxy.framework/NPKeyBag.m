@implementation NPKeyBag

- (NPKeyBag)init
{
  NPKeyBag *v2;
  uint64_t v3;
  NSPredicate *validOnRampPredicate;
  uint64_t v5;
  NSPredicate *validOnRampWithTFOPredicate;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NPKeyBag;
  v2 = -[NPKeyBag init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_1273);
    v3 = objc_claimAutoreleasedReturnValue();
    validOnRampPredicate = v2->_validOnRampPredicate;
    v2->_validOnRampPredicate = (NSPredicate *)v3;

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_1274);
    v5 = objc_claimAutoreleasedReturnValue();
    validOnRampWithTFOPredicate = v2->_validOnRampWithTFOPredicate;
    v2->_validOnRampWithTFOPredicate = (NSPredicate *)v5;

  }
  return v2;
}

BOOL __16__NPKeyBag_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v4;
  void *v5;

  v2 = a2;
  if ((objc_msgSend(v2, "isDayPassExpired") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "tuscanyEndpoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hosts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "count") != 0;

  }
  return v3;
}

BOOL __16__NPKeyBag_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v4;
  void *v5;

  v2 = a2;
  if ((objc_msgSend(v2, "isDayPassExpired") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "tuscanyEndpoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hosts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      v3 = objc_msgSend(v2, "TFOStatus") == 2;
    else
      v3 = 0;

  }
  return v3;
}

- (NPKeyBag)initWithData:(id)a3
{
  id v4;
  NPKeyBag *v5;
  void *v6;
  id *v7;
  _QWORD v9[4];
  id *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = -[NPKeyBag init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__4;
    v16 = __Block_byref_object_dispose__4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __25__NPKeyBag_initWithData___block_invoke;
    v9[3] = &unk_1E4138668;
    v7 = v5;
    v10 = v7;
    v11 = &v12;
    -[NSMutableData enumerateTLVsUsingBlock:](v6, v9);
    objc_storeStrong(v7 + 2, (id)v13[5]);

    _Block_object_dispose(&v12, 8);
  }

  return v5;
}

uint64_t __25__NPKeyBag_initWithData___block_invoke(uint64_t a1, int a2, unsigned int a3, _DWORD *a4)
{
  uint64_t v6;
  NPKey *v7;
  void *v8;
  NPKey *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  if (a2 == 2 && a3 == 4)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = *a4;
  }
  else if (a2 == 5 && a3 == 8)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)a4;
  }
  else if (a2 == 6 && a3 == 4)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = *a4;
  }
  else
  {
    v6 = a3;
    if (a2 == 1 && a3)
    {
      v7 = [NPKey alloc];
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a4, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NPKey initWithData:](v7, "initWithData:", v8);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v9);
    }
    else if (a2 == 7 && a3 == 8)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = *(_QWORD *)a4;
    }
    else if (a2 == 8 && a3)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a4, a3);
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 32);
      *(_QWORD *)(v11 + 32) = v10;

    }
    else if (a2 == 9 && a3 == 8)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_QWORD *)a4;
    }
  }
  return 1;
}

- (NPKeyBag)initWithOnRamps:(id)a3 currentNetworkInfo:(id)a4 currentEdgeIndex:(int64_t)a5 currentEdgeList:(id)a6 generation:(unsigned int)a7 identifier:(id)a8 updateHash:(id)a9
{
  unsigned int v12;
  id v15;
  id v16;
  id v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  __int128 v22;
  char v23;
  unint64_t v24;
  void *v25;
  NPKey *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  BOOL v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  _BOOL8 v47;
  NSObject *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSArray *keys;
  NSArray *v60;
  uint64_t v61;
  uint64_t v62;
  int64_t v63;
  NPKeyBag *v64;
  __int128 v66;
  id v67;
  unsigned int v68;
  unsigned int v69;
  id v70;
  void *v71;
  NPKeyBag *v72;
  unsigned int v73;
  void *v74;
  id v75;
  NSArray *v76;
  char v77;
  uint64_t v78;
  unsigned int v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  _BYTE uu[22];
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v12 = a5;
  v88 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v75 = a6;
  v70 = a8;
  v17 = a9;
  v71 = v16;
  v72 = -[NPKeyBag init](self, "init");
  if (v72)
  {
    v68 = v12;
    v69 = a7;
    v67 = v17;
    v76 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = 0.0;
    if (v16)
    {
      objc_msgSend(v16, "lastUsed");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v16, "lastUsed");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceReferenceDate");
        v18 = v21;

      }
    }
    if (objc_msgSend(v15, "count"))
    {
      v77 = 0;
      v23 = 0;
      v24 = 0;
      *(_QWORD *)&v22 = 138413058;
      v66 = v22;
      while (1)
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", v24, v66);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_alloc_init(NPKey);
        if ((objc_msgSend(v25, "isDayPassExpired") & 1) != 0
          || (objc_msgSend(v25, "tuscanyEndpoint"),
              v27 = (void *)objc_claimAutoreleasedReturnValue(),
              v28 = v27 == 0,
              v27,
              v28))
        {
          *(_QWORD *)uu = 0;
          *(_QWORD *)&uu[8] = 0;
          uuid_clear(uu);
          -[NPKey setInfo:](v26, "setInfo:", 0);
          -[NPKey setSession_counter:](v26, "setSession_counter:", 0);
          v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uu);
          -[NPKey setUuid:](v26, "setUuid:", v36);

          objc_msgSend(v25, "dayPass");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v36) = v37 != 0;

          v77 |= v36;
        }
        else
        {
          objc_msgSend(v25, "dayPass");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = 0;
          v82 = objc_msgSend(v25, "maxFrameSize");
          v81 = 0;
          objc_msgSend(v25, "dayPassCreationDate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "timeIntervalSince1970");
          v32 = v31;

          v81 = v32;
          v80 = 0;
          objc_msgSend(v25, "dayPassHardExpiry");
          v80 = v33;
          v79 = 0;
          v79 = objc_msgSend(v29, "length");
          v34 = objc_retainAutorelease(v29);
          v35 = objc_msgSend(v34, "bytes");
          if (v35)
            v73 = *(_DWORD *)(v35 + 92);
          else
            v73 = 0;
          v78 = 0;
          if (!v75
            || v24 >= objc_msgSend(v75, "count")
            || (objc_msgSend(v75, "objectAtIndexedSubscript:", v24),
                v38 = (void *)objc_claimAutoreleasedReturnValue(),
                v39 = v38 == 0,
                v38,
                v39))
          {
            v45 = 0;
            v47 = 0;
          }
          else
          {
            objc_msgSend(v75, "objectAtIndexedSubscript:", v24);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = objc_msgSend(v40, "TFOStatus");
            objc_msgSend(v40, "addressFamily");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "getTuscanyEndpoint:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            nplog_obj();
            v43 = objc_claimAutoreleasedReturnValue();
            v44 = v43;
            if (!v42)
            {
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v40, "addressFamilyString");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "TFOStatusString");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "addressFamilyString");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)uu = v66;
                *(_QWORD *)&uu[4] = v70;
                *(_WORD *)&uu[12] = 2112;
                *(_QWORD *)&uu[14] = v74;
                v84 = 2112;
                v85 = v57;
                v86 = 2112;
                v87 = v58;
                _os_log_error_impl(&dword_19E8FE000, v44, OS_LOG_TYPE_ERROR, "%@: Skipping onRamp with %@ <TFOStatus: %@> because it does not have a Tuscany endpoint with address family %@", uu, 0x2Au);

              }
              goto LABEL_28;
            }
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v40, "addressFamilyString");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "TFOStatusString");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)uu = v66;
              *(_QWORD *)&uu[4] = v70;
              *(_WORD *)&uu[12] = 2112;
              *(_QWORD *)&uu[14] = v55;
              v84 = 2112;
              v85 = v42;
              v86 = 2112;
              v87 = v56;
              _os_log_debug_impl(&dword_19E8FE000, v44, OS_LOG_TYPE_DEBUG, "%@: Sending onRamp with %@ %@ <TFOStatus: %@> to the kernel", uu, 0x2Au);

            }
            objc_msgSend(v42, "encodedData");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "addressFamily");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "intValue") == 30;

          }
          nplog_obj();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v25, "dayPassUUID");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)uu = 138412802;
            *(_QWORD *)&uu[4] = v70;
            *(_WORD *)&uu[12] = 2112;
            *(_QWORD *)&uu[14] = v54;
            v84 = 1024;
            LODWORD(v85) = v73;
            _os_log_debug_impl(&dword_19E8FE000, v48, OS_LOG_TYPE_DEBUG, "%@: Sending day pass UUID %@, counter %u to the kernel", uu, 0x1Cu);

          }
          objc_msgSend(MEMORY[0x1E0C99DF0], "data");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v49;
          if (v49)
          {
            objc_msgSend(v49, "appendBytes:length:", &v79, 4);
            v51 = objc_msgSend(objc_retainAutorelease(v34), "bytes");
            objc_msgSend(v50, "appendBytes:length:", v51, v79);
            objc_msgSend(v50, "appendBytes:length:", &v82, 4);
            objc_msgSend(v50, "appendBytes:length:", &v78, 8);
            objc_msgSend(v50, "appendBytes:length:", &v81, 8);
            objc_msgSend(v50, "appendBytes:length:", &v80, 8);
            v52 = objc_retainAutorelease(v45);
            objc_msgSend(v50, "appendBytes:length:", objc_msgSend(v52, "bytes"), objc_msgSend(v52, "length"));
            -[NPKey setInfo:](v26, "setInfo:", v50);
            -[NPKey setSession_counter:](v26, "setSession_counter:", v73);
            objc_msgSend(v25, "dayPassUUID");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[NPKey setUuid:](v26, "setUuid:", v53);

            -[NPKey setFlags:](v26, "setFlags:", v47);
          }

          v23 = 1;
        }
        objc_msgSend(v25, "registerAgentWithKey:", v26);
        if (v26)
          -[NSArray addObject:](v76, "addObject:", v26);
LABEL_28:

        if (++v24 >= objc_msgSend(v15, "count"))
          goto LABEL_34;
      }
    }
    v23 = 0;
    v77 = 0;
LABEL_34:
    keys = v72->_keys;
    v72->_keys = v76;
    v60 = v76;

    v72->_index = v68;
    v72->_generation = v69;
    v72->_lastUsedTimestamp = v18;
    objc_storeStrong((id *)&v72->_updateHash, a9);

    v61 = objc_msgSend(v71, "lastFallbackReason");
    v62 = 34;
    if ((v77 & 1) == 0)
      v62 = 0;
    if ((v61 != 0) | v23 & 1)
      v63 = v61;
    else
      v63 = v62;
    v72->_fallbackReason = v63;
    v64 = v72;
    v17 = v67;
  }

  return v72;
}

- (id)data
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned __int16 v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int16 v14;
  id v15;
  unsigned int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NPKeyBag keys](self, "keys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8), "data");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "length");
        v11 = objc_retainAutorelease(v9);
        -[NSMutableData appendType:length:value:](v3, 1, v10, objc_msgSend(v11, "bytes"));

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  v17 = -[NPKeyBag index](self, "index");
  -[NSMutableData appendType:length:value:](v3, 2, 4u, (uint64_t)&v17);
  -[NSMutableData appendType:length:value:](v3, 5, 8u, (uint64_t)&self->_fallbackReason);
  -[NSMutableData appendType:length:value:](v3, 6, 4u, (uint64_t)&self->_generation);
  -[NSMutableData appendType:length:value:](v3, 7, 8u, (uint64_t)&self->_lastUsedTimestamp);
  -[NPKeyBag updateHash](self, "updateHash");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NPKeyBag updateHash](self, "updateHash");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");
    -[NPKeyBag updateHash](self, "updateHash");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[NSMutableData appendType:length:value:](v3, 8, v14, objc_msgSend(v15, "bytes"));

  }
  -[NSMutableData appendType:length:value:](v3, 9, 8u, (uint64_t)&self->_TFOStatusOverride);
  return v3;
}

- (void)createOnRamps
{
  __int128 v3;
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  NPTuscanyOnRamp *v8;
  NSObject *v9;
  int64_t TFOStatusOverride;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  NSDictionary *onRampMap;
  NSArray *v16;
  NSArray *onRampList;
  __int128 v18;
  uint8_t buf[4];
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_keys, "count"))
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    *(_QWORD *)&v3 = 134217984;
    v18 = v3;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_keys, "objectAtIndexedSubscript:", v6, v18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NPTuscanyOnRamp initWithKey:]([NPTuscanyOnRamp alloc], "initWithKey:", v7);
      if (self->_TFOStatusOverride)
      {
        nplog_obj();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          TFOStatusOverride = self->_TFOStatusOverride;
          *(_DWORD *)buf = v18;
          v20 = TFOStatusOverride;
          _os_log_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_DEFAULT, "Overriding TFO status to %ld", buf, 0xCu);
        }

        -[NPTuscanyOnRamp setTFOStatus:](v8, "setTFOStatus:", self->_TFOStatusOverride);
      }
      if (!v5)
        v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v5, "addObject:", v8);
      if (-[NSPredicate evaluateWithObject:](self->_validOnRampPredicate, "evaluateWithObject:", v8))
      {
        -[NPTuscanyOnRamp tuscanyEndpoint](v8, "tuscanyEndpoint");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hosts");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v4)
          v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v13);

      }
      ++v6;
    }
    while (v6 < -[NSArray count](self->_keys, "count"));
    if (v4)
    {
      v14 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v4);
      goto LABEL_18;
    }
  }
  else
  {
    v5 = 0;
  }
  v14 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
  v4 = 0;
LABEL_18:
  onRampMap = self->_onRampMap;
  self->_onRampMap = v14;

  if (v5)
    v16 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v5);
  else
    v16 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
  onRampList = self->_onRampList;
  self->_onRampList = v16;

}

- (id)copyUsableOnRamps:(BOOL)a3 requireTFO:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSPredicate *v7;
  NSPredicate *v8;
  void *v9;
  NSUInteger v10;
  NSUInteger v11;
  void *v12;
  NSUInteger v13;
  uint64_t v14;

  v4 = a4;
  v5 = a3;
  v7 = self->_validOnRampPredicate;
  if (v4)
  {
    v8 = self->_validOnRampWithTFOPredicate;

    v7 = v8;
  }
  if (!v5)
  {
    v10 = -[NPKeyBag index](self, "index");
    if (-[NSArray count](self->_onRampList, "count") <= v10)
    {
LABEL_10:
      v9 = 0;
    }
    else
    {
      v11 = v10;
      while (1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_onRampList, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSPredicate evaluateWithObject:](v7, "evaluateWithObject:", v12))
          break;

        v10 = (v10 + 1);
        v13 = -[NSArray count](self->_onRampList, "count");
        v11 = v10;
        if (v13 <= v10)
          goto LABEL_10;
      }
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v12, 0);

    }
    -[NPKeyBag setIndex:](self, "setIndex:", v10);
LABEL_13:
    if (v9)
      goto LABEL_20;
    goto LABEL_14;
  }
  -[NSArray filteredArrayUsingPredicate:](self->_onRampList, "filteredArrayUsingPredicate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    goto LABEL_13;

LABEL_14:
  if (-[NSArray count](self->_onRampList, "count"))
  {
    if (v4)
      v14 = 24;
    else
      v14 = 34;
    -[NPKeyBag setFallbackReason:](self, "setFallbackReason:", v14);
  }
  v9 = 0;
LABEL_20:

  return v9;
}

- (void)moveToNextOnRamp
{
  uint64_t v3;

  if (-[NSArray count](self->_keys, "count"))
    v3 = -[NPKeyBag index](self, "index") + 1;
  else
    v3 = 0;
  -[NPKeyBag setIndex:](self, "setIndex:", v3);
}

- (void)logWithMessage:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  unsigned int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  unsigned int v30;
  int64_t v31;
  unsigned int v32;
  int64_t v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  _BYTE v38[14];
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v36 = v7;
      v37 = 2080;
      *(_QWORD *)v38 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      _os_log_debug_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEBUG, "%@: %s:", buf, 0x16u);
    }

    -[NPKeyBag keys](self, "keys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v14 = 0;
      v15 = 1;
      *(_QWORD *)&v13 = 138413314;
      v34 = v13;
      do
      {
        -[NPKeyBag keys](self, "keys", v34);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        nplog_obj();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v17, "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "info");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "length");
          v25 = objc_msgSend(v17, "session_counter");
          *(_DWORD *)buf = v34;
          v36 = v7;
          v37 = 1024;
          *(_DWORD *)v38 = v15 - 1;
          *(_WORD *)&v38[4] = 2112;
          *(_QWORD *)&v38[6] = v22;
          v39 = 2048;
          v40 = v24;
          v41 = 1024;
          v42 = v25;
          _os_log_debug_impl(&dword_19E8FE000, v18, OS_LOG_TYPE_DEBUG, "%@:   %u. [%@] [%lu info bytes] [%u session counter]", buf, 0x2Cu);

        }
        v14 = v15;
        -[NPKeyBag keys](self, "keys");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

      }
      while (v20 > v15++);
    }
    nplog_obj();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v30 = -[NPKeyBag index](self, "index");
      *(_DWORD *)buf = 138412546;
      v36 = v7;
      v37 = 1024;
      *(_DWORD *)v38 = v30;
      _os_log_debug_impl(&dword_19E8FE000, v26, OS_LOG_TYPE_DEBUG, "%@:  Current index: %u", buf, 0x12u);
    }

    nplog_obj();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v31 = -[NPKeyBag fallbackReason](self, "fallbackReason");
      *(_DWORD *)buf = 138412546;
      v36 = v7;
      v37 = 2048;
      *(_QWORD *)v38 = v31;
      _os_log_debug_impl(&dword_19E8FE000, v27, OS_LOG_TYPE_DEBUG, "%@:  Fallback Reason: %ld", buf, 0x16u);
    }

    nplog_obj();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v32 = -[NPKeyBag generation](self, "generation");
      *(_DWORD *)buf = 138412546;
      v36 = v7;
      v37 = 1024;
      *(_DWORD *)v38 = v32;
      _os_log_debug_impl(&dword_19E8FE000, v28, OS_LOG_TYPE_DEBUG, "%@:  Generation: %u", buf, 0x12u);
    }

    nplog_obj();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v33 = -[NPKeyBag TFOStatusOverride](self, "TFOStatusOverride");
      *(_DWORD *)buf = 138412546;
      v36 = v7;
      v37 = 2048;
      *(_QWORD *)v38 = v33;
      _os_log_debug_impl(&dword_19E8FE000, v29, OS_LOG_TYPE_DEBUG, "%@:  TFO status override: %ld", buf, 0x16u);
    }

  }
}

- (double)timeSinceLastUsed
{
  double lastUsedTimestamp;
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  lastUsedTimestamp = self->_lastUsedTimestamp;
  v3 = 0.0;
  if (lastUsedTimestamp > 0.0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", lastUsedTimestamp);
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "timeIntervalSinceNow");
      if (v6 < 0.0)
      {
        objc_msgSend(v5, "timeIntervalSinceNow");
        v3 = fabs(v7);
      }
    }

  }
  return v3;
}

- (BOOL)updateHashMatchesEdgeSet:(id)a3
{
  id v4;
  NSData *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self->_updateHash;
  if (v5)
  {
    objc_msgSend(v4, "updateHash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "updateHash");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = -[NSData isEqualToData:](v5, "isEqualToData:", v7);

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (id)getOnRampForEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    do
    {
      v7 = v6;
      objc_msgSend(MEMORY[0x1E0CCEC78], "endpointWithCEndpoint:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKeyBag onRampMap](self, "onRampMap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)nw_endpoint_copy_parent_endpoint();
    }
    while (v6 && !v10);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)moveToOnRamp:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  unint64_t v12;
  id v13;

  v13 = a3;
  -[NPKeyBag onRampList](self, "onRampList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    while (1)
    {
      -[NPKeyBag onRampList](self, "onRampList");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "dayPassUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", v13);

      if (v10)
        break;

      ++v6;
      -[NPKeyBag onRampList](self, "onRampList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v6 >= v12)
        goto LABEL_7;
    }
    -[NPKeyBag setIndex:](self, "setIndex:", v6);

  }
LABEL_7:

}

- (void)removeIPv6Keys
{
  NSUInteger v3;
  NSArray *v4;
  NSArray *keys;
  unint64_t index;
  unsigned int v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_1276);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[NSArray count](self->_keys, "count");
  -[NSArray filteredArrayUsingPredicate:](self->_keys, "filteredArrayUsingPredicate:", v8);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  keys = self->_keys;
  self->_keys = v4;

  index = self->_index;
  if (v3 > index && -[NSArray count](self->_keys, "count") <= index)
  {
    if (-[NSArray count](self->_keys, "count"))
      v7 = -[NSArray count](self->_keys, "count") - 1;
    else
      v7 = 0;
    self->_index = v7;
  }

}

BOOL __26__NPKeyBag_removeIPv6Keys__block_invoke(uint64_t a1, void *a2)
{
  return (objc_msgSend(a2, "flags") & 1) == 0;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
  objc_storeStrong((id *)&self->_keys, a3);
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (int64_t)fallbackReason
{
  return self->_fallbackReason;
}

- (void)setFallbackReason:(int64_t)a3
{
  self->_fallbackReason = a3;
}

- (unsigned)generation
{
  return self->_generation;
}

- (void)setGeneration:(unsigned int)a3
{
  self->_generation = a3;
}

- (NSData)updateHash
{
  return self->_updateHash;
}

- (void)setUpdateHash:(id)a3
{
  objc_storeStrong((id *)&self->_updateHash, a3);
}

- (int64_t)TFOStatusOverride
{
  return self->_TFOStatusOverride;
}

- (void)setTFOStatusOverride:(int64_t)a3
{
  self->_TFOStatusOverride = a3;
}

- (double)lastUsedTimestamp
{
  return self->_lastUsedTimestamp;
}

- (void)setLastUsedTimestamp:(double)a3
{
  self->_lastUsedTimestamp = a3;
}

- (NSDictionary)onRampMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOnRampMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)onRampList
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setOnRampList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSPredicate)validOnRampPredicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setValidOnRampPredicate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSPredicate)validOnRampWithTFOPredicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setValidOnRampWithTFOPredicate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validOnRampWithTFOPredicate, 0);
  objc_storeStrong((id *)&self->_validOnRampPredicate, 0);
  objc_storeStrong((id *)&self->_onRampList, 0);
  objc_storeStrong((id *)&self->_onRampMap, 0);
  objc_storeStrong((id *)&self->_updateHash, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end
