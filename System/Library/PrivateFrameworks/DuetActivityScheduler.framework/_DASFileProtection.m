@implementation _DASFileProtection

+ (id)completeUnlessOpen
{
  if (completeUnlessOpen_onceToken != -1)
    dispatch_once(&completeUnlessOpen_onceToken, &__block_literal_global_12);
  return (id)completeUnlessOpen_fileCompletionCompleteUnlessOpen;
}

- (BOOL)indicatesProtection
{
  NSString *fileProtection;

  fileProtection = self->_fileProtection;
  if (fileProtection)
    LOBYTE(fileProtection) = !-[NSString isEqualToString:](fileProtection, "isEqualToString:", *MEMORY[0x1E0CB2AE0]);
  return (char)fileProtection;
}

+ (id)none
{
  if (none_onceToken != -1)
    dispatch_once(&none_onceToken, &__block_literal_global_5);
  return (id)none_fileCompletionNone;
}

- (BOOL)isEqual:(id)a3
{
  _DASFileProtection *v4;
  _DASFileProtection *v5;
  _DASFileProtection *v6;
  void *v7;
  NSString *fileProtection;
  void *v9;
  char v10;
  void *v11;

  v4 = (_DASFileProtection *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (!self->_fileProtection)
      {
        -[_DASFileProtection fileProtection](v5, "fileProtection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v10 = 1;
          goto LABEL_12;
        }
        if (!self->_fileProtection)
          goto LABEL_10;
      }
      -[_DASFileProtection fileProtection](v6, "fileProtection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        fileProtection = self->_fileProtection;
        -[_DASFileProtection fileProtection](v6, "fileProtection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NSString isEqual:](fileProtection, "isEqual:", v9);

      }
      else
      {
LABEL_10:
        v10 = 0;
      }
LABEL_12:

      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_13:

  return v10;
}

- (NSString)fileProtection
{
  return self->_fileProtection;
}

- (_DASFileProtection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _DASFileProtection *v8;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("fileProtection")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileProtection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      v8 = 0;
LABEL_14:

      goto LABEL_15;
    }
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB2AE0]))
    {
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB2AC0]))
      {
        +[_DASFileProtection completeUntilFirstUserAuthentication](_DASFileProtection, "completeUntilFirstUserAuthentication");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB2AB8]))
      {
        +[_DASFileProtection completeUnlessOpen](_DASFileProtection, "completeUnlessOpen");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB2AB0]))
      {
        +[_DASFileProtection complete](_DASFileProtection, "complete");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    +[_DASFileProtection none](_DASFileProtection, "none");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v8 = (_DASFileProtection *)v7;
    goto LABEL_14;
  }
  +[_DASFileProtection none](_DASFileProtection, "none");
  v8 = (_DASFileProtection *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v8;
}

+ (id)complete
{
  if (complete_onceToken != -1)
    dispatch_once(&complete_onceToken, &__block_literal_global_11);
  return (id)complete_fileCompletionComplete;
}

+ (id)completeUntilFirstUserAuthentication
{
  if (completeUntilFirstUserAuthentication_onceToken != -1)
    dispatch_once(&completeUntilFirstUserAuthentication_onceToken, &__block_literal_global_13);
  return (id)completeUntilFirstUserAuthentication_fileCompletionCompleteUntilFirstUserAuthentication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProtection, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *fileProtection;

  fileProtection = self->_fileProtection;
  if (fileProtection)
    objc_msgSend(a3, "encodeObject:forKey:", fileProtection, CFSTR("fileProtection"));
}

- (id)description
{
  if (-[NSString isEqualToString:](self->_fileProtection, "isEqualToString:", *MEMORY[0x1E0CB2AB0]))
    return CFSTR("ClassA");
  if (-[NSString isEqualToString:](self->_fileProtection, "isEqualToString:", *MEMORY[0x1E0CB2AB8]))
    return CFSTR("ClassB");
  if (-[NSString isEqualToString:](self->_fileProtection, "isEqualToString:", *MEMORY[0x1E0CB2AC0]))
    return CFSTR("ClassC");
  return CFSTR("None");
}

- (_DASFileProtection)initWithProtection:(id)a3
{
  id v5;
  _DASFileProtection *v6;
  _DASFileProtection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DASFileProtection;
  v6 = -[_DASFileProtection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fileProtection, a3);

  return v7;
}

+ (_DASFileProtection)protectionWithType:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProtection:", v3);

  return (_DASFileProtection *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)protectionType
{
  return self->_fileProtection;
}

- (void)setFileProtection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
