@implementation BBServerSetDefaultExpirationComponents

uint64_t __BBServerSetDefaultExpirationComponents_block_invoke(uint64_t a1)
{
  return objc_msgSend((id)__server, "_setDefaultExpirationComponents:", *(_QWORD *)(a1 + 32));
}

@end
