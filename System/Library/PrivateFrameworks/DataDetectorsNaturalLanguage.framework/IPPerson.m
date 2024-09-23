@implementation IPPerson

- (IPPerson)initWithEmail:(id)a3 fullName:(id)a4
{
  return -[IPPerson initWithHandle:handleType:fullName:](self, "initWithHandle:handleType:fullName:", a3, *MEMORY[0x24BDBA288], a4);
}

- (IPPerson)initWithHandle:(id)a3 handleType:(id)a4 fullName:(id)a5
{
  id v9;
  id v10;
  id v11;
  IPPerson *v12;
  IPPerson *v13;
  void *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)IPPerson;
  v12 = -[IPPerson init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_handle, a3);
    objc_storeStrong((id *)&v13->_handleType, a4);
    if (objc_msgSend(v11, "length"))
      v14 = v11;
    else
      v14 = 0;
    objc_storeStrong((id *)&v13->_fullName, v14);
  }

  return v13;
}

- (IPPerson)init
{
  -[IPPerson doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (IPPerson)initWithString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char *v9;
  IPPerson *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "length");
    if (objc_msgSend(v5, "hasSuffix:", CFSTR(">")))
    {
      v7 = objc_msgSend(v5, "rangeOfString:", CFSTR("<"));
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = 0;
        v9 = (char *)(v6 - 1);
        if (v6 == 1)
          goto LABEL_12;
      }
      else
      {
        v9 = (char *)v7;
        v11 = objc_msgSend(v5, "length") - v7;
        if (v11 == 2)
        {
          v8 = 0;
          if (!v9)
            goto LABEL_12;
        }
        else
        {
          objc_msgSend(v5, "substringWithRange:", v9 + 1, v11 - 2);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9)
          {
LABEL_12:
            self = -[IPPerson initWithEmail:fullName:](self, "initWithEmail:fullName:", v8, v9);

            v10 = self;
            goto LABEL_13;
          }
        }
      }
    }
    else
    {
      v8 = 0;
      v9 = (char *)v6;
      if (!v6)
        goto LABEL_12;
    }
    objc_msgSend(v5, "substringWithRange:", 0, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
    v9 = (char *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (IPPerson)initWithSGIPPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  IPPerson *v11;

  v4 = a3;
  objc_msgSend(v4, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "handleType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = -[IPPerson initWithHandle:handleType:fullName:](self, "initWithHandle:handleType:fullName:", v6, v8, v10);

  return v11;
}

- (NSString)displayableName
{
  void *v3;
  void *v4;

  -[IPPerson fullName](self, "fullName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IPPerson fullName](self, "fullName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)email
{
  NSString *v3;

  if (-[NSString isEqualToString:](self->_handleType, "isEqualToString:", *MEMORY[0x24BDBA288]))
    v3 = self->_handle;
  else
    v3 = 0;
  return v3;
}

- (NSString)fullName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)handle
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)ABUUID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setABUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)handleType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleType, 0);
  objc_storeStrong((id *)&self->_ABUUID, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
}

@end
