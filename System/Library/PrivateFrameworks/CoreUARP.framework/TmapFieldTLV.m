@implementation TmapFieldTLV

- (TmapFieldTLV)init
{
  -[TmapFieldTLV doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TmapFieldTLV)initWithDictionary:(id)a3 endian:(id)a4
{
  id v6;
  id v7;
  id v8;
  os_log_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  TmapFieldTLV *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)TmapFieldTLV;
  v8 = -[TmapFieldTLV init](&v19, sel_init);
  if (!v8)
    goto LABEL_8;
  v9 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
  v10 = (void *)*((_QWORD *)v8 + 4);
  *((_QWORD *)v8 + 4) = v9;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FieldName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)*((_QWORD *)v8 + 1);
  *((_QWORD *)v8 + 1) = v12;

  if (!*((_QWORD *)v8 + 1))
  {
    if (os_log_type_enabled(*((os_log_t *)v8 + 4), OS_LOG_TYPE_ERROR))
      -[TmapFieldTLV initWithDictionary:endian:].cold.1();
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(*((os_log_t *)v8 + 4), OS_LOG_TYPE_ERROR))
      -[TmapFieldTLV initWithDictionary:endian:].cold.4();
    goto LABEL_19;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FieldLength"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    if (os_log_type_enabled(*((os_log_t *)v8 + 4), OS_LOG_TYPE_ERROR))
      -[TmapFieldTLV initWithDictionary:endian:].cold.2();
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(*((os_log_t *)v8 + 4), OS_LOG_TYPE_ERROR))
      -[TmapFieldTLV initWithDictionary:endian:].cold.3();
    goto LABEL_18;
  }
  *((_QWORD *)v8 + 2) = objc_msgSend(v14, "unsignedIntValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FieldType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");

  if (!objc_msgSend(v8, "createFieldType:", v16))
  {

LABEL_18:
LABEL_19:
    v17 = 0;
    goto LABEL_20;
  }
  *((_DWORD *)v8 + 7) = objc_msgSend(v7, "isEqualToString:", CFSTR("LittleEndian"));

LABEL_8:
  v17 = (TmapFieldTLV *)v8;
LABEL_20:

  return v17;
}

