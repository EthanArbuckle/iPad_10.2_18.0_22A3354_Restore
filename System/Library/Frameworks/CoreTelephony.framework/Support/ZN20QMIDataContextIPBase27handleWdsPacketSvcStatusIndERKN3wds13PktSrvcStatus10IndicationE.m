@implementation ZN20QMIDataContextIPBase27handleWdsPacketSvcStatusIndERKN3wds13PktSrvcStatus10IndicationE

_QWORD *___ZN20QMIDataContextIPBase27handleWdsPacketSvcStatusIndERKN3wds13PktSrvcStatus10IndicationE_block_invoke_147(_QWORD *result, _DWORD *a2)
{
  int v2;
  BOOL v3;

  *(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24) = *a2;
  v2 = *(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24);
  if (v2)
    v3 = v2 != *(_DWORD *)(*(_QWORD *)(result[6] + 8) + 24);
  else
    v3 = 1;
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = v3;
  return result;
}

@end
