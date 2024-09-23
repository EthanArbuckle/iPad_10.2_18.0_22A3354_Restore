@implementation IMMessagePartGUID

- (IMMessagePartGUID)init
{

  return 0;
}

- (IMMessagePartGUID)initWithEncodedMessagePartGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  IMMessagePartGUID *v15;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _OWORD v21[3];
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
  {
    IMLogHandleForCategory("IMMessagePartGUID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_19E36C2A0(v7, v8, v9, v10, v11, v12, v13, v14);

    goto LABEL_9;
  }
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  if (!-[IMMessagePartGUID decodeRangesWithEncodedGuid:ranges:](self, "decodeRangesWithEncodedGuid:ranges:", v5, &v22))
  {
LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  if (*((_QWORD *)&v22 + 1))
  {
    objc_msgSend(v5, "substringWithRange:", (_QWORD)v22);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (*((_QWORD *)&v24 + 1))
  {
    objc_msgSend(v5, "substringWithRange:", (_QWORD)v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  if (*((_QWORD *)&v23 + 1))
  {
    objc_msgSend(v5, "substringWithRange:", (_QWORD)v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18 && objc_msgSend(v18, "length"))
      v20 = objc_msgSend(v19, "unsignedIntValue");
    else
      v20 = 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v20 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v21[0] = v22;
  v21[1] = v23;
  v21[2] = v24;
  self = -[IMMessagePartGUID initWithEncodedMessagePartGUID:messageGUID:prefix:partNumber:ranges:](self, "initWithEncodedMessagePartGUID:messageGUID:prefix:partNumber:ranges:", v5, v17, v6, v20, v21);

  v15 = self;
LABEL_10:

  return v15;
}

- (BOOL)decodeRangesWithEncodedGuid:(id)a3 ranges:(IMMessagePartRanges *)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  int v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    a4->partNumberRange = 0u;
    a4->messageGUIDRange = 0u;
    a4->prefixRange = 0u;
    if (!objc_msgSend(v5, "length"))
      goto LABEL_18;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v12 = objc_msgSend(v6, "characterAtIndex:", v7);
      if (v12 == 58)
        v13 = v7;
      else
        v13 = v10;
      if (v12 == 58)
        v14 = v7;
      else
        v14 = v11;
      if (v12 == 47)
        v9 = v11 + 1;
      else
        v10 = v13;
      if (v12 == 47)
      {
        v8 = ~v11 + v7;
        v11 = v7;
      }
      else
      {
        v11 = v14;
      }
      ++v7;
    }
    while (v7 < objc_msgSend(v6, "length"));
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = objc_msgSend(v6, "length");
      a4->prefixRange.location = 0;
      a4->prefixRange.length = v10;
      a4->partNumberRange.location = v9;
      a4->partNumberRange.length = v8;
      a4->messageGUIDRange.location = v11 + 1;
      a4->messageGUIDRange.length = v15 + ~v11;
      LOBYTE(a4) = 1;
    }
    else
    {
LABEL_18:
      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

- (IMMessagePartGUID)initWithMessageGUID:(id)a3 prefix:(id)a4 partNumber:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  IMMessagePartGUID *v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "encodeMessagePartGUID:prefix:partNumber:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[IMMessagePartGUID initWithEncodedMessagePartGUID:](self, "initWithEncodedMessagePartGUID:", v10);
  return v11;
}

- (IMMessagePartGUID)initWithEncodedMessagePartGUID:(id)a3 messageGUID:(id)a4 prefix:(id)a5 partNumber:(unint64_t)a6 ranges:(IMMessagePartRanges *)a7
{
  id v12;
  id v13;
  id v14;
  IMMessagePartGUID *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSString *encodedMessagePartGUID;
  uint64_t v20;
  NSString *messageGUID;
  uint64_t v22;
  NSString *prefix;
  _NSRange prefixRange;
  _NSRange partNumberRange;
  IMMessagePartGUID *v26;
  NSObject *v27;
  NSObject *v29;
  void *v30;
  void *v31;
  objc_super v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v32.receiver = self;
  v32.super_class = (Class)IMMessagePartGUID;
  v15 = -[IMMessagePartGUID init](&v32, sel_init);
  if (!v15)
    goto LABEL_11;
  if (!v12
    || (v16 = objc_msgSend(v12, "length"), !v14)
    || !v16
    || (v17 = objc_msgSend(v14, "length"), !v13)
    || !v17
    || !objc_msgSend(v13, "length"))
  {
    IMLogHandleForCategory("IMMessagePartGUID");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v34 = v12;
      v35 = 2112;
      v36 = v13;
      v37 = 2112;
      v38 = v14;
      _os_log_error_impl(&dword_19E239000, v27, OS_LOG_TYPE_ERROR, "Failed to create IMMessagePartGuid with input: encodedMessagePartGUID: %@, prefix: %@, messageGUID: %@", buf, 0x20u);
    }

    goto LABEL_15;
  }
  if (!a7->messageGUIDRange.length || !a7->prefixRange.length)
  {
    IMLogHandleForCategory("IMMessagePartGUID");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      NSStringFromRange(a7->prefixRange);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromRange(a7->messageGUIDRange);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v30;
      v35 = 2112;
      v36 = v31;
      _os_log_error_impl(&dword_19E239000, v29, OS_LOG_TYPE_ERROR, "Failed to create IMMessagePartGuid with invalid ranges: prefixRange: %@, messageGUIDRange: %@", buf, 0x16u);

    }
LABEL_15:
    v26 = 0;
    goto LABEL_16;
  }
  v18 = objc_msgSend(v12, "copy");
  encodedMessagePartGUID = v15->_encodedMessagePartGUID;
  v15->_encodedMessagePartGUID = (NSString *)v18;

  v20 = objc_msgSend(v13, "copy");
  messageGUID = v15->_messageGUID;
  v15->_messageGUID = (NSString *)v20;

  v22 = objc_msgSend(v14, "copy");
  prefix = v15->_prefix;
  v15->_prefix = (NSString *)v22;

  v15->_partNumber = a6;
  prefixRange = a7->prefixRange;
  partNumberRange = a7->partNumberRange;
  v15->_ranges.messageGUIDRange = a7->messageGUIDRange;
  v15->_ranges.partNumberRange = partNumberRange;
  v15->_ranges.prefixRange = prefixRange;
LABEL_11:
  v26 = v15;
LABEL_16:

  return v26;
}

- (IMMessagePartGUID)initWithMessageGUID:(id)a3 prefix:(id)a4
{
  return -[IMMessagePartGUID initWithMessageGUID:prefix:partNumber:](self, "initWithMessageGUID:prefix:partNumber:", a3, a4, 0x7FFFFFFFFFFFFFFFLL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v11;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMMessagePartGUID encodedMessagePartGUID](self, "encodedMessagePartGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessagePartGUID messageGUID](self, "messageGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessagePartGUID prefix](self, "prefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IMMessagePartGUID partNumber](self, "partNumber");
  -[IMMessagePartGUID ranges](self, "ranges");
  v9 = (void *)objc_msgSend(v4, "initWithEncodedMessagePartGUID:messageGUID:prefix:partNumber:ranges:", v5, v6, v7, v8, &v11);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[IMMessagePartGUID encodedMessagePartGUID](self, "encodedMessagePartGUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodedMessagePartGUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (_NSRange)prefixRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_ranges.prefixRange.length;
  location = self->_ranges.prefixRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)partNumberRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_ranges.partNumberRange.length;
  location = self->_ranges.partNumberRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)messageGUIDRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_ranges.messageGUIDRange.length;
  location = self->_ranges.messageGUIDRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  NSRange v15;
  NSRange v16;
  NSRange v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)IMMessagePartGUID;
  -[IMMessagePartGUID description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessagePartGUID encodedMessagePartGUID](self, "encodedMessagePartGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessagePartGUID prefix](self, "prefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessagePartGUID messageGUID](self, "messageGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IMMessagePartGUID partNumber](self, "partNumber");
  v15.location = -[IMMessagePartGUID prefixRange](self, "prefixRange");
  NSStringFromRange(v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16.location = -[IMMessagePartGUID partNumberRange](self, "partNumberRange");
  NSStringFromRange(v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17.location = -[IMMessagePartGUID messageGUIDRange](self, "messageGUIDRange");
  NSStringFromRange(v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ encodedMessagePartGUID: %@, prefix: %@, messageGUID: %@, partNumber: %ld, prefixRange: %@, partNumberRange: %@, messageGUIDRange: %@"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)encodeMessagePartGUID:(id)a3 prefix:(id)a4
{
  return (id)objc_msgSend(a1, "encodeMessagePartGUID:prefix:partNumber:", a3, a4, 0x7FFFFFFFFFFFFFFFLL);
}

+ (id)encodeMessagePartGUID:(id)a3 prefix:(id)a4 partNumber:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8 && objc_msgSend(v7, "length") && objc_msgSend(v9, "length"))
  {
    if (a5 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%c%@"), v9, 58, v7, v20, v21);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%c%ld%c%@"), v9, 58, a5, 47, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IMLogHandleForCategory("IMMessagePartGUID");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_19E36C2A0(v10, v11, v12, v13, v14, v15, v16, v17);

    v18 = 0;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMMessagePartGUID encodedMessagePartGUID](self, "encodedMessagePartGUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("encodedMessagePartGUID"));

}

- (IMMessagePartGUID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  IMMessagePartGUID *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encodedMessagePartGUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[IMMessagePartGUID initWithEncodedMessagePartGUID:](self, "initWithEncodedMessagePartGUID:", v5);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (unint64_t)partNumber
{
  return self->_partNumber;
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (NSString)encodedMessagePartGUID
{
  return self->_encodedMessagePartGUID;
}

- (IMMessagePartRanges)ranges
{
  _NSRange v3;

  v3 = *(_NSRange *)&self[1].prefixRange.length;
  retstr->prefixRange = *(_NSRange *)&self->messageGUIDRange.length;
  retstr->partNumberRange = v3;
  retstr->messageGUIDRange = *(_NSRange *)&self[1].partNumberRange.length;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedMessagePartGUID, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

@end
