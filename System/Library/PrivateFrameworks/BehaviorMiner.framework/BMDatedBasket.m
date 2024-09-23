@implementation BMDatedBasket

- (BMDatedBasket)initWithBasket:(id)a3 Date:(id)a4
{
  id v7;
  id v8;
  BMDatedBasket *v9;
  BMDatedBasket *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMDatedBasket;
  v9 = -[BMDatedBasket init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_basket, a3);
    objc_storeStrong((id *)&v10->_date, a4);
  }

  return v10;
}

+ (id)undated:(id)a3
{
  return (id)objc_msgSend(a3, "valueForKey:", CFSTR("basket"));
}

- (NSDate)date
{
  return self->_date;
}

- (NSSet)basket
{
  return self->_basket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basket, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
