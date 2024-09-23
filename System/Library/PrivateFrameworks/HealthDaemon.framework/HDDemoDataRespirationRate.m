@implementation HDDemoDataRespirationRate

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSNumber)rate
{
  return self->_rate;
}

- (void)setRate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rate, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
