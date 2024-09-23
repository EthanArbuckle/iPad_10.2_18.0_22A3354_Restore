@implementation FPActionOperationLocator

+ (id)locatorForURL:(id)a3
{
  id v3;
  FPURLOperationLocator *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[FPURLOperationLocator initWithObject:]([FPURLOperationLocator alloc], "initWithObject:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)locatorForItem:(id)a3
{
  id v3;
  FPItemOperationLocator *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[FPActionOperationLocator initWithObject:]([FPItemOperationLocator alloc], "initWithObject:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (FPActionOperationLocator)initWithObject:(id)a3
{
  id v5;
  FPActionOperationLocator *v6;
  FPActionOperationLocator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPActionOperationLocator;
  v6 = -[FPActionOperationLocator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_object, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithObject:", self->_object);
}

- (void)_setObject:(id)a3
{
  objc_storeStrong((id *)&self->_object, a3);
}

- (id)underlyingObject
{
  return self->_object;
}

- (unint64_t)hash
{
  return -[NSObject hash](self->_object, "hash");
}

- (BOOL)isEqual:(id)a3
{
  FPActionOperationLocator *v4;
  FPActionOperationLocator *v5;
  char v6;

  v4 = (FPActionOperationLocator *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[NSObject isEqual:](self->_object, "isEqual:", v5->_object);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_object, CFSTR("obj"));
}

- (FPActionOperationLocator)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  FPActionOperationLocator *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("obj"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[FPActionOperationLocator initWithObject:](self, "initWithObject:", v8);
  return v9;
}

- (BOOL)isExternalURL
{
  return 0;
}

- (BOOL)isProviderItem
{
  return 0;
}

- (NSURL)asURL
{
  void *v5;

  if (!-[FPActionOperationLocator isExternalURL](self, "isExternalURL")
    && !-[FPActionOperationLocator isExternalURL](self, "isExternalURL"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPActionOperationLocator.m"), 112, CFSTR("not a url"));

  }
  return (NSURL *)self->_object;
}

- (FPItem)asFPItem
{
  void *v5;

  if (!-[FPActionOperationLocator isProviderItem](self, "isProviderItem")
    && !-[FPActionOperationLocator isProviderItem](self, "isProviderItem"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPActionOperationLocator.m"), 118, CFSTR("not an item"));

  }
  return (FPItem *)self->_object;
}

- (NSString)filename
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPActionOperationLocator.m"), 124, CFSTR("UNREACHABLE: needs override"));

  return 0;
}

- (unint64_t)size
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPActionOperationLocator.m"), 130, CFSTR("UNREACHABLE: needs override"));

  return 0;
}

- (BOOL)isDownloaded
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPActionOperationLocator.m"), 136, CFSTR("UNREACHABLE: needs override"));

  return 0;
}

- (id)identifier
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPActionOperationLocator.m"), 142, CFSTR("UNREACHABLE: needs override"));

  return 0;
}

- (id)parentIdentifier
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPActionOperationLocator.m"), 148, CFSTR("UNREACHABLE: needs override"));

  return 0;
}

- (BOOL)isFolder
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPActionOperationLocator.m"), 154, CFSTR("UNREACHABLE: needs override"));

  return 0;
}

- (BOOL)requiresCrossDeviceCopy
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPActionOperationLocator.m"), 165, CFSTR("UNREACHABLE: needs override"));

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
}

@end
