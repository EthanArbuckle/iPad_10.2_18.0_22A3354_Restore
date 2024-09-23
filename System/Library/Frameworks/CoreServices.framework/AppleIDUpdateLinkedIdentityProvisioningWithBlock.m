@implementation AppleIDUpdateLinkedIdentityProvisioningWithBlock

void ___AppleIDUpdateLinkedIdentityProvisioningWithBlock_block_invoke(uint64_t a1)
{
  CFTypeRef cf;

  cf = 0;
  _CSIdentityUpdateLinkedIdentityProvisioning(*(_QWORD *)(a1 + 40), (CFErrorRef *)&cf);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (cf)
    CFRelease(cf);
}

@end
