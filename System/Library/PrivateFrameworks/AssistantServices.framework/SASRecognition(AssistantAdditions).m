@implementation SASRecognition(AssistantAdditions)

- (id)af_correctionContextWithRefId:()AssistantAdditions sessionId:
{
  void *v4;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v4 = 0;
  v11[2] = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v10[0] = CFSTR("interactionId");
    v10[1] = CFSTR("sessionId");
    v11[0] = a3;
    v11[1] = a4;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = a4;
    v8 = a3;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

@end
