@implementation SASSpeechRecognized(AssistantAdditions)

- (uint64_t)af_isUtterance
{
  return 1;
}

- (uint64_t)af_isUserUtterance
{
  return 1;
}

- (uint64_t)af_waitsForConfirmation
{
  return 1;
}

- (id)af_correctionContext
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "refId");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    return 0;
  v3 = (void *)v2;
  objc_msgSend(a1, "sessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  v9[0] = CFSTR("interactionId");
  objc_msgSend(a1, "refId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("sessionId");
  v10[0] = v5;
  objc_msgSend(a1, "sessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
