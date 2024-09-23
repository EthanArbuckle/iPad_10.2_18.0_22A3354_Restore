@implementation _CPValue

- (void)clearKind
{
  NSString *string_value;
  _CPStruct *struct_value;
  _CPListValue *list_value;
  NSData *bytes_value;

  self->_whichKind = 0;
  self->_null_value = 0;
  self->_number_value = 0.0;
  string_value = self->_string_value;
  self->_string_value = 0;

  self->_BOOL_value = 0;
  struct_value = self->_struct_value;
  self->_struct_value = 0;

  list_value = self->_list_value;
  self->_list_value = 0;

  bytes_value = self->_bytes_value;
  self->_bytes_value = 0;

}

- (void)setNull_value:(int)a3
{
  -[_CPValue clearKind](self, "clearKind");
  self->_whichKind = 1;
  self->_null_value = a3;
}

- (int)null_value
{
  if (self->_whichKind == 1)
    return self->_null_value;
  else
    return 0;
}

- (void)setNumber_value:(double)a3
{
  -[_CPValue clearKind](self, "clearKind");
  self->_whichKind = 2;
  self->_number_value = a3;
}

- (double)number_value
{
  double result;

  result = 0.0;
  if (self->_whichKind == 2)
    return self->_number_value;
  return result;
}

- (void)setString_value:(id)a3
{
  unint64_t v4;
  NSString *v5;
  NSString *string_value;
  id v7;

  v7 = a3;
  -[_CPValue clearKind](self, "clearKind");
  v4 = 3;
  if (!v7)
    v4 = 0;
  self->_whichKind = v4;
  v5 = (NSString *)objc_msgSend(v7, "copy");
  string_value = self->_string_value;
  self->_string_value = v5;

}

- (NSString)string_value
{
  if (self->_whichKind == 3)
    return self->_string_value;
  else
    return (NSString *)0;
}

- (void)setBool_value:(BOOL)a3
{
  -[_CPValue clearKind](self, "clearKind");
  self->_whichKind = 4;
  self->_BOOL_value = a3;
}

- (BOOL)BOOL_value
{
  return self->_whichKind == 4 && self->_BOOL_value;
}

- (void)setStruct_value:(id)a3
{
  _CPStruct *v4;
  unint64_t v5;
  _CPStruct *struct_value;

  v4 = (_CPStruct *)a3;
  -[_CPValue clearKind](self, "clearKind");
  v5 = 5;
  if (!v4)
    v5 = 0;
  self->_whichKind = v5;
  struct_value = self->_struct_value;
  self->_struct_value = v4;

}

- (_CPStruct)struct_value
{
  if (self->_whichKind == 5)
    return self->_struct_value;
  else
    return (_CPStruct *)0;
}

- (void)setList_value:(id)a3
{
  _CPListValue *v4;
  unint64_t v5;
  _CPListValue *list_value;

  v4 = (_CPListValue *)a3;
  -[_CPValue clearKind](self, "clearKind");
  v5 = 6;
  if (!v4)
    v5 = 0;
  self->_whichKind = v5;
  list_value = self->_list_value;
  self->_list_value = v4;

}

- (_CPListValue)list_value
{
  if (self->_whichKind == 6)
    return self->_list_value;
  else
    return (_CPListValue *)0;
}

- (void)setBytes_value:(id)a3
{
  unint64_t v4;
  NSData *v5;
  NSData *bytes_value;
  id v7;

  v7 = a3;
  -[_CPValue clearKind](self, "clearKind");
  v4 = 7;
  if (!v7)
    v4 = 0;
  self->_whichKind = v4;
  v5 = (NSData *)objc_msgSend(v7, "copy");
  bytes_value = self->_bytes_value;
  self->_bytes_value = v5;

}

- (NSData)bytes_value
{
  if (self->_whichKind == 7)
    return self->_bytes_value;
  else
    return (NSData *)0;
}

