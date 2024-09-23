@implementation NEIKEv2DeletePayload

- (unint64_t)type
{
  return 42;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  SEL v9;
  id Property;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("Payload Type"), v5, a4);

  if (self)
  {
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", self->_protocol, CFSTR("Protocol"), v5, a4);
    Property = objc_getProperty(self, v9, 32, 1);
  }
  else
  {
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", 0, CFSTR("Protocol"), v5, a4);
    Property = 0;
  }
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("SPIs"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEIKEv2DeletePayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (BOOL)hasRequiredFields
{
  if (self)
    LOBYTE(self) = self->_protocol != 0;
  return (char)self;
}

- (BOOL)generatePayloadData
{
  const char *v3;
  const char *v5;
  unint64_t protocol;
  const char *v7;
  void *v8;
  SEL v9;
  SEL v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  int v24;
  uint8_t buf[4];
  int v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    if (objc_getProperty(self, a2, 16, 1))
      return objc_getProperty(self, v3, 16, 1) != 0;
    if (-[NEIKEv2DeletePayload hasRequiredFields](self, "hasRequiredFields"))
    {
      v24 = 0;
      protocol = self->_protocol;
      v24 = protocol;
      if (protocol == 3)
      {
        BYTE1(v24) = 4;
        HIWORD(v24) = bswap32(objc_msgSend(objc_getProperty(self, v5, 32, 1), "count")) >> 16;
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 4 * objc_msgSend(objc_getProperty(self, v9, 32, 1), "count") + 4);
        objc_msgSend(v8, "appendBytes:length:", &v24, 4);
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = objc_getProperty(self, v10, 32, 1);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v21 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
              *(_DWORD *)buf = 0;
              *(_DWORD *)buf = objc_msgSend(v16, "value", (_QWORD)v20);
              objc_msgSend(v8, "appendBytes:length:", buf, 4);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
          }
          while (v13);
        }

        goto LABEL_16;
      }
      if (protocol == 1)
      {
        BYTE1(v24) = 0;
        HIWORD(v24) = 0;
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v24, 4);
LABEL_16:
        objc_setProperty_atomic(self, v7, v8, 16);

        return objc_getProperty(self, v3, 16, 1) != 0;
      }
      goto LABEL_19;
    }
LABEL_21:
    ne_log_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "Delete payload missing required fields", buf, 2u);
    }

    return 0;
  }
  if ((objc_msgSend(0, "hasRequiredFields") & 1) == 0)
    goto LABEL_21;
  v24 = 0;
LABEL_19:
  ne_log_obj();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    if (self)
      v19 = self->_protocol;
    else
      LODWORD(v19) = 0;
    *(_DWORD *)buf = 67109120;
    v26 = v19;
    _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, "Unsupported DELETE protocol type %u", buf, 8u);
  }

  return 0;
}

- (BOOL)parsePayloadData
{
  const char *v3;
  const char *v4;
  NSObject *v5;
  const char *v6;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  const char *v12;
  id v13;
  NEIKEv2ESPSPI *v14;
  SEL v15;
  const char *v16;
  void *v17;
  SEL v18;
  NSObject *v19;
  int v20;
  NEIKEv2ESPSPI *v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!self || !objc_getProperty(self, a2, 16, 1))
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[NEIKEv2DeletePayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_23;
    }
LABEL_7:

    return 0;
  }
  if ((unint64_t)objc_msgSend(objc_getProperty(self, v3, 16, 1), "length") <= 3)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[NEIKEv2DeletePayload parsePayloadData]";
      v6 = "%s called with null (self.payloadData.length >= sizeof(ikev2_payload_delete_hdr_t))";
LABEL_23:
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, v6, buf, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v20 = 0;
  objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v20, 4);
  v9 = v20;
  self->_protocol = v20;
  if (v9 == 3)
  {
    if (BYTE1(v20) == 4)
    {
      if (HIWORD(v20))
      {
        v10 = 0;
        v11 = 4;
        do
        {
          if (objc_msgSend(objc_getProperty(self, v8, 16, 1), "length") < v11)
            break;
          v13 = objc_getProperty(self, v12, 16, 1);
          v14 = -[NEIKEv2ESPSPI initWithValue:]([NEIKEv2ESPSPI alloc], "initWithValue:", *(unsigned int *)(objc_msgSend(v13, "bytes") + 4 * v10 + 4));
          if (objc_getProperty(self, v15, 32, 1))
          {
            objc_msgSend(objc_getProperty(self, v16, 32, 1), "arrayByAddingObject:", v14);
          }
          else
          {
            v21 = v14;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
          }
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setProperty_atomic(self, v18, v17, 32);

          ++v10;
          v11 += 4;
        }
        while (v10 < bswap32(HIWORD(v20)) >> 16);
      }
    }
    else
    {
      ne_log_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = BYTE1(v20);
        _os_log_error_impl(&dword_19BD16000, v19, OS_LOG_TYPE_ERROR, "Invalid DELETE SPI length %u", buf, 8u);
      }

    }
  }
  return -[NEIKEv2DeletePayload hasRequiredFields](self, "hasRequiredFields");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spis, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("Delete");
}

@end
