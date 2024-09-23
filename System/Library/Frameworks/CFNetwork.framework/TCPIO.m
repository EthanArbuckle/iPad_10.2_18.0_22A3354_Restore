@implementation TCPIO

TCPIO_BlockCallbacks_Listener *___ZN15TCPIO_Establish20setupBlockPropertiesENSt3__110shared_ptrI25TransportConnectionObjCPPEE_block_invoke(TCPIO_BlockCallbacks_Listener *result)
{
  id var3;
  TCPIO_BlockCallbacks_Listener *v2;

  var3 = result->var1.var3;
  if (var3)
  {
    v2 = (TCPIO_BlockCallbacks_Listener *)*((_QWORD *)var3 + 1);
    if (v2)
      TCPIO_BlockCallbacks_Listener::receiveEvent(v2, CFSTR("_kCFStreamPropertyExcessiveKeepalivesBlock"));
    result = (TCPIO_BlockCallbacks_Listener *)*((_QWORD *)var3 + 2);
    if (result)
      return (TCPIO_BlockCallbacks_Listener *)TCPIO_BlockCallbacks_Listener::receiveEvent(result, CFSTR("_kCFStreamPropertyExcessiveKeepalivesBlock"));
  }
  return result;
}

TCPIO_BlockCallbacks_Listener *___ZN15TCPIO_Establish20setupBlockPropertiesENSt3__110shared_ptrI25TransportConnectionObjCPPEE_block_invoke_3(TCPIO_BlockCallbacks_Listener *result)
{
  id var3;
  TCPIO_BlockCallbacks_Listener *v2;

  var3 = result->var1.var3;
  if (var3)
  {
    v2 = (TCPIO_BlockCallbacks_Listener *)*((_QWORD *)var3 + 1);
    if (v2)
      TCPIO_BlockCallbacks_Listener::receiveEvent(v2, CFSTR("_kCFStreamPropertyLowThroughputBlock"));
    result = (TCPIO_BlockCallbacks_Listener *)*((_QWORD *)var3 + 2);
    if (result)
      return (TCPIO_BlockCallbacks_Listener *)TCPIO_BlockCallbacks_Listener::receiveEvent(result, CFSTR("_kCFStreamPropertyLowThroughputBlock"));
  }
  return result;
}

TCPIO_BlockCallbacks_Listener *___ZN15TCPIO_Establish20setupBlockPropertiesENSt3__110shared_ptrI25TransportConnectionObjCPPEE_block_invoke_276(TCPIO_BlockCallbacks_Listener *result, uint64_t a2, unsigned __int8 a3)
{
  id var3;
  TCPIO_BlockCallbacks_Listener *v5;

  var3 = result->var1.var3;
  if (var3)
  {
    v5 = (TCPIO_BlockCallbacks_Listener *)*((_QWORD *)var3 + 1);
    if (v5)
      TCPIO_BlockCallbacks_Listener::receiveEvent(v5, CFSTR("_kCFStreamPropertyConnectionWaitingBlock"), a3);
    result = (TCPIO_BlockCallbacks_Listener *)*((_QWORD *)var3 + 2);
    if (result)
      return (TCPIO_BlockCallbacks_Listener *)TCPIO_BlockCallbacks_Listener::receiveEvent(result, CFSTR("_kCFStreamPropertyConnectionWaitingBlock"), a3);
  }
  return result;
}

TCPIO_BlockCallbacks_Listener *___ZN15TCPIO_Establish20setupBlockPropertiesENSt3__110shared_ptrI25TransportConnectionObjCPPEE_block_invoke_3_280(TCPIO_BlockCallbacks_Listener *result, int a2, uint64_t a3)
{
  id var3;
  TCPIO_BlockCallbacks_Listener *v5;

  var3 = result->var1.var3;
  if (var3)
  {
    v5 = (TCPIO_BlockCallbacks_Listener *)*((_QWORD *)var3 + 1);
    if (v5)
      TCPIO_BlockCallbacks_Listener::receiveEvent(v5, (const __CFString *)&unk_1EDCFA170, a3);
    result = (TCPIO_BlockCallbacks_Listener *)*((_QWORD *)var3 + 2);
    if (result)
      return (TCPIO_BlockCallbacks_Listener *)TCPIO_BlockCallbacks_Listener::receiveEvent(result, (const __CFString *)&unk_1EDCFA170, a3);
  }
  return result;
}

@end
