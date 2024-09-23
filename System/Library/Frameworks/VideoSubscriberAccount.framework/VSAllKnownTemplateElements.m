@implementation VSAllKnownTemplateElements

void __VSAllKnownTemplateElements_block_invoke()
{
  uint64_t v0;
  void *v1;

  __VSAllKnownTemplateElements_block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VSAllKnownTemplateElements___vs_lazy_init_variable;
  VSAllKnownTemplateElements___vs_lazy_init_variable = v0;

}

id __VSAllKnownTemplateElements_block_invoke_2()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v0, "addObject:", CFSTR("authenticationTemplate"));
  objc_msgSend(v0, "addObject:", CFSTR("autoAuthenticationTemplate"));
  objc_msgSend(v0, "addObject:", CFSTR("webAuthenticationTemplate"));
  objc_msgSend(v0, "addObject:", CFSTR("onscreenCodeAuthenticationTemplate"));
  objc_msgSend(v0, "addObject:", CFSTR("twoFactorVerificationTemplate"));
  v1 = (void *)objc_msgSend(v0, "copy");

  return v1;
}

@end
