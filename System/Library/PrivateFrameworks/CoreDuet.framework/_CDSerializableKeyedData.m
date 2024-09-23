@implementation _CDSerializableKeyedData

- (BOOL)setData:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 18) = 1;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

  return a1 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_encodedKey, 0);
}

- (unint64_t)serializeTo:(unint64_t)a3 maxSize:(char *)a4 success:
{
  uint64_t v8;
  unint64_t v9;
  NSObject *v10;
  char v11;
  uint64_t v12;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (*(_BYTE *)(a1 + 18))
    *(_WORD *)(a1 + 17) = objc_msgSend((id)objc_opt_class(), "byteChecksumOfData:", *(_QWORD *)(a1 + 32));
  v8 = objc_msgSend(*(id *)(a1 + 8), "length");
  v9 = v8 + objc_msgSend(*(id *)(a1 + 32), "length") + 18;
  if (v9 <= a3)
  {
    v12 = objc_msgSend((id)a1, "serializeData:withChecksum:to:", *(_QWORD *)(a1 + 8), *(unsigned __int8 *)(a1 + 16), a2);
    v9 = objc_msgSend((id)a1, "serializeData:withChecksum:to:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 17), a2 + v12)+ v12;
    if (a4)
    {
      v11 = 1;
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 24);
      v15 = 138543874;
      v16 = v14;
      v17 = 1024;
      v18 = a3;
      v19 = 1024;
      v20 = v9;
      _os_log_error_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_ERROR, "Data for key %{public}@ does not fit in %d bytes (it is %d)", (uint8_t *)&v15, 0x18u);
    }

    if (a4)
    {
      v11 = 0;
LABEL_11:
      *a4 = v11;
    }
  }
  return v9;
}

- (unint64_t)serializeData:(id)a3 withChecksum:(unsigned __int8)a4 to:(void *)a5
{
  id v7;
  size_t v8;
  id v9;
  const void *v10;

  v7 = a3;
  v8 = objc_msgSend(v7, "length");
  *(_QWORD *)a5 = v8;
  v9 = objc_retainAutorelease(v7);
  v10 = (const void *)objc_msgSend(v9, "bytes");

  memcpy((char *)a5 + 8, v10, v8);
  *((_BYTE *)a5 + v8 + 8) = a4;
  return v8 + 9;
}

+ (unsigned)byteChecksumOfData:(id)a3
{
  id v3;
  char *v4;
  uint64_t v5;
  unsigned __int8 i;
  char v7;

  v3 = objc_retainAutorelease(a3);
  v4 = (char *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  for (i = 0; v5; --v5)
  {
    v7 = *v4++;
    i += v7;
  }

  return i;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 4, self->_data);
  *((_BYTE *)v4 + 17) = self->_dataChecksum;
  *((_BYTE *)v4 + 18) = self->_dataChecksumNeedsUpdate;
  objc_storeStrong(v4 + 3, self->_key);
  objc_storeStrong(v4 + 1, self->_encodedKey);
  *((_BYTE *)v4 + 16) = self->_keyChecksum;
  return v4;
}

