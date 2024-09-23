@implementation IMNicknameEncryptionTag

+ (id)_tagWithDataRepresentation:(id)a3 length:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "length") >= a4)
  {
    objc_msgSend(v8, "subdataWithRange:", 0, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDataRepresentation:", v16);
    return v17;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = objc_msgSend(v8, "length");

    objc_msgSend(v9, "stringWithFormat:", CFSTR("Provided tag is too short {tagLength: %tu, expectedLength: %tu}"), v10, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2938];
    v19[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("IMNicknameEncryptionHelpersErrorDomain"), -2001, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
      *a5 = objc_retainAutorelease(v14);

    return 0;
  }
}

+ (id)_tagWithStringRepresentation:(id)a3 length:(unint64_t)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (objc_class *)MEMORY[0x1E0C99D50];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithBase64EncodedString:options:", v9, 0);

  objc_msgSend(a1, "_tagWithDataRepresentation:length:error:", v10, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (IMNicknameEncryptionTag)initWithDataRepresentation:(id)a3
{
  id v5;
  IMNicknameEncryptionTag *v6;
  IMNicknameEncryptionTag *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMNicknameEncryptionTag;
  v6 = -[IMNicknameEncryptionTag init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataRepresentation, a3);

  return v7;
}

- (NSString)stringRepresentation
{
  void *v2;
  void *v3;

  -[IMNicknameEncryptionTag dataRepresentation](self, "dataRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isEqualToTag:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  const void *v8;
  void *v9;
  id v10;
  const void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IMNicknameEncryptionTag dataRepresentation](self, "dataRepresentation");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const void *)objc_msgSend(v7, "bytes");
  objc_msgSend(v6, "dataRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v9);
  v11 = (const void *)objc_msgSend(v10, "bytes");
  -[IMNicknameEncryptionTag dataRepresentation](self, "dataRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = timingsafe_bcmp(v8, v11, objc_msgSend(v12, "length"));

  if (a4 && v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tags mismatch {className: %@}"), objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2938];
    v19[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("IMNicknameEncryptionHelpersErrorDomain"), -2001, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v13 == 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[IMNicknameEncryptionTag isEqualToTag:error:](self, "isEqualToTag:error:", v4, 0);

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  -[IMNicknameEncryptionTag dataRepresentation](self, "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 ^ objc_msgSend(v4, "hash") ^ 0x11;

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[IMNicknameEncryptionTag dataRepresentation](self, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSData)dataRepresentation
{
  return self->_dataRepresentation;
}

- (void)setDataRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_dataRepresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataRepresentation, 0);
}

@end
