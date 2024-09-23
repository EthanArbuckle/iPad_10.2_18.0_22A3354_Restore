@implementation CFBasicHashCopyDescription

uint64_t __CFBasicHashCopyDescription_block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t (*v4)(uint64_t);
  CFStringRef v5;
  CFStringRef v6;
  uint64_t v7;
  CFStringRef v8;
  uint64_t (*v9)(uint64_t);
  CFStringRef v10;
  __CFString *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  if (*(_BYTE *)(a1 + 56))
  {
    v4 = *(uint64_t (**)(uint64_t))(CFBasicHashCallBackPtrs[((*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                               + 32) >> 14) >> 5) & 0x1F]
                                           + 8 * ((*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) >> 14) & 0x1FLL));
    if (v4)
      v5 = (CFStringRef)v4(a2[2]);
    else
      v5 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("<%p>"), a2[2]);
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 32);
    if ((*(_WORD *)(v7 + 18) & 4) == 0)
      goto LABEL_8;
    v9 = *(uint64_t (**)(uint64_t))(CFBasicHashCallBackPtrs[((*(_QWORD *)(v7 + 32) >> 4) >> 5) & 0x1F]
                                           + 8 * ((*(_QWORD *)(v7 + 32) >> 4) & 0x1FLL));
    if (v9)
    {
      v10 = (CFStringRef)v9(a2[1]);
LABEL_12:
      v8 = v10;
      goto LABEL_13;
    }
LABEL_11:
    v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("<%p>"), a2[1]);
    goto LABEL_12;
  }
  v6 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("<%p>"), a2[2]);
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 18) & 4) != 0)
    goto LABEL_11;
LABEL_8:
  v8 = 0;
LABEL_13:
  v11 = *(__CFString **)(a1 + 40);
  v12 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 18);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *a2;
  if ((v12 & 4) != 0 && (v12 & 0x18) != 0)
  {
    CFStringAppendFormat(v11, 0, CFSTR("%@%ld : %@ = %@ (%ld)\n"), v13, v14, v8, v6, a2[3]);
  }
  else if ((v12 & 4) != 0)
  {
    CFStringAppendFormat(v11, 0, CFSTR("%@%ld : %@ = %@\n"), v13, v14, v8, v6);
  }
  else if ((v12 & 0x18) != 0)
  {
    CFStringAppendFormat(v11, 0, CFSTR("%@%ld : %@ (%ld)\n"), v13, v14, v6, a2[3]);
  }
  else
  {
    CFStringAppendFormat(v11, 0, CFSTR("%@%ld : %@\n"), v13, *a2, v6);
  }
  if (v8)
    CFRelease(v8);
  if (v6)
    CFRelease(v6);
  return 1;
}

@end
