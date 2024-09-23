@implementation HDMHNotification

- (HDMHNotification)initWithFireOnDayIndex:(int64_t)a3 dateComponents:(id)a4 category:(id)a5
{
  id v9;
  id v10;
  HDMHNotification *v11;
  HDMHNotification *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDMHNotification;
  v11 = -[HDMHNotification init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_fireOnDayIndex = a3;
    objc_storeStrong((id *)&v11->_dateComponents, a4);
    objc_storeStrong((id *)&v12->_category, a5);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  HDMHNotification *v4;
  HDMHNotification *v5;
  NSDateComponents *dateComponents;
  void *v7;
  NSString *category;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (HDMHNotification *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      dateComponents = self->_dateComponents;
      -[HDMHNotification dateComponents](v5, "dateComponents");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSDateComponents isEqual:](dateComponents, "isEqual:", v7))
      {
        category = self->_category;
        -[HDMHNotification category](v5, "category");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](category, "isEqualToString:", v9))
        {
          -[HDMHNotification eventIdentifier](self, "eventIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDMHNotification eventIdentifier](v5, "eventIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqualToString:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p dayIndex:%ld category:%@>"), objc_opt_class(), self, self->_fireOnDayIndex, self->_category);
}

- (id)eventIdentifier
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld%ld"), -[NSDateComponents hour](self->_dateComponents, "hour"), -[NSDateComponents minute](self->_dateComponents, "minute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%ld_%@"), self->_category, self->_fireOnDayIndex, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)category
{
  return self->_category;
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComponents, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
