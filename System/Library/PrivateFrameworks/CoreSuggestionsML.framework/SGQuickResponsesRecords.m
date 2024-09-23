@implementation SGQuickResponsesRecords

- (SGQuickResponsesRecords)initWithReplyRecords:(id)a3 totalOpportunities:(double)a4 totalDisplayed:(double)a5 totalSelected:(double)a6 totalMatched:(double)a7 totalUnmatched:(double)a8
{
  id v16;
  SGQuickResponsesRecords *v17;
  SGQuickResponsesRecords *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v16 = a3;
  if (a4 < 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesStore.m"), 1294, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("totalOpportunities >= 0"));

  }
  if (a5 < 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesStore.m"), 1295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("totalDisplayed >= 0"));

  }
  if (a6 < 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesStore.m"), 1296, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("totalSelected >= 0"));

  }
  if (a7 < 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesStore.m"), 1297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("totalMatched >= 0"));

  }
  if (a8 < 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesStore.m"), 1298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("totalUnmatched >= 0"));

  }
  v25.receiver = self;
  v25.super_class = (Class)SGQuickResponsesRecords;
  v17 = -[SGQuickResponsesRecords init](&v25, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_replyRecords, a3);
    v18->_totalOpportunities = a4;
    v18->_totalDisplayed = a5;
    v18->_totalSelected = a6;
    v18->_totalMatched = a7;
    v18->_totalUnmatched = a8;
  }

  return v18;
}

- (NSArray)replyRecords
{
  return self->_replyRecords;
}

- (double)totalOpportunities
{
  return self->_totalOpportunities;
}

- (double)totalDisplayed
{
  return self->_totalDisplayed;
}

- (double)totalSelected
{
  return self->_totalSelected;
}

- (double)totalMatched
{
  return self->_totalMatched;
}

- (double)totalUnmatched
{
  return self->_totalUnmatched;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyRecords, 0);
}

@end
