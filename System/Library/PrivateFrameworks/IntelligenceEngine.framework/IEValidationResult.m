@implementation IEValidationResult

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[IEValidationResult type](self, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        v9 = 0;
LABEL_23:

        goto LABEL_24;
      }
      -[IEValidationResult text](self, "text");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23 != v10)
      {
        -[IEValidationResult text](self, "text");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "text");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v21, "isEqualToString:"))
        {
          v9 = 0;
          goto LABEL_21;
        }
      }
      -[IEValidationResult filename](self, "filename");
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "filename");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((void *)v22 != v11)
      {
        -[IEValidationResult filename](self, "filename");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "filename");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v20, "isEqualToString:"))
        {
          v9 = 0;
          v12 = (void *)v22;
LABEL_19:

LABEL_20:
          if (v23 == v10)
          {
LABEL_22:

            goto LABEL_23;
          }
LABEL_21:

          goto LABEL_22;
        }
      }
      -[IEValidationResult code](self, "code");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "code");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == v14
        || (-[IEValidationResult code](self, "code"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "code"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v18, "isEqualToString:", v3)))
      {
        v15 = -[IEValidationResult lineNumber](self, "lineNumber");
        v9 = v15 == objc_msgSend(v6, "lineNumber");
        if (v13 == v14)
        {

LABEL_18:
          v12 = (void *)v22;
          if ((void *)v22 == v11)
            goto LABEL_20;
          goto LABEL_19;
        }
      }
      else
      {
        v9 = 0;
      }

      goto LABEL_18;
    }
  }
  v9 = 0;
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[IEValidationResult type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[IEValidationResult text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  -[IEValidationResult filename](self, "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[IEValidationResult code](self, "code");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  v11 = v8 - (v6 - v4 + 32 * v4) + 32 * (v6 - v4 + 32 * v4);
  v12 = 31 * (v10 - v11 + 32 * v11);

  return v12 + -[IEValidationResult lineNumber](self, "lineNumber") + 28629151;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
  objc_storeStrong((id *)&self->_code, a3);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_storeStrong((id *)&self->_filename, a3);
}

- (int)lineNumber
{
  return self->_lineNumber;
}

- (void)setLineNumber:(int)a3
{
  self->_lineNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_code, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
