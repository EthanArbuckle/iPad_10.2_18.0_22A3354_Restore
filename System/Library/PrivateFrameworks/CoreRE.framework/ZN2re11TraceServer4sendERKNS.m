@implementation ZN2re11TraceServer4sendERKNS

re::TraceServer *___ZN2re11TraceServer4sendERKNS_12TraceMessageEP13nw_connection_block_invoke(uint64_t a1)
{
  re::TraceServer *result;
  uint64_t v3;
  nw_connection *v4;
  uint64_t v5;
  nw_connection ***i;
  nw_connection **v7;
  int v8;

  if (result)
  {
    v3 = *((_QWORD *)result + 27);
    if (v3)
    {
      v4 = *(nw_connection **)(a1 + 40);
      v5 = 8 * v3;
      for (i = (nw_connection ***)*((_QWORD *)result + 29); ; ++i)
      {
        v7 = *i;
        if (**i == v4)
          break;
        v5 -= 8;
        if (!v5)
          return result;
      }
      if (*(_BYTE *)(a1 + 48) == 2)
      {
        v8 = *((_DWORD *)v7 + 33) - 1;
        *((_DWORD *)v7 + 33) = v8;
        if (!v8)
        {
          if (v7[5])
          {
            re::TraceServer::send(result, (const re::TraceDelta *)(v7 + 1), v4);
            v7[18] = v7[2];
            return (re::TraceServer *)re::DynamicArray<re::TraceEntry>::clear(v7 + 3);
          }
        }
      }
    }
  }
  return result;
}

@end
