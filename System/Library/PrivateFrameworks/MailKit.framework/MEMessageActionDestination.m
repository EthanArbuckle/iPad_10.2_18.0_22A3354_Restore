@implementation MEMessageActionDestination

+ (id)allowedMailboxTypes
{
  return &unk_24C4D9888;
}

+ (MEMessageActionDestination)inbox
{
  return -[MEMessageActionDestination initWithDefaultMailboxType:]([MEMessageActionDestination alloc], "initWithDefaultMailboxType:", 7);
}

+ (MEMessageActionDestination)trash
{
  return -[MEMessageActionDestination initWithDefaultMailboxType:]([MEMessageActionDestination alloc], "initWithDefaultMailboxType:", 3);
}

+ (MEMessageActionDestination)archive
{
  return -[MEMessageActionDestination initWithDefaultMailboxType:]([MEMessageActionDestination alloc], "initWithDefaultMailboxType:", 2);
}

+ (MEMessageActionDestination)junk
{
  return -[MEMessageActionDestination initWithDefaultMailboxType:]([MEMessageActionDestination alloc], "initWithDefaultMailboxType:", 1);
}

- (MEMessageActionDestination)initWithDefaultMailboxType:(int64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  MEMessageActionDestination *v8;
  MEMessageActionDestination *v9;
  objc_super v11;

  +[MEMessageActionDestination allowedMailboxTypes](MEMessageActionDestination, "allowedMailboxTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)MEMessageActionDestination;
    v8 = -[MEMessageActionDestination init](&v11, sel_init);
    if (v8)
      v8->_mailboxType = a3;
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEMessageActionDestination)initWithCoder:(id)a3
{
  id v4;
  MEMessageActionDestination *v5;

  v4 = a3;
  v5 = -[MEMessageActionDestination initWithDefaultMailboxType:](self, "initWithDefaultMailboxType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_mailboxType")));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MEMessageActionDestination mailboxType](self, "mailboxType"), CFSTR("EFPropertyKey_mailboxType"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  BOOL v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if ((objc_msgSend(v5, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    v6 = v4;
    v7 = -[MEMessageActionDestination mailboxType](self, "mailboxType");
    v8 = v7 == objc_msgSend(v6, "mailboxType");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Destination: %ld"), -[MEMessageActionDestination mailboxType](self, "mailboxType"));
}

- (int64_t)mailboxType
{
  return self->_mailboxType;
}

@end
