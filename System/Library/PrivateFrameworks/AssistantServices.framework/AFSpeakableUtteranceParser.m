@implementation AFSpeakableUtteranceParser

- (AFSpeakableUtteranceParser)init
{
  void *v3;
  AFSpeakableUtteranceParser *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AFSpeakableUtteranceParser initWithLocale:](self, "initWithLocale:", v3);

  return v4;
}

- (AFSpeakableUtteranceParser)initWithLocale:(id)a3
{
  id v4;
  AFSpeakableUtteranceParser *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *providers;
  NSLocale *v8;
  NSLocale *locale;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFSpeakableUtteranceParser;
  v5 = -[AFSpeakableUtteranceParser init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    providers = v5->_providers;
    v5->_providers = v6;

    if (v4)
    {
      v8 = (NSLocale *)v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v8 = (NSLocale *)objc_claimAutoreleasedReturnValue();
    }
    locale = v5->_locale;
    v5->_locale = v8;

    if (objc_msgSend((id)objc_opt_class(), "_shouldAutomaticallyProvideFunctions"))
      -[AFSpeakableUtteranceParser setHandlesFunctions:](v5, "setHandlesFunctions:", 1);
  }

  return v5;
}

- (void)registerProvider:(id)a3 forNamespace:(id)a4
{
  id v6;
  NSMutableDictionary *providers;
  id functionHandler;
  id v9;

  v9 = a3;
  v6 = a4;
  providers = self->_providers;
  if (v9)
    -[NSMutableDictionary setObject:forKey:](providers, "setObject:forKey:", v9, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](providers, "removeObjectForKey:", v6);
  functionHandler = self->_functionHandler;
  if (functionHandler && functionHandler != v9)
    objc_msgSend(functionHandler, "registerProvider:forNamespace:", v9, v6);

}

