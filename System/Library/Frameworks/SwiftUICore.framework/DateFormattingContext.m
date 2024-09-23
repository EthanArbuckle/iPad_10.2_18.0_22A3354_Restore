@implementation DateFormattingContext

- (DateFormattingContext)initWithReferenceDate:(id)a3 isLuminanceReduced:(BOOL)a4
{
  id v7;
  DateFormattingContext *v8;
  DateFormattingContext *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DateFormattingContext;
  v8 = -[DateFormattingContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_referenceDate, a3);
    v9->_isLuminanceReduced = a4;
  }

  return v9;
}

- (DateFormattingContext)init
{
  return -[DateFormattingContext initWithReferenceDate:isLuminanceReduced:](self, "initWithReferenceDate:isLuminanceReduced:", 0, 0);
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (BOOL)isLuminanceReduced
{
  return self->_isLuminanceReduced;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);
}

@end
