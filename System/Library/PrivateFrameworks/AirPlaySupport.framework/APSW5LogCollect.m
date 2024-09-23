@implementation APSW5LogCollect

void __APSW5LogCollect_block_invoke()
{
  if (gLogCategory_APSW5Log <= 40 && (gLogCategory_APSW5Log != -1 || _LogCategory_Initialize()))
    LogPrintF();
}

@end
