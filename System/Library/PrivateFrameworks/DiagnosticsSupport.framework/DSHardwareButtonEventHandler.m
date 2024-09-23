@implementation DSHardwareButtonEventHandler

- (BOOL)isEqualToHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  unint64_t v11;
  BOOL v12;
  BOOL v13;

  v4 = a3;
  if (v4)
  {
    -[DSHardwareButtonEventHandler target](self, "target");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[DSHardwareButtonEventHandler action](self, "action");
    v8 = objc_msgSend(v4, "action");
    v9 = -[DSHardwareButtonEventHandler preventPropagation](self, "preventPropagation");
    v10 = objc_msgSend(v4, "preventPropagation");
    v11 = -[DSHardwareButtonEventHandler events](self, "events");
    v12 = (v11 == objc_msgSend(v4, "events")) & ~(v9 ^ v10);
    if (v7 != (const char *)v8)
      v12 = 0;
    v13 = v5 == v6 && v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  DSHardwareButtonEventHandler *v4;
  BOOL v5;

  v4 = (DSHardwareButtonEventHandler *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[DSHardwareButtonEventHandler isEqualToHandler:](self, "isEqualToHandler:", v4);
  }

  return v5;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (BOOL)preventPropagation
{
  return self->_preventPropagation;
}

- (void)setPreventPropagation:(BOOL)a3
{
  self->_preventPropagation = a3;
}

- (unint64_t)events
{
  return self->_events;
}

- (void)setEvents:(unint64_t)a3
{
  self->_events = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_target, 0);
}

@end
