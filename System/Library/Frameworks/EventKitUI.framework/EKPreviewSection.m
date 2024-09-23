@implementation EKPreviewSection

+ (id)sectionWithDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:", v4);

  return v5;
}

- (EKPreviewSection)initWithDate:(id)a3
{
  id v5;
  EKPreviewSection *v6;
  EKPreviewSection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKPreviewSection;
  v6 = -[EKPreviewSection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_date, a3);

  return v7;
}

- (void)addEvent:(id)a3
{
  NSArray *events;
  id v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  objc_class *v9;
  id v10;
  NSArray *v11;
  NSArray *v12;

  events = self->_events;
  if (events)
  {
    v5 = a3;
    -[NSArray arrayByAddingObject:](events, "arrayByAddingObject:", v5);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();

    v6 = (NSArray *)-[NSArray copy](v12, "copy");
    v7 = self->_events;
    self->_events = v6;

    v8 = v12;
  }
  else
  {
    v9 = (objc_class *)MEMORY[0x1E0C99D20];
    v10 = a3;
    v11 = (NSArray *)objc_msgSend([v9 alloc], "initWithObjects:", v10, 0);

    v8 = self->_events;
    self->_events = v11;
  }

}

- (NSArray)events
{
  return self->_events;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