- (BOOL)readFrom:(id)a3
{
  return _CPValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[_CPValue null_value](self, "null_value"))
    PBDataWriterWriteInt32Field();
  -[_CPValue number_value](self, "number_value");
  if (v4 != 0.0)
    PBDataWriterWriteDoubleField();
  -[_CPValue string_value](self, "string_value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if (-[_CPValue BOOL_value](self, "BOOL_value"))
    PBDataWriterWriteBOOLField();
  -[_CPValue struct_value](self, "struct_value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_CPValue struct_value](self, "struct_value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPValue list_value](self, "list_value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_CPValue list_value](self, "list_value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPValue bytes_value](self, "bytes_value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v12;
  if (v10)
  {
    PBDataWriterWriteDataField();
    v11 = v12;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int null_value;
  double number_value;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int BOOL_value;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  BOOL v31;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  null_value = self->_null_value;
  if (null_value != objc_msgSend(v4, "null_value"))
    goto LABEL_25;
  number_value = self->_number_value;
  objc_msgSend(v4, "number_value");
  if (number_value != v7)
    goto LABEL_25;
  -[_CPValue string_value](self, "string_value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string_value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
    goto LABEL_24;
  -[_CPValue string_value](self, "string_value");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[_CPValue string_value](self, "string_value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "string_value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (!v14)
      goto LABEL_25;
  }
  else
  {

  }
  BOOL_value = self->_BOOL_value;
  if (BOOL_value != objc_msgSend(v4, "BOOL_value"))
    goto LABEL_25;
  -[_CPValue struct_value](self, "struct_value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "struct_value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
    goto LABEL_24;
  -[_CPValue struct_value](self, "struct_value");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[_CPValue struct_value](self, "struct_value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "struct_value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (!v20)
      goto LABEL_25;
  }
  else
  {

  }
  -[_CPValue list_value](self, "list_value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "list_value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
    goto LABEL_24;
  -[_CPValue list_value](self, "list_value");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_CPValue list_value](self, "list_value");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "list_value");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_25;
  }
  else
  {

  }
  -[_CPValue bytes_value](self, "bytes_value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bytes_value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
  {
LABEL_24:

    goto LABEL_25;
  }
  -[_CPValue bytes_value](self, "bytes_value");
  v26 = objc_claimAutoreleasedReturnValue();
  if (!v26)
  {

LABEL_28:
    v31 = 1;
    goto LABEL_26;
  }
  v27 = (void *)v26;
  -[_CPValue bytes_value](self, "bytes_value");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bytes_value");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "isEqual:", v29);

  if ((v30 & 1) != 0)
    goto LABEL_28;
LABEL_25:
  v31 = 0;
LABEL_26:

  return v31;
}

- (unint64_t)hash
{
  double number_value;
  uint64_t v4;
  double v5;
  long double v6;
  unint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  number_value = self->_number_value;
  v4 = 2654435761 * self->_null_value;
  v5 = -number_value;
  if (number_value >= 0.0)
    v5 = self->_number_value;
  v6 = round(v5);
  v7 = (unint64_t)(fmod(v6, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v5 - v6, 0x40uLL);
  v8 = -[NSString hash](self->_string_value, "hash");
  v9 = 2654435761 * self->_BOOL_value;
  v10 = -[_CPStruct hash](self->_struct_value, "hash");
  v11 = -[_CPListValue hash](self->_list_value, "hash");
  return v8 ^ v4 ^ v9 ^ v10 ^ v11 ^ -[NSData hash](self->_bytes_value, "hash") ^ v7;
}

- (unint64_t)whichKind
{
  return self->_whichKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bytes_value, 0);
  objc_storeStrong((id *)&self->_list_value, 0);
  objc_storeStrong((id *)&self->_struct_value, 0);
  objc_storeStrong((id *)&self->_string_value, 0);
}

- (_CPValue)initWithFacade:(id)a3
{
  id v4;
  _CPValue *v5;
  void *v6;
  int v7;
  id v8;
  _CPStruct *v9;
  id v10;
  _CPValue *v11;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_CPValue init](self, "init");
  if (v5)
  {
    if (v4
      && (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v4, "isEqual:", v6),
          v6,
          !v7))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v4;
        v9 = -[_CPStruct initWithFacade:]([_CPStruct alloc], "initWithFacade:", v8);

        -[_CPValue setStruct_value:](v5, "setStruct_value:", v9);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v4;
          v9 = -[_CPListValue initWithFacade:]([_CPListValue alloc], "initWithFacade:", v10);

          -[_CPValue setList_value:](v5, "setList_value:", v9);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[_CPValue setString_value:](v5, "setString_value:", v4);
            goto LABEL_10;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = (_CPStruct *)objc_retainAutorelease(v4);
            if (!strcmp((const char *)-[_CPStruct objCType](v9, "objCType"), "B"))
            {
              -[_CPValue setBool_value:](v5, "setBool_value:", -[_CPStruct BOOLValue](v9, "BOOLValue"));
            }
            else
            {
              -[_CPStruct doubleValue](v9, "doubleValue");
              -[_CPValue setNumber_value:](v5, "setNumber_value:");
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[_CPValue setBytes_value:](v5, "setBytes_value:", v4);
              goto LABEL_10;
            }
            PARLogHandleForCategory();
            v9 = (_CPStruct *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_DEBUG))
            {
              v14 = 138412290;
              v15 = (id)objc_opt_class();
              v13 = v15;
              _os_log_debug_impl(&dword_19A825000, &v9->super.super, OS_LOG_TYPE_DEBUG, "Don't know how to encode %@ as a _CPValue", (uint8_t *)&v14, 0xCu);

            }
          }
        }
      }

    }
    else
    {
      -[_CPValue setNull_value:](v5, "setNull_value:", 0);
    }
LABEL_10:
    v11 = v5;
  }

  return v5;
}

@end
