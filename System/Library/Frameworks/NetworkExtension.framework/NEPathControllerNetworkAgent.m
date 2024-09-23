@implementation NEPathControllerNetworkAgent

- (void)setIsForcedAdvisory:(BOOL)a3
{
  self->_isForcedAdvisory = a3;
  -[NEPathControllerNetworkAgent setUpdateClientsImmediately:](self, "setUpdateClientsImmediately:");
}

- (id)copyAgentData
{
  void *v3;
  void *v4;
  const char *v5;
  int v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  BOOL v19;
  char v20;
  char v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  uint64_t v28;
  int internalSessionType;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _DWORD v37[7];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[NEPathControllerNetworkAgent advisoryInterfaceArray](self, "advisoryInterfaceArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    goto LABEL_4;
  -[NEPathControllerNetworkAgent advisoryAgentDomain](self, "advisoryAgentDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {

LABEL_4:
    goto LABEL_5;
  }
  -[NEPathControllerNetworkAgent advisoryAgentType](self, "advisoryAgentType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "length");

  if (!v28)
  {
    *(_QWORD *)&v32 = 0;
    v30 = 0u;
    v31 = 0u;
    if (self)
    {
      objc_msgSend(objc_getProperty(self, v5, 40, 1), "getUUIDBytes:", &v30);
      internalSessionType = self->super._internalSessionType;
    }
    else
    {
      objc_msgSend(0, "getUUIDBytes:", &v30);
      internalSessionType = 0;
    }
    LODWORD(v31) = internalSessionType;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v30, 40);
    return (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_5:
  v36 = 0u;
  memset(v37, 0, sizeof(v37));
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v5, 40, 1), "getUUIDBytes:", &v30);
    v6 = self->super._internalSessionType;
  }
  else
  {
    objc_msgSend(0, "getUUIDBytes:", &v30);
    v6 = 0;
  }
  LODWORD(v31) = v6;
  -[NEPathControllerNetworkAgent advisoryInterfaceArray](self, "advisoryInterfaceArray", v30, v31, v32, v33, (_QWORD)v34);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 >= 4)
    v9 = 4;
  else
    v9 = v8;
  if (v9)
  {
    for (i = 0; i != v9; ++i)
    {
      -[NEPathControllerNetworkAgent advisoryInterfaceArray](self, "advisoryInterfaceArray");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntegerValue");

      if (v13)
      {
        -[NEPathControllerNetworkAgent advisoryInterfaceArray](self, "advisoryInterfaceArray");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (char *)&v30 + 4 * i;
        *((_DWORD *)v16 + 10) = objc_msgSend(v15, "unsignedIntegerValue");

        -[NEPathControllerNetworkAgent predictedInterfaceArray](self, "predictedInterfaceArray");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *((_DWORD *)v16 + 14) = objc_msgSend(v18, "unsignedIntegerValue");

      }
    }
  }
  v19 = -[NEPathControllerNetworkAgent weakAdvisory](self, "weakAdvisory");
  BYTE8(v34) = BYTE8(v34) & 0xFE | v19;
  if (-[NEPathControllerNetworkAgent noAdvisoryTimer](self, "noAdvisoryTimer"))
    v20 = 2;
  else
    v20 = 0;
  BYTE8(v34) = BYTE8(v34) & 0xFD | v20;
  if (-[NEPathControllerNetworkAgent preferAdvisory](self, "preferAdvisory"))
    v21 = 8;
  else
    v21 = 0;
  BYTE8(v34) = BYTE8(v34) & 0xF7 | v21;
  if (-[NEPathControllerNetworkAgent isForcedAdvisory](self, "isForcedAdvisory"))
    v22 = 4;
  else
    v22 = 0;
  BYTE8(v34) = BYTE8(v34) & 0xFB | v22;
  -[NEPathControllerNetworkAgent advisoryAgentDomain](self, "advisoryAgentDomain");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEPathControllerNetworkAgent advisoryAgentType](self, "advisoryAgentType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 && (unint64_t)objc_msgSend(v23, "length") <= 0x1F)
  {
    objc_msgSend(v23, "UTF8String");
    __strlcpy_chk();
  }
  if (v24 && (unint64_t)objc_msgSend(v24, "length") <= 0x1F)
  {
    objc_msgSend(v24, "UTF8String");
    __strlcpy_chk();
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v30, 140);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  void *v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  id Property;
  id v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CCEC20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CCECA8], "pathForClientID:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[NENetworkAgent agentDescription](self, "agentDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject parameters](v5, "parameters");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "effectiveProcessUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "UUIDString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412802;
        v22 = v15;
        v23 = 2112;
        v24 = v16;
        v25 = 2112;
        v26 = v19;
        _os_log_debug_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEBUG, "%@ asserted by: client=%@ process=%@", (uint8_t *)&v21, 0x20u);

      }
      if (!self || !objc_getProperty(self, v9, 88, 1))
      {
        v6 = 1;
        goto LABEL_15;
      }
      Property = objc_getProperty(self, v10, 88, 1);
      v12 = Property;
      -[NSObject parameters](v5, "parameters");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject effectiveProcessUUID](v8, "effectiveProcessUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, void *))Property + 2))(v12, v4, v13);

    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v20;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "Could not fetch path for assert message (client %@)", (uint8_t *)&v21, 0xCu);

    }
  }
  else
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "Assert message did not contain client UUID", (uint8_t *)&v21, 2u);
    }
    v6 = 0;
  }
