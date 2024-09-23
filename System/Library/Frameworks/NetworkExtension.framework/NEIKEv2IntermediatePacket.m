@implementation NEIKEv2IntermediatePacket

- (void)gatherPayloads
{
  const char *v3;
  const char *v4;
  SEL v5;
  SEL v6;
  id newValue;

  newValue = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self)
  {
    if (objc_getProperty(self, v3, 88, 1))
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v4, 88, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v4, 64, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v5, 56, 1));
    objc_setProperty_atomic(self, v6, newValue, 80);
  }
  else
  {
    objc_msgSend(newValue, "addObjectsFromArray:", 0);
    objc_msgSend(newValue, "addObjectsFromArray:", 0);
  }

}

- (void)filloutPayloads
{
  NEIKEv2IntermediatePacket *v2;
  NEIKEv2IntermediatePacket *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  NEIKEv2IntermediatePacket *v16;
  void *v17;
  ptrdiff_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v2 = self;
  v26 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  if (self)
    self = (NEIKEv2IntermediatePacket *)objc_getProperty(self, a2, 80, 1);
  v3 = self;
  v4 = -[NEIKEv2IntermediatePacket countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v2 && objc_getProperty(v2, v10, 64, 1))
            {
              objc_msgSend(objc_getProperty(v2, v11, 64, 1), "arrayByAddingObject:", v8);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_20;
            }
            v24 = v8;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1, (_QWORD)v19);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v2)
            {
LABEL_20:
              v16 = v2;
              v17 = v13;
              v18 = 64;
              goto LABEL_23;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_25;
            if (v2 && objc_getProperty(v2, v14, 56, 1))
            {
              objc_msgSend(objc_getProperty(v2, v15, 56, 1), "arrayByAddingObject:", v8);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v23 = v8;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1, (_QWORD)v19);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v2)
                goto LABEL_24;
            }
            v16 = v2;
            v17 = v13;
            v18 = 56;
LABEL_23:
            objc_setProperty_atomic(v16, v12, v17, v18);
          }
LABEL_24:

          goto LABEL_25;
        }
        if (v2)
          objc_setProperty_atomic(v2, v9, v8, 88);
LABEL_25:
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NEIKEv2IntermediatePacket countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAuthenticatedData, 0);
  objc_storeStrong((id *)&self->_ke, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("IKE_INTERMEDIATE");
}

+ (unint64_t)exchangeType
{
  return 43;
}

- (id)authenticatedData
{
  void *v2;
  const char *v3;
  const char *v4;
  id Property;
  const char *v6;
  const char *v7;
  id v8;
  const char *v9;
  const char *v10;
  id v11;
  const char *v12;
  id v13;
  SEL v14;
  id v15;
  const char *v16;
  id v17;
  int v18;
  uint64_t v19;
  void *v20;
  SEL v21;
  NSObject *v22;
  const char *v23;
  NSObject *v25;
  int v26;
  uint8_t v27[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int128 buf;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = a1;
    if (objc_getProperty(a1, a2, 96, 1))
    {
LABEL_3:
      a1 = objc_getProperty(v2, v3, 96, 1);
      return a1;
    }
    if (objc_getProperty(v2, v3, 48, 1))
    {
      Property = objc_getProperty(v2, v4, 48, 1);
      if (Property && objc_getProperty(Property, v6, 24, 1))
      {
        v8 = objc_getProperty(v2, v7, 48, 1);
        if (v8 && objc_getProperty(v8, v9, 16, 1))
        {
          v11 = objc_getProperty(v2, v10, 48, 1);
          if (v11)
            v11 = objc_getProperty(v11, v12, 24, 1);
          v13 = v11;
          v15 = objc_getProperty(v2, v14, 48, 1);
          if (v15)
            v15 = objc_getProperty(v15, v16, 16, 1);
          v17 = v15;
          buf = 0uLL;
          v33 = 0;
          v32 = 0;
          v26 = 0;
          if ((unint64_t)objc_msgSend(v13, "length") > 0x1F)
          {
            objc_msgSend(v13, "getBytes:range:", &buf, 0, 28);
            objc_msgSend(v13, "getBytes:range:", &v26, 28, 4);
            v18 = objc_msgSend(v17, "length");
            HIWORD(v26) = bswap32(v18 + 4) >> 16;
            v19 = (unsigned __int16)(v18 + 4) + 28;
            v33 = bswap32(v19);
            LOBYTE(v32) = 46;
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v19);
            objc_msgSend(v20, "appendBytes:length:", &buf, 28);
            objc_msgSend(v20, "appendBytes:length:", &v26, 4);
            objc_msgSend(v20, "appendData:", v17);
            objc_setProperty_atomic(v2, v21, v20, 96);

            goto LABEL_3;
          }
          ne_log_obj();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v27 = 134218240;
            v28 = objc_msgSend(v13, "length");
            v29 = 2048;
            v30 = 32;
            _os_log_fault_impl(&dword_19BD16000, v25, OS_LOG_TYPE_FAULT, "Authenticated header length %zu < minimum length %zu", v27, 0x16u);
          }

LABEL_23:
          a1 = 0;
          return a1;
        }
        ne_log_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          LODWORD(buf) = 136315138;
          *(_QWORD *)((char *)&buf + 4) = "-[NEIKEv2IntermediatePacket authenticatedData]";
          v23 = "%s called with null self.encryptedPayload.payloadData";
          goto LABEL_21;
        }
LABEL_22:

        goto LABEL_23;
      }
      ne_log_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        goto LABEL_22;
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[NEIKEv2IntermediatePacket authenticatedData]";
      v23 = "%s called with null self.encryptedPayload.authenticatedHeaders";
    }
    else
    {
      ne_log_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        goto LABEL_22;
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[NEIKEv2IntermediatePacket authenticatedData]";
      v23 = "%s called with null self.encryptedPayload";
    }
LABEL_21:
    _os_log_fault_impl(&dword_19BD16000, v22, OS_LOG_TYPE_FAULT, v23, (uint8_t *)&buf, 0xCu);
    goto LABEL_22;
  }
  return a1;
}

@end
