@implementation COMTTimerCreateAction

- (COMTTimerCreateAction)initWithTimer:(id)a3
{
  id v4;
  COMTTimerCreateAction *v5;
  uint64_t v6;
  MTTimer *timer;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMTTimerCreateAction;
  v5 = -[COMTAction init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    timer = v5->_timer;
    v5->_timer = (MTTimer *)v6;

  }
  return v5;
}

- (COMTTimerCreateAction)initWithCoder:(id)a3
{
  id v4;
  COMTTimerCreateAction *v5;
  COMTTimerCreateAction *v6;
  COMTTimerCreateAction *v7;
  uint64_t v8;
  MTTimer *timer;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COMTTimerCreateAction;
  v5 = -[COMTAction initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CT"));
  v6 = (COMTTimerCreateAction *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = -[COMTTimerCreateAction copy](v6, "copy");
    timer = v5->_timer;
    v5->_timer = (MTTimer *)v8;

LABEL_4:
    v7 = v5;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COMTTimerCreateAction;
  v4 = a3;
  -[COMTAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[COMTTimerCreateAction timer](self, "timer", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CT"));

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
