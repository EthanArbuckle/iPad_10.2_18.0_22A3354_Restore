@implementation ZN20QMIDataCommandDriver39sendWdsGetCurrentDataBearerTechReq

_QWORD *___ZN20QMIDataCommandDriver39sendWdsGetCurrentDataBearerTechReq_syncEv_block_invoke_68(_QWORD *result, unsigned __int8 *a2)
{
  *(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24) = *a2;
  *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *((_DWORD *)a2 + 1);
  *(_DWORD *)(*(_QWORD *)(result[6] + 8) + 24) = *((_DWORD *)a2 + 2);
  return result;
}

@end
