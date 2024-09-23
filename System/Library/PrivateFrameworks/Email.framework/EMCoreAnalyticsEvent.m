@implementation EMCoreAnalyticsEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)name
{
  return self->_name;
}

- (EMCoreAnalyticsEvent)initWithEventName:(id)a3 collectionData:(id)a4
{
  id v7;
  id v8;
  EMCoreAnalyticsEvent *v9;
  EMCoreAnalyticsEvent *v10;
  uint64_t v11;
  NSDictionary *data;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EMCoreAnalyticsEvent;
  v9 = -[EMCoreAnalyticsEvent init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v11 = objc_msgSend(v8, "copy");
    data = v10->_data;
    v10->_data = (NSDictionary *)v11;

  }
  return v10;
}

- (NSDictionary)data
{
  return self->_data;
}

@end
