@implementation AVVCAudioBuffer(remoteVoiceActivityVADBuffer)

- (id)remoteVoiceActivityVADBuffer
{
  void *v2;
  char v4;

  if (objc_msgSend(a1, "remoteVoiceActivityAvailable"))
  {
    v4 = objc_msgSend(a1, "remoteVoiceActivityVAD");
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
