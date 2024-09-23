@implementation HKMHDaySummary

- (HKMHDaySummary)initWithDayIndex:(int64_t)a3 momentaryStatesOfMind:(id)a4 dailyStateOfMind:(id)a5
{
  id v8;
  id v9;
  HKMHDaySummary *v10;
  HKMHDaySummary *v11;
  uint64_t v12;
  NSArray *momentaryStatesOfMind;
  uint64_t v14;
  HKStateOfMind *dailyStateOfMind;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKMHDaySummary;
  v10 = -[HKMHDaySummary init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_dayIndex = a3;
    v12 = objc_msgSend(v8, "copy");
    momentaryStatesOfMind = v11->_momentaryStatesOfMind;
    v11->_momentaryStatesOfMind = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    dailyStateOfMind = v11->_dailyStateOfMind;
    v11->_dailyStateOfMind = (HKStateOfMind *)v14;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  HKStateOfMind *dailyStateOfMind;
  HKStateOfMind *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (self->_dayIndex != v5[1] || !-[NSArray isEqualToArray:](self->_momentaryStatesOfMind, "isEqualToArray:", v5[2]))
      goto LABEL_8;
    dailyStateOfMind = self->_dailyStateOfMind;
    v7 = (HKStateOfMind *)v5[3];
    if (dailyStateOfMind == v7)
    {
      v8 = 1;
      goto LABEL_9;
    }
    if (v7)
      v8 = -[HKStateOfMind isEqual:](dailyStateOfMind, "isEqual:");
    else
LABEL_8:
      v8 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (unint64_t)hash
{
  int64_t dayIndex;
  uint64_t v4;

  dayIndex = self->_dayIndex;
  v4 = -[NSArray hash](self->_momentaryStatesOfMind, "hash") ^ dayIndex;
  return v4 ^ -[HKStateOfMind hash](self->_dailyStateOfMind, "hash");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_dayIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p index:%@ dailyState:%@ states:%@>"), v4, self, v5, self->_dailyStateOfMind, self->_momentaryStatesOfMind);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHDaySummary)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  HKMHDaySummary *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DayIndex"));
  objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("MomentaryStatesOfMind"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DailyStateOfMind"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HKMHDaySummary initWithDayIndex:momentaryStatesOfMind:dailyStateOfMind:](self, "initWithDayIndex:momentaryStatesOfMind:dailyStateOfMind:", v5, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t dayIndex;
  id v5;

  dayIndex = self->_dayIndex;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", dayIndex, CFSTR("DayIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_momentaryStatesOfMind, CFSTR("MomentaryStatesOfMind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dailyStateOfMind, CFSTR("DailyStateOfMind"));

}

- (int64_t)dayIndex
{
  return self->_dayIndex;
}

- (NSArray)momentaryStatesOfMind
{
  return self->_momentaryStatesOfMind;
}

- (HKStateOfMind)dailyStateOfMind
{
  return self->_dailyStateOfMind;
}

- (void)setDailyStateOfMind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyStateOfMind, 0);
  objc_storeStrong((id *)&self->_momentaryStatesOfMind, 0);
}

@end
