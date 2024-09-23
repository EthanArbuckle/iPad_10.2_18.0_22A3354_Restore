@implementation CCItemField

+ (id)_selectorNameForDataType:(unsigned __int8)a3
{
  const char *v3;
  id result;

  switch(a3)
  {
    case 0u:
      v3 = sel_stringValue;
      goto LABEL_25;
    case 1u:
      v3 = sel_repeatedStringValue;
      goto LABEL_25;
    case 2u:
      v3 = sel_uint32Value;
      goto LABEL_25;
    case 3u:
      v3 = sel_repeatedUInt32Value;
      goto LABEL_25;
    case 4u:
      v3 = sel_uint64Value;
      goto LABEL_25;
    case 5u:
      v3 = sel_repeatedUInt64Value;
      goto LABEL_25;
    case 6u:
      v3 = sel_int32Value;
      goto LABEL_25;
    case 7u:
      v3 = sel_repeatedInt32Value;
      goto LABEL_25;
    case 8u:
      v3 = sel_int64Value;
      goto LABEL_25;
    case 9u:
      v3 = sel_repeatedInt64Value;
      goto LABEL_25;
    case 0xAu:
      v3 = sel_floatValue;
      goto LABEL_25;
    case 0xBu:
      v3 = sel_repeatedFloatValue;
      goto LABEL_25;
    case 0xCu:
      v3 = sel_doubleValue;
      goto LABEL_25;
    case 0xDu:
      v3 = sel_repeatedDoubleValue;
      goto LABEL_25;
    case 0xEu:
      v3 = sel_BOOLValue;
      goto LABEL_25;
    case 0xFu:
      v3 = sel_repeatedBoolValue;
      goto LABEL_25;
    case 0x10u:
      v3 = sel_bytesValue;
      goto LABEL_25;
    case 0x11u:
      v3 = sel_repeatedBytesValue;
      goto LABEL_25;
    case 0x12u:
      v3 = sel_subMessageValue;
      goto LABEL_25;
    case 0x13u:
      v3 = sel_repeatedSubMessageValue;
LABEL_25:
      NSStringFromSelector(v3);
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x14u:
      result = CFSTR("[your-enum-type-name]EnumValue");
      break;
    case 0x15u:
      result = CFSTR("repeated[your-enum-type-name]EnumValue");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 dataType:(unsigned __int8)a4
{
  CCItemField *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCItemField;
  result = -[CCItemField init](&v7, sel_init);
  if (result)
  {
    result->_fieldType = a3;
    result->_dataType = a4;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 stringValue:(id)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 0);
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedStringValue:(id)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 1);
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 uint32Value:(unsigned int)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 2);
  if (result)
  {
    result->_valueStorage.value.uint32Value = a4;
    result->_valueStorage.hasValue = 1;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedUInt32Value:(id)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 3);
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 uint64Value:(unint64_t)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 4);
  if (result)
  {
    result->_valueStorage.value.uint64Value = a4;
    result->_valueStorage.hasValue = 1;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedUInt64Value:(id)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 5);
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 int32Value:(int)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 6);
  if (result)
  {
    result->_valueStorage.value.uint32Value = a4;
    result->_valueStorage.hasValue = 1;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedInt32Value:(id)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 7);
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 int64Value:(int64_t)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 8);
  if (result)
  {
    result->_valueStorage.value.uint64Value = a4;
    result->_valueStorage.hasValue = 1;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedInt64Value:(id)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 9);
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 floatValue:(float)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 10);
  if (result)
  {
    result->_valueStorage.value.floatValue = a4;
    result->_valueStorage.hasValue = 1;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedFloatValue:(id)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 11);
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 doubleValue:(double)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 12);
  if (result)
  {
    result->_valueStorage.value.doubleValue = a4;
    result->_valueStorage.hasValue = 1;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedDoubleValue:(id)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 13);
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 BOOLValue:(BOOL)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 14);
  if (result)
  {
    result->_valueStorage.value.BOOLValue = a4;
    result->_valueStorage.hasValue = 1;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedBoolValue:(id)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 15);
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 bytesValue:(id)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 16);
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedBytesValue:(id)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 17);
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 subMessageValue:(id)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 18);
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedSubMessageValue:(id)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 19);
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 enumValue:(unsigned int)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 20);
  if (result)
  {
    result->_valueStorage.value.uint32Value = a4;
    result->_valueStorage.hasValue = 1;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedEnumValue:(id)a4
{
  CCItemField *result;

  result = -[CCItemField initWithFieldType:dataType:](self, "initWithFieldType:dataType:", a3, 21);
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (void)setParentMessageField:(id)a3
{
  objc_storeStrong((id *)&self->_parentMessageField, a3);
}

- (void)setRepeatedSubMessageIndex:(unsigned int)a3
{
  self->_repeatedSubMessageIndex = a3;
}

- (void)appendInvalidFieldAccessErrorForAccessedDataType:(unsigned __int8)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSError *v9;
  NSError *error;
  id v11;

  objc_msgSend((id)objc_opt_class(), "_selectorNameForDataType:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  CCStringFromItemFieldDataType(-[CCItemField dataType](self, "dataType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_selectorNameForDataType:", -[CCItemField dataType](self, "dataType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CCTypeIdentifierRegistryBridge();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptionForTypeIdentifier:", -[CCItemField fieldType](self, "fieldType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  CCMismatchedFieldAccessorErrorForField(v7, v11, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CCErrorByJoiningMismatchedFieldAccessorErrorUnderlyingErrors(self->_error, v8);
  v9 = (NSError *)objc_claimAutoreleasedReturnValue();
  error = self->_error;
  self->_error = v9;

}

- (NSObject)boxedJSONValue
{
  id v3;
  NSString *v4;
  void *v6;
  void *stringValue;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  if (!self->_valueStorage.hasValue)
    return 0;
  v3 = 0;
  switch(-[CCItemField dataType](self, "dataType"))
  {
    case 0u:
    case 1u:
    case 0x10u:
    case 0x11u:
      v4 = self->_valueStorage.value.stringValue;
      return v4;
    case 2u:
    case 0x14u:
      v4 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", self->_valueStorage.value.uint32Value);
      return v4;
    case 3u:
      v6 = (void *)objc_opt_new();
      stringValue = self->_valueStorage.value.stringValue;
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __29__CCItemField_boxedJSONValue__block_invoke;
      v39[3] = &unk_250990408;
      v3 = v6;
      v40 = v3;
      objc_msgSend(stringValue, "enumerateUInt32ValuesWithBlock:", v39);
      v8 = v40;
      goto LABEL_21;
    case 4u:
      v4 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLongLong:", self->_valueStorage.value.uint64Value);
      return v4;
    case 5u:
      v9 = (void *)objc_opt_new();
      v10 = self->_valueStorage.value.stringValue;
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __29__CCItemField_boxedJSONValue__block_invoke_2;
      v37[3] = &unk_250990430;
      v3 = v9;
      v38 = v3;
      objc_msgSend(v10, "enumerateUInt64ValuesWithBlock:", v37);
      v8 = v38;
      goto LABEL_21;
    case 6u:
      v4 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", self->_valueStorage.value.uint32Value);
      return v4;
    case 7u:
      v11 = (void *)objc_opt_new();
      v12 = self->_valueStorage.value.stringValue;
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __29__CCItemField_boxedJSONValue__block_invoke_3;
      v35[3] = &unk_250990458;
      v3 = v11;
      v36 = v3;
      objc_msgSend(v12, "enumerateInt32ValuesWithBlock:", v35);
      v8 = v36;
      goto LABEL_21;
    case 8u:
      v4 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", self->_valueStorage.value.uint64Value);
      return v4;
    case 9u:
      v13 = (void *)objc_opt_new();
      v14 = self->_valueStorage.value.stringValue;
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __29__CCItemField_boxedJSONValue__block_invoke_4;
      v33[3] = &unk_250990480;
      v3 = v13;
      v34 = v3;
      objc_msgSend(v14, "enumerateInt64ValuesWithBlock:", v33);
      v8 = v34;
      goto LABEL_21;
    case 0xAu:
      v15 = objc_alloc(MEMORY[0x24BDD16E0]);
      LODWORD(v16) = self->_valueStorage.value.uint32Value;
      v4 = (NSString *)objc_msgSend(v15, "initWithFloat:", v16);
      return v4;
    case 0xBu:
      v17 = (void *)objc_opt_new();
      v18 = self->_valueStorage.value.stringValue;
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __29__CCItemField_boxedJSONValue__block_invoke_5;
      v31[3] = &unk_2509904A8;
      v3 = v17;
      v32 = v3;
      objc_msgSend(v18, "enumerateFloatValuesWithBlock:", v31);
      v8 = v32;
      goto LABEL_21;
    case 0xCu:
      v4 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", self->_valueStorage.value.doubleValue);
      return v4;
    case 0xDu:
      v19 = (void *)objc_opt_new();
      v20 = self->_valueStorage.value.stringValue;
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __29__CCItemField_boxedJSONValue__block_invoke_6;
      v29[3] = &unk_2509904D0;
      v3 = v19;
      v30 = v3;
      objc_msgSend(v20, "enumerateDoubleValuesWithBlock:", v29);
      v8 = v30;
      goto LABEL_21;
    case 0xEu:
      v4 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", self->_valueStorage.value.BOOLValue);
      return v4;
    case 0xFu:
      v21 = (void *)objc_opt_new();
      v22 = self->_valueStorage.value.stringValue;
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __29__CCItemField_boxedJSONValue__block_invoke_7;
      v27[3] = &unk_2509904F8;
      v3 = v21;
      v28 = v3;
      objc_msgSend(v22, "enumerateBoolValuesWithBlock:", v27);
      v8 = v28;
      goto LABEL_21;
    case 0x15u:
      v23 = (void *)objc_opt_new();
      v24 = self->_valueStorage.value.stringValue;
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __29__CCItemField_boxedJSONValue__block_invoke_8;
      v25[3] = &unk_250990408;
      v3 = v23;
      v26 = v3;
      objc_msgSend(v24, "enumerateUInt32ValuesWithBlock:", v25);
      v8 = v26;
LABEL_21:

      break;
    default:
      return v3;
  }
  return v3;
}

void __29__CCItemField_boxedJSONValue__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", a2);
  objc_msgSend(v2, "addObject:", v3);

}

void __29__CCItemField_boxedJSONValue__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLongLong:", a2);
  objc_msgSend(v2, "addObject:", v3);

}

void __29__CCItemField_boxedJSONValue__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", a2);
  objc_msgSend(v2, "addObject:", v3);

}

