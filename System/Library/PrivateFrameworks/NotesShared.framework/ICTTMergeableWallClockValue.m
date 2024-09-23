@implementation ICTTMergeableWallClockValue

- (ICTTMergeableWallClockValue)initWithValue:(id)a3 timestamp:(id)a4
{
  id v6;
  id v7;
  ICTTMergeableWallClockValue *v8;
  uint64_t v9;
  NSObject *value;
  NSDate *v11;
  NSDate *timestamp;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICTTMergeableWallClockValue;
  v8 = -[ICTTMergeableWallClockValue init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copyWithZone:", 0);
    value = v8->_value;
    v8->_value = v9;

    if (v7)
    {
      v11 = (NSDate *)v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    timestamp = v8->_timestamp;
    v8->_timestamp = v11;

  }
  return v8;
}

- (void)setValue:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  NSObject *value;
  NSDate *v9;
  NSDate *timestamp;
  void *v11;
  id v12;

  v12 = a3;
  -[ICTTMergeableWallClockValue value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v12);

  if ((v5 & 1) == 0)
  {
    NSStringFromSelector(sel_value);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTTMergeableWallClockValue willChangeValueForKey:](self, "willChangeValueForKey:", v6);

    v7 = objc_msgSend(v12, "copyWithZone:", 0);
    value = self->_value;
    self->_value = v7;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    timestamp = self->_timestamp;
    self->_timestamp = v9;

    NSStringFromSelector(sel_value);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTTMergeableWallClockValue didChangeValueForKey:](self, "didChangeValueForKey:", v11);

  }
}

- (unint64_t)merge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[ICTTMergeableWallClockValue timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (v7 == -1)
  {
    objc_msgSend(v4, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTTMergeableWallClockValue setValue:](self, "setValue:", v9);

    objc_msgSend(v4, "timestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTTMergeableWallClockValue setTimestamp:](self, "setTimestamp:", v10);

    v8 = 2;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (ICTTMergeableWallClockValue)initWithData:(id)a3
{
  id v4;
  id v5;
  char *v6;
  int v7;
  ICTTMergeableWallClockValue *v8;
  NSObject *v9;
  _BYTE v11[56];

  v4 = a3;
  topotext::WallClockMergeableValue::WallClockMergeableValue((topotext::WallClockMergeableValue *)v11);
  v5 = objc_retainAutorelease(v4);
  v6 = (char *)objc_msgSend(v5, "bytes");
  v7 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v5, "length"));
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v11, v6, v7))
  {
    self = -[ICTTMergeableWallClockValue initWithArchive:](self, "initWithArchive:", v11);
    v8 = self;
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICTTMergeableWallClockValue initWithData:].cold.1(v9);

    v8 = 0;
  }
  topotext::WallClockMergeableValue::~WallClockMergeableValue((topotext::WallClockMergeableValue *)v11);

  return v8;
}

