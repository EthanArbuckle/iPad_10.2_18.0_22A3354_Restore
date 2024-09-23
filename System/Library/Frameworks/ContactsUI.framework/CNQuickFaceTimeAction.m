@implementation CNQuickFaceTimeAction

- (id)identifier
{
  if (-[CNQuickFaceTimeAction audioOnly](self, "audioOnly"))
    return CFSTR("facetime-audio");
  else
    return CFSTR("facetime-video");
}

- (id)category
{
  _BOOL4 v2;
  uint64_t *v3;

  v2 = -[CNQuickFaceTimeAction audioOnly](self, "audioOnly");
  v3 = &CNQuickActionCategoryVideoCall;
  if (v2)
    v3 = &CNQuickActionCategoryAudioCall;
  return (id)*v3;
}

- (id)_coreDuetValue
{
  return 0;
}

- (id)_coreDuetInteractionMechanisms
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNQuickFaceTimeAction audioOnly](self, "audioOnly"))
    v4 = 11;
  else
    v4 = 17;
  objc_msgSend(v3, "addIndex:", v4);
  objc_msgSend(v3, "addIndex:", 10);
  return v3;
}

- (id)titleForContext:(int64_t)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  objc_super v8;

  v4 = 0;
  switch(a3)
  {
    case 0:
    case 2:
    case 3:
      v5 = -[CNQuickFaceTimeAction audioOnly](self, "audioOnly");
      v6 = (void *)objc_opt_class();
      if (!v5)
        goto LABEL_5;
      objc_msgSend(v6, "defaultFaceTimeAudioTitle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      v8.receiver = self;
      v8.super_class = (Class)CNQuickFaceTimeAction;
      -[CNQuickPropertyAction titleForContext:](&v8, sel_titleForContext_, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
    case 6:
      v6 = (void *)objc_opt_class();
LABEL_5:
      objc_msgSend(v6, "defaultFaceTimeTitle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v4;
  }
  return v4;
}

- (id)subtitleForContext:(int64_t)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  objc_super v7;

  if ((unint64_t)(a3 - 2) < 2)
  {
    v7.receiver = self;
    v7.super_class = (Class)CNQuickFaceTimeAction;
    -[CNQuickPropertyAction subtitleForContext:](&v7, sel_subtitleForContext_, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 4 && a3 != 1)
      return 0;
    v3 = -[CNQuickFaceTimeAction audioOnly](self, "audioOnly");
    v4 = (void *)objc_opt_class();
    if (v3)
      objc_msgSend(v4, "defaultFaceTimeAudioTitle");
    else
      objc_msgSend(v4, "defaultFaceTimeTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)score
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNQuickFaceTimeAction;
  return -[CNQuickPropertyAction score](&v3, sel_score) + 100;
}

- (void)performWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  if (+[CNQuickAction reallyPerform](CNQuickAction, "reallyPerform"))
  {
    -[CNQuickPropertyAction propertyAction](self, "propertyAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CNQuickFaceTimeAction audioOnly](self, "audioOnly"))
      v6 = 1;
    else
      v6 = 3;
    objc_msgSend(v5, "setType:", v6);
    objc_msgSend(v5, "performActionForItem:sender:", 0, self);
    -[CNQuickContactAction setCompletionBlock:](self, "setCompletionBlock:", v4);
    -[CNQuickContactAction actionDidFinish:](self, "actionDidFinish:", v5);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNQuickFaceTimeAction;
    -[CNQuickPropertyAction performWithCompletionBlock:](&v7, sel_performWithCompletionBlock_, v4);
  }

}

- (BOOL)audioOnly
{
  return self->_audioOnly;
}

- (void)setAudioOnly:(BOOL)a3
{
  self->_audioOnly = a3;
}

+ (id)defaultFaceTimeTitle
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTION_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultFaceTimeAudioTitle
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FACETIME_AUDIO_ACTION_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
