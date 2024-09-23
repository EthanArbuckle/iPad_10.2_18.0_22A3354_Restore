@implementation SGMIBiomeSummaryResults

- (SGMIBiomeSummaryResults)initWithBiomeSummaryByMessage:(id)a3 biomeMessageIdByPersistentId:(id)a4
{
  id v7;
  id v8;
  SGMIBiomeSummaryResults *v9;
  SGMIBiomeSummaryResults *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGMIBiomeSummaryResults;
  v9 = -[SGMIBiomeSummaryResults init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_biomeSummaryByMessage, a3);
    objc_storeStrong((id *)&v10->_biomeMessageIdByPersistentId, a4);
  }

  return v10;
}

- (NSDictionary)biomeSummaryByMessage
{
  return self->_biomeSummaryByMessage;
}

- (NSDictionary)biomeMessageIdByPersistentId
{
  return self->_biomeMessageIdByPersistentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeMessageIdByPersistentId, 0);
  objc_storeStrong((id *)&self->_biomeSummaryByMessage, 0);
}

@end
