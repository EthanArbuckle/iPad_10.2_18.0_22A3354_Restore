@implementation MKThreadContext

- (void)_CA_setDisableActions:(BOOL)a3
{
  int64_t CA_disableActionsCounter;
  int64_t v4;

  CA_disableActionsCounter = self->_CA_disableActionsCounter;
  if (a3)
  {
    self->_CA_disableActionsCounter = CA_disableActionsCounter + 1;
    if (CA_disableActionsCounter)
      return;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:");
    return;
  }
  v4 = CA_disableActionsCounter - 1;
  self->_CA_disableActionsCounter = v4;
  if (!v4)
    goto LABEL_5;
}

+ (id)currentContext
{
  void *v2;
  void *v3;
  MKThreadContext *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("MKThreadContext"));
  v4 = (MKThreadContext *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(MKThreadContext);
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("MKThreadContext"));
  }

  return v4;
}

@end
