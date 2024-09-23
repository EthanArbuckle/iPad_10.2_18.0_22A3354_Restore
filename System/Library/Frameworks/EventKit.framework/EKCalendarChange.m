@implementation EKCalendarChange

+ (int)entityType
{
  return 1;
}

- (EKCalendarChange)initWithChangeProperties:(id)a3
{
  id v4;
  EKCalendarChange *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *calendarIdentifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKCalendarChange;
  v5 = -[EKObjectChange initWithChangeProperties:](&v12, sel_initWithChangeProperties_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_titleChanged = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("color"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_colorChanged = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("display_order"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_orderChanged = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UUID"));
    v9 = objc_claimAutoreleasedReturnValue();
    calendarIdentifier = v5->_calendarIdentifier;
    v5->_calendarIdentifier = (NSString *)v9;

  }
  return v5;
}

- (BOOL)titleChanged
{
  return self->_titleChanged;
}

- (BOOL)colorChanged
{
  return self->_colorChanged;
}

- (BOOL)orderChanged
{
  return self->_orderChanged;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
}

@end