LABEL_15:

  return v6;
}

- (void)unassertAgentWithOptions:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  const char *v8;
  void (**Property)(id, void *);
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CCEC20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[NENetworkAgent agentDescription](self, "agentDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "%@ unasserted by: client=%@", (uint8_t *)&v12, 0x16u);

    }
    if (self && objc_getProperty(self, v7, 96, 1))
    {
      Property = (void (**)(id, void *))objc_getProperty(self, v8, 96, 1);
      Property[2](Property, v4);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "Unassert message did not contain client UUID", (uint8_t *)&v12, 2u);
    }

  }
}

- (void)setAssertHandler:(id)a3
{
  if (self)
    objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void)setUnassertHandler:(id)a3
{
  if (self)
    objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NEPathControllerNetworkAgent)initWithAdvisoryInterface:(id)a3 advisoryMode:(unint64_t)a4
{
  id v6;
  void *v7;
  NEPathControllerNetworkAgent *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NENetworkAgent initWithConfigUUID:sessionType:name:](self, "initWithConfigUUID:sessionType:name:", v7, 5, 0);

  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NEPathControllerNetworkAgent setAdvisoryInterfaceArray:](v8, "setAdvisoryInterfaceArray:", v9);

    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NEPathControllerNetworkAgent setPredictedInterfaceArray:](v8, "setPredictedInterfaceArray:", v10);

    -[NEPathControllerNetworkAgent advisoryInterfaceArray](v8, "advisoryInterfaceArray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLong:", objc_msgSend(v6, "interfaceIndex"));
    objc_msgSend(v11, "addObject:", v12);

    -[NEPathControllerNetworkAgent predictedInterfaceArray](v8, "predictedInterfaceArray");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", &unk_1E3D03718);

    switch(a4)
    {
      case 4uLL:
        -[NEPathControllerNetworkAgent setPreferAdvisory:](v8, "setPreferAdvisory:", 1);
        break;
      case 3uLL:
        -[NEPathControllerNetworkAgent setNoAdvisoryTimer:](v8, "setNoAdvisoryTimer:", 1);
        break;
      case 2uLL:
        -[NEPathControllerNetworkAgent setWeakAdvisory:](v8, "setWeakAdvisory:", 1);
        break;
    }
  }

  return v8;
}

- (NEPathControllerNetworkAgent)initWithAdvisoryAgentDomain:(id)a3 agentType:(id)a4 advisoryMode:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NEPathControllerNetworkAgent *v11;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NENetworkAgent initWithConfigUUID:sessionType:name:](self, "initWithConfigUUID:sessionType:name:", v10, 5, 0);

  if (v11)
  {
    -[NEPathControllerNetworkAgent setAdvisoryAgentDomain:](v11, "setAdvisoryAgentDomain:", v8);
    -[NEPathControllerNetworkAgent setAdvisoryAgentType:](v11, "setAdvisoryAgentType:", v9);
    switch(a5)
    {
      case 4uLL:
        -[NEPathControllerNetworkAgent setPreferAdvisory:](v11, "setPreferAdvisory:", 1);
        break;
      case 3uLL:
        -[NEPathControllerNetworkAgent setNoAdvisoryTimer:](v11, "setNoAdvisoryTimer:", 1);
        break;
      case 2uLL:
        -[NEPathControllerNetworkAgent setWeakAdvisory:](v11, "setWeakAdvisory:", 1);
        break;
    }
  }

  return v11;
}

