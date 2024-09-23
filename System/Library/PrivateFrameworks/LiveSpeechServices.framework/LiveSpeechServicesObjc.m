@implementation LiveSpeechServicesObjc

+ (void)startLiveSpeechAndReturnError:(id *)a3
{
  id v4;

  +[LiveSpeechServices shared](LiveSpeechServices, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startLiveSpeechAndReturnError:", a3);

}

+ (void)stopLiveSpeechAndReturnError:(id *)a3
{
  id v4;

  +[LiveSpeechServices shared](LiveSpeechServices, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopLiveSpeechAndReturnError:", a3);

}

+ (id)liveSpeechPhrases
{
  void *v2;
  void *v3;

  +[LiveSpeechServices shared](LiveSpeechServices, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "liveSpeechPhrases");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)observeFavoriteLiveSpeechPhrasesChanges:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  +[LiveSpeechServices shared](LiveSpeechServices, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__LiveSpeechServicesObjc_observeFavoriteLiveSpeechPhrasesChanges___block_invoke;
  v8[3] = &unk_2510BCF20;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "observeFavoriteLiveSpeechPhrasesChanges:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __66__LiveSpeechServicesObjc_observeFavoriteLiveSpeechPhrasesChanges___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)favoritePhrases
{
  void *v2;
  void *v3;

  +[LiveSpeechServices shared](LiveSpeechServices, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "favoritePhrases");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)addFavoritePhrase:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[LiveSpeechServices shared](LiveSpeechServices, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addFavoritePhrase:", v3);

}

+ (void)removeFavoritePhrase:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[LiveSpeechServices shared](LiveSpeechServices, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFavoritePhrase:", v3);

}

+ (id)phraseTextKey
{
  void *v2;
  void *v3;

  +[LiveSpeechServices shared](LiveSpeechServices, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "phraseTextKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)phraseInputIDKey
{
  void *v2;
  void *v3;

  +[LiveSpeechServices shared](LiveSpeechServices, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "phraseInputIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)phraseShortcutKey
{
  void *v2;
  void *v3;

  +[LiveSpeechServices shared](LiveSpeechServices, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "phraseShortcutKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)observeFavoritePhrasesChanges:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  +[LiveSpeechServices shared](LiveSpeechServices, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__LiveSpeechServicesObjc_observeFavoritePhrasesChanges___block_invoke;
  v8[3] = &unk_2510BCF20;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "observeFavoritePhrasesChanges:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __56__LiveSpeechServicesObjc_observeFavoritePhrasesChanges___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
