@implementation MinMessageItem

- (MinMessageItem)initWith:(id)a3 andText:(id)a4
{
  NSDate *v6;
  NSString *v7;
  MinMessageItem *v8;
  NSString *text;
  NSString *v10;
  NSDate *date;
  objc_super v13;

  v6 = (NSDate *)a3;
  v7 = (NSString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)MinMessageItem;
  v8 = -[MinMessageItem init](&v13, "init");
  text = v8->_text;
  v8->_text = v7;
  v10 = v7;

  date = v8->_date;
  v8->_date = v6;

  return v8;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