- (BOOL)createFieldType:(id)a3
{
  id v4;
  BOOL v5;
  int v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Integer")))
  {
    self->_fieldType = 0;
LABEL_12:
    v5 = 1;
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("UnsignedInteger")))
  {
    v5 = 1;
    self->_fieldType = 1;
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("UTF8String")))
  {
    v6 = 2;
LABEL_11:
    self->_fieldType = v6;
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Base64EncodedString")))
  {
    v6 = 3;
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Float")))
  {
    v6 = 4;
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    -[TmapFieldTLV createFieldType:].cold.1();
  v5 = 0;
LABEL_13:

  return v5;
}

- (TmapFieldTLV)initWithCoder:(id)a3
{
  id v4;
  TmapFieldTLV *v5;
  uint64_t v6;
  NSString *fieldName;
  os_log_t v8;
  OS_os_log *log;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TmapFieldTLV;
  v5 = -[TmapFieldTLV init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FieldName"));
    v6 = objc_claimAutoreleasedReturnValue();
    fieldName = v5->_fieldName;
    v5->_fieldName = (NSString *)v6;

    v5->_fieldLength = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FieldLength"));
    v5->_fieldType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FieldType"));
    v5->_endian = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Endian"));
    v8 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
    log = v5->_log;
    v5->_log = (OS_os_log *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *fieldName;
  id v5;

  fieldName = self->_fieldName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", fieldName, CFSTR("FieldName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fieldLength, CFSTR("FieldLength"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fieldType, CFSTR("FieldType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_endian, CFSTR("Endian"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)expandFieldData:(id)a3 withOffset:(unint64_t)a4 inCoreAnalytics:(id)a5
{
  id v8;
  id v9;
  unint64_t fieldLength;
  NSObject *log;
  NSObject *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  BOOL v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  fieldLength = self->_fieldLength;
  if (__CFADD__(a4, fieldLength))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[TmapFieldTLV expandFieldData:withOffset:inCoreAnalytics:].cold.1();
    goto LABEL_15;
  }
  if (fieldLength + a4 > objc_msgSend(v8, "length"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v12 = log;
      v13 = objc_msgSend(v8, "length");
      v14 = self->_fieldLength + a4;
      v18 = 134218240;
      v19 = v13;
      v20 = 2048;
      v21 = v14;
      _os_log_error_impl(&dword_212D08000, v12, OS_LOG_TYPE_ERROR, "Length of MTIC Data(%lu) and Expected TMAP Data(%lu) do not match ", (uint8_t *)&v18, 0x16u);

    }
LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[TmapFieldTLV expandFieldData:withOffset:inCoreAnalytics:].cold.2();
    goto LABEL_15;
  }
  if (!self->_fieldName)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[TmapFieldTLV expandFieldData:withOffset:inCoreAnalytics:].cold.3();
    goto LABEL_15;
  }
  objc_msgSend(v8, "subdataWithRange:", a4, self->_fieldLength);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[TmapFieldTLV expandFieldData:inCoreAnalytics:](self, "expandFieldData:inCoreAnalytics:", v15, v9);

LABEL_16:
  return v16;
}

- (BOOL)expandFieldData:(id)a3 inCoreAnalytics:(id)a4
{
  id v6;
  id v7;
  int fieldType;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  fieldType = self->_fieldType;
  if (fieldType == 3)
  {
    v9 = -[TmapFieldTLV expandEncodedString:inCoreAnalytics:](self, "expandEncodedString:inCoreAnalytics:", v6, v7);
    goto LABEL_5;
  }
  if (fieldType == 2)
  {
    v9 = -[TmapFieldTLV expandString:inCoreAnalytics:](self, "expandString:inCoreAnalytics:", v6, v7);
LABEL_5:
    v10 = v9;
    goto LABEL_18;
  }
  -[TmapFieldTLV endianSwap:](self, "endianSwap:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[TmapFieldTLV expandFieldData:inCoreAnalytics:].cold.1();
    v10 = 0;
    goto LABEL_17;
  }
  v13 = self->_fieldType;
  switch(v13)
  {
    case 4:
      v14 = -[TmapFieldTLV expandFloat:inCoreAnalytics:](self, "expandFloat:inCoreAnalytics:", v11, v7);
      goto LABEL_16;
    case 1:
      v14 = -[TmapFieldTLV expandUnsignedInteger:inCoreAnalytics:](self, "expandUnsignedInteger:inCoreAnalytics:", v11, v7);
      goto LABEL_16;
    case 0:
      v14 = -[TmapFieldTLV expandInteger:inCoreAnalytics:](self, "expandInteger:inCoreAnalytics:", v11, v7);
LABEL_16:
      v10 = v14;
LABEL_17:

      goto LABEL_18;
  }

  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    -[TmapFieldTLV expandFieldData:inCoreAnalytics:].cold.2();
  v10 = 0;
LABEL_18:

  return v10;
}

- (BOOL)getNextOffset:(unint64_t *)a3 fromStart:(unint64_t)a4
{
  unint64_t fieldLength;
  BOOL v5;

  fieldLength = self->_fieldLength;
  v5 = __CFADD__(a4, fieldLength);
  if (!__CFADD__(a4, fieldLength))
    *a3 = fieldLength + a4;
  return !v5;
}

- (id)endianSwap:(id)a3
{
  if (self->_endian == 1)
    -[TmapFieldTLV littleEndianSwap:](self, "littleEndianSwap:", a3);
  else
    -[TmapFieldTLV bigEndianSwap:](self, "bigEndianSwap:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bigEndianSwap:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v11;
  unint64_t v12;

  v4 = a3;
  v5 = v4;
  switch(self->_fieldLength)
  {
    case 1uLL:
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithData:", v4);
      goto LABEL_10;
    case 2uLL:
      LOWORD(v12) = 0;
      objc_msgSend(v4, "getBytes:length:", &v12, 2);
      LOWORD(v11) = bswap32((unsigned __int16)v12) >> 16;
      v7 = objc_alloc(MEMORY[0x24BDBCE50]);
      v8 = 2;
      goto LABEL_9;
    case 4uLL:
      LODWORD(v12) = 0;
      objc_msgSend(v4, "getBytes:length:", &v12, 4);
      LODWORD(v11) = bswap32(v12);
      v7 = objc_alloc(MEMORY[0x24BDBCE50]);
      v8 = 4;
      goto LABEL_9;
    case 8uLL:
      v12 = 0;
      objc_msgSend(v4, "getBytes:length:", &v12, 8);
      v11 = bswap64(v12);
      v7 = objc_alloc(MEMORY[0x24BDBCE50]);
      v8 = 8;
LABEL_9:
      v6 = objc_msgSend(v7, "initWithBytes:length:", &v11, v8, v11);
LABEL_10:
      v9 = (void *)v6;
      break;
    default:
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[TmapFieldTLV bigEndianSwap:].cold.1();
      v9 = 0;
      break;
  }

  return v9;
}

- (id)littleEndianSwap:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  v5 = v4;
  switch(self->_fieldLength)
  {
    case 1uLL:
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithData:", v4);
      goto LABEL_10;
    case 2uLL:
      LOWORD(v10) = 0;
      objc_msgSend(v4, "getBytes:length:", &v10, 2);
      LOWORD(v9) = v10;
      goto LABEL_9;
    case 4uLL:
      LODWORD(v10) = 0;
      objc_msgSend(v4, "getBytes:length:", &v10, 4);
      LODWORD(v9) = v10;
      goto LABEL_9;
    case 8uLL:
      v10 = 0;
      objc_msgSend(v4, "getBytes:length:", &v10, 8);
      v9 = v10;
LABEL_9:
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v9, self->_fieldLength);
LABEL_10:
      v7 = (void *)v6;
      break;
    default:
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[TmapFieldTLV bigEndianSwap:].cold.1();
      v7 = 0;
      break;
  }

  return v7;
}

- (BOOL)expandInteger:(id)a3 inCoreAnalytics:(id)a4
{
  id v6;
  id v7;
  unint64_t *p_fieldLength;
  BOOL v9;
  void *v10;
  uint64_t v11;
  NSObject *log;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  unsigned int v22;
  __int16 v23;
  char v24;

  v6 = a3;
  v7 = a4;
  p_fieldLength = &self->_fieldLength;
  switch(self->_fieldLength)
  {
    case 1uLL:
      v24 = 0;
      v9 = 1;
      objc_msgSend(v6, "getBytes:length:", &v24, 1);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, self->_fieldName);

      break;
    case 2uLL:
      v23 = 0;
      objc_msgSend(v6, "getBytes:length:", &v23, 2);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", v23);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4uLL:
      v22 = 0;
      objc_msgSend(v6, "getBytes:length:", &v22, 4);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v22);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 8uLL:
      v21 = 0;
      objc_msgSend(v6, "getBytes:length:", &v21, 8);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v21);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v19 = (void *)v11;
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, self->_fieldName);

      v9 = 1;
      break;
    default:
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        -[TmapFieldTLV expandInteger:inCoreAnalytics:].cold.1((uint64_t)p_fieldLength, log, v13, v14, v15, v16, v17, v18);
      v9 = 0;
      break;
  }

  return v9;
}

