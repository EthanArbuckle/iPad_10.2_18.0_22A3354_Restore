@implementation CFBasicHashCopyDescription

uint64_t __CFBasicHashCopyDescription_block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t (*v4)(void);
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  if (*(_BYTE *)(a1 + 56))
    v4 = **(uint64_t (***)(void))(*(_QWORD *)(a1 + 32) + 32);
  else
    v4 = (uint64_t (*)(void))__CFBasicHashNullCallback;
  v5 = (const void *)v4();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 16);
  if ((v7 & 0x18) != 0)
  {
    v8 = (const void *)((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))v4)(v6, 26, a2[1], 0, *(_QWORD *)(v6 + 32));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v8 = 0;
  }
  v9 = v7 & 0x18;
  v10 = v7 & 0x380;
  v11 = *(__CFString **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *a2;
  if (v9)
    v14 = v10 == 0;
  else
    v14 = 1;
  if (v14)
  {
    if (v9)
    {
      CFStringAppendFormat(v11, 0, CFSTR("%@%ld : %@ = %@\n"), v12, v13, v8, v5);
    }
    else if (v10)
    {
      CFStringAppendFormat(v11, 0, CFSTR("%@%ld : %@ (%ld)\n"), v12, v13, v5, a2[5]);
    }
    else
    {
      CFStringAppendFormat(v11, 0, CFSTR("%@%ld : %@\n"), v12, *a2, v5);
    }
  }
  else
  {
    CFStringAppendFormat(v11, 0, CFSTR("%@%ld : %@ = %@ (%ld)\n"), v12, v13, v8, v5, a2[5]);
  }
  if (v8)
    CFRelease(v8);
  if (v5)
    CFRelease(v5);
  return 1;
}

@end
