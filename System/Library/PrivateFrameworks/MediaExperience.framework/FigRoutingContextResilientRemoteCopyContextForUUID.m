@implementation FigRoutingContextResilientRemoteCopyContextForUUID

uint64_t __FigRoutingContextResilientRemoteCopyContextForUUID_block_invoke(uint64_t a1, uint64_t a2)
{
  __CFDictionary *MutableCopy;
  uint64_t v5;
  uint64_t v6;

  MutableCopy = CFDictionaryCreateMutableCopy(*(CFAllocatorRef *)(a1 + 40), 0, *(CFDictionaryRef *)(a1 + 48));
  CFDictionaryRemoveValue(MutableCopy, CFSTR("contextUUID"));
  switch(*(_DWORD *)(a1 + 56))
  {
    case 1:
      v5 = objc_msgSend(*(id *)(a1 + 32), "copySystemAudioContextWithAllocator:options:context:", *(_QWORD *)(a1 + 40), MutableCopy, a2);
      break;
    case 2:
      v5 = objc_msgSend(*(id *)(a1 + 32), "copySystemMirroringContextWithAllocator:options:context:", *(_QWORD *)(a1 + 40), MutableCopy, a2);
      break;
    case 3:
      v5 = objc_msgSend(*(id *)(a1 + 32), "copySystemMusicContextWithAllocator:options:context:", *(_QWORD *)(a1 + 40), MutableCopy, a2);
      break;
    case 4:
      v5 = objc_msgSend(*(id *)(a1 + 32), "createAudioContextWithAllocator:options:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
      break;
    case 5:
      v5 = objc_msgSend(*(id *)(a1 + 32), "createVideoContextWithAllocator:options:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
      break;
    case 6:
      v5 = objc_msgSend(*(id *)(a1 + 32), "createPerAppSecondDisplayContextWithAllocator:options:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
      break;
    case 0xC:
      v5 = objc_msgSend(*(id *)(a1 + 32), "copySidePlayContextWithAllocator:options:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
      break;
    default:
      v5 = objc_msgSend(*(id *)(a1 + 32), "copyContextForUUIDWithAllocator:options:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
      break;
  }
  v6 = v5;
  if (MutableCopy)
    CFRelease(MutableCopy);
  return v6;
}

void __FigRoutingContextResilientRemoteCopyContextForUUID_block_invoke_2(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
}

@end
