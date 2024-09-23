@implementation NSBundle

void __36__NSBundle_MailUI__mui_MailUIBundle__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MailUI"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)mui_MailUIBundle_bundle;
  mui_MailUIBundle_bundle = v2;

  if (!mui_MailUIBundle_bundle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("NSBundle+MailUI.m"), 20, CFSTR("Failed to load com.apple.MailUI bundle"));

  }
}

@end
