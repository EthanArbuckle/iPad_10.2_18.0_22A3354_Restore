@implementation COTimerRequest

- (COTimerRequest)initWithTimer:(id)a3
{
  id v4;
  COTimerRequest *v5;
  uint64_t v6;
  MTTimer *timer;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COTimerRequest;
  v5 = -[COMeshCommand init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    timer = v5->_timer;
    v5->_timer = (MTTimer *)v6;

  }
  return v5;
}

- (COTimerRequest)initWithCoder:(id)a3
{
  id v4;
  COTimerRequest *v5;
  uint64_t v6;
  MTTimer *timer;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COTimerRequest;
  v5 = -[COMeshCommand initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timer"));
    v6 = objc_claimAutoreleasedReturnValue();
    timer = v5->_timer;
    v5->_timer = (MTTimer *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COTimerRequest;
  v4 = a3;
  -[COMeshCommand encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[COTimerRequest timer](self, "timer", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("timer"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTTimer)timer
{
  return self->_timer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
