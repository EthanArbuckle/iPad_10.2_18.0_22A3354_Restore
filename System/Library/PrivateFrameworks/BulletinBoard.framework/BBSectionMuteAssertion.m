@implementation BBSectionMuteAssertion

+ (id)sectionMuteAssertionUntilDate:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[BBSectionMuteAssertion _initWithExpirationDate:]([BBSectionMuteAssertion alloc], "_initWithExpirationDate:", v3);

  return v4;
}

- (id)_initWithExpirationDate:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BBSectionMuteAssertion;
  v5 = -[BBMuteAssertion _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v5[1];
    v5[1] = v6;

  }
  return v5;
}

- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  v9 = -[NSDate compare:](self->_expirationDate, "compare:", v7) == NSOrderedDescending;

  return v9;
}

- (void)getNextExpirationDate:(id *)a3 wasPurged:(BOOL *)a4 currentDate:(id)a5
{
  _BOOL4 v8;
  NSDate *expirationDate;

  v8 = -[BBSectionMuteAssertion isActiveForThreadIdentifier:currentDate:](self, "isActiveForThreadIdentifier:currentDate:", 0, a5);
  expirationDate = 0;
  if (v8)
    expirationDate = self->_expirationDate;
  *a3 = objc_retainAutorelease(expirationDate);
  *a4 = 0;
}

- (unint64_t)hash
{
  return -[NSDate hash](self->_expirationDate, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  id v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (v4 = v3) != 0)
  {
    v5 = v4;
    v6 = BSEqualObjects();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; expirationDate: %@>"),
               objc_opt_class(),
               self,
               self->_expirationDate);
}

- (id)toUNCMuteAssertion
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BEBF490];
  -[BBSectionMuteAssertion expirationDate](self, "expirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionMuteAssertionUntilDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BBSectionMuteAssertion;
  v4 = a3;
  -[BBMuteAssertion encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"), v5.receiver, v5.super_class);

}

- (BBSectionMuteAssertion)initWithCoder:(id)a3
{
  id v4;
  BBSectionMuteAssertion *v5;
  uint64_t v6;
  NSDate *expirationDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BBSectionMuteAssertion;
  v5 = -[BBMuteAssertion initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

  }
  return v5;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
