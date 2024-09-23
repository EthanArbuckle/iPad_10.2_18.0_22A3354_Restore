@implementation CHEncodedStrokeIdentifier

- (CHEncodedStrokeIdentifier)initWithData:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CHEncodedStrokeIdentifier *v12;

  v5 = a3;
  v11 = objc_msgSend_init(self, v6, v7, v8, v9, v10);
  v12 = (CHEncodedStrokeIdentifier *)v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 16), a3);
    v12->_savedHash = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  if (self->_savedHash)
    return self->_savedHash;
  if ((unint64_t)objc_msgSend_length(self->_encodedStrokeIdentifier, a2, v2, v3, v4, v5) < 0x51)
  {
    v13 = 0;
  }
  else
  {
    v13 = 0;
    v14 = 80;
    do
    {
      objc_msgSend_subdataWithRange_(self->_encodedStrokeIdentifier, v8, v14 - 80, 80, v11, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 ^= objc_msgSend_hash(v15, v16, v17, v18, v19, v20);

      v14 += 80;
    }
    while (v14 < objc_msgSend_length(self->_encodedStrokeIdentifier, v21, v22, v23, v24, v25));
  }
  v31 = objc_msgSend_length(self->_encodedStrokeIdentifier, v8, v9, v10, v11, v12) % 0x50uLL;
  if (v31)
  {
    v32 = objc_msgSend_length(self->_encodedStrokeIdentifier, v26, v27, v28, v29, v30);
    objc_msgSend_subdataWithRange_(self->_encodedStrokeIdentifier, v33, v32 - v31, v31, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v13 ^= objc_msgSend_hash(v36, v37, v38, v39, v40, v41);

  }
  self->_savedHash = v13;
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CHEncodedStrokeIdentifier *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CHEncodedStrokeIdentifier *v11;
  NSData *encodedStrokeIdentifier;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSData *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (CHEncodedStrokeIdentifier *)v4;
    v11 = v5;
    if (self)
    {
      if (self == v5)
      {
        LOBYTE(self) = 1;
      }
      else
      {
        encodedStrokeIdentifier = self->_encodedStrokeIdentifier;
        objc_msgSend_encodedStrokeIdentifier(v5, v6, v7, v8, v9, v10);
        v18 = (NSData *)objc_claimAutoreleasedReturnValue();
        if (encodedStrokeIdentifier == v18)
        {
          LOBYTE(self) = 1;
        }
        else
        {
          self = (CHEncodedStrokeIdentifier *)self->_encodedStrokeIdentifier;
          objc_msgSend_encodedStrokeIdentifier(v11, v13, v14, v15, v16, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(self) = objc_msgSend_isEqual_(self, v20, (uint64_t)v19, v21, v22, v23);

        }
      }
    }

  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_encodedStrokeIdentifier, (uint64_t)CFSTR("encodedStrokeIdentifier"), v3, v4);
}

- (CHEncodedStrokeIdentifier)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CHEncodedStrokeIdentifier *v14;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("encodedStrokeIdentifier"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (CHEncodedStrokeIdentifier *)objc_msgSend_initWithData_(self, v10, (uint64_t)v9, v11, v12, v13);
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)encodedStrokeIdentifier
{
  return self->_encodedStrokeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedStrokeIdentifier, 0);
}

@end
