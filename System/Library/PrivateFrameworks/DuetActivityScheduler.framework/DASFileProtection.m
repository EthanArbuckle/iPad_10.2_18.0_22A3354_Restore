@implementation DASFileProtection

void __26___DASFileProtection_none__block_invoke()
{
  _DASFileProtection *v0;
  uint64_t v1;
  void *v2;

  v0 = [_DASFileProtection alloc];
  v1 = -[_DASFileProtection initWithProtection:](v0, "initWithProtection:", *MEMORY[0x1E0CB2AE0]);
  v2 = (void *)none_fileCompletionNone;
  none_fileCompletionNone = v1;

}

void __30___DASFileProtection_complete__block_invoke()
{
  _DASFileProtection *v0;
  uint64_t v1;
  void *v2;

  v0 = [_DASFileProtection alloc];
  v1 = -[_DASFileProtection initWithProtection:](v0, "initWithProtection:", *MEMORY[0x1E0CB2AB0]);
  v2 = (void *)complete_fileCompletionComplete;
  complete_fileCompletionComplete = v1;

}

void __40___DASFileProtection_completeUnlessOpen__block_invoke()
{
  _DASFileProtection *v0;
  uint64_t v1;
  void *v2;

  v0 = [_DASFileProtection alloc];
  v1 = -[_DASFileProtection initWithProtection:](v0, "initWithProtection:", *MEMORY[0x1E0CB2AB8]);
  v2 = (void *)completeUnlessOpen_fileCompletionCompleteUnlessOpen;
  completeUnlessOpen_fileCompletionCompleteUnlessOpen = v1;

}

void __58___DASFileProtection_completeUntilFirstUserAuthentication__block_invoke()
{
  _DASFileProtection *v0;
  uint64_t v1;
  void *v2;

  v0 = [_DASFileProtection alloc];
  v1 = -[_DASFileProtection initWithProtection:](v0, "initWithProtection:", *MEMORY[0x1E0CB2AC0]);
  v2 = (void *)completeUntilFirstUserAuthentication_fileCompletionCompleteUntilFirstUserAuthentication;
  completeUntilFirstUserAuthentication_fileCompletionCompleteUntilFirstUserAuthentication = v1;

}

@end
