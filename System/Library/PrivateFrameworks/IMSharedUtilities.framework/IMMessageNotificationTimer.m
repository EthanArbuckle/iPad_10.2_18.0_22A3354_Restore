@implementation IMMessageNotificationTimer

- (IMMessageNotificationTimer)initWithDate:(id)a3
{
  IMMessageNotificationTimer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMMessageNotificationTimer;
  v4 = -[IMMessageNotificationTimer init](&v6, sel_init);
  if (v4)
  {
    v4->_date = (NSDate *)a3;
    v4->_numberDingsLeft = (NSNumber *)&unk_1E3FFE648;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMMessageNotificationTimer;
  -[IMMessageNotificationTimer dealloc](&v3, sel_dealloc);
}

- (BOOL)areDingsRemaining
{
  return -[NSNumber intValue](self->_numberDingsLeft, "intValue") > 0;
}

- (void)reduceNumberDingsLeft
{
  if (-[NSNumber intValue](self->_numberDingsLeft, "intValue") >= 1)
    self->_numberDingsLeft = (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NSNumber intValue](self->_numberDingsLeft, "intValue") - 1);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSNumber)numberDingsLeft
{
  return self->_numberDingsLeft;
}

@end