- (ICTTMergeableWallClockValue)initWithArchive:(const void *)a3
{
  topotext::WallClockMergeableValue *v5;
  topotext::WallClockMergeableValue *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  ICTTMergeableWallClockValue *v10;

  if ((~*((_DWORD *)a3 + 8) & 3) != 0)
  {
    v10 = 0;
  }
  else
  {
    v5 = (topotext::WallClockMergeableValue *)objc_opt_class();
    v6 = v5;
    v7 = *((_QWORD *)a3 + 6);
    if (!v7)
      v7 = *(_QWORD *)(topotext::WallClockMergeableValue::default_instance(v5) + 48);
    -[topotext::WallClockMergeableValue extractContentsFromBoxedValue:](v6, "extractContentsFromBoxedValue:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *((double *)a3 + 5));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ICTTMergeableWallClockValue initWithValue:timestamp:](self, "initWithValue:timestamp:", v8, v9);

    v10 = self;
  }

  return v10;
}

+ (id)extractContentsFromBoxedValue:(const void *)a3
{
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  id v29;

  v3 = 0;
  switch(*((_DWORD *)a3 + 12))
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *((_QWORD *)a3 + 5));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)a3 + 5));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    case 4:
      v6 = (uint64_t *)*((_QWORD *)a3 + 5);
      if (*((char *)v6 + 23) < 0)
        v6 = (uint64_t *)*v6;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    case 5:
      v7 = objc_alloc(MEMORY[0x1E0C99D50]);
      v9 = *((_DWORD *)a3 + 12);
      if (v9 == 5)
      {
        v10 = *((_QWORD *)a3 + 5);
      }
      else
      {
        v10 = google::protobuf::internal::empty_string_;
        if (!google::protobuf::internal::empty_string_)
          versioned_document::Version::SharedCtor((uint64_t)v7, v8, 0);
      }
      if (*(char *)(v10 + 23) < 0)
        v10 = *(_QWORD *)v10;
      if (v9 == 5)
      {
        v26 = *((_QWORD *)a3 + 5);
      }
      else
      {
        v26 = google::protobuf::internal::empty_string_;
        if (!google::protobuf::internal::empty_string_)
          versioned_document::Version::SharedCtor((uint64_t)v7, v8, v10);
      }
      if (*(char *)(v26 + 23) < 0)
        v27 = *(_QWORD *)(v26 + 8);
      else
        v27 = *(unsigned __int8 *)(v26 + 23);
      v5 = objc_msgSend(v7, "initWithBytes:length:", v10, v27);
      goto LABEL_36;
    case 6:
      v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
      if (*((_DWORD *)a3 + 12) == 6)
      {
        v13 = *((_QWORD *)a3 + 5);
      }
      else
      {
        v13 = google::protobuf::internal::empty_string_;
        if (!google::protobuf::internal::empty_string_)
          versioned_document::Version::SharedCtor((uint64_t)v11, v12, 0);
      }
      if (*(char *)(v13 + 23) < 0)
        v13 = *(_QWORD *)v13;
      v5 = objc_msgSend(v11, "initWithUUIDBytes:", v13);
LABEL_36:
      v3 = (void *)v5;
      break;
    case 7:
      v14 = objc_alloc(MEMORY[0x1E0C99D50]);
      v17 = topotext::BoxedValue::jsonvalue((topotext::BoxedValue *)a3, v15, v16);
      if (*(char *)(v17 + 23) >= 0)
        v20 = v17;
      else
        v20 = *(_QWORD *)v17;
      v21 = topotext::BoxedValue::jsonvalue((topotext::BoxedValue *)a3, v18, v19);
      if (*(char *)(v21 + 23) >= 0)
        v22 = *(unsigned __int8 *)(v21 + 23);
      else
        v22 = *(_QWORD *)(v21 + 8);
      v23 = (void *)objc_msgSend(v14, "initWithBytes:length:", v20, v22);
      v29 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v23, 0, &v29);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v29;
      if (v24)
      {
        v25 = os_log_create("com.apple.notes", "Topotext");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          +[ICTTMergeableWallClockValue extractContentsFromBoxedValue:].cold.4((uint64_t)v24, v25);

      }
      break;
    default:
      return v3;
  }
  return v3;
}

- (id)serialize
{
  id v2;
  void *v3;
  int v4;
  _BYTE v6[56];

  -[ICTTMergeableWallClockValue saveToArchive:](self, "saveToArchive:", v6, topotext::WallClockMergeableValue::WallClockMergeableValue((topotext::WallClockMergeableValue *)v6));
  v2 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)topotext::WallClockMergeableValue::ByteSize((topotext::WallClockMergeableValue *)v6)));
  v3 = (void *)objc_msgSend(v2, "mutableBytes");
  v4 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v2, "length"));
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v6, v3, v4);
  topotext::WallClockMergeableValue::~WallClockMergeableValue((topotext::WallClockMergeableValue *)v6);
  return v2;
}

