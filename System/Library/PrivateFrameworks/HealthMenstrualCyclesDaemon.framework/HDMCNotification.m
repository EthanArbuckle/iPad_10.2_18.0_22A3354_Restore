@implementation HDMCNotification

- (HDMCNotification)initWithFireOnDayIndex:(int64_t)a3 category:(id)a4
{
  return -[HDMCNotification initWithFireOnDayIndex:category:fertileWindowEndDayIndex:daysShifted:](self, "initWithFireOnDayIndex:category:fertileWindowEndDayIndex:daysShifted:", a3, a4, 0, 0);
}

- (HDMCNotification)initWithFireOnDayIndex:(int64_t)a3 category:(id)a4 fertileWindowEndDayIndex:(int64_t)a5 daysShifted:(int64_t)a6
{
  id v11;
  HDMCNotification *v12;
  HDMCNotification *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDMCNotification;
  v12 = -[HDMCNotification init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_fireOnDayIndex = a3;
    objc_storeStrong((id *)&v12->_category, a4);
    v13->_fertileWindowEndDayIndex = a5;
    v13->_daysShifted = a6;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  HDMCNotification *v4;
  HDMCNotification *v5;
  int64_t fireOnDayIndex;
  NSString *category;
  void *v8;
  int64_t fertileWindowEndDayIndex;
  int64_t daysShifted;
  BOOL v11;

  v4 = (HDMCNotification *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      fireOnDayIndex = self->_fireOnDayIndex;
      if (fireOnDayIndex == -[HDMCNotification fireOnDayIndex](v5, "fireOnDayIndex"))
      {
        category = self->_category;
        -[HDMCNotification category](v5, "category");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](category, "isEqualToString:", v8)
          && (fertileWindowEndDayIndex = self->_fertileWindowEndDayIndex,
              fertileWindowEndDayIndex == -[HDMCNotification fertileWindowEndDayIndex](v5, "fertileWindowEndDayIndex")))
        {
          daysShifted = self->_daysShifted;
          v11 = daysShifted == -[HDMCNotification daysShifted](v5, "daysShifted");
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p dayIndex:%ld category:%@ fertileWindowEndDayIndex:%ld daysShifted:%ld>"), objc_opt_class(), self, self->_fireOnDayIndex, self->_category, self->_fertileWindowEndDayIndex, self->_daysShifted);
}

- (id)eventIdentifierFromUpdateFertileWindowNotification
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HDMCNotification category](self, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%ld_%ld"), v4, -[HDMCNotification fertileWindowEndDayIndex](self, "fertileWindowEndDayIndex"), -[HDMCNotification daysShifted](self, "daysShifted"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)fireOnDayIndex
{
  return self->_fireOnDayIndex;
}

- (NSString)category
{
  return self->_category;
}

- (int64_t)fertileWindowEndDayIndex
{
  return self->_fertileWindowEndDayIndex;
}

- (int64_t)daysShifted
{
  return self->_daysShifted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
}

@end
