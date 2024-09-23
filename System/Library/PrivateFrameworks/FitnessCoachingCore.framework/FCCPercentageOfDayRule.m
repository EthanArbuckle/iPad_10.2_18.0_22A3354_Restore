@implementation FCCPercentageOfDayRule

- (FCCPercentageOfDayRule)initWithMinimumDayDuration:(double)a3 percentOfDay:(double)a4
{
  FCCPercentageOfDayRule *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FCCPercentageOfDayRule;
  result = -[FCCPercentageOfDayRule init](&v7, sel_init);
  if (result)
  {
    result->_minimumDayDuration = a3;
    result->_percentOfDay = a4;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FCCPercentageOfDayRule: minimumDayDuration: %.1f, percentOfDay: %.1f"), *(_QWORD *)&self->_minimumDayDuration, *(_QWORD *)&self->_percentOfDay);
}

- (FCCPercentageOfDayRule)initWithProtobuf:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "minimumDayDuration");
  v6 = v5;
  objc_msgSend(v4, "percentOfDay");
  v8 = v7;

  return -[FCCPercentageOfDayRule initWithMinimumDayDuration:percentOfDay:](self, "initWithMinimumDayDuration:percentOfDay:", v6, v8);
}

- (id)protobuf
{
  FCCPercentageOfDayRuleProtobuf *v3;

  v3 = objc_alloc_init(FCCPercentageOfDayRuleProtobuf);
  -[FCCPercentageOfDayRuleProtobuf setMinimumDayDuration:](v3, "setMinimumDayDuration:", self->_minimumDayDuration);
  -[FCCPercentageOfDayRuleProtobuf setPercentOfDay:](v3, "setPercentOfDay:", self->_percentOfDay);
  return v3;
}

- (FCCPercentageOfDayRule)initWithTransportData:(id)a3
{
  id v4;
  FCCPercentageOfDayRuleProtobuf *v5;
  FCCPercentageOfDayRule *v6;

  v4 = a3;
  v5 = -[FCCPercentageOfDayRuleProtobuf initWithData:]([FCCPercentageOfDayRuleProtobuf alloc], "initWithData:", v4);

  v6 = -[FCCPercentageOfDayRule initWithProtobuf:](self, "initWithProtobuf:", v5);
  return v6;
}

- (id)transportData
{
  void *v2;
  void *v3;

  -[FCCPercentageOfDayRule protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)minimumDayDuration
{
  return self->_minimumDayDuration;
}

- (double)percentOfDay
{
  return self->_percentOfDay;
}

@end
