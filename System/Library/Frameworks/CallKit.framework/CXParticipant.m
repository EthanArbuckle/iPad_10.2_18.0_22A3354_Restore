@implementation CXParticipant

- (CXParticipant)initWithName:(id)a3
{
  id v4;
  CXParticipant *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXParticipant initWithName:]", CFSTR("name"));
  v9.receiver = self;
  v9.super_class = (Class)CXParticipant;
  v5 = -[CXParticipant init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (CXParticipant)initWithName:(id)a3 imageURL:(id)a4
{
  id v6;
  CXParticipant *v7;
  CXParticipant *v8;
  uint64_t v9;
  CXSandboxExtendedURL *sandboxExtendedImageURL;

  v6 = a4;
  v7 = -[CXParticipant initWithName:](self, "initWithName:", a3);
  v8 = v7;
  if (v6 && v7)
  {
    CXGetSandboxExtendedFileURL(v6);
    v9 = objc_claimAutoreleasedReturnValue();
    sandboxExtendedImageURL = v8->_sandboxExtendedImageURL;
    v8->_sandboxExtendedImageURL = (CXSandboxExtendedURL *)v9;

  }
  return v8;
}

- (CXParticipant)initWithParticipant:(id)a3
{
  id v4;
  CXParticipant *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  CXSandboxExtendedURL *sandboxExtendedImageURL;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXParticipant;
  v5 = -[CXParticipant init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "sandboxExtendedImageURL");
    v8 = objc_claimAutoreleasedReturnValue();
    sandboxExtendedImageURL = v5->_sandboxExtendedImageURL;
    v5->_sandboxExtendedImageURL = (CXSandboxExtendedURL *)v8;

  }
  return v5;
}

- (NSURL)imageURL
{
  void *v2;
  void *v3;

  -[CXParticipant sandboxExtendedImageURL](self, "sandboxExtendedImageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setImageURL:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    CXGetSandboxExtendedFileURL(a3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[CXParticipant setSandboxExtendedImageURL:](self, "setSandboxExtendedImageURL:", v4);

}

+ (id)unarchivedObjectClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  objc_msgSend(a1, "unarchivedObjectClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;
  void *v6;
  CXSandboxExtendedURL *sandboxExtendedImageURL;
  id v8;

  name = self->_name;
  v5 = a3;
  NSStringFromSelector(sel_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", name, v6);

  sandboxExtendedImageURL = self->_sandboxExtendedImageURL;
  NSStringFromSelector(sel_sandboxExtendedImageURL);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", sandboxExtendedImageURL, v8);

}

- (CXParticipant)initWithCoder:(id)a3
{
  id v4;
  CXParticipant *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  void *v11;
  void *v12;
  void *sandboxExtendedImageURL;
  void *v14;
  int v15;
  CXSandboxExtendedURL *v16;
  NSObject *p_super;
  CXSandboxExtendedURL *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CXParticipant;
  v5 = -[CXParticipant init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_name);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_sandboxExtendedImageURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "connection");
        sandboxExtendedImageURL = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "URL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(sandboxExtendedImageURL, "cx_clientSandboxCanAccessFileURL:", v14);

        if (v15)
        {
          v16 = v12;
          p_super = &v5->_sandboxExtendedImageURL->super;
          v5->_sandboxExtendedImageURL = v16;
        }
        else
        {
          CXDefaultLog();
          p_super = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v22 = v12;
            _os_log_impl(&dword_1A402D000, p_super, OS_LOG_TYPE_DEFAULT, "[WARN] Client does not have permission to access %@", buf, 0xCu);
          }
        }

      }
      else
      {
        v18 = v12;
        sandboxExtendedImageURL = v5->_sandboxExtendedImageURL;
        v5->_sandboxExtendedImageURL = v18;
      }

    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CXParticipant initWithParticipant:](+[CXParticipant allocWithZone:](CXParticipant, "allocWithZone:", a3), "initWithParticipant:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CXParticipant initWithParticipant:](+[CXMutableParticipant allocWithZone:](CXMutableParticipant, "allocWithZone:", a3), "initWithParticipant:", self);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_name);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXParticipant name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_imageURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXParticipant imageURL](self, "imageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%@"), v6, v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[CXParticipant name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CXParticipant sandboxExtendedImageURL](self, "sandboxExtendedImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CXParticipant *v4;
  BOOL v5;

  v4 = (CXParticipant *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CXParticipant isEqualToParticipant:](self, "isEqualToParticipant:", v4);
  }

  return v5;
}

- (BOOL)isEqualToParticipant:(id)a3
{
  id v4;
  NSString *name;
  uint64_t v6;
  CXSandboxExtendedURL *sandboxExtendedImageURL;
  uint64_t v8;
  char v9;

  v4 = a3;
  name = self->_name;
  objc_msgSend(v4, "name");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)name | v6 && !-[NSString isEqual:](name, "isEqual:", v6))
  {
    v9 = 0;
  }
  else
  {
    sandboxExtendedImageURL = self->_sandboxExtendedImageURL;
    objc_msgSend(v4, "sandboxExtendedImageURL");
    v8 = objc_claimAutoreleasedReturnValue();
    if ((unint64_t)sandboxExtendedImageURL | v8)
      v9 = -[CXSandboxExtendedURL isEqual:](sandboxExtendedImageURL, "isEqual:", v8);
    else
      v9 = 1;

  }
  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CXSandboxExtendedURL)sandboxExtendedImageURL
{
  return self->_sandboxExtendedImageURL;
}

- (void)setSandboxExtendedImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_sandboxExtendedImageURL, a3);
}

- (id)wrappedByObject
{
  return objc_loadWeakRetained(&self->_wrappedByObject);
}

- (void)setWrappedByObject:(id)a3
{
  objc_storeWeak(&self->_wrappedByObject, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_wrappedByObject);
  objc_storeStrong((id *)&self->_sandboxExtendedImageURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
