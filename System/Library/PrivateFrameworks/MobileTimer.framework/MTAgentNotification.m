@implementation MTAgentNotification

+ (id)notificationWithType:(int64_t)a3 name:(id)a4
{
  return (id)objc_msgSend(a1, "notificationWithType:name:powerAssertionTimeout:", a3, a4, 0.0);
}

+ (id)notificationWithType:(int64_t)a3 name:(id)a4 powerAssertionTimeout:(double)a5
{
  id v8;
  void *v9;

  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:name:powerAssertionTimeout:", a3, v8, a5);

  return v9;
}

- (MTAgentNotification)initWithType:(int64_t)a3 name:(id)a4 powerAssertionTimeout:(double)a5
{
  id v8;
  MTAgentNotification *v9;
  MTAgentNotification *v10;
  uint64_t v11;
  NSString *name;
  MTPowerAssertion *v13;
  void *v14;
  uint64_t v15;
  MTPowerAssertion *powerAssertion;
  objc_super v18;

  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MTAgentNotification;
  v9 = -[MTAgentNotification init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    v11 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v11;

    if (a5 > 0.0)
    {
      v13 = [MTPowerAssertion alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[MTPowerAssertion initWithName:assertionTimeout:](v13, "initWithName:assertionTimeout:", v14, a5);
      powerAssertion = v10->_powerAssertion;
      v10->_powerAssertion = (MTPowerAssertion *)v15;

      -[MTPowerAssertion takeAssertion](v10->_powerAssertion, "takeAssertion");
    }
  }

  return v10;
}

- (void)releaseAssertion
{
  MTPowerAssertion *powerAssertion;

  powerAssertion = self->_powerAssertion;
  if (powerAssertion)
  {
    -[MTPowerAssertion releaseAssertion](powerAssertion, "releaseAssertion");
    powerAssertion = self->_powerAssertion;
  }
  self->_powerAssertion = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[MTAgentNotification releaseAssertion](self, "releaseAssertion");
  v3.receiver = self;
  v3.super_class = (Class)MTAgentNotification;
  -[MTAgentNotification dealloc](&v3, sel_dealloc);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MTPowerAssertion)powerAssertion
{
  return self->_powerAssertion;
}

- (void)setPowerAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_powerAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
