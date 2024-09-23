@implementation PKTextInputLanguageSpec

- (_QWORD)initWithLocales:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v3 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)PKTextInputLanguageSpec;
    a1 = objc_msgSendSuper2(&v11, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[3];
      a1[3] = v4;

      if (qword_1ECEE60B8 != -1)
        dispatch_once(&qword_1ECEE60B8, &__block_literal_global_5);
      objc_msgSend(v3, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "languageCode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lowercaseString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend((id)qword_1ECEE60A0, "containsObject:", v8))
      {
        v9 = 2;
      }
      else if (objc_msgSend((id)_MergedGlobals_112, "containsObject:", v8))
      {
        v9 = 1;
      }
      else
      {
        if (!objc_msgSend((id)qword_1ECEE60A8, "containsObject:", v8))
        {
          a1[1] = 0;
          goto LABEL_12;
        }
        v9 = 3;
      }
      a1[1] = v9;
LABEL_12:
      a1[2] = objc_msgSend((id)qword_1ECEE60B0, "containsObject:", v8);

    }
  }

  return a1;
}

void __43__PKTextInputLanguageSpec_initWithLocales___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("zh"), CFSTR("yue"), CFSTR("ja"), CFSTR("th"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_112;
  _MergedGlobals_112 = v0;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("en"), CFSTR("pt"), CFSTR("fr"), CFSTR("it"), CFSTR("de"), CFSTR("es"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECEE60A0;
  qword_1ECEE60A0 = v2;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ko"), 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ECEE60A8;
  qword_1ECEE60A8 = v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ar"), CFSTR("ars"), CFSTR("vi"), 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ECEE60B0;
  qword_1ECEE60B0 = v6;

}

- (uint64_t)uncommittedTokenColumnCount
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    switch(*(_QWORD *)(result + 8))
    {
      case 0:
      case 2:
        +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = objc_msgSend(v1, "incrementalCommitWordsBack");

        break;
      case 1:
        v2 = 3;
        break;
      case 3:
        v2 = 2;
        break;
      default:
        v2 = 0;
        break;
    }
    if (v2 <= 1)
      return 1;
    else
      return v2;
  }
  return result;
}

- (double)strokeFadeOutDuration
{
  void *v1;
  double v2;
  double v3;

  if (!a1)
    return 0.0;
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "textInputStrokeFadeOutDuration");
  v3 = v2;

  return v3;
}

- (double)standardCommitDelay
{
  void *v2;
  double v3;
  double v4;
  double result;

  if (!a1)
    return 0.0;
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputStandardCommitDelay");
  v4 = v3;

  result = v4 + 0.3;
  if (*(_QWORD *)(a1 + 16) != 1)
    return v4;
  return result;
}

- (double)singleCharacterCommitDelay
{
  void *v2;
  double v3;
  double v4;
  double result;

  if (!a1)
    return 0.0;
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "singleCharacterCommitDelay");
  v4 = v3;

  result = v4 + 0.3;
  if (*(_QWORD *)(a1 + 16) != 1)
    return v4;
  return result;
}

- (id)debugLocaleDescriptions
{
  id *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v1 = a1;
  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1[3], "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = v1[3];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "localeIdentifier", (_QWORD)v10);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
            objc_msgSend(v2, "addObject:", v8);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    v1 = (id *)objc_msgSend(v2, "copy");
  }
  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__locales, 0);
}

@end
