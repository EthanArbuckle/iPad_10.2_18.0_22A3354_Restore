@implementation HKMCNotification

- (HKMCNotification)initWithCategory:(id)a3 dueDateComponents:(id)a4
{
  id v6;
  id v7;
  HKMCNotification *v8;
  uint64_t v9;
  NSString *category;
  uint64_t v11;
  NSDateComponents *dueDateComponents;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKMCNotification;
  v8 = -[HKMCNotification init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    category = v8->_category;
    v8->_category = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    dueDateComponents = v8->_dueDateComponents;
    v8->_dueDateComponents = (NSDateComponents *)v11;

  }
  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %@ %@>"), objc_opt_class(), self->_category, self->_dueDateComponents);
}

- (BOOL)isEqual:(id)a3
{
  HKMCNotification *v4;
  HKMCNotification *v5;
  NSString *category;
  void *v7;
  NSDateComponents *dueDateComponents;
  void *v9;
  char v10;

  v4 = (HKMCNotification *)a3;
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
      category = self->_category;
      -[HKMCNotification category](v5, "category");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](category, "isEqualToString:", v7))
      {
        dueDateComponents = self->_dueDateComponents;
        -[HKMCNotification dueDateComponents](v5, "dueDateComponents");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NSDateComponents isEqual:](dueDateComponents, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *category;
  id v5;

  category = self->_category;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", category, CFSTR("Category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dueDateComponents, CFSTR("DueDateComponents"));

}

- (HKMCNotification)initWithCoder:(id)a3
{
  id v4;
  HKMCNotification *v5;
  uint64_t v6;
  NSString *category;
  uint64_t v8;
  NSDateComponents *dueDateComponents;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMCNotification;
  v5 = -[HKMCNotification init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Category"));
    v6 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DueDateComponents"));
    v8 = objc_claimAutoreleasedReturnValue();
    dueDateComponents = v5->_dueDateComponents;
    v5->_dueDateComponents = (NSDateComponents *)v8;

  }
  return v5;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDateComponents)dueDateComponents
{
  return self->_dueDateComponents;
}

- (void)setDueDateComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dueDateComponents, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