void __29__CCItemField_boxedJSONValue__block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", a2);
  objc_msgSend(v2, "addObject:", v3);

}

void __29__CCItemField_boxedJSONValue__block_invoke_5(uint64_t a1, float a2)
{
  void *v3;
  id v4;
  double v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = objc_alloc(MEMORY[0x24BDD16E0]);
  *(float *)&v5 = a2;
  v6 = (id)objc_msgSend(v4, "initWithFloat:", v5);
  objc_msgSend(v3, "addObject:", v6);

}

void __29__CCItemField_boxedJSONValue__block_invoke_6(uint64_t a1, double a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", a2);
  objc_msgSend(v2, "addObject:", v3);

}

void __29__CCItemField_boxedJSONValue__block_invoke_7(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __29__CCItemField_boxedJSONValue__block_invoke_8(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)stringValue
{
  void *v3;

  if (-[CCItemField dataType](self, "dataType"))
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 0);
    v3 = 0;
  }
  else
  {
    v3 = (void *)-[NSString copy](self->_valueStorage.value.stringValue, "copy");
  }
  return v3;
}

- (id)repeatedStringValue
{
  void *v3;

  if (-[CCItemField dataType](self, "dataType") == 1)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_valueStorage.value.uint64Value, 1);
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 1);
    v3 = 0;
  }
  return v3;
}

