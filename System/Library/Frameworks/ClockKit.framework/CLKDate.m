@implementation CLKDate

- (CLKDate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKDate;
  return -[CLKDate init](&v3, sel_init);
}

+ (id)date
{
  return objc_alloc_init((Class)a1);
}

- (CLKDate)initWithTimeIntervalSinceReferenceDate:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLKDate;
  return -[CLKDate initWithTimeIntervalSinceReferenceDate:](&v4, sel_initWithTimeIntervalSinceReferenceDate_, a3);
}

- (CLKDate)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLKDate;
  return -[CLKDate initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (CLKDate)initWithTimeIntervalSinceNow:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLKDate;
  return -[CLKDate initWithTimeIntervalSinceNow:](&v4, sel_initWithTimeIntervalSinceNow_, a3);
}

+ (id)dateWithTimeIntervalSinceNow:(double)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithTimeIntervalSinceNow:", a3);
}

- (double)timeIntervalSinceNow
{
  return 0.0;
}

+ (double)timeIntervalSinceReferenceDate
{
  return 0.0;
}

+ (id)complicationDateWithTimeIntervalSinceNow:(double)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(a1, "complicationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateWithTimeInterval:sinceDate:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)unmodifiedDateWithTimeIntervalSinceNow:(double)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(a1, "unmodifiedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateWithTimeInterval:sinceDate:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
