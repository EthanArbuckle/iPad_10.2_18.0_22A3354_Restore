@implementation ToggleReaderActivity

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_systemImageName
{
  void *v2;
  __CFString *v3;
  __CFString *v4;

  -[TabDocumentActivity tabDocument](self, "tabDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isShowingReader"))
    v3 = CFSTR("doc.plaintext.fill");
  else
    v3 = CFSTR("doc.plaintext");
  v4 = v3;

  return v4;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0CD5838];
}

- (int64_t)actionType
{
  return 5;
}

- (BOOL)_isEnabled
{
  return !-[ToggleReaderActivity _isDisabled](self, "_isDisabled");
}

- (BOOL)_isDisabled
{
  void *v2;
  char v3;

  -[TabDocumentActivity tabDocument](self, "tabDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReaderAvailable") ^ 1;

  return v3;
}

- (void)performActivityWithTabDocument:(id)a3
{
  void *v4;

  objc_msgSend(a3, "browserController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleShowingReaderForUserAction");

  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

@end