- (id)stringValueNoCopy
{
  NSString *v3;

  if (-[CCItemField dataType](self, "dataType"))
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 0);
    v3 = 0;
  }
  else
  {
    v3 = self->_valueStorage.value.stringValue;
  }
  return v3;
}

- (id)repeatedStringValueNoCopy
{
  NSString *v3;

  if (-[CCItemField dataType](self, "dataType") == 1)
  {
    v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 1);
    v3 = 0;
  }
  return v3;
}

- (BOOL)hasUInt32Value
{
  if (-[CCItemField dataType](self, "dataType") == 2)
    return self->_valueStorage.hasValue;
  -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 2);
  return 0;
}

- (unsigned)uint32Value
{
  if (-[CCItemField dataType](self, "dataType") == 2)
    return self->_valueStorage.value.uint32Value;
  -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 2);
  return 0;
}

- (id)repeatedUInt32Value
{
  NSString *v3;

  if (-[CCItemField dataType](self, "dataType") == 3)
  {
    v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 3);
    v3 = 0;
  }
  return v3;
}

- (BOOL)hasUInt64Value
{
  if (-[CCItemField dataType](self, "dataType") == 4)
    return self->_valueStorage.hasValue;
  -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 4);
  return 0;
}

- (unint64_t)uint64Value
{
  if (-[CCItemField dataType](self, "dataType") == 4)
    return self->_valueStorage.value.uint64Value;
  -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 4);
  return 0;
}

