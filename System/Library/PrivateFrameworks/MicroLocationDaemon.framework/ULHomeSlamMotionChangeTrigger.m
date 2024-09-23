@implementation ULHomeSlamMotionChangeTrigger

- (ULHomeSlamMotionChangeTrigger)initWithdate:(id)a3 andTrigger:(int64_t)a4
{
  id v6;
  ULHomeSlamMotionChangeTrigger *v7;
  ULHomeSlamMotionChangeTrigger *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULHomeSlamMotionChangeTrigger;
  v7 = -[ULHomeSlamMotionChangeTrigger init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[ULHomeSlamMotionChangeTrigger setDate:](v7, "setDate:", v6);
    -[ULHomeSlamMotionChangeTrigger setTrigger:](v8, "setTrigger:", a4);
  }

  return v8;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (int64_t)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(int64_t)a3
{
  self->_trigger = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
