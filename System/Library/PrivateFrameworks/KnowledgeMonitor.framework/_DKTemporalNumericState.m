@implementation _DKTemporalNumericState

- (_DKTemporalNumericState)initWithState:(id)a3 timestamp:(id)a4
{
  id v7;
  id v8;
  _DKTemporalNumericState *v9;
  _DKTemporalNumericState *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_DKTemporalNumericState;
  v9 = -[_DKTemporalNumericState init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_state, a3);
    objc_storeStrong((id *)&v10->_timestamp, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DKTemporalNumericState)initWithCoder:(id)a3
{
  id v4;
  _DKTemporalNumericState *v5;
  uint64_t v6;
  NSNumber *state;
  uint64_t v8;
  NSDate *timestamp;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DKTemporalNumericState;
  v5 = -[_DKTemporalNumericState init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v6 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v8 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *state;
  id v5;

  state = self->_state;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("state=%@, timestamp=%@"), self->_state, self->_timestamp);
}

- (NSNumber)state
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