+ (_CDSerializableKeyedData)keyedDataDeserializedFrom:(unint64_t)a3 maxSize:
{
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _CDSerializableKeyedData *v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  unsigned __int8 v15;

  v5 = (void *)objc_opt_self();
  if (a3 < 0x12)
    return (_CDSerializableKeyedData *)0;
  v7 = v5;
  v15 = 0;
  v14 = 0;
  objc_msgSend(v5, "dataDeseralizedFrom:maxSize:checksum:bytesRead:", a2, a3, &v15, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
    if (v9)
    {
      v13 = 0;
      v12 = 0;
      objc_msgSend(v7, "dataDeseralizedFrom:maxSize:checksum:bytesRead:", a2 + v14, a3 - v14, &v13, &v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = objc_alloc_init(_CDSerializableKeyedData);
        objc_storeStrong((id *)&v11->_key, v9);
        objc_storeStrong((id *)&v11->_encodedKey, v8);
        v11->_keyChecksum = v15;
        objc_storeStrong((id *)&v11->_data, v10);
        v11->_dataChecksum = v13;
        v11->_dataChecksumNeedsUpdate = 0;
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)initWithKey:(void *)a3 data:(_QWORD *)a4 error:
{
  id v8;
  id v9;
  id *v10;
  uint64_t v11;
  id v12;
  id *v13;
  objc_super v15;

  v8 = a2;
  v9 = a3;
  if (!a1)
    goto LABEL_9;
  v15.receiver = a1;
  v15.super_class = (Class)_CDSerializableKeyedData;
  v10 = (id *)objc_msgSendSuper2(&v15, sel_init);
  a1 = v10;
  if (v10)
  {
    objc_storeStrong(v10 + 4, a3);
    *(_WORD *)((char *)a1 + 17) = 256;
    objc_storeStrong(a1 + 3, a2);
    objc_msgSend(v8, "dataUsingEncoding:allowLossyConversion:", 4, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = a1[1];
    a1[1] = (id)v11;

    if (a1[1])
    {
      *((_BYTE *)a1 + 16) = objc_msgSend((id)objc_opt_class(), "byteChecksumOfData:", a1[1]);
      goto LABEL_5;
    }
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "errorForInvalidKeyEncoding");
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_9:
    v13 = 0;
    goto LABEL_6;
  }
LABEL_5:
  a1 = a1;
  v13 = a1;
LABEL_6:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  _CDSerializableKeyedData *v4;
  const char *v5;
  _CDSerializableKeyedData *v6;
  id Property;
  const char *v8;
  id v9;
  id v10;
  const char *v11;
  id v12;
  const char *v13;
  id v14;
  id v15;
  char v16;

  v4 = (_CDSerializableKeyedData *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      if (self)
        Property = objc_getProperty(self, v5, 32, 1);
      else
        Property = 0;
      v9 = Property;
      if (v6)
        v10 = objc_getProperty(v6, v8, 32, 1);
      else
        v10 = 0;
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        if (self)
          v12 = objc_getProperty(self, v11, 24, 1);
        else
          v12 = 0;
        v14 = v12;
        if (v6)
          v15 = objc_getProperty(v6, v13, 24, 1);
        else
          v15 = 0;
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

+ (id)errorForInvalidKeyEncoding
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2D68];
  v7[0] = CFSTR("Keys must allow NSUTF8Encoding");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.serializableKeyedData"), 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)log
{
  return +[_CDSharedMemoryKeyValueStore log]();
}

+ (id)dataDeseralizedFrom:(void *)a3 maxSize:(unint64_t)a4 checksum:(char *)a5 bytesRead:(unint64_t *)a6
{
  uint64_t v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  NSObject *v30;

  *a6 = 0;
  v8 = *(_QWORD *)a3;
  v9 = *(_QWORD *)a3 + 8;
  if (v9 > a4)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[_CDSerializableKeyedData dataDeseralizedFrom:maxSize:checksum:bytesRead:].cold.1(a4, v10, v11, v12, v13, v14, v15, v16);
LABEL_13:
    v29 = 0;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", (char *)a3 + 8, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v20 = v8 + 9;
  if (v20 > a4)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[_CDSerializableKeyedData dataDeseralizedFrom:maxSize:checksum:bytesRead:].cold.2(a4, v21, v22, v23, v24, v25, v26, v27);

    goto LABEL_13;
  }
  v28 = *((unsigned __int8 *)a3 + v9);
  if (v28 != objc_msgSend(a1, "byteChecksumOfData:", v10))
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      +[_CDSerializableKeyedData dataDeseralizedFrom:maxSize:checksum:bytesRead:].cold.3();

    goto LABEL_13;
  }
  *a6 = v20;
  *a5 = v28;
  v10 = v10;
  v29 = v10;
LABEL_14:

  return v29;
}

+ (void)dataDeseralizedFrom:(uint64_t)a3 maxSize:(uint64_t)a4 checksum:(uint64_t)a5 bytesRead:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9_3(&dword_18DDBE000, a2, a3, "Attempt to read beyond max size %d when deserializing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)dataDeseralizedFrom:(uint64_t)a3 maxSize:(uint64_t)a4 checksum:(uint64_t)a5 bytesRead:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9_3(&dword_18DDBE000, a2, a3, "Attempt to read beyond max size %d when deserializing checksum", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)dataDeseralizedFrom:maxSize:checksum:bytesRead:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Checksum does not match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
