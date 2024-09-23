@implementation CKTranscriptScrollIntentTriggerUpdateContext

- (CKTranscriptScrollIntentTriggerUpdateContext)initWithContentOffsetScrollIntent:(int64_t)a3 currentScrollIntent:(int64_t)a4
{
  CKTranscriptScrollIntentTriggerUpdateContext *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptScrollIntentTriggerUpdateContext;
  result = -[CKTranscriptScrollIntentTriggerUpdateContext init](&v7, sel_init);
  if (result)
  {
    result->_contentOffsetScrollIntent = a3;
    result->_currentScrollIntent = a4;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CKDebugNameForCKTranscriptScrollIntent(-[CKTranscriptScrollIntentTriggerUpdateContext contentOffsetScrollIntent](self, "contentOffsetScrollIntent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" contentOffsetScrollIntent=%@"), v4);

  CKDebugNameForCKTranscriptScrollIntent(-[CKTranscriptScrollIntentTriggerUpdateContext currentScrollIntent](self, "currentScrollIntent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" currentScrollIntent=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (int64_t)contentOffsetScrollIntent
{
  return self->_contentOffsetScrollIntent;
}

- (int64_t)currentScrollIntent
{
  return self->_currentScrollIntent;
}

@end
