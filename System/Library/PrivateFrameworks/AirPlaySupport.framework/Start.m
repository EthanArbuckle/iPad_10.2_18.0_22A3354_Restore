@implementation Start

void __dataSource_Start_block_invoke(uint64_t a1)
{
  if (gLogCategory_APSPSGDataSource <= 50
    && (gLogCategory_APSPSGDataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dataSource_updateDevicePSGInfos(*(_QWORD *)(a1 + 32), 1);
}

void __dataSource_Start_block_invoke_2(uint64_t a1)
{
  dataSource_updateDevicePSGInfos(*(_QWORD *)(a1 + 32), 0);
}

@end
