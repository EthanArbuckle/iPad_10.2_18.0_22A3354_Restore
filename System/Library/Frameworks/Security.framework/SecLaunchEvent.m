@implementation SecLaunchEvent

- (SecLaunchEvent)initWithName:(id)a3
{
  id v5;
  SecLaunchEvent *v6;
  SecLaunchEvent *v7;
  uint64_t v8;
  NSDate *date;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SecLaunchEvent;
  v6 = -[SecLaunchEvent init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    date = v7->_date;
    v7->_date = (NSDate *)v8;

    v7->_counter = 1;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_alloc_init((Class)objc_opt_class());
  -[SecLaunchEvent name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setName:", v7);

  -[SecLaunchEvent date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setDate:", v9);

  objc_msgSend(v5, "setCounter:", -[SecLaunchEvent counter](self, "counter"));
  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unsigned)counter
{
  return self->_counter;
}

- (void)setCounter:(unsigned int)a3
{
  self->_counter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
