@implementation AFEnableCrashTrappingTTRs

void __AFEnableCrashTrappingTTRs_block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.assistant"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "BOOLForKey:", CFSTR("EnableCrashTrapTTR"));

}

@end