- (BOOL)handleTTSCodes
{
  void *v2;
  BOOL v3;

  -[NSMutableDictionary objectForKey:](self->_providers, "objectForKey:", CFSTR("tts"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setHandleTTSCodes:(BOOL)a3
{
  _AFSpeakableUtterancePassThroughProvider *v4;

  if (a3 && !-[AFSpeakableUtteranceParser handleTTSCodes](self, "handleTTSCodes"))
  {
    v4 = objc_alloc_init(_AFSpeakableUtterancePassThroughProvider);
    -[AFSpeakableUtteranceParser registerProvider:forNamespace:](self, "registerProvider:forNamespace:", v4, CFSTR("tts"));

  }
  else
  {
    -[AFSpeakableUtteranceParser registerProvider:forNamespace:](self, "registerProvider:forNamespace:", 0, CFSTR("tts"));
  }
}

- (BOOL)handlesFunctions
{
  void *v2;
  BOOL v3;

  -[NSMutableDictionary objectForKey:](self->_providers, "objectForKey:", CFSTR("fn"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setHandlesFunctions:(BOOL)a3
{
  id functionHandler;
  AFSUPFunctionProvider *v5;
  id v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3 && !-[AFSpeakableUtteranceParser handlesFunctions](self, "handlesFunctions"))
  {
    functionHandler = self->_functionHandler;
    if (!functionHandler)
    {
      v5 = -[AFSUPFunctionProvider initWithLocale:]([AFSUPFunctionProvider alloc], "initWithLocale:", self->_locale);
      v6 = self->_functionHandler;
      self->_functionHandler = v5;

      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = self->_providers;
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
            -[NSMutableDictionary objectForKey:](self->_providers, "objectForKey:", v12, (_QWORD)v14);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(self->_functionHandler, "registerProvider:forNamespace:", v13, v12);

          }
          v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);
      }

      functionHandler = self->_functionHandler;
    }
    -[AFSpeakableUtteranceParser registerProvider:forNamespace:](self, "registerProvider:forNamespace:", functionHandler, CFSTR("fn"), (_QWORD)v14);
  }
  else
  {
    -[AFSpeakableUtteranceParser registerProvider:forNamespace:](self, "registerProvider:forNamespace:", 0, CFSTR("fn"));
  }
}

- (id)_handleProviderAtIndex:(unsigned int)a3 withBuffer:(id *)a4 totalLength:(unint64_t)a5 consumedLength:(unsigned int *)a6 containsPrivacySensitiveContents:(BOOL *)a7 hadEmpties:(BOOL *)a8 externalProviders:(BOOL *)a9
{
  id v16;
  int64_t v17;
  __CFString *v18;
  int64_t var1;
  unsigned __int16 *var2;
  uint64_t v21;
  char *var3;
  int64_t var5;
  int64_t v24;
  id v26;
  int v27;
  uint64_t v28;
  unsigned __int16 *v29;
  unsigned __int16 v30;
  int v31;
  char *v32;
  int64_t v33;
  int64_t v34;
  int v36;
  int v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL *v43;
  AFSpeakableUtteranceParser *v44;
  BOOL *v45;
  char v46;
  id v47;
  char v48;
  CFRange v49;
  CFRange v50;

  if (a7)
    *a7 = 0;
  v16 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v17 = a3;
  if (a3 >= a5)
  {
    v18 = &stru_1E3A37708;
    goto LABEL_24;
  }
  v43 = a8;
  v44 = self;
  v45 = a7;
  v18 = &stru_1E3A37708;
  while (1)
  {
    var1 = a4->var4.var1;
    if (var1 <= v17)
    {
      v21 = 0;
      ++*a6;
      ++a3;
      goto LABEL_21;
    }
    var2 = a4->var2;
    if (var2)
    {
      LOWORD(v21) = var2[a4->var4.var0 + v17];
    }
    else
    {
      var3 = a4->var3;
      if (var3)
      {
        LOWORD(v21) = var3[a4->var4.var0 + v17];
      }
      else
      {
        if (a4->var6 <= v17 || (var5 = a4->var5, var5 > v17))
        {
          v24 = v17 - 4;
          if (a3 < 4)
            v24 = 0;
          if (v24 + 64 < var1)
            var1 = v24 + 64;
          a4->var5 = v24;
          a4->var6 = var1;
          v49.location = a4->var4.var0 + v24;
          v49.length = var1 - v24;
          CFStringGetCharacters(a4->var1, v49, a4->var0);
          var5 = a4->var5;
        }
        LOWORD(v21) = a4->var0[v17 - var5];
      }
    }
    ++*a6;
    ++a3;
    v21 = (unsigned __int16)v21;
    if ((unsigned __int16)v21 == 35)
      break;
    if ((unsigned __int16)v21 == 125)
      goto LABEL_24;
LABEL_21:
    objc_msgSend(v16, "appendFormat:", CFSTR("%C"), v21);
    v17 = a3;
    if (a3 >= a5)
      goto LABEL_24;
  }
  if (a9
    && !*a9
    && (objc_msgSend(v16, "isEqualToString:", CFSTR("tts")) & 1) == 0
    && (objc_msgSend(v16, "isEqualToString:", CFSTR("fn")) & 1) == 0)
  {
    *a9 = 1;
  }
  v26 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v27 = 0;
  while (2)
  {
    v28 = a4->var4.var1;
    if (v28 <= a3)
    {
      v31 = 0;
      v30 = 0;
      ++*a6;
LABEL_49:
      v36 = v30;
      ++a3;
      objc_msgSend(v26, "appendFormat:", CFSTR("%C"), v30);
      v37 = v31 << 31 >> 31;
      if (v36 == 123)
        v37 = 1;
      v27 += v37;
      continue;
    }
    break;
  }
  v29 = a4->var2;
  if (v29)
  {
    v30 = v29[a4->var4.var0 + a3];
  }
  else
  {
    v32 = a4->var3;
    if (v32)
    {
      v30 = v32[a4->var4.var0 + a3];
    }
    else
    {
      if (a4->var6 <= a3 || (v33 = a4->var5, v33 > a3))
      {
        v34 = a3 - 4;
        if (a3 < 4)
          v34 = 0;
        if (v34 + 64 < v28)
          v28 = v34 + 64;
        a4->var5 = v34;
        a4->var6 = v28;
        v50.location = a4->var4.var0 + v34;
        v50.length = v28 - v34;
        CFStringGetCharacters(a4->var1, v50, a4->var0);
        v33 = a4->var5;
      }
      v30 = a4->var0[a3 - v33];
    }
  }
  ++*a6;
  v31 = v30 == 125;
  if (v30 != 125 || v27 != 0)
    goto LABEL_49;
  v48 = 0;
  v47 = 0;
  -[AFSpeakableUtteranceParser _parseStringWithFormat:error:hadEmpties:containsPrivacySensitiveContents:externalProviders:](self, "_parseStringWithFormat:error:hadEmpties:containsPrivacySensitiveContents:externalProviders:", v26, &v47, v43, &v48, a9);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v47;
  v40 = v39;
  if (v39)
    NSLog(CFSTR("ERROR parsing remainder: %@"), v39);
  v46 = 0;
  -[NSMutableDictionary objectForKey:](v44->_providers, "objectForKey:", v16);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41)
    goto LABEL_59;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v41, "stringForExpression:containsPrivacySensitiveContents:", v38, &v46);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_60;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v41, "stringForExpression:", v38);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v38, "isEqualToString:", v42) ^ 1;
  }
  else
  {
LABEL_59:
    v42 = 0;
  }
