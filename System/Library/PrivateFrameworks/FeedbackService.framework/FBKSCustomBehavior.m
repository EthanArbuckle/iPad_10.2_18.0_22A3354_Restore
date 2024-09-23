@implementation FBKSCustomBehavior

- (FBKSCustomBehavior)initWithDictionary:(id)a3
{
  id v4;
  FBKSCustomBehavior *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *answers;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FBKSCustomBehavior;
  v5 = -[FBKSCustomBehavior init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("make_visible"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_makeVisible = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("notify_on_upload"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_notifyOnUpload = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("answers"));
    v8 = objc_claimAutoreleasedReturnValue();
    answers = v5->_answers;
    v5->_answers = (NSDictionary *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("launch_new_draft"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_launchNewDraft = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("is_captive"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isCaptive = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("form_id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_storeStrong((id *)&v5->_formId, v12);

  }
  return v5;
}

- (NSString)description
{
  void *v2;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v13;

  v13 = (void *)MEMORY[0x24BDD17C8];
  if (-[FBKSCustomBehavior isCaptive](self, "isCaptive"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (-[FBKSCustomBehavior makeVisible](self, "makeVisible"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[FBKSCustomBehavior notifyOnUpload](self, "notifyOnUpload"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[FBKSCustomBehavior formId](self, "formId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[FBKSCustomBehavior formId](self, "formId");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringValue");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("(null)");
  }
  if (-[FBKSCustomBehavior launchNewDraft](self, "launchNewDraft"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[FBKSCustomBehavior isCaptive](self, "isCaptive"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("FBKSCustomBehavior – isCaptive:%@, makeVisible:%@, notifyOnUpload:%@, formID:%@, launchDraft:%@, answers:%@"), v4, v5, v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  return (NSString *)v11;
}

- (BOOL)makeVisible
{
  return self->_makeVisible;
}

- (void)setMakeVisible:(BOOL)a3
{
  self->_makeVisible = a3;
}

- (BOOL)notifyOnUpload
{
  return self->_notifyOnUpload;
}

- (void)setNotifyOnUpload:(BOOL)a3
{
  self->_notifyOnUpload = a3;
}

- (NSNumber)formId
{
  return self->_formId;
}

- (void)setFormId:(id)a3
{
  objc_storeStrong((id *)&self->_formId, a3);
}

- (NSDictionary)answers
{
  return self->_answers;
}

- (void)setAnswers:(id)a3
{
  objc_storeStrong((id *)&self->_answers, a3);
}

- (BOOL)launchNewDraft
{
  return self->_launchNewDraft;
}

- (void)setLaunchNewDraft:(BOOL)a3
{
  self->_launchNewDraft = a3;
}

- (BOOL)isCaptive
{
  return self->_isCaptive;
}

- (void)setIsCaptive:(BOOL)a3
{
  self->_isCaptive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_answers, 0);
  objc_storeStrong((id *)&self->_formId, 0);
}

@end
