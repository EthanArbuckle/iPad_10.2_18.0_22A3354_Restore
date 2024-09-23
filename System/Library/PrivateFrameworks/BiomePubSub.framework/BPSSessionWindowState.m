@implementation BPSSessionWindowState

- (BPSSessionWindowState)initWithDateInterval:(id)a3 identifier:(id)a4 aggregate:(id)a5 completed:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  BPSSessionWindowState *v12;
  BPSSessionWindowState *v13;
  objc_super v15;

  v6 = a6;
  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BPSSessionWindowState;
  v12 = -[BPSWindowState initWithIdentifier:aggregate:completed:](&v15, sel_initWithIdentifier_aggregate_completed_, a4, a5, v6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_dateInterval, a3);

  return v13;
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
  v6.super_class = (Class)BPSSessionWindowState;
  v4 = a3;
  -[BPSWindowState encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[BPSSessionWindowState dateInterval](self, "dateInterval", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dateInterval"));

}

- (BPSSessionWindowState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BPSSessionWindowState *v6;
  BPSSessionWindowState *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)BPSSessionWindowState,
        v6 = -[BPSWindowState initWithCoder:](&v9, sel_initWithCoder_, v4),
        (self = v6) != 0))
  {
    -[BPSSessionWindowState setDateInterval:](v6, "setDateInterval:", v5);
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
