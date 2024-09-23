@implementation APAdvertiserUpdateNANLinkStatus

uint64_t __APAdvertiserUpdateNANLinkStatus_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v2 + 160))
  {
    if (gLogCategory_APAdvertiser <= 50 && (gLogCategory_APAdvertiser != -1 || _LogCategory_Initialize()))
      LogPrintF();
    result = BonjourAdvertiserUpdateLinkStatusNAN();
    v2 = *(_QWORD *)(v1 + 32);
  }
  if (*(_QWORD *)(v2 + 152))
  {
    if (gLogCategory_APAdvertiser <= 50 && (gLogCategory_APAdvertiser != -1 || _LogCategory_Initialize()))
      LogPrintF();
    return BonjourAdvertiserUpdateLinkStatusNAN();
  }
  return result;
}

@end
