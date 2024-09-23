@implementation DisplaySetBrightnessFactor

uint64_t ___DisplaySetBrightnessFactor_block_invoke(uint64_t result)
{
  uint64_t (*v1)(uint64_t, const __CFString *, _QWORD);
  uint64_t v2;

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 16))
  {
    v1 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)(result + 32) + 16);
    v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
    if (*(_DWORD *)(*(_QWORD *)(result + 32) + 44))
      return v1(v2, CFSTR("DisplayOn"), *MEMORY[0x1E0C9AE50]);
    else
      return v1(v2, CFSTR("DisplayOn"), *MEMORY[0x1E0C9AE40]);
  }
  return result;
}

uint64_t ___DisplaySetBrightnessFactor_block_invoke_2(uint64_t a1)
{
  notify_set_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(a1 + 40));
  return notify_post("com.apple.iokit.hid.displayStatus");
}

uint64_t ___DisplaySetBrightnessFactor_block_invoke_528(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 16))
    return (*(uint64_t (**)(_QWORD, const __CFString *, _QWORD))(*(_QWORD *)(result + 32) + 16))(*(_QWORD *)(*(_QWORD *)(result + 32) + 24), CFSTR("DisplayBrightnessFactorZero"), *MEMORY[0x1E0C9AE50]);
  return result;
}

@end