- (BOOL)updateClientsImmediately
{
  return self->updateClientsImmediately;
}

- (void)setUpdateClientsImmediately:(BOOL)a3
{
  self->updateClientsImmediately = a3;
}

- (BOOL)isForcedAdvisory
{
  return self->_isForcedAdvisory;
}

- (NSMutableArray)predictedInterfaceArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPredictedInterfaceArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableArray)advisoryInterfaceArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAdvisoryInterfaceArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)advisoryAgentDomain
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAdvisoryAgentDomain:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)advisoryAgentType
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAdvisoryAgentType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)weakAdvisory
{
  return self->_weakAdvisory;
}

- (void)setWeakAdvisory:(BOOL)a3
{
  self->_weakAdvisory = a3;
}

- (BOOL)noAdvisoryTimer
{
  return self->_noAdvisoryTimer;
}

- (void)setNoAdvisoryTimer:(BOOL)a3
{
  self->_noAdvisoryTimer = a3;
}

- (BOOL)preferAdvisory
{
  return self->_preferAdvisory;
}

- (void)setPreferAdvisory:(BOOL)a3
{
  self->_preferAdvisory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advisoryAgentType, 0);
  objc_storeStrong((id *)&self->_advisoryAgentDomain, 0);
  objc_storeStrong((id *)&self->_advisoryInterfaceArray, 0);
  objc_storeStrong((id *)&self->_predictedInterfaceArray, 0);
  objc_storeStrong(&self->_internalUnassertHandler, 0);
  objc_storeStrong(&self->_internalAssertHandler, 0);
}

+ (id)agentType
{
  return CFSTR("PathController");
}

+ (id)agentFromData:(id)a3
{
  id v3;
  uint64_t v4;
  NEPathControllerNetworkAgent *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NEPathControllerNetworkAgent *v9;
  id v10;
  id v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 140)
  {
    v4 = objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v5 = [NEPathControllerNetworkAgent alloc];
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v4);
    v7 = *(unsigned int *)(v4 + 16);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4 + 20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NENetworkAgent initWithConfigUUID:sessionType:name:](v5, "initWithConfigUUID:sessionType:name:", v6, v7, v8);

    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NEPathControllerNetworkAgent setAdvisoryInterfaceArray:](v9, "setAdvisoryInterfaceArray:", v10);

    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NEPathControllerNetworkAgent setPredictedInterfaceArray:](v9, "setPredictedInterfaceArray:", v11);

    for (i = 0; i != 16; i += 4)
    {
      v13 = v4 + i;
      if (*(_DWORD *)(v4 + i + 40))
      {
        -[NEPathControllerNetworkAgent advisoryInterfaceArray](v9, "advisoryInterfaceArray");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLong:", *(unsigned int *)(v13 + 40));
        objc_msgSend(v14, "addObject:", v15);

        -[NEPathControllerNetworkAgent predictedInterfaceArray](v9, "predictedInterfaceArray");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLong:", *(unsigned int *)(v13 + 56));
        objc_msgSend(v16, "addObject:", v17);

      }
    }
    -[NEPathControllerNetworkAgent setWeakAdvisory:](v9, "setWeakAdvisory:", *(_BYTE *)(v4 + 72) & 1);
    -[NEPathControllerNetworkAgent setNoAdvisoryTimer:](v9, "setNoAdvisoryTimer:", (*(unsigned __int8 *)(v4 + 72) >> 1) & 1);
    -[NEPathControllerNetworkAgent setIsForcedAdvisory:](v9, "setIsForcedAdvisory:", (*(unsigned __int8 *)(v4 + 72) >> 2) & 1);
    -[NEPathControllerNetworkAgent setPreferAdvisory:](v9, "setPreferAdvisory:", (*(unsigned __int8 *)(v4 + 72) >> 3) & 1);
    if (*(_BYTE *)(v4 + 73))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4 + 73);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEPathControllerNetworkAgent setAdvisoryAgentDomain:](v9, "setAdvisoryAgentDomain:", v18);

    }
    v20 = *(unsigned __int8 *)(v4 + 105);
    v19 = v4 + 105;
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEPathControllerNetworkAgent setAdvisoryAgentType:](v9, "setAdvisoryAgentType:", v21);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