- (id)repeatedUInt64Value
{
  NSString *v3;

  if (-[CCItemField dataType](self, "dataType") == 5)
  {
    v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 5);
    v3 = 0;
  }
  return v3;
}

- (BOOL)hasInt32Value
{
  if (-[CCItemField dataType](self, "dataType") == 6)
    return self->_valueStorage.hasValue;
  -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 6);
  return 0;
}

- (int)int32Value
{
  if (-[CCItemField dataType](self, "dataType") == 6)
    return self->_valueStorage.value.int32Value;
  -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 6);
  return 0;
}

- (id)repeatedInt32Value
{
  NSString *v3;

  if (-[CCItemField dataType](self, "dataType") == 7)
  {
    v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 7);
    v3 = 0;
  }
  return v3;
}

- (BOOL)hasInt64Value
{
  if (-[CCItemField dataType](self, "dataType") == 8)
    return self->_valueStorage.hasValue;
  -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 8);
  return 0;
}

- (int64_t)int64Value
{
  if (-[CCItemField dataType](self, "dataType") == 8)
    return self->_valueStorage.value.int64Value;
  -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 8);
  return 0;
}

- (id)repeatedInt64Value
{
  NSString *v3;

  if (-[CCItemField dataType](self, "dataType") == 9)
  {
    v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 9);
    v3 = 0;
  }
  return v3;
}

- (BOOL)hasFloatValue
{
  if (-[CCItemField dataType](self, "dataType") == 10)
    return self->_valueStorage.hasValue;
  -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 10);
  return 0;
}

- (float)floatValue
{
  if (-[CCItemField dataType](self, "dataType") == 10)
    return self->_valueStorage.value.floatValue;
  -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 10);
  return 0.0;
}

- (id)repeatedFloatValue
{
  NSString *v3;

  if (-[CCItemField dataType](self, "dataType") == 11)
  {
    v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 11);
    v3 = 0;
  }
  return v3;
}

- (BOOL)hasDoubleValue
{
  if (-[CCItemField dataType](self, "dataType") == 12)
    return self->_valueStorage.hasValue;
  -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 12);
  return 0;
}

- (double)doubleValue
{
  if (-[CCItemField dataType](self, "dataType") == 12)
    return self->_valueStorage.value.doubleValue;
  -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 12);
  return 0.0;
}

- (id)repeatedDoubleValue
{
  NSString *v3;

  if (-[CCItemField dataType](self, "dataType") == 13)
  {
    v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 13);
    v3 = 0;
  }
  return v3;
}

- (BOOL)hasBoolValue
{
  if (-[CCItemField dataType](self, "dataType") == 14)
    return self->_valueStorage.hasValue;
  -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 14);
  return 0;
}

- (BOOL)BOOLValue
{
  if (-[CCItemField dataType](self, "dataType") == 14)
    return self->_valueStorage.value.BOOLValue;
  -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 14);
  return 0;
}

