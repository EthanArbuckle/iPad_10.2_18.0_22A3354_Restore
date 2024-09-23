@implementation AFGetTimerResponse

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFGetTimerResponse;
  v4 = a3;
  -[AFSiriResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_timer, CFSTR("timer"), v5.receiver, v5.super_class);

}

- (AFGetTimerResponse)initWithCoder:(id)a3
{
  id v4;
  AFGetTimerResponse *v5;
  uint64_t v6;
  STTimer *timer;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFGetTimerResponse;
  v5 = -[AFSiriResponse initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timer"));
    v6 = objc_claimAutoreleasedReturnValue();
    timer = v5->_timer;
    v5->_timer = (STTimer *)v6;

  }
  return v5;
}

- (STTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
