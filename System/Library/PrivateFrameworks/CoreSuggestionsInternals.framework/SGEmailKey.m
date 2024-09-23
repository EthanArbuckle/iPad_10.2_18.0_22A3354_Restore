@implementation SGEmailKey

- (SGEmailKey)initWithMailMessageKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SGEmailKey *v7;

  v4 = a3;
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SGMessageKey initWithSource:uniqueIdentifier:](self, "initWithSource:uniqueIdentifier:", v5, v6);
  return v7;
}

- (id)toMailMessageKey
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0D198A0]);
  -[SGMessageKey source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMessageKey uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithSource:messageId:", v4, v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SGEmailKey *v4;
  SGEmailKey *v5;
  BOOL v6;

  v4 = (SGEmailKey *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGEmailKey isEqualToEmailKey:](self, "isEqualToEmailKey:", v5);

  return v6;
}

- (BOOL)isEqualToEmailKey:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SGEmailKey;
  return -[SGMessageKey isEqualToMessageKey:](&v4, sel_isEqualToMessageKey_, a3);
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGMessageKey source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGEmailKey messageId](self, "messageId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGEmailKey source:%@ messageId:%@>"), v4, v5);

  return (NSString *)v6;
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  void *v7;

  if ((unint64_t)a3 < 0x1C)
    return (a3 & 0xFFFFFFF) == 5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGEmailKey.m"), 67, CFSTR("Unknown entity type: %lu"), a3);

  return 0;
}

@end
