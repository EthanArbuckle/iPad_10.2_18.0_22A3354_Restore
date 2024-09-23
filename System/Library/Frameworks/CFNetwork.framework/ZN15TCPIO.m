@implementation ZN15TCPIO

id *___ZN15TCPIO_Establish20setupBlockPropertiesENSt3__110shared_ptrI25TransportConnectionObjCPPEE_block_invoke_5_282(id *result)
{
  id v1;
  TCPIO_BlockCallbacks_Listener *v2;
  id *PropertyBlockPtr;
  void (**v4)(void);

  v1 = result[4];
  if (v1)
  {
    v2 = (TCPIO_BlockCallbacks_Listener *)*((_QWORD *)v1 + 1);
    if (v2)
    {
      PropertyBlockPtr = TCPIO_BlockCallbacks_Listener::findPropertyBlockPtr(v2, (CFStringRef)&unk_1EDCFA1A8);
      if (PropertyBlockPtr)
      {
        v4 = (void (**)(void))*PropertyBlockPtr;
        if (v4)
          v4[2]();
      }
    }
    result = (id *)*((_QWORD *)v1 + 2);
    if (result)
    {
      result = TCPIO_BlockCallbacks_Listener::findPropertyBlockPtr((TCPIO_BlockCallbacks_Listener *)result, (CFStringRef)&unk_1EDCFA1A8);
      if (result)
      {
        result = (id *)*result;
        if (result)
          return (id *)((uint64_t (*)(void))result[2])();
      }
    }
  }
  return result;
}

@end
