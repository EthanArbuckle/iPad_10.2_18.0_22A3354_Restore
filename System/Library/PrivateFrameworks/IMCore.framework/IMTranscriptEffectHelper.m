@implementation IMTranscriptEffectHelper

+ (id)allEffectIdentifiers
{
  if (qword_1EE65F518 != -1)
    dispatch_once(&qword_1EE65F518, &unk_1E471D7D8);
  return (id)qword_1EE65F510;
}

+ (BOOL)identifierIsEffectIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "identifierNameMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

+ (BOOL)effectIdentifierIsFullScreenMoment:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(a1, "identifierIsEffectIdentifier:", v4))
  {
    objc_msgSend(v4, "rangeOfString:", CFSTR("com.apple.messages.effect"));
    v6 = v5 != 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)effectIdentifierIsImpactEffect:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(a1, "identifierIsEffectIdentifier:", v4))
  {
    objc_msgSend(v4, "rangeOfString:", CFSTR("com.apple.MobileSMS.expressivesend"));
    v6 = v5 != 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)identifierNameMap
{
  if (qword_1EE65F528 != -1)
    dispatch_once(&qword_1EE65F528, &unk_1E4720A88);
  return (id)qword_1EE65F520;
}

+ (id)replayStringMap
{
  if (qword_1EE65F538 != -1)
    dispatch_once(&qword_1EE65F538, &unk_1E471DDD8);
  return (id)qword_1EE65F530;
}

+ (id)sendWithEffectStringMap
{
  if (qword_1EE65F548 != -1)
    dispatch_once(&qword_1EE65F548, &unk_1E471BBA0);
  return (id)qword_1EE65F540;
}

+ (id)findIdentifierByMathcingPartialSufix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "allEffectIdentifiers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "localizedCaseInsensitiveContainsString:", v4))
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)nameForEffectIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "identifierNameMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)replayStringForEffectIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "replayStringMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sendWithStringForEffectIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "sendWithEffectStringMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)isFeatureEnabled
{
  return 1;
}

+ (BOOL)shouldShowReplayButtonForEffectIdentifier:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = objc_msgSend(a1, "isFeatureEnabled");
  LOBYTE(a1) = 0;
  if (v3 && v4)
    LODWORD(a1) = objc_msgSend((id)*MEMORY[0x1E0D39490], "isEqualToString:", v3) ^ 1;

  return (char)a1;
}

@end