- (void)saveToArchive:(void *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  const __CFNumber *v9;
  const __CFNumber *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  std::string *v17;
  char v18;
  void *v19;
  void *v20;
  std::string *v21;
  uint64_t v22;
  char v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  std::string __str;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  *((_DWORD *)a3 + 8) |= 2u;
  v5 = *((_QWORD *)a3 + 6);
  if (!v5)
  {
    v5 = operator new();
    topotext::BoxedValue::BoxedValue((topotext::BoxedValue *)v5);
    *((_QWORD *)a3 + 6) = v5;
  }
  -[ICTTMergeableWallClockValue value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICTTMergeableWallClockValue value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[ICTTMergeableWallClockValue value](self, "value");
    v9 = (const __CFNumber *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((isKindOfClass & 1) != 0)
    {
      if (CFNumberIsFloatType(v9))
      {
        -[__CFNumber doubleValue](v10, "doubleValue");
        v12 = v11;
        if (*(_DWORD *)(v5 + 48) != 3)
        {
          topotext::BoxedValue::clear_contents(v5);
          *(_DWORD *)(v5 + 48) = 3;
        }
        *(_QWORD *)(v5 + 40) = v12;
      }
      else
      {
        v22 = -[__CFNumber integerValue](v10, "integerValue");
        if (*(_DWORD *)(v5 + 48) != 1)
        {
          topotext::BoxedValue::clear_contents(v5);
          *(_DWORD *)(v5 + 48) = 1;
        }
        *(_QWORD *)(v5 + 40) = v22;
      }

      goto LABEL_42;
    }
    objc_opt_class();
    v13 = objc_opt_isKindOfClass();

    -[ICTTMergeableWallClockValue value](self, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((v13 & 1) != 0)
    {
      v16 = objc_retainAutorelease(v14);
      std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v16, "UTF8String"));
      if (*(_DWORD *)(v5 + 48) == 4)
      {
        v17 = *(std::string **)(v5 + 40);
      }
      else
      {
        topotext::BoxedValue::clear_contents(v5);
        *(_DWORD *)(v5 + 48) = 4;
        v17 = (std::string *)operator new();
        v17->__r_.__value_.__r.__words[0] = 0;
        v17->__r_.__value_.__l.__size_ = 0;
        v17->__r_.__value_.__r.__words[2] = 0;
        *(_QWORD *)(v5 + 40) = v17;
      }
      std::string::operator=(v17, &__str);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
LABEL_22:

      goto LABEL_42;
    }
    objc_opt_class();
    v18 = objc_opt_isKindOfClass();

    -[ICTTMergeableWallClockValue value](self, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if ((v18 & 1) != 0)
    {
      v16 = objc_retainAutorelease(v19);
      std::string::basic_string[abi:ne180100](&__str, (void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"));
      if (*(_DWORD *)(v5 + 48) == 5)
      {
        v21 = *(std::string **)(v5 + 40);
      }
      else
      {
        topotext::BoxedValue::clear_contents(v5);
        *(_DWORD *)(v5 + 48) = 5;
        v21 = (std::string *)operator new();
        v21->__r_.__value_.__r.__words[0] = 0;
        v21->__r_.__value_.__l.__size_ = 0;
        v21->__r_.__value_.__r.__words[2] = 0;
        *(_QWORD *)(v5 + 40) = v21;
      }
      std::string::operator=(v21, &__str);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      goto LABEL_22;
    }
    objc_opt_class();
    v23 = objc_opt_isKindOfClass();

    if ((v23 & 1) != 0)
    {
      -[ICTTMergeableWallClockValue value](self, "value");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_OWORD *)&__str.__r_.__value_.__l.__data_ = 0uLL;
      objc_msgSend(v24, "getUUIDBytes:", &__str);
      if (*(_DWORD *)(v5 + 48) == 6)
      {
        v25 = *(_QWORD **)(v5 + 40);
      }
      else
      {
        topotext::BoxedValue::clear_contents(v5);
        *(_DWORD *)(v5 + 48) = 6;
        v25 = (_QWORD *)operator new();
        *v25 = 0;
        v25[1] = 0;
        v25[2] = 0;
        *(_QWORD *)(v5 + 40) = v25;
      }
      MEMORY[0x1C3B7A7E8](v25, &__str, 16);

    }
    else
    {
      v26 = (void *)MEMORY[0x1E0CB36D8];
      -[ICTTMergeableWallClockValue value](self, "value");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v26) = objc_msgSend(v26, "isValidJSONObject:", v27);

      if ((_DWORD)v26)
      {
        v28 = (void *)MEMORY[0x1E0CB36D8];
        -[ICTTMergeableWallClockValue value](self, "value");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        objc_msgSend(v28, "dataWithJSONObject:options:error:", v29, 0, &v41);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v41;

        if (!v30 || v31)
        {
          v35 = os_log_create("com.apple.notes", "Topotext");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            -[ICTTMergeableWallClockValue value](self, "value");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (void *)objc_opt_class();
            LODWORD(__str.__r_.__value_.__l.__data_) = 138412546;
            *(std::string::size_type *)((char *)__str.__r_.__value_.__r.__words + 4) = (std::string::size_type)v39;
            WORD2(__str.__r_.__value_.__r.__words[1]) = 2112;
            *(std::string::size_type *)((char *)&__str.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v31;
            v40 = v39;
            _os_log_error_impl(&dword_1BD918000, v35, OS_LOG_TYPE_ERROR, "Error converting ICTTMergeableWallClockValue: %@ to JSON: %@", (uint8_t *)&__str, 0x16u);

          }
        }
        else
        {
          v32 = objc_retainAutorelease(v30);
          std::string::basic_string[abi:ne180100](&__str, (void *)objc_msgSend(v32, "bytes"), objc_msgSend(v32, "length"));
          topotext::BoxedValue::set_jsonvalue((topotext::BoxedValue *)v5, &__str);
          if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__str.__r_.__value_.__l.__data_);
        }

      }
      else
      {
        v33 = (void *)MEMORY[0x1E0D641A0];
        -[ICTTMergeableWallClockValue value](self, "value");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICTTMergeableWallClockValue saveToArchive:]", 1, 0, CFSTR("Unsupported contents type for boxing in ICTTMergeableWallClockValue: %@"), objc_opt_class());

      }
    }
  }
