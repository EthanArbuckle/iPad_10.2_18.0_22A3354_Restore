@implementation CMScreenGetScreenType

void __CMScreenGetScreenType_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  CFTypeRef v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const void *ValueAtIndex;
  CFTypeRef cf;
  CFArrayRef theArray;
  CFTypeRef v10;
  CFTypeRef v11;

  v2 = CFSTR("None");
  if (cmscreenIsActivated())
  {
    v11 = 0;
    FigRoutingManagerContextUtilities_CopySystemMirroringContextUUID((uint64_t)&v11);
    v10 = 0;
    FigRoutingManagerContextUtilities_CopyPickedEndpointAtIndex((uint64_t)v11, 0, (uint64_t)&v10);
    v3 = v10;
    if (!v10)
    {
      theArray = 0;
      FigRoutingManagerContextUtilities_CopyPerAppSecondDisplayContextUUIDs((uint64_t)&theArray);
      if (theArray)
      {
        Count = CFArrayGetCount(theArray);
        if (Count >= 1)
        {
          v5 = Count;
          v6 = 0;
          while (1)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(theArray, v6);
            cf = 0;
            FigRoutingManagerContextUtilities_CopyPickedEndpointAtIndex((uint64_t)ValueAtIndex, 0, (uint64_t)&cf);
            if (FigRoutingManagerIsEndpointOfType((uint64_t)cf)
              || FigRoutingManagerIsEndpointOfType((uint64_t)cf))
            {
              break;
            }
            if (cf)
              CFRelease(cf);
            if (v5 == ++v6)
              goto LABEL_16;
          }
          if (cf)
          {
            v10 = CFRetain(cf);
            if (cf)
              CFRelease(cf);
          }
          else
          {
            v10 = 0;
          }
        }
LABEL_16:
        if (theArray)
          CFRelease(theArray);
      }
      v3 = v10;
    }
    if (FigRoutingManagerIsEndpointOfType((uint64_t)v3))
    {
      v2 = CFSTR("AirPlay");
    }
    else if (FigRoutingManagerIsEndpointOfType((uint64_t)v10))
    {
      v2 = CFSTR("TVOut");
    }
    if (v10)
    {
      CFRelease(v10);
      v10 = 0;
    }
    if (v11)
      CFRelease(v11);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
}

@end
