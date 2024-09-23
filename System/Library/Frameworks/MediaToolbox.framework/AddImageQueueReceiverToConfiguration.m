@implementation AddImageQueueReceiverToConfiguration

CFIndex __videoReceiver_AddImageQueueReceiverToConfiguration_block_invoke(uint64_t a1)
{
  CFIndex result;
  CFIndex v3;
  CFIndex v4;
  const __CFDictionary *ImageQueueReceiverByID;
  BOOL v6;

  result = FigDataChannelConfigurationGetChannelCount(*(_QWORD *)(a1 + 40));
  if (result >= 1)
  {
    v3 = result;
    v4 = 0;
    while (1)
    {
      while (1)
      {
        result = FigDataChannelConfigurationGetOutputQueueTypeAtIndex(*(_QWORD *)(a1 + 40), v4);
        if ((_DWORD)result == 1)
          break;
        if (++v4 >= v3)
          return result;
      }
      FigDataChannelConfigurationGetCAImageQueueIDAtIndex(*(_QWORD *)(a1 + 40), v4);
      ImageQueueReceiverByID = videoReceiver_getImageQueueReceiverByID();
      if (!ImageQueueReceiverByID)
        break;
      result = FigDataChannelConfigurationSetCAImageQueueReceiverAtIndex(*(_QWORD *)(a1 + 40), v4, (uint64_t)ImageQueueReceiverByID);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
      ++v4;
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        v6 = 0;
      else
        v6 = v4 < v3;
      if (!v6)
        return result;
    }
    result = FigSignalErrorAt();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

@end
