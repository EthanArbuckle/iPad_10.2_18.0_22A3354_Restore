@implementation SASSpeechRecognized(AFUserUtteranceAdditions)

- (AFUserUtterance)af_userUtteranceValue
{
  void *v2;
  AFUserUtterance *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  AFUserUtterance *v8;

  objc_msgSend(a1, "recognition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [AFUserUtterance alloc];
  objc_msgSend(v2, "af_speechPhrases");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "sentenceConfidence");
  objc_msgSend(v2, "af_speechUtterances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "af_correctionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AFUserUtterance initWithPhrases:sentenceConfidence:utterances:correctionIdentifier:](v3, "initWithPhrases:sentenceConfidence:utterances:correctionIdentifier:", v4, v5, v6, v7);

  return v8;
}

- (id)af_bestTextInterpretation
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "af_userUtteranceValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bestTextInterpretation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
