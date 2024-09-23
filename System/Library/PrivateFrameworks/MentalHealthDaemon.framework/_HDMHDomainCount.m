@implementation _HDMHDomainCount

- (_HDMHDomainCount)initWithCount:(int64_t)a3 mostRecentDate:(id)a4
{
  id v6;
  _HDMHDomainCount *v7;
  _HDMHDomainCount *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_HDMHDomainCount;
  v7 = -[_HDMHDomainCount init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[_HDMHDomainCount setCount:](v7, "setCount:", a3);
    -[_HDMHDomainCount setMostRecentDate:](v8, "setMostRecentDate:", v6);
  }

  return v8;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSDate)mostRecentDate
{
  return self->_mostRecentDate;
}

- (void)setMostRecentDate:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentDate, 0);
}

@end
