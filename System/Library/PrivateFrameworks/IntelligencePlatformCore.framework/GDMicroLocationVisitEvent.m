@implementation GDMicroLocationVisitEvent

- (GDMicroLocationVisitEvent)initWithDate:(id)a3 microLocationIdentifier:(id)a4 probability:(double)a5 isEnter:(BOOL)a6
{
  id v11;
  id v12;
  GDMicroLocationVisitEvent *v13;
  GDMicroLocationVisitEvent *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GDMicroLocationVisitEvent;
  v13 = -[GDMicroLocationVisitEvent init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_date, a3);
    objc_storeStrong((id *)&v14->_microLocationIdentifier, a4);
    v14->_probability = a5;
    v14->_isEnter = a6;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  GDMicroLocationVisitEvent *v4;
  GDMicroLocationVisitEvent *v5;
  GDMicroLocationVisitEvent *v6;
  int isEnter;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double probability;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  NSDate *date;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSString *microLocationIdentifier;
  void *v27;
  const char *v28;
  uint64_t v29;
  char isEqualToString;

  v4 = (GDMicroLocationVisitEvent *)a3;
  v5 = v4;
  if (self == v4)
  {
    isEqualToString = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    isEnter = self->_isEnter;
    if (isEnter == objc_msgSend_isEnter(v6, v8, v9, v10)
      && (probability = self->_probability, objc_msgSend_probability(v6, v11, v12, v13), probability == v18))
    {
      date = self->_date;
      objc_msgSend_date(v6, v15, v16, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToDate_(date, v21, (uint64_t)v20, v22))
      {
        microLocationIdentifier = self->_microLocationIdentifier;
        objc_msgSend_microLocationIdentifier(v6, v23, v24, v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(microLocationIdentifier, v28, (uint64_t)v27, v29);

      }
      else
      {
        isEqualToString = 0;
      }

    }
    else
    {
      isEqualToString = 0;
    }

  }
  else
  {
    isEqualToString = 0;
  }

  return isEqualToString;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)microLocationIdentifier
{
  return self->_microLocationIdentifier;
}

- (double)probability
{
  return self->_probability;
}

- (BOOL)isEnter
{
  return self->_isEnter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microLocationIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