LABEL_42:
  -[ICTTMergeableWallClockValue timestamp](self, "timestamp");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "timeIntervalSinceReferenceDate");
  *((_DWORD *)a3 + 8) |= 1u;
  *((_QWORD *)a3 + 5) = v37;

}

+ (BOOL)canParseData:(id)a3
{
  id v3;
  id v4;
  char *v5;
  int v6;
  _BYTE v8[56];

  v3 = a3;
  topotext::WallClockMergeableValue::WallClockMergeableValue((topotext::WallClockMergeableValue *)v8);
  v4 = objc_retainAutorelease(v3);
  v5 = (char *)objc_msgSend(v4, "bytes");
  v6 = ICTTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v4, "length"));
  LOBYTE(v5) = google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v8, v5, v6);
  topotext::WallClockMergeableValue::~WallClockMergeableValue((topotext::WallClockMergeableValue *)v8);

  return (char)v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ICTTMergeableWallClockValue timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;
  -[ICTTMergeableWallClockValue value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, timestamp: %f, value: %@>"), v4, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSObject)value
{
  return self->_value;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (void)initWithData:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Corrupt protobuf data for initializing ICTTMergeableWallClockValue", v1, 2u);
}

+ (void)extractContentsFromBoxedValue:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "Error parsing JSON for ICTTMergeableWallClockValue: %@", (uint8_t *)&v2, 0xCu);
}

@end
