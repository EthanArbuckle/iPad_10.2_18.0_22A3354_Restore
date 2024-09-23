@implementation SGQuickResponsesReplyRecord

- (SGQuickResponsesReplyRecord)initWithDisplayed:(double)a3 selected:(double)a4 matched:(double)a5
{
  SGQuickResponsesReplyRecord *result;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  if (a3 < 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesStore.m"), 1317, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayed >= 0"));

  }
  if (a4 < 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesStore.m"), 1318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selected >= 0"));

  }
  if (a5 < 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesStore.m"), 1319, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("matched >= 0"));

  }
  v14.receiver = self;
  v14.super_class = (Class)SGQuickResponsesReplyRecord;
  result = -[SGQuickResponsesReplyRecord init](&v14, sel_init);
  if (result)
  {
    result->_displayed = a3;
    result->_selected = a4;
    result->_matched = a5;
  }
  return result;
}

- (NSString)langResponse
{
  return self->_langResponse;
}

- (double)displayed
{
  return self->_displayed;
}

- (double)selected
{
  return self->_selected;
}

- (double)matched
{
  return self->_matched;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_langResponse, 0);
}

@end
