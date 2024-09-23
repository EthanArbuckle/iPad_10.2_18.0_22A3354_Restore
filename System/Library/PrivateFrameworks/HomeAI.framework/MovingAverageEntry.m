@implementation MovingAverageEntry

- (MovingAverageEntry)initWithValue:(id)a3
{
  id v5;
  MovingAverageEntry *v6;
  uint64_t v7;
  NSDate *date;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MovingAverageEntry;
  v6 = -[MovingAverageEntry init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = objc_claimAutoreleasedReturnValue();
    date = v6->_date;
    v6->_date = (NSDate *)v7;

    objc_storeStrong((id *)&v6->_value, a3);
  }

  return v6;
}

- (NSNumber)value
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
