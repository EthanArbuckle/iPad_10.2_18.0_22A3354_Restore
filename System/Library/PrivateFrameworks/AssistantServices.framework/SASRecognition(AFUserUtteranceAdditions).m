@implementation SASRecognition(AFUserUtteranceAdditions)

- (AFUserUtterance)af_userUtteranceValueWithRefId:()AFUserUtteranceAdditions sessionId:
{
  id v6;
  id v7;
  AFUserUtterance *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  AFUserUtterance *v13;

  v6 = a4;
  v7 = a3;
  v8 = [AFUserUtterance alloc];
  objc_msgSend(a1, "af_speechPhrases");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "sentenceConfidence");
  objc_msgSend(a1, "af_speechUtterances");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "af_correctionContextWithRefId:sessionId:", v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[AFUserUtterance initWithPhrases:sentenceConfidence:utterances:correctionIdentifier:](v8, "initWithPhrases:sentenceConfidence:utterances:correctionIdentifier:", v9, v10, v11, v12);
  return v13;
}

- (id)af_bestTextInterpretationWithRefId:()AFUserUtteranceAdditions sessionId:
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "af_userUtteranceValueWithRefId:sessionId:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bestTextInterpretation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
