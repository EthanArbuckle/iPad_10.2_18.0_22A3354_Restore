@implementation NSUserDefaults(SBDefaultExistance)

- (BOOL)bs_defaultExists:()SBDefaultExistance
{
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v9;

  v5 = a3;
  if (!a1
    || (objc_getAssociatedObject(a1, "baseBoard_domain"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BSAbstractDefaultDomain.m"), 39, CFSTR("Domain must be present or we are unable to answer this question."));

    v6 = 0;
  }
  v7 = _CFPreferencesHasAppValue() != 0;

  return v7;
}

@end
