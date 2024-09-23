@implementation GKRecurrenceRule

- (GKRecurrenceRule)initWithInterval:(unint64_t)a3 frequency:(int64_t)a4
{
  GKRecurrenceRule *v6;
  GKRecurrenceRule *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKRecurrenceRule;
  v6 = -[GKRecurrenceRule init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[GKRecurrenceRule setInterval:](v6, "setInterval:", a3);
    -[GKRecurrenceRule setFrequency:](v7, "setFrequency:", a4);
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  GKRecurrenceRule *v4;

  v4 = -[GKRecurrenceRule init](+[GKRecurrenceRule allocWithZone:](GKRecurrenceRule, "allocWithZone:", a3), "init");
  -[GKRecurrenceRule setInterval:](v4, "setInterval:", -[GKRecurrenceRule interval](self, "interval"));
  -[GKRecurrenceRule setFrequency:](v4, "setFrequency:", -[GKRecurrenceRule frequency](self, "frequency"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[GKRecurrenceRule interval](self, "interval"), CFSTR("interval"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[GKRecurrenceRule frequency](self, "frequency"), CFSTR("frequency"));

}

- (GKRecurrenceRule)initWithCoder:(id)a3
{
  id v4;
  GKRecurrenceRule *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKRecurrenceRule;
  v5 = -[GKRecurrenceRule init](&v7, sel_init);
  if (v5)
  {
    -[GKRecurrenceRule setInterval:](v5, "setInterval:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interval")));
    -[GKRecurrenceRule setFrequency:](v5, "setFrequency:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("frequency")));
  }

  return v5;
}

- (unint64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(unint64_t)a3
{
  self->_interval = a3;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(int64_t)a3
{
  self->_frequency = a3;
}

@end
