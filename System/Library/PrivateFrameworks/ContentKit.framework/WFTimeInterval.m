@implementation WFTimeInterval

- (WFTimeInterval)initWithTimeInterval:(double)a3
{
  return -[WFTimeInterval initWithTimeInterval:allowedUnits:unitsStyle:zeroFormattingBehavior:](self, "initWithTimeInterval:allowedUnits:unitsStyle:zeroFormattingBehavior:", 4348, 0, 1, a3);
}

- (WFTimeInterval)initWithTimeInterval:(double)a3 allowedUnits:(unint64_t)a4 unitsStyle:(int64_t)a5 zeroFormattingBehavior:(unint64_t)a6
{
  WFTimeInterval *v10;
  WFTimeInterval *v11;
  void *v12;
  WFTimeInterval *v13;

  v10 = -[WFTimeInterval init](self, "init");
  v11 = v10;
  if (v10)
  {
    v10->_timeInterval = a3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_hash = objc_msgSend(v12, "hash");

    v11->_allowedUnits = a4;
    v11->_unitsStyle = a5;
    v11->_zeroFormattingBehavior = a6;
    v13 = v11;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WFTimeInterval timeInterval](self, "timeInterval");
  return (id)objc_msgSend(v4, "initWithTimeInterval:allowedUnits:unitsStyle:zeroFormattingBehavior:", -[WFTimeInterval allowedUnits](self, "allowedUnits"), -[WFTimeInterval unitsStyle](self, "unitsStyle"), -[WFTimeInterval zeroFormattingBehavior](self, "zeroFormattingBehavior"), v5);
}

- (BOOL)isEqual:(id)a3
{
  WFTimeInterval *v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;

  v4 = (WFTimeInterval *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFTimeInterval timeInterval](self, "timeInterval");
      v6 = v5;
      -[WFTimeInterval timeInterval](v4, "timeInterval");
      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  int64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  -[WFTimeInterval timeInterval](self, "timeInterval");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "timeInterval");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (NSDateComponentsFormatter)timeIntervalFormatter
{
  NSDateComponentsFormatter *timeIntervalFormatter;
  NSDateComponentsFormatter *v4;
  NSDateComponentsFormatter *v5;

  timeIntervalFormatter = self->_timeIntervalFormatter;
  if (!timeIntervalFormatter)
  {
    v4 = (NSDateComponentsFormatter *)objc_opt_new();
    v5 = self->_timeIntervalFormatter;
    self->_timeIntervalFormatter = v4;

    -[NSDateComponentsFormatter setAllowedUnits:](self->_timeIntervalFormatter, "setAllowedUnits:", self->_allowedUnits);
    -[NSDateComponentsFormatter setUnitsStyle:](self->_timeIntervalFormatter, "setUnitsStyle:", self->_unitsStyle);
    -[NSDateComponentsFormatter setZeroFormattingBehavior:](self->_timeIntervalFormatter, "setZeroFormattingBehavior:", self->_zeroFormattingBehavior);
    timeIntervalFormatter = self->_timeIntervalFormatter;
  }
  return timeIntervalFormatter;
}

- (NSString)absoluteTimeString
{
  void *v3;
  void *v4;

  -[WFTimeInterval timeIntervalFormatter](self, "timeIntervalFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTimeInterval timeInterval](self, "timeInterval");
  objc_msgSend(v3, "stringFromTimeInterval:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)wfSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[4];
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12 = CFSTR("link.contentkit.timeinterval");
  v10[0] = CFSTR("timeInterval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timeInterval);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("allowedUnits");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_allowedUnits);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("unitsStyle");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_unitsStyle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("zeroFormattingBehavior");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_zeroFormattingBehavior);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double timeInterval;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  timeInterval = self->_timeInterval;
  v6 = a3;
  objc_msgSend(v4, "numberWithDouble:", timeInterval);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("timeInterval"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_allowedUnits);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("allowedUnits"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_unitsStyle);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("unitsStyle"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_zeroFormattingBehavior);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("zeroFormattingBehavior"));

}

- (WFTimeInterval)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowedUnits"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unitsStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zeroFormattingBehavior"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "unsignedIntegerValue");
  return -[WFTimeInterval initWithTimeInterval:allowedUnits:unitsStyle:zeroFormattingBehavior:](self, "initWithTimeInterval:allowedUnits:unitsStyle:zeroFormattingBehavior:", v9, v11, v13, v7);
}

- (unint64_t)hash
{
  return self->_hash;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (unint64_t)allowedUnits
{
  return self->_allowedUnits;
}

- (int64_t)unitsStyle
{
  return self->_unitsStyle;
}

- (unint64_t)zeroFormattingBehavior
{
  return self->_zeroFormattingBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeIntervalFormatter, 0);
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.timeinterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowedUnits"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("unitsStyle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("zeroFormattingBehavior"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTimeInterval:allowedUnits:unitsStyle:zeroFormattingBehavior:", v10, v12, v14, v8);
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
