@implementation APMetadataSourceStop

void __APMetadataSourceStop_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "stop");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  if (gLogCategory_APMetadataSource <= 50
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

@end
