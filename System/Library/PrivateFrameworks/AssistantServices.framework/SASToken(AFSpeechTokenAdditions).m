@implementation SASToken(AFSpeechTokenAdditions)

- (AFSpeechToken)af_speechToken
{
  AFSpeechToken *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc_init(AFSpeechToken);
  objc_msgSend(a1, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFSpeechToken setText:](v2, "setText:", v3);

  objc_msgSend(a1, "phoneSequence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFSpeechToken setPhoneSequence:](v2, "setPhoneSequence:", v4);

  objc_msgSend(a1, "confidenceScore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFSpeechToken setConfidenceScore:](v2, "setConfidenceScore:", (int)objc_msgSend(v5, "intValue"));

  objc_msgSend(a1, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFSpeechToken setStartTime:](v2, "setStartTime:", (double)(int)objc_msgSend(v6, "intValue") * 0.001);

  objc_msgSend(a1, "silenceStartTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFSpeechToken setSilenceStartTime:](v2, "setSilenceStartTime:", (double)(int)objc_msgSend(v7, "intValue") * 0.001);

  objc_msgSend(a1, "endTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFSpeechToken setEndTime:](v2, "setEndTime:", (double)(int)objc_msgSend(v8, "intValue") * 0.001);

  -[AFSpeechToken setRemoveSpaceBefore:](v2, "setRemoveSpaceBefore:", objc_msgSend(a1, "removeSpaceBefore"));
  -[AFSpeechToken setRemoveSpaceAfter:](v2, "setRemoveSpaceAfter:", objc_msgSend(a1, "removeSpaceAfter"));
  -[AFSpeechToken setGraphCost:](v2, "setGraphCost:", 0);
  -[AFSpeechToken setAcousticCost:](v2, "setAcousticCost:", 0);
  return v2;
}

@end
