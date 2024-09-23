@implementation CKTranscriptScrollIntentUpdateRequest

- (id)initDeferredScrollIntentEnforcementWithIntent:(int64_t)a3
{
  CKTranscriptScrollIntentUpdateRequest *v4;
  CKTranscriptScrollIntentUpdateRequest *v5;
  CKScrollViewAnimationProperties *animationProperties;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptScrollIntentUpdateRequest;
  v4 = -[CKTranscriptScrollIntentUpdateRequest init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    animationProperties = v4->_animationProperties;
    v4->_intent = a3;
    v4->_animationProperties = 0;

    v5->_wantsDeferredScrollIntentEnforcement = 1;
  }
  return v5;
}

- (CKTranscriptScrollIntentUpdateRequest)initWithAnimatedIntent:(int64_t)a3 animationProperties:(id)a4
{
  id v7;
  CKTranscriptScrollIntentUpdateRequest *v8;
  CKTranscriptScrollIntentUpdateRequest *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKTranscriptScrollIntentUpdateRequest;
  v8 = -[CKTranscriptScrollIntentUpdateRequest init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_intent = a3;
    objc_storeStrong((id *)&v8->_animationProperties, a4);
    v9->_wantsDeferredScrollIntentEnforcement = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CKDebugNameForCKTranscriptScrollIntent(-[CKTranscriptScrollIntentUpdateRequest intent](self, "intent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" intent=%@"), v4);

  -[CKTranscriptScrollIntentUpdateRequest animationProperties](self, "animationProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" animationProperties=%@"), v5);

  v6 = -[CKTranscriptScrollIntentUpdateRequest wantsDeferredScrollIntentEnforcement](self, "wantsDeferredScrollIntentEnforcement");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR(" wantsDeferredScrollIntentEnforcement=%@"), v7);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (int64_t)intent
{
  return self->_intent;
}

- (CKScrollViewAnimationProperties)animationProperties
{
  return self->_animationProperties;
}

- (BOOL)wantsDeferredScrollIntentEnforcement
{
  return self->_wantsDeferredScrollIntentEnforcement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationProperties, 0);
}

@end