- (BOOL)expandUnsignedInteger:(id)a3 inCoreAnalytics:(id)a4
{
  id v6;
  id v7;
  unint64_t *p_fieldLength;
  BOOL v9;
  void *v10;
  uint64_t v11;
  NSObject *log;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  unsigned int v22;
  unsigned __int16 v23;
  unsigned __int8 v24;

  v6 = a3;
  v7 = a4;
  p_fieldLength = &self->_fieldLength;
  switch(self->_fieldLength)
  {
    case 1uLL:
      v24 = 0;
      v9 = 1;
      objc_msgSend(v6, "getBytes:length:", &v24, 1);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, self->_fieldName);

      break;
    case 2uLL:
      v23 = 0;
      objc_msgSend(v6, "getBytes:length:", &v23, 2);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v23);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4uLL:
      v22 = 0;
      objc_msgSend(v6, "getBytes:length:", &v22, 4);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v22);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 8uLL:
      v21 = 0;
      objc_msgSend(v6, "getBytes:length:", &v21, 8);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v21);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v19 = (void *)v11;
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, self->_fieldName);

      v9 = 1;
      break;
    default:
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        -[TmapFieldTLV expandUnsignedInteger:inCoreAnalytics:].cold.1((uint64_t)p_fieldLength, log, v13, v14, v15, v16, v17, v18);
      v9 = 0;
      break;
  }

  return v9;
}

