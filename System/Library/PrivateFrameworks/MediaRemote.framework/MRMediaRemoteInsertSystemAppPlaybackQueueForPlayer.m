@implementation MRMediaRemoteInsertSystemAppPlaybackQueueForPlayer

uint64_t __MRMediaRemoteInsertSystemAppPlaybackQueueForPlayer_block_invoke(uint64_t result, int a2, CFArrayRef theArray)
{
  uint64_t v5;
  CFIndex Count;
  unint64_t v7;
  CFIndex v8;
  unsigned int v9;
  const __CFNumber *ValueAtIndex;
  int valuePtr;

  if (*(_QWORD *)(result + 32))
  {
    v5 = result;
    if (theArray && (Count = CFArrayGetCount(theArray), valuePtr = 0, Count))
    {
      v7 = Count;
      v8 = 0;
      v9 = 1;
      while (1)
      {
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray, v8);
        CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
        if (valuePtr == 4)
          break;
        v8 = v9;
        if (v7 <= v9++)
          goto LABEL_7;
      }
    }
    else
    {
LABEL_7:
      if (!a2)
        _MRSendCommandReplyContainsSuccessfulStatus((CFIndex)theArray);
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v5 + 32) + 16))();
  }
  return result;
}

@end
