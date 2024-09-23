@implementation BKRedirectHIDEvent

void ___BKRedirectHIDEvent_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setDisplay:", v3);
  objc_msgSend(v4, "setPid:", *(unsigned int *)(a1 + 48));
  objc_msgSend(v4, "setToken:", *(_QWORD *)(a1 + 40));

}

@end
