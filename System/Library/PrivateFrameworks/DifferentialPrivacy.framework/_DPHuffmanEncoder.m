@implementation _DPHuffmanEncoder

- (_DPHuffmanEncoder)init
{

  return 0;
}

- (_DPHuffmanEncoder)initWithTableClassName:(id)a3 maxOutputBitLength:(unint64_t)a4
{
  NSString *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  Class v15;
  Class v16;
  NSDictionary *v17;
  NSDictionary *table;
  NSString *v19;
  NSString *tableUUID;
  NSNumber *v21;
  NSNumber *unknownTokenCode;
  _DPHuffmanEncoder *v23;
  NSObject *v24;
  objc_super v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v9;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[_DPLog framework](_DPLog, "framework");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[_DPHuffmanEncoder initWithTableClassName:maxOutputBitLength:].cold.1();
    goto LABEL_22;
  }
  objc_msgSend(v13, "member:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    +[_DPLog framework](_DPLog, "framework");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[_DPHuffmanEncoder initWithTableClassName:maxOutputBitLength:].cold.2();
    goto LABEL_22;
  }
  if (!a4)
  {
    +[_DPLog framework](_DPLog, "framework");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[_DPHuffmanEncoder initWithTableClassName:maxOutputBitLength:].cold.3();
    goto LABEL_22;
  }
  v26.receiver = self;
  v26.super_class = (Class)_DPHuffmanEncoder;
  self = -[_DPHuffmanEncoder init](&v26, sel_init);
  if (self)
  {
    v15 = NSClassFromString(v6);
    if (v15)
    {
      v16 = v15;
      -[objc_class getTable](v15, "getTable");
      v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      table = self->_table;
      self->_table = v17;

      -[objc_class getUUID](v16, "getUUID");
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      tableUUID = self->_tableUUID;
      self->_tableUUID = v19;

      -[objc_class getUnknownTokenCode](v16, "getUnknownTokenCode");
      v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      unknownTokenCode = self->_unknownTokenCode;
      self->_unknownTokenCode = v21;

      if (self->_table)
      {
        if (self->_tableUUID)
        {
          self->_maxOutputBitLength = a4;
          goto LABEL_9;
        }
        +[_DPLog framework](_DPLog, "framework");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[_DPHuffmanEncoder initWithTableClassName:maxOutputBitLength:].cold.6();
      }
      else
      {
        +[_DPLog framework](_DPLog, "framework");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[_DPHuffmanEncoder initWithTableClassName:maxOutputBitLength:].cold.5();
      }
    }
    else
    {
      +[_DPLog framework](_DPLog, "framework");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[_DPHuffmanEncoder initWithTableClassName:maxOutputBitLength:].cold.4();
    }
LABEL_22:

    v23 = 0;
    goto LABEL_23;
  }
LABEL_9:
  self = self;
  v23 = self;
LABEL_23:

  return v23;
}

- (BOOL)tokenExist:(id)a3
{
  void *v3;
  BOOL v4;
  NSObject *v5;

  if (a3)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_table, "objectForKeyedSubscript:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_DPHuffmanEncoder tokenExist:].cold.1();

    return 0;
  }
  return v4;
}

- (id)encodeTokens:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSNumber *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t maxOutputBitLength;
  uint64_t v19;
  NSString *tableUUID;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  __int128 v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  NSString *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(&stru_1E95DA470, "mutableCopy");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v28;
      *(_QWORD *)&v8 = 138412546;
      v25 = v8;
      v26 = v4;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](self->_table, "objectForKeyedSubscript:", v12, v25);
          v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            +[_DPLog framework](_DPLog, "framework");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              tableUUID = self->_tableUUID;
              *(_DWORD *)buf = v25;
              v32 = v12;
              v33 = 2112;
              v34 = tableUUID;
              _os_log_debug_impl(&dword_1D3FAA000, v14, OS_LOG_TYPE_DEBUG, "Token=%@ is not in our table=%@.", buf, 0x16u);
            }

            v13 = self->_unknownTokenCode;
          }
          v15 = -[NSNumber unsignedLongValue](v13, "unsignedLongValue");
          if (!v15)
          {
            +[_DPLog framework](_DPLog, "framework");
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              -[_DPHuffmanEncoder encodeTokens:].cold.2();

            v22 = 0;
            v4 = v26;
            goto LABEL_28;
          }
          +[_DPHuffmanEncoder codeToBinaryString:](_DPHuffmanEncoder, "codeToBinaryString:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            +[_DPLog framework](_DPLog, "framework");
            v23 = objc_claimAutoreleasedReturnValue();
            v4 = v26;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              -[_DPHuffmanEncoder encodeTokens:].cold.3();

            goto LABEL_25;
          }
          v17 = (void *)v16;
          maxOutputBitLength = self->_maxOutputBitLength;
          v19 = -[NSObject length](v5, "length");
          if (maxOutputBitLength < objc_msgSend(v17, "length") + v19)
          {

            v4 = v26;
            goto LABEL_27;
          }
          -[NSObject appendString:](v5, "appendString:", v17);

        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        v4 = v26;
        if (v9)
          continue;
        break;
      }
    }
LABEL_27:

    -[NSObject stringByPaddingToLength:withString:startingAtIndex:](v5, "stringByPaddingToLength:withString:startingAtIndex:", self->_maxOutputBitLength, CFSTR("0"), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_DPHuffmanEncoder tokenExist:].cold.1();
LABEL_25:
    v22 = 0;
  }
LABEL_28:

  return v22;
}

+ (id)codeToBinaryString:(unint64_t)a3
{
  char v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;

  v4 = __clz(a3);
  v5 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
  v6 = 1 << ~v4;
  do
  {
    if ((v6 & a3) != 0)
      v7 = 49;
    else
      v7 = 48;
    objc_msgSend(v5, "appendFormat:", CFSTR("%c"), v7);
    v8 = v6 >= 2;
    v6 >>= 1;
  }
  while (v8);
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

- (NSString)tableUUID
{
  return self->_tableUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableUUID, 0);
  objc_storeStrong((id *)&self->_unknownTokenCode, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

- (void)initWithTableClassName:maxOutputBitLength:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "TableName is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithTableClassName:maxOutputBitLength:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Unknown tableName=%@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithTableClassName:maxOutputBitLength:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Invalid maxOutputBitLength: 0.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithTableClassName:maxOutputBitLength:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Invalid tableName=%@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithTableClassName:maxOutputBitLength:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Cannot read table for %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithTableClassName:maxOutputBitLength:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Cannot read table UUID for %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)tokenExist:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Input tokens is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)encodeTokens:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1D3FAA000, v1, OS_LOG_TYPE_ERROR, "Encoding for token=%@ collide with end of sequence code for table=%@.", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)encodeTokens:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Can't convert code to binary string", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
