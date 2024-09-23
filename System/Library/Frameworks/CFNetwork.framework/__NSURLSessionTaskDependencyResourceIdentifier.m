@implementation __NSURLSessionTaskDependencyResourceIdentifier

- (id)copyWithZone:(_NSZone *)a3
{
  __NSURLSessionTaskDependencyResourceIdentifier *v4;
  const char *v5;
  __NSURLSessionTaskDependencyResourceIdentifier *v6;
  NSString *URLPath;
  NSString *mimeType;

  v4 = -[__NSURLSessionTaskDependencyResourceIdentifier init](+[__NSURLSessionTaskDependencyResourceIdentifier allocWithZone:](__NSURLSessionTaskDependencyResourceIdentifier, "allocWithZone:", a3), "init");
  v6 = v4;
  if (self)
  {
    URLPath = self->_URLPath;
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  URLPath = 0;
  if (v4)
LABEL_3:
    objc_setProperty_nonatomic(v4, v5, URLPath, 8);
LABEL_4:
  if (!self)
  {
    mimeType = 0;
    if (!v6)
      return v6;
    goto LABEL_6;
  }
  mimeType = self->_mimeType;
  if (v6)
LABEL_6:
    objc_setProperty_nonatomic(v6, v5, mimeType, 16);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  NSString *URLPath;
  NSString *mimeType;
  uint64_t v7;

  if (!a3)
    return 0;
  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
    {
      URLPath = self->_URLPath;
      if (!((unint64_t)URLPath | *((_QWORD *)a3 + 1)) || (-[NSString isEqual:](URLPath, "isEqual:") & 1) != 0)
      {
        mimeType = self->_mimeType;
        v7 = *((_QWORD *)a3 + 2);
        if (mimeType)
          return (-[NSString isEqual:](mimeType, "isEqual:", v7) & 1) != 0;
        if (v7)
        {
LABEL_9:
          mimeType = 0;
          return (-[NSString isEqual:](mimeType, "isEqual:", v7) & 1) != 0;
        }
        return 1;
      }
    }
    else if (!*((_QWORD *)a3 + 1) || (objc_msgSend(0, "isEqual:") & 1) != 0)
    {
      v7 = *((_QWORD *)a3 + 2);
      if (!v7)
        return 1;
      goto LABEL_9;
    }
  }
  return 0;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSString *mimeType;

  if (self)
  {
    v3 = -[NSString hash](self->_URLPath, "hash");
    mimeType = self->_mimeType;
  }
  else
  {
    v3 = objc_msgSend(0, "hash");
    mimeType = 0;
  }
  return -[NSString hash](mimeType, "hash") ^ v3;
}

- (void)dealloc
{
  SEL v3;
  objc_super v4;

  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 8);
    objc_setProperty_nonatomic(self, v3, 0, 16);
  }
  v4.receiver = self;
  v4.super_class = (Class)__NSURLSessionTaskDependencyResourceIdentifier;
  -[__NSURLSessionTaskDependencyResourceIdentifier dealloc](&v4, sel_dealloc);
}

- (id)description
{
  NSString *URLPath;
  NSString *mimeType;

  if (!self)
    return 0;
  URLPath = self->_URLPath;
  if (URLPath)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("URLPath: %@"), URLPath);
  mimeType = self->_mimeType;
  if (mimeType)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MimeType: %@"), mimeType);
  else
    return 0;
}

- (void)initWitURLPath:(void *)a3 mimeType:
{
  id v5;
  const char *v6;
  void *v7;
  SEL v8;
  objc_super v10;

  if (!a1)
    return 0;
  v10.receiver = a1;
  v10.super_class = (Class)__NSURLSessionTaskDependencyResourceIdentifier;
  v5 = objc_msgSendSuper2(&v10, sel_init);
  v7 = v5;
  if (v5)
  {
    objc_setProperty_nonatomic(v5, v6, a2, 8);
    objc_setProperty_nonatomic(v7, v8, a3, 16);
  }
  return v7;
}

@end
