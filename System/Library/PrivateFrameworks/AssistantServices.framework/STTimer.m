@implementation STTimer

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STTimer;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_timerId, CFSTR("TimerId"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_state, CFSTR("State"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_value, CFSTR("Value"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fireDate, CFSTR("FireDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_duration, CFSTR("Duration"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_label, CFSTR("Label"));

}

- (STTimer)initWithCoder:(id)a3
{
  id v4;
  STTimer *v5;
  uint64_t v6;
  NSString *timerId;
  uint64_t v8;
  NSNumber *value;
  uint64_t v10;
  NSDate *fireDate;
  uint64_t v12;
  NSNumber *duration;
  uint64_t v14;
  NSString *label;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STTimer;
  v5 = -[STSiriModelObject initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TimerId"));
    v6 = objc_claimAutoreleasedReturnValue();
    timerId = v5->_timerId;
    v5->_timerId = (NSString *)v6;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("State"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Value"));
    v8 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FireDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    fireDate = v5->_fireDate;
    v5->_fireDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Duration"));
    v12 = objc_claimAutoreleasedReturnValue();
    duration = v5->_duration;
    v5->_duration = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Label"));
    v14 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v14;

  }
  return v5;
}

- (NSString)timerId
{
  return self->_timerId;
}

- (void)setTimerId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_timerId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
