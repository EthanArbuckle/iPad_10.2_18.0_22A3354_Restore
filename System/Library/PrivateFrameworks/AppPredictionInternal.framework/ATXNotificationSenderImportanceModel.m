@implementation ATXNotificationSenderImportanceModel

- (id)calculateSenderImportanceForNotificationWithContextRequest:(id)a3
{
  id v3;
  ATXSenderImportance *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = -[ATXSenderImportance initWithSenderImportanceScore:featureDictionary:]([ATXSenderImportance alloc], "initWithSenderImportanceScore:featureDictionary:", v3, 0.0);

  return v4;
}

@end