- (id)repeatedBoolValue
{
  NSString *v3;

  if (-[CCItemField dataType](self, "dataType") == 15)
  {
    v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 14);
    v3 = 0;
  }
  return v3;
}

- (id)bytesValue
{
  void *v3;

  if (-[CCItemField dataType](self, "dataType") == 16)
  {
    v3 = (void *)-[NSString copy](self->_valueStorage.value.stringValue, "copy");
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 16);
    v3 = 0;
  }
  return v3;
}

- (id)repeatedBytesValue
{
  void *v3;

  if (-[CCItemField dataType](self, "dataType") == 17)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_valueStorage.value.uint64Value, 1);
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 17);
    v3 = 0;
  }
  return v3;
}

- (id)bytesValueNoCopy
{
  NSString *v3;

  if (-[CCItemField dataType](self, "dataType") == 16)
  {
    v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 16);
    v3 = 0;
  }
  return v3;
}

- (id)repeatedBytesValueNoCopy
{
  NSString *v3;

  if (-[CCItemField dataType](self, "dataType") == 17)
  {
    v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 17);
    v3 = 0;
  }
  return v3;
}

- (id)subMessageValue
{
  void *v3;

  if (-[CCItemField dataType](self, "dataType") == 18)
  {
    v3 = (void *)-[NSString copy](self->_valueStorage.value.stringValue, "copy");
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 18);
    v3 = 0;
  }
  return v3;
}

- (id)repeatedSubMessageValue
{
  void *v3;

  if (-[CCItemField dataType](self, "dataType") == 19)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_valueStorage.value.uint64Value, 1);
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 19);
    v3 = 0;
  }
  return v3;
}

- (id)subMessageValueNoCopy
{
  NSString *v3;

  if (-[CCItemField dataType](self, "dataType") == 18)
  {
    v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 18);
    v3 = 0;
  }
  return v3;
}

- (id)repeatedSubMessageValueNoCopy
{
  NSString *v3;

  if (-[CCItemField dataType](self, "dataType") == 19)
  {
    v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 19);
    v3 = 0;
  }
  return v3;
}

- (BOOL)hasRawEnumValue
{
  if (-[CCItemField dataType](self, "dataType") == 20)
    return self->_valueStorage.hasValue;
  -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 20);
  return 0;
}

- (unsigned)rawEnumValue
{
  if (-[CCItemField dataType](self, "dataType") == 20)
    return self->_valueStorage.value.uint32Value;
  -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 20);
  return 0;
}

- (id)repeatedRawEnumValue
{
  NSString *v3;

  if (-[CCItemField dataType](self, "dataType") == 21)
  {
    v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    -[CCItemField appendInvalidFieldAccessErrorForAccessedDataType:](self, "appendInvalidFieldAccessErrorForAccessedDataType:", 21);
    v3 = 0;
  }
  return v3;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CCTypeIdentifierRegistryBridge();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptionForTypeIdentifier:", -[CCItemField fieldType](self, "fieldType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CCItemField fieldType](self, "fieldType");
  CCStringFromItemFieldDataType(-[CCItemField dataType](self, "dataType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCItemField boxedJSONValue](self, "boxedJSONValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCItemField parentMessageField](self, "parentMessageField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ - name: %@ fieldType: %hu dataType: %@, value: %@, parentField: %@"), v5, v7, v8, v9, v10, v11);

  return v12;
}

- (unsigned)fieldType
{
  return self->_fieldType;
}

- (unsigned)dataType
{
  return self->_dataType;
}

- (CCItemField)parentMessageField
{
  return self->_parentMessageField;
}

- (unsigned)repeatedSubMessageIndex
{
  return self->_repeatedSubMessageIndex;
}

- (CCItemFieldValueStorage)valueStorage
{
  CCItemFieldValue v2;
  uint64_t v3;
  CCItemFieldValueStorage result;

  v2.stringValue = (NSString *)self->_valueStorage.value;
  v3 = *(_QWORD *)&self->_valueStorage.hasValue;
  result.value = v2;
  result.hasValue = v3;
  return result;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_parentMessageField, 0);
}

@end
