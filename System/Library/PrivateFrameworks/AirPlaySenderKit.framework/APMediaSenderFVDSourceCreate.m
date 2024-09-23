@implementation APMediaSenderFVDSourceCreate

uint64_t __APMediaSenderFVDSourceCreate_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 88))
    return APSLogErrorAt();
  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return fvdsrc_submitPixelBufferInternal(v1, *(CVPixelBufferRef *)(v1 + 96), *(_QWORD *)(v1 + 104));
}

@end
