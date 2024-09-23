@implementation LSPrecondition

- (BOOL)isMet
{
  return 1;
}

- (id)description
{
  return CFSTR("<LSPrecondition: empty>");
}

+ (id)emptyPrecondition
{
  if (+[LSPrecondition emptyPrecondition]::onceToken != -1)
    dispatch_once(&+[LSPrecondition emptyPrecondition]::onceToken, &__block_literal_global_57);
  return (id)+[LSPrecondition emptyPrecondition]::result;
}

void __35__LSPrecondition_emptyPrecondition__block_invoke()
{
  LSPrecondition *v0;
  void *v1;

  v0 = objc_alloc_init(LSPrecondition);
  v1 = (void *)+[LSPrecondition emptyPrecondition]::result;
  +[LSPrecondition emptyPrecondition]::result = (uint64_t)v0;

}

+ (id)registrationStatePreconditionForBundleWithIdentifier:(id)a3 placeholderInstalled:(id)a4 fullApplicationInstalled:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[LSBundleRegistrationStatePrecondition initForBundleWithIdentifier:placeholderInstalled:fullApplicationInstalled:]([LSBundleRegistrationStatePrecondition alloc], "initForBundleWithIdentifier:placeholderInstalled:fullApplicationInstalled:", v7, v8, v9);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
