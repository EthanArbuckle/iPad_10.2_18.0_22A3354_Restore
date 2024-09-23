@implementation AppleIDAuthenticationForgetAppleIDWithBlock

void ___AppleIDAuthenticationForgetAppleIDWithBlock_block_invoke(uint64_t a1)
{
  CFErrorRef v2;

  v2 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("CSIdentityErrorDomain"), -114, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v2)
    CFRelease(v2);
}

@end
