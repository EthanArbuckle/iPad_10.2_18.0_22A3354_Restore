@implementation BPSTimeWindowState

- (BPSTimeWindowState)initWithDateInterval:(id)a3 identifier:(id)a4 aggregate:(id)a5 completed:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  BPSTimeWindowState *v11;
  BPSTimeWindowState *v12;
  objc_super v14;

  v6 = a6;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BPSTimeWindowState;
  v11 = -[BPSWindowState initWithIdentifier:aggregate:completed:](&v14, sel_initWithIdentifier_aggregate_completed_, a4, a5, v6);
  v12 = v11;
  if (v11)
    -[BPSTimeWindowState setDateInterval:](v11, "setDateInterval:", v10);

  return v12;
}

- (id)metadata
{
  return -[BPSTimeWindowMetadata initWithDateInterval:]([BPSTimeWindowMetadata alloc], "initWithDateInterval:", self->_dateInterval);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BPSTimeWindowState;
  v4 = a3;
  -[BPSWindowState encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[BPSTimeWindowState dateInterval](self, "dateInterval", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dateInterval"));

}

- (BPSTimeWindowState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BPSTimeWindowState *v6;
  BPSTimeWindowState *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)BPSTimeWindowState,
        v6 = -[BPSWindowState initWithCoder:](&v9, sel_initWithCoder_, v4),
        (self = v6) != 0))
  {
    -[BPSTimeWindowState setDateInterval:](v6, "setDateInterval:", v5);
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_dateInterval, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
