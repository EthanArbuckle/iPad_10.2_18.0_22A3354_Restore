@implementation CLKRelativeDateProgressProvider

+ (id)relativeDateProgressProviderWithStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setStartDate:", v7);

  objc_msgSend(v8, "setEndDate:", v6);
  return v8;
}

- (double)_progressFractionForNow:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double result;
  void *v9;
  void *v10;
  double v11;
  double v12;

  v4 = a3;
  -[CLKRelativeDateProgressProvider startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  result = 0.0;
  if (v7 >= 0.00000011920929)
  {
    -[CLKRelativeDateProgressProvider endDate](self, "endDate", 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKRelativeDateProgressProvider startDate](self, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    v12 = v11;

    result = 1.0;
    if (v12 >= 0.00000011920929)
    {
      result = v7 / v12;
      if (v7 / v12 > v12 + -0.00000011920929)
        return 1.0;
    }
  }
  return result;
}

- (BOOL)_needsUpdates
{
  return 1;
}

- (void)_validate
{
  NSDate *endDate;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLKRelativeDateProgressProvider;
  -[CLKProgressProvider _validate](&v4, sel__validate);
  if (!self->_startDate)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@ startDate cannot be nil"), objc_opt_class());
  endDate = self->_endDate;
  if (!endDate)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@ endDate cannot be nil"), objc_opt_class());
    endDate = self->_endDate;
  }
  if (-[NSDate compare:](self->_startDate, "compare:", endDate) == NSOrderedDescending)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@ endDate cannot be older than startDate"), objc_opt_class());
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLKRelativeDateProgressProvider *v4;
  id *p_isa;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKRelativeDateProgressProvider;
  v4 = -[CLKProgressProvider copyWithZone:](&v7, sel_copyWithZone_, a3);
  p_isa = (id *)&v4->super.super.isa;
  if (v4 != self)
  {
    objc_storeStrong((id *)&v4->_startDate, self->_startDate);
    objc_storeStrong(p_isa + 8, self->_endDate);
  }
  return p_isa;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  char v5;
  objc_super v7;

  v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKRelativeDateProgressProvider;
  if (-[CLKProgressProvider isEqual:](&v7, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && CLKEqualObjects(self->_startDate, v4[7]))
  {
    v5 = CLKEqualObjects(self->_endDate, v4[8]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKRelativeDateProgressProvider;
  v3 = (double)-[CLKProgressProvider hash](&v6, sel_hash);
  v4 = v3 + (double)(unint64_t)-[NSDate hash](self->_startDate, "hash") * 100.0;
  return (unint64_t)(v4 + (double)(unint64_t)-[NSDate hash](self->_endDate, "hash") * 1000.0);
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
  v5.super_class = (Class)CLKRelativeDateProgressProvider;
  v4 = a3;
  -[CLKProgressProvider encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, CFSTR("_startDate"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_endDate, CFSTR("_endDate"));

}

- (CLKRelativeDateProgressProvider)initWithCoder:(id)a3
{
  id v4;
  CLKRelativeDateProgressProvider *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *endDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLKRelativeDateProgressProvider;
  v5 = -[CLKProgressProvider initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_startDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_endDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKRelativeDateProgressProvider;
  -[CLKProgressProvider JSONObjectRepresentation](&v7, sel_JSONObjectRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate JSONObjectRepresentation](self->_startDate, "JSONObjectRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("startDate"));

  -[NSDate JSONObjectRepresentation](self->_endDate, "JSONObjectRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("endDate"));

  return v3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
