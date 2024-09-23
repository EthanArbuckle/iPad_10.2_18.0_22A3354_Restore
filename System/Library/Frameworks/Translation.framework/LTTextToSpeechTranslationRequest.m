@implementation LTTextToSpeechTranslationRequest

void __71___LTTextToSpeechTranslationRequest__startTranslationWithService_done___block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v2 = objc_msgSend(a1[5], "copy");
    v3 = (void *)*((_QWORD *)WeakRetained + 16);
    *((_QWORD *)WeakRetained + 16) = v2;

    objc_storeStrong((id *)WeakRetained + 15, a1[4]);
    v4 = (void *)*((_QWORD *)WeakRetained + 15);
    objc_msgSend(WeakRetained, "requestContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startTextToSpeechTranslationWithContext:text:", v5, v6);

  }
}

@end
