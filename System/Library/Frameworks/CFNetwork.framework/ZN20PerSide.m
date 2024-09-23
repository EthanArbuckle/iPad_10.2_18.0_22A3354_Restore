@implementation ZN20PerSide

NSObject *___ZN20PerSide_CFReadStream17_offqueue_canReadEPP9__CFError_block_invoke(NSObject *result)
{
  NSObject *v1;
  uint64_t v2;
  _QWORD *isa;
  CFTypeRef v4;
  BOOL v5;

  v1 = result;
  v2 = *((_QWORD *)result[5].isa + 1);
  if (v2)
  {
    isa = result[6].isa;
    if (!isa)
      __assert_rtn("-[NWStreamPair _onqueue_canRead:]", "HTTPServerNWStream.mm", 850, "error != NULL");
    v4 = *(CFTypeRef *)(v2 + 56);
    if (v4)
      v4 = CFRetain(v4);
    *isa = v4;
    result = ReadBuffer::countOfAvailableBytes(*(ReadBuffer **)(v2 + 72));
    v5 = (uint64_t)result > 0 || *isa || *(_BYTE *)(v2 + 80) || *(_BYTE *)(v2 + 82) != 0;
  }
  else
  {
    v5 = 0;
  }
  *(_BYTE *)(*((_QWORD *)v1[4].isa + 1) + 24) = v5;
  return result;
}

@end
