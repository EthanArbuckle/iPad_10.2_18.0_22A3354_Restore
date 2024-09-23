@implementation CSRemoteVADSignalExtractor

- (CSRemoteVADSignalExtractor)initWithToken:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSRemoteVADSignalExtractor;
  return -[CSVADSignalExtractor initWithToken:delegate:](&v4, sel_initWithToken_delegate_, a3, 0);
}

- (void)feedRemoteVAD:(id)a3 startSampleCount:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  float v10;
  float v11;
  float v12;
  objc_super v13;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  if ((int)objc_msgSend(v6, "length") >= 1)
  {
    v8 = 0;
    do
    {
      v9 = *(_BYTE *)(v7 + v8) != 0;
      +[CSConfig remoteVADDuration](CSConfig, "remoteVADDuration");
      v11 = v10;
      +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
      v13.receiver = self;
      v13.super_class = (Class)CSRemoteVADSignalExtractor;
      -[CSVADSignalExtractor processBufferSampleWithIndex:startSampleCount:isSampleRepresentSpeech:vadToSpeechRatio:](&v13, sel_processBufferSampleWithIndex_startSampleCount_isSampleRepresentSpeech_vadToSpeechRatio_, v8++, a4, v9, (unint64_t)(float)(v11 * v12));
    }
    while (v8 < (int)objc_msgSend(v6, "length"));
  }

}

@end
