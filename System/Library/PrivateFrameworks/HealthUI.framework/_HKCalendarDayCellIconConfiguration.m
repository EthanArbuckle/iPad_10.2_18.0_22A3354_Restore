@implementation _HKCalendarDayCellIconConfiguration

+ (id)configurationWithDateIndex:(int64_t)a3 color:(id)a4 style:(int64_t)a5
{
  id v7;
  _QWORD *v8;
  void *v9;

  v7 = a4;
  v8 = objc_alloc_init((Class)objc_opt_class());
  v9 = (void *)v8[2];
  v8[1] = a3;
  v8[2] = v7;

  v8[3] = a5;
  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_dateIndex);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[UIColor hash](self->_color, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_style);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  int64_t dateIndex;
  uint64_t v6;
  char v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (dateIndex = self->_dateIndex,
        v6 = v4[1],
        v7 = -[UIColor isEqual:](self->_color, "isEqual:", v4[2]),
        dateIndex == v6))
  {
    if (self->_style == v4[3])
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_HKCalendarDayCellIconConfiguration;
  -[_HKCalendarDayCellIconConfiguration description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Date Index=%ld, Color=%@, Style=%ld"), v4, self->_dateIndex, self->_color, self->_style);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
