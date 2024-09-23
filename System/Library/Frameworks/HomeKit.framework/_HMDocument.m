@implementation _HMDocument

- (_HMDocument)initWithString:(id)a3
{
  id v4;
  _HMDocument *v5;
  uint64_t v6;
  NSString *stringValue;
  _HMDocument *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)_HMDocument;
    v5 = -[_HMDocument init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      stringValue = v5->_stringValue;
      v5->_stringValue = (NSString *)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_HMDocument)initWithData:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  _HMDocument *v9;

  if (a3)
  {
    v6 = (objc_class *)MEMORY[0x1E0CB3940];
    v7 = a3;
    v8 = (void *)objc_msgSend([v6 alloc], "initWithData:encoding:", v7, 4);

    if (v8)
    {
      self = -[_HMDocument initWithString:](self, "initWithString:", v8);
      v9 = self;
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Invalid parameter."), CFSTR(" data is not UTF8 encoded"), 0);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_HMDocument)initWithURL:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  _HMDocument *v9;

  v6 = (void *)MEMORY[0x1E0CB3620];
  v7 = a3;
  objc_msgSend(v6, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_HMDocument initWithURL:fileManager:error:](self, "initWithURL:fileManager:error:", v7, v8, a4);

  return v9;
}

- (_HMDocument)initWithURL:(id)a3 fileManager:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  const __CFString *v12;
  _HMDocument *v13;
  void *v15;
  char v16;

  v8 = a3;
  v9 = a4;
  if (!v8)
    goto LABEL_9;
  v16 = 0;
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v10, &v16);

  if ((v11 & 1) == 0)
  {
    if (a5)
    {
      v12 = CFSTR(" file does not exist.");
      goto LABEL_8;
    }
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  if (v16)
  {
    if (a5)
    {
      v12 = CFSTR("Invalid file type (directory).");
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Invalid parameter."), v12, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    self = -[_HMDocument initWithData:error:](self, "initWithData:error:", v15, a5);
    v13 = self;
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Not found."), CFSTR("The  data could not be read from the file."), 0);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

LABEL_10:
  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_HMDocument stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _HMDocument *v4;
  _HMDocument *v5;
  _HMDocument *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (_HMDocument *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[_HMDocument stringValue](self, "stringValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMDocument stringValue](v6, "stringValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSAttributedString)attributedString
{
  return (NSAttributedString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
