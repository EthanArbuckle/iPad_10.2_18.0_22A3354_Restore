@implementation HIDAnalyticsHistogramEvent

- (HIDAnalyticsHistogramEvent)initWithAttributes:(id)a3 description:(id)a4
{
  HIDAnalyticsHistogramEvent *v4;
  HIDAnalyticsHistogramEvent *v5;
  HIDAnalyticsHistogramEvent *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HIDAnalyticsHistogramEvent;
  v4 = -[HIDAnalyticsEvent initWithAttributes:description:](&v8, sel_initWithAttributes_description_, a3, a4);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

- (void)addHistogramFieldWithSegments:(id)a3 segments:(_HIDAnalyticsHistogramSegmentConfig *)a4 count:(int64_t)a5
{
  id v8;
  HIDAnalyticsHistogramEventField *v9;
  HIDAnalyticsHistogramEventField *field;

  v8 = a3;
  v9 = -[HIDAnalyticsHistogramEventField initWithAttributes:segments:count:]([HIDAnalyticsHistogramEventField alloc], "initWithAttributes:segments:count:", v8, a4, a5);

  field = self->_field;
  self->_field = v9;

}

- (id)value
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_isUpdated)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[HIDAnalyticsHistogramEventField fieldName](self->_field, "fieldName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Name"));

    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24D3F4218, CFSTR("Type"));
    -[HIDAnalyticsHistogramEventField value](self->_field, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("Value"));

    objc_msgSend(v3, "addObject:", v4);
    self->_isUpdated = 0;
    if (objc_msgSend(v3, "count"))
      v7 = v3;
    else
      v7 = 0;
    v8 = v7;

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)setIntegerValue:(unint64_t)a3
{
  -[HIDAnalyticsHistogramEventField setIntegerValue:](self->_field, "setIntegerValue:", a3);
  self->_isUpdated = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_field, 0);
}

- (void)setValue:(id)a3
{
  -[HIDAnalyticsHistogramEventField setValue:](self->_field, "setValue:", a3);
}

@end
