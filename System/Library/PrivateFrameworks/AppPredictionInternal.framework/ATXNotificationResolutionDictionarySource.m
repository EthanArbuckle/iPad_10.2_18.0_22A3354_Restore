@implementation ATXNotificationResolutionDictionarySource

- (ATXNotificationResolutionDictionarySource)initWithResolutionDictionary:(id)a3
{
  id v5;
  ATXNotificationResolutionDictionarySource *v6;
  ATXNotificationResolutionDictionarySource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXNotificationResolutionDictionarySource;
  v6 = -[ATXNotificationResolutionDictionarySource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_resolutionDictionary, a3);

  return v7;
}

- (id)resolutionsForNotifications:(id)a3
{
  return self->_resolutionDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionDictionary, 0);
}

@end
