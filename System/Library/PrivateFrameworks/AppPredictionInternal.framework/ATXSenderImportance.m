@implementation ATXSenderImportance

- (ATXSenderImportance)initWithSenderImportanceScore:(double)a3 featureDictionary:(id)a4
{
  id v7;
  ATXSenderImportance *v8;
  ATXSenderImportance *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ATXSenderImportance;
  v8 = -[ATXSenderImportance init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_senderImportanceScore = a3;
    objc_storeStrong((id *)&v8->_featureDictionary, a4);
  }

  return v9;
}

- (double)senderImportanceScore
{
  return self->_senderImportanceScore;
}

- (NSDictionary)featureDictionary
{
  return self->_featureDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureDictionary, 0);
}

@end