- (BOOL)expandFloat:(id)a3 inCoreAnalytics:(id)a4
{
  id v6;
  id v7;
  unint64_t fieldLength;
  double v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  double v14;
  int v15;

  v6 = a3;
  v7 = a4;
  fieldLength = self->_fieldLength;
  if (fieldLength == 8)
  {
    v14 = 0.0;
    objc_msgSend(v6, "getBytes:length:", &v14, 8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (fieldLength == 4)
  {
    v15 = 0;
    objc_msgSend(v6, "getBytes:length:", &v15, 4);
    LODWORD(v9) = v15;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v11 = (void *)v10;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, self->_fieldName);

    v12 = 1;
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    -[TmapFieldTLV expandFloat:inCoreAnalytics:].cold.1();
  v12 = 0;
LABEL_9:

  return v12;
}

- (BOOL)expandString:(id)a3 inCoreAnalytics:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDD17C8];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithData:encoding:", v8, 4);

  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v10, "stringWithUTF8String:", objc_msgSend(v11, "UTF8String"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, self->_fieldName);
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[TmapFieldTLV expandString:inCoreAnalytics:].cold.1();
  }

  return v12 != 0;
}

- (BOOL)expandEncodedString:(id)a3 inCoreAnalytics:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, self->_fieldName);
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[TmapFieldTLV expandEncodedString:inCoreAnalytics:].cold.1();
  }

  return v7 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
}

- (void)initWithDictionary:endian:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "TMAP Event must have Field Name.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDictionary:endian:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "TMAP Event must have Field Length.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDictionary:endian:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "TMAP Field Length must be Number.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDictionary:endian:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "TMAP Field Name must be String.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)createFieldType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "TMAP Field Type not supported.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)expandFieldData:withOffset:inCoreAnalytics:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "MTIC Event Data Offset + Field Length causes overflow.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)expandFieldData:withOffset:inCoreAnalytics:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "CA Dictionary is not defined.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)expandFieldData:withOffset:inCoreAnalytics:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "Field Name is not defined.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)expandFieldData:inCoreAnalytics:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "Failed to Endian Swap Data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)expandFieldData:inCoreAnalytics:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "MTIC Field Type not defined.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)bigEndianSwap:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "Cannot Endian Flip provided Length.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)expandInteger:(uint64_t)a3 inCoreAnalytics:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "Integer must be length: 1, 2, 4, or 8; not: %lu", a5, a6, a7, a8, 0);
}

- (void)expandUnsignedInteger:(uint64_t)a3 inCoreAnalytics:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "Unsigned Integer must be length: 1, 2, 4, or 8; not: %lu",
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)expandFloat:inCoreAnalytics:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "Floats can only be 4 or 8 Bytes.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)expandString:inCoreAnalytics:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "MTIC Event Data isn't string.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)expandEncodedString:inCoreAnalytics:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "MTIC Event Data isn't encoded string.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
