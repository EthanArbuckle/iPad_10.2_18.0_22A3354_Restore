@implementation EMMessageReadLaterAction

- (EMMessageReadLaterAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 readLaterDate:(id)a6
{
  id v11;
  EMMessageReadLaterAction *v12;
  EMMessageReadLaterAction *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)EMMessageReadLaterAction;
  v12 = -[EMMessageChangeAction initWithMessageListItems:origin:actor:](&v15, sel_initWithMessageListItems_origin_actor_, a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_readLaterDate, a6);

  return v13;
}

- (int64_t)signpostType
{
  return 10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageReadLaterAction)initWithCoder:(id)a3
{
  id v4;
  EMMessageReadLaterAction *v5;
  uint64_t v6;
  NSDate *readLaterDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMMessageReadLaterAction;
  v5 = -[EMMessageChangeAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_readLaterDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    readLaterDate = v5->_readLaterDate;
    v5->_readLaterDate = (NSDate *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EMMessageReadLaterAction;
  -[EMMessageChangeAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[EMMessageReadLaterAction readLaterDate](self, "readLaterDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_readLaterDate"));

}

- (NSDate)readLaterDate
{
  return self->_readLaterDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readLaterDate, 0);
}

@end
