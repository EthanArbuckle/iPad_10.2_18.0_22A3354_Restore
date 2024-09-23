@implementation SGMailMessageKey

- (SGMailMessageKey)initWithSource:(id)a3 messageId:(id)a4
{
  id v7;
  id v8;
  SGMailMessageKey *v9;
  SGMailMessageKey *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGMailMessageKey;
  v9 = -[SGMailMessageKey init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_source, a3);
    objc_storeStrong((id *)&v10->_messageId, a4);
  }

  return v10;
}

- (SGMailMessageKey)initWithCoder:(id)a3
{
  id v4;
  SGMailMessageKey *v5;
  void *v6;
  uint64_t v7;
  NSString *source;
  void *v9;
  uint64_t v10;
  NSString *messageId;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SGMailMessageKey;
  v5 = -[SGMailMessageKey init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("source"));
    v7 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (NSString *)v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("messageId"));
    v10 = objc_claimAutoreleasedReturnValue();
    messageId = v5->_messageId;
    v5->_messageId = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *source;
  id v5;

  source = self->_source;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messageId, CFSTR("messageId"));

}

- (BOOL)isEqual:(id)a3
{
  SGMailMessageKey *v4;
  SGMailMessageKey *v5;
  BOOL v6;

  v4 = (SGMailMessageKey *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGMailMessageKey isEqualToMailMessageKey:](self, "isEqualToMailMessageKey:", v5);

  return v6;
}

- (BOOL)isEqualToMailMessageKey:(id)a3
{
  id *v4;
  NSString *source;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  char v10;
  NSString *v11;
  NSString *v12;

  v4 = (id *)a3;
  source = self->_source;
  v6 = (NSString *)v4[1];
  if (source == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = source;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_messageId;
  v12 = v11;
  if (v11 == v4[2])
    v10 = 1;
  else
    v10 = -[NSString isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_source, "hash");
  return -[NSString hash](self->_messageId, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("'%@'/'%@'"), self->_source, self->_messageId);
}

- (NSString)source
{
  return self->_source;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