LABEL_60:
  if (v48)
  {
    if (!v45)
      goto LABEL_66;
LABEL_65:
    *v45 = 1;
    goto LABEL_66;
  }
  if (v45 && v46)
    goto LABEL_65;
LABEL_66:
  v18 = v42;

LABEL_24:
  return v18;
}

- (id)_handleOptionalAtIndex:(unsigned int)a3 withBuffer:(id *)a4 totalLength:(unint64_t)a5 consumedLength:(unsigned int *)a6 containsPrivacySensitiveContents:(BOOL *)a7 externalProviders:(BOOL *)a8
{
  id v15;
  unint64_t v16;
  int64_t v17;
  __CFString *v18;
  int64_t var1;
  unsigned __int16 *var2;
  unsigned __int16 v21;
  char *var3;
  int64_t var5;
  int64_t v24;
  void *v25;
  void *v26;
  BOOL *v28;
  __int16 v29;
  CFRange v30;

  if (a7)
    *a7 = 0;
  v15 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v16 = a5 - 1;
  if (a5 - 1 <= a3)
  {
    v18 = &stru_1E3A37708;
    goto LABEL_30;
  }
  v28 = a8;
  v17 = a3;
  v18 = &stru_1E3A37708;
  while (1)
  {
    var1 = a4->var4.var1;
    if (var1 > v17)
      break;
    v21 = 0;
    ++*a6;
LABEL_20:
    objc_msgSend(v15, "appendFormat:", CFSTR("%C"), v21);
    v17 = ++a3;
    if (v16 <= a3)
      goto LABEL_30;
  }
  var2 = a4->var2;
  if (var2)
  {
    v21 = var2[a4->var4.var0 + v17];
  }
  else
  {
    var3 = a4->var3;
    if (var3)
    {
      v21 = var3[a4->var4.var0 + v17];
    }
    else
    {
      if (a4->var6 <= v17 || (var5 = a4->var5, var5 > v17))
      {
        v24 = v17 - 4;
        if (a3 < 4)
          v24 = 0;
        if (v24 + 64 < var1)
          var1 = v24 + 64;
        a4->var5 = v24;
        a4->var6 = var1;
        v30.location = a4->var4.var0 + v24;
        v30.length = var1 - v24;
        CFStringGetCharacters(a4->var1, v30, a4->var0);
        var5 = a4->var5;
      }
      v21 = a4->var0[v17 - var5];
    }
  }
  ++*a6;
  if (v21 != 93)
    goto LABEL_20;
  v29 = 0;
  -[AFSpeakableUtteranceParser parseStringWithFormat:includeControlCharacters:error:hadEmpties:containsPrivacySensitiveContents:externalProviders:](self, "parseStringWithFormat:includeControlCharacters:error:hadEmpties:containsPrivacySensitiveContents:externalProviders:", v15, 1, 0, (char *)&v29 + 1, &v29, v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (HIBYTE(v29))
  {
    v18 = &stru_1E3A37708;
  }
  else
  {
    if (a7 && (_BYTE)v29)
      *a7 = 1;
    v18 = v25;
  }

LABEL_30:
  return v18;
}

- (id)_handleControlCodeAtIndex:(unsigned int)a3 withBuffer:(id *)a4 totalLength:(unint64_t)a5 consumedLength:(unsigned int *)a6 hadEmpties:(BOOL *)a7 containsPrivacySensitiveContents:(BOOL *)a8 externalProviders:(BOOL *)a9
{
  uint64_t var1;
  unsigned __int16 *var2;
  unsigned __int16 v18;
  char *var3;
  int64_t var5;
  int64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __CFString *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  int64_t var6;
  CFRange v47;

  if (!a6)
    __assert_rtn("-[AFSpeakableUtteranceParser _handleControlCodeAtIndex:withBuffer:totalLength:consumedLength:hadEmpties:containsPrivacySensitiveContents:externalProviders:]", "AFSpeakableUtteranceParser.m", 270, "consumed && \"Need to provide a consumer.\");
  if (a8)
    *a8 = 0;
  if (a5 - 1 > a3)
  {
    var1 = a4->var4.var1;
    if (var1 > a3)
    {
      var2 = a4->var2;
      if (var2)
      {
        v18 = var2[a4->var4.var0 + a3];
      }
      else
      {
        var3 = a4->var3;
        if (var3)
        {
          v18 = var3[a4->var4.var0 + a3];
        }
        else
        {
          if (a4->var6 <= a3 || (var5 = a4->var5, var5 > a3))
          {
            v21 = a3 - 4;
            if (a3 < 4)
              v21 = 0;
            if (v21 + 64 < var1)
              var1 = v21 + 64;
            a4->var5 = v21;
            a4->var6 = var1;
            v47.location = a4->var4.var0 + v21;
            v47.length = var1 - v21;
            CFStringGetCharacters(a4->var1, v47, a4->var0);
            var5 = a4->var5;
          }
          v18 = a4->var0[a3 - var5];
        }
      }
      if (v18 == 123)
      {
        ++*a6;
        v29 = *(_OWORD *)&a4->var3;
        v43 = *(_OWORD *)&a4->var1;
        v44 = v29;
        v45 = *(_OWORD *)&a4->var4.var1;
        var6 = a4->var6;
        v30 = *(_OWORD *)&a4->var0[40];
        v39 = *(_OWORD *)&a4->var0[32];
        v40 = v30;
        v31 = *(_OWORD *)&a4->var0[56];
        v41 = *(_OWORD *)&a4->var0[48];
        v42 = v31;
        v32 = *(_OWORD *)&a4->var0[8];
        v35 = *(_OWORD *)a4->var0;
        v36 = v32;
        v33 = *(_OWORD *)&a4->var0[24];
        v37 = *(_OWORD *)&a4->var0[16];
        v38 = v33;
        -[AFSpeakableUtteranceParser _handleProviderAtIndex:withBuffer:totalLength:consumedLength:containsPrivacySensitiveContents:hadEmpties:externalProviders:](self, "_handleProviderAtIndex:withBuffer:totalLength:consumedLength:containsPrivacySensitiveContents:hadEmpties:externalProviders:", a3 + 1, &v35, a5, a6, a8, a7, a9);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v34 = -[__CFString length](v28, "length");
        if (a7)
        {
          if (!v34)
            *a7 = 1;
        }
        return v28;
      }
      if (v18 == 91)
      {
        ++*a6;
        v22 = *(_OWORD *)&a4->var3;
        v43 = *(_OWORD *)&a4->var1;
        v44 = v22;
        v45 = *(_OWORD *)&a4->var4.var1;
        var6 = a4->var6;
        v23 = *(_OWORD *)&a4->var0[40];
        v39 = *(_OWORD *)&a4->var0[32];
        v40 = v23;
        v24 = *(_OWORD *)&a4->var0[56];
        v41 = *(_OWORD *)&a4->var0[48];
        v42 = v24;
        v25 = *(_OWORD *)&a4->var0[8];
        v35 = *(_OWORD *)a4->var0;
        v36 = v25;
        v26 = *(_OWORD *)&a4->var0[24];
        v37 = *(_OWORD *)&a4->var0[16];
        v38 = v26;
        -[AFSpeakableUtteranceParser _handleOptionalAtIndex:withBuffer:totalLength:consumedLength:containsPrivacySensitiveContents:externalProviders:](self, "_handleOptionalAtIndex:withBuffer:totalLength:consumedLength:containsPrivacySensitiveContents:externalProviders:", a3 + 1, &v35, a5, a6, a8, a9);
        return (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v28 = &stru_1E3A37708;
  return v28;
}

- (id)parseStringWithFormat:(id)a3 includeControlCharacters:(BOOL)a4 error:(id *)a5 hadEmpties:(BOOL *)a6 containsPrivacySensitiveContents:(BOOL *)a7 externalProviders:(BOOL *)a8
{
  _BOOL4 v11;
  __CFString *v13;
  __CFString *v14;
  unint64_t v15;
  __CFString *v16;
  const __CFString *CharactersPtr;
  const char *CStringPtr;
  uint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  UniChar *v23;
  uint64_t v24;
  UniChar v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v30;
  BOOL *v32;
  _OWORD v33[11];
  uint64_t v34;
  char v35;
  int v36;
  UniChar chars;
  UniChar buffer[8];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CFStringRef theString[2];
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  CFRange v50;

  v11 = a4;
  v13 = (__CFString *)a3;
  v14 = v13;
  if (a7)
    *a7 = 0;
  v15 = -[__CFString length](v13, "length");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", v15);
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v32 = a7;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    *(_OWORD *)buffer = 0u;
    v39 = 0u;
    theString[0] = v14;
    *((_QWORD *)&v47 + 1) = 0;
    *(_QWORD *)&v48 = v15;
    CharactersPtr = (const __CFString *)CFStringGetCharactersPtr(v14);
    CStringPtr = 0;
    theString[1] = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v14, 0x600u);
    v19 = 0;
    v20 = 0;
    v21 = 0;
    *((_QWORD *)&v48 + 1) = 0;
    v49 = 0;
    *(_QWORD *)&v47 = CStringPtr;
    while (1)
    {
      chars = 0;
      v22 = v48;
      if ((uint64_t)v48 <= v19)
        goto LABEL_21;
      v23 = (UniChar *)theString[1];
      if (theString[1])
        break;
      if (!(_QWORD)v47)
      {
        v28 = *((_QWORD *)&v48 + 1);
        if (v49 <= v19 || *((_QWORD *)&v48 + 1) > v19)
        {
          v30 = v19 - 4;
          if (v21 < 4)
            v30 = 0;
          if (v30 + 64 < (uint64_t)v48)
            v22 = v30 + 64;
          *((_QWORD *)&v48 + 1) = v30;
          v49 = v22;
          v50.location = *((_QWORD *)&v47 + 1) + v30;
          v50.length = v22 - v30;
          CFStringGetCharacters(theString[0], v50, buffer);
          v28 = *((_QWORD *)&v48 + 1);
        }
        v24 = v19 - v28;
        v23 = buffer;
        goto LABEL_10;
      }
      v25 = *(char *)(v47 + *((_QWORD *)&v47 + 1) + v19);
LABEL_13:
      chars = v25;
      if (v25 == 64)
      {
        v36 = 0;
        v35 = 0;
        v33[8] = *(_OWORD *)theString;
        v33[9] = v47;
        v33[10] = v48;
        v34 = v49;
        v33[4] = v42;
        v33[5] = v43;
        v33[6] = v44;
        v33[7] = v45;
        v33[0] = *(_OWORD *)buffer;
        v33[1] = v39;
        v33[2] = v40;
        v33[3] = v41;
        -[AFSpeakableUtteranceParser _handleControlCodeAtIndex:withBuffer:totalLength:consumedLength:hadEmpties:containsPrivacySensitiveContents:externalProviders:](self, "_handleControlCodeAtIndex:withBuffer:totalLength:consumedLength:hadEmpties:containsPrivacySensitiveContents:externalProviders:", v21 + 1, v33, v15, &v36, a6, &v35, a8);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v11 && objc_msgSend(v26, "length"))
          -[__CFString appendString:](v16, "appendString:", v27);
        if (v35)
          v20 = 1;
        if (v36)
          v21 += v36;
        else
          CFStringAppendCharacters(v16, &chars, 1);

        goto LABEL_24;
      }
LABEL_21:
      CFStringAppendCharacters(v16, &chars, 1);
LABEL_24:
      v19 = ++v21;
      if (v15 <= v21)
      {
        if (v32 && (v20 & 1) != 0)
          *v32 = 1;
        goto LABEL_39;
      }
    }
    v24 = *((_QWORD *)&v47 + 1) + v19;
LABEL_10:
    v25 = v23[v24];
    goto LABEL_13;
  }
LABEL_39:

  return v16;
}

- (id)_parseStringWithFormat:(id)a3 error:(id *)a4 hadEmpties:(BOOL *)a5 containsPrivacySensitiveContents:(BOOL *)a6 externalProviders:(BOOL *)a7
{
  return -[AFSpeakableUtteranceParser parseStringWithFormat:includeControlCharacters:error:hadEmpties:containsPrivacySensitiveContents:externalProviders:](self, "parseStringWithFormat:includeControlCharacters:error:hadEmpties:containsPrivacySensitiveContents:externalProviders:", a3, 1, a4, a5, a6, a7);
}

- (id)parseStringWithFormat:(id)a3 error:(id *)a4
{
  return -[AFSpeakableUtteranceParser parseStringWithFormat:error:hasExternalDomains:](self, "parseStringWithFormat:error:hasExternalDomains:", a3, a4, 0);
}

- (id)parseStringWithFormat:(id)a3 error:(id *)a4 hasExternalDomains:(BOOL *)a5
{
  __int16 v6;

  v6 = 0;
  -[AFSpeakableUtteranceParser _parseStringWithFormat:error:hadEmpties:containsPrivacySensitiveContents:externalProviders:](self, "_parseStringWithFormat:error:hadEmpties:containsPrivacySensitiveContents:externalProviders:", a3, a4, (char *)&v6 + 1, &v6, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)parseStringWithFormat:(id)a3 error:(id *)a4 containsPrivacySensitiveContents:(BOOL *)a5
{
  return -[AFSpeakableUtteranceParser parseStringWithFormat:error:containsPrivacySensitiveContents:hasExternalDomains:](self, "parseStringWithFormat:error:containsPrivacySensitiveContents:hasExternalDomains:", a3, a4, a5, 0);
}

- (id)parseStringWithFormat:(id)a3 error:(id *)a4 containsPrivacySensitiveContents:(BOOL *)a5 hasExternalDomains:(BOOL *)a6
{
  char v7;

  if (a5)
    *a5 = 0;
  v7 = 0;
  -[AFSpeakableUtteranceParser _parseStringWithFormat:error:hadEmpties:containsPrivacySensitiveContents:externalProviders:](self, "_parseStringWithFormat:error:hadEmpties:containsPrivacySensitiveContents:externalProviders:", a3, a4, &v7, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)parseStringRemovingControlCharacters:(id)a3 error:(id *)a4
{
  char v5;

  v5 = 0;
  -[AFSpeakableUtteranceParser parseStringWithFormat:includeControlCharacters:error:hadEmpties:containsPrivacySensitiveContents:externalProviders:](self, "parseStringWithFormat:includeControlCharacters:error:hadEmpties:containsPrivacySensitiveContents:externalProviders:", a3, 0, a4, &v5, &v5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)parseStringRemovingControlCharacters:(id)a3 error:(id *)a4 containsPrivacySensitiveContents:(BOOL *)a5
{
  char v6;

  if (a5)
    *a5 = 0;
  v6 = 0;
  -[AFSpeakableUtteranceParser parseStringWithFormat:includeControlCharacters:error:hadEmpties:containsPrivacySensitiveContents:externalProviders:](self, "parseStringWithFormat:includeControlCharacters:error:hadEmpties:containsPrivacySensitiveContents:externalProviders:", a3, 0, a4, &v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong(&self->_functionHandler, 0);
  objc_storeStrong((id *)&self->_providers, 0);
}

+ (BOOL)_shouldAutomaticallyProvideFunctions
{
  return 1;
}

+ (id)parseUserGeneratedMessage:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (parseUserGeneratedMessage__onceToken != -1)
    dispatch_once(&parseUserGeneratedMessage__onceToken, &__block_literal_global_11415);
  if (parseUserGeneratedMessage__AXSpeechTransformTextHandle)
  {
    parseUserGeneratedMessage__AXSpeechTransformTextHandle(v3, 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v7 = 136315394;
      v8 = "+[AFSpeakableUtteranceParser parseUserGeneratedMessage:]";
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s User Generated Message: %@", (uint8_t *)&v7, 0x16u);
      v5 = AFSiriLogContextConnection;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 136315394;
      v8 = "+[AFSpeakableUtteranceParser parseUserGeneratedMessage:]";
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s Transformed Text: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __56__AFSpeakableUtteranceParser_parseUserGeneratedMessage___block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  const char *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!parseUserGeneratedMessage__AXSpeechTransformTextHandle)
  {
    v0 = dlopen("/usr/lib/libAXSpeechManager.dylib", 1);
    if (v0)
    {
      parseUserGeneratedMessage__AXSpeechTransformTextHandle = (uint64_t (*)(_QWORD, _QWORD))dlsym(v0, "AXSpeechTransformText");
      if (parseUserGeneratedMessage__AXSpeechTransformTextHandle)
        return;
      v1 = (void *)AFSiriLogContextConnection;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        return;
      v2 = v1;
      v5 = 136315394;
      v6 = "+[AFSpeakableUtteranceParser parseUserGeneratedMessage:]_block_invoke";
      v7 = 2082;
      v8 = dlerror();
      v3 = "%s Could not find AXSpeechTransformText: %{public}s";
    }
    else
    {
      v4 = (void *)AFSiriLogContextConnection;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        return;
      v2 = v4;
      v5 = 136315394;
      v6 = "+[AFSpeakableUtteranceParser parseUserGeneratedMessage:]_block_invoke";
      v7 = 2082;
      v8 = dlerror();
      v3 = "%s Could not open speech manager dylib: %{public}s";
    }
    _os_log_error_impl(&dword_19AF50000, v2, OS_LOG_TYPE_ERROR, v3, (uint8_t *)&v5, 0x16u);

  }
}

@end
