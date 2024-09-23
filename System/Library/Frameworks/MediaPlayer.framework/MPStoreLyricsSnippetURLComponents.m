@implementation MPStoreLyricsSnippetURLComponents

- (MPStoreLyricsSnippetURLComponents)initWithURL:(id)a3
{
  id v4;
  MPStoreLyricsSnippetURLComponents *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  MPStoreLyricsSnippetURLComponents *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  MPStoreLyricsSnippetURLComponents *v56;
  id obj;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  objc_super v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)MPStoreLyricsSnippetURLComponents;
  v5 = -[MPStoreLyricsSnippetURLComponents init](&v63, sel_init);
  if (!v5)
  {
LABEL_37:
    v47 = v5;
    goto LABEL_38;
  }
  objc_msgSend(v4, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https?://%@/(?<countryCode>\\w{2})/lyrics/(?<adamID>[0-9]+)"), CFSTR("music.apple.com"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 1;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v7, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_35;
  v12 = objc_msgSend(v10, "rangeWithName:", CFSTR("adamID"));
  v14 = v13;
  v15 = objc_msgSend(v11, "rangeWithName:", CFSTR("countryCode"));
  if (v12 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 1;
    goto LABEL_35;
  }
  v18 = v15;
  v19 = v16;
  v52 = v11;
  v53 = v9;
  v54 = v7;
  v56 = v5;
  objc_msgSend(v6, "substringWithRange:", v12, v14);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v6;
  objc_msgSend(v6, "substringWithRange:", v18, v19);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v4, 0);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "queryItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (!v21)
  {
    v23 = 0;
    v24 = 0;
    obj = 0;
    v58 = 0;
    goto LABEL_27;
  }
  v22 = v21;
  v23 = 0;
  v24 = 0;
  obj = 0;
  v58 = 0;
  v25 = *(_QWORD *)v60;
  do
  {
    for (i = 0; i != v22; ++i)
    {
      if (*(_QWORD *)v60 != v25)
        objc_enumerationMutation(v20);
      v27 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
      objc_msgSend(v27, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("ts"));

      if (v29)
      {
        objc_msgSend(v27, "value");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v23;
        v23 = (void *)v30;
      }
      else
      {
        objc_msgSend(v27, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("te"));

        if (v33)
        {
          objc_msgSend(v27, "value");
          v34 = objc_claimAutoreleasedReturnValue();
          v31 = v24;
          v24 = (void *)v34;
        }
        else
        {
          objc_msgSend(v27, "name");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("l"));

          if (v36)
          {
            objc_msgSend(v27, "value");
            v37 = objc_claimAutoreleasedReturnValue();
            v31 = v58;
            v58 = (void *)v37;
          }
          else
          {
            objc_msgSend(v27, "name");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("tk"));

            if (!v39)
              continue;
            objc_msgSend(v27, "value");
            v40 = objc_claimAutoreleasedReturnValue();
            v31 = obj;
            obj = (id)v40;
          }
        }
      }

    }
    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  }
  while (v22);
LABEL_27:

  v8 = 1;
  v7 = v54;
  if (!v23)
  {
    v5 = v56;
    v42 = v50;
    v41 = v51;
    v43 = v58;
    goto LABEL_33;
  }
  v5 = v56;
  v42 = v50;
  v41 = v51;
  v43 = v58;
  if (!v24)
  {
LABEL_33:
    v44 = obj;
    goto LABEL_34;
  }
  v44 = obj;
  if (v58 && obj)
  {
    objc_msgSend(v23, "doubleValue");
    v56->_startTime = v45;
    objc_msgSend(v24, "doubleValue");
    v56->_endTime = v46;
    v56->_songAdamID = objc_msgSend(v51, "integerValue");
    objc_storeStrong((id *)&v56->_language, v58);
    objc_storeStrong((id *)&v56->_signature, obj);
    objc_storeStrong((id *)&v56->_countryCode, v50);
    v44 = obj;
    v8 = 0;
  }
LABEL_34:

  v6 = v55;
  v11 = v52;
  v9 = v53;
LABEL_35:

  if (!v8)
    goto LABEL_37;
  v47 = 0;
LABEL_38:

  return v47;
}

- (MPStoreLyricsSnippetURLComponents)initWithSong:(id)a3 language:(id)a4 startTime:(double)a5 endTime:(double)a6
{
  id v10;
  id v11;
  MPStoreLyricsSnippetURLComponents *v12;
  MPStoreLyricsSnippetURLComponents *v13;
  void *v14;
  void *v15;
  MPStoreLyricsSnippetURLComponents *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MPStoreLyricsSnippetURLComponents;
  v12 = -[MPStoreLyricsSnippetURLComponents init](&v18, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_3;
  objc_storeStrong((id *)&v12->_language, a4);
  v13->_startTime = a5;
  v13->_endTime = a6;
  objc_msgSend(v10, "identifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredStoreStringIdentifierForPersonID:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v13->_songAdamID = objc_msgSend(v15, "integerValue");

  if (!v13->_songAdamID)
    v16 = 0;
  else
LABEL_3:
    v16 = v13;

  return v16;
}

- (void)URLWithAdditionalParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0DDC0A0]);
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithIdentity:", v9);

  objc_msgSend(MEMORY[0x1E0DDC0D0], "sharedBagProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__MPStoreLyricsSnippetURLComponents_URLWithAdditionalParameters_completion___block_invoke;
  v14[3] = &unk_1E3161550;
  v15 = v6;
  v16 = v7;
  v14[4] = self;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v11, "getBagForRequestContext:withCompletionHandler:", v10, v14);

}

- (id)signatureWithCountryCode:(id)a3 adamID:(id)a4 startTime:(id)a5 endTime:(id)a6 language:(id)a7
{
  void *v7;
  void *v8;
  id v9;
  const void *v10;
  CC_LONG v11;
  id v12;
  id v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lyrics%@%@%@%@%@"), a3, a4, a5, a6, a7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 20);
  v9 = objc_retainAutorelease(v7);
  v10 = (const void *)objc_msgSend(v9, "UTF8String");
  v11 = objc_msgSend(v9, "length");
  v12 = objc_retainAutorelease(v8);
  CC_SHA1(v10, v11, (unsigned __int8 *)objc_msgSend(v12, "mutableBytes"));
  objc_msgSend(v12, "setLength:", 16);
  v13 = objc_retainAutorelease(v12);
  fd3fa4R8(3, objc_msgSend(v13, "mutableBytes"));
  objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (int64_t)songAdamID
{
  return self->_songAdamID;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

void __76__MPStoreLyricsSnippetURLComponents_URLWithAdditionalParameters_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t quot;
  uint64_t v26;
  char *v27;
  lldiv_t v28;
  uint64_t v29;
  const UInt8 *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  __CFString *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _QWORD v70[2];

  v70[0] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(v5, "stringForBagKey:", *MEMORY[0x1E0DDBE78]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "dictionaryForBagKey:", *MEMORY[0x1E0DDBEA8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v8;
      v59 = v6;
      if (v8)
      {
        objc_msgSend(v8, "ic_stringValueForKey:", CFSTR("lyricsSnippetShareSignaturePrefix"));
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        v11 = CFSTR("2.v1.");
        if (v9)
          v11 = (__CFString *)v9;
        v63 = v11;

      }
      else
      {
        v63 = &stru_1E3163D10;
      }
      v12 = (void *)objc_opt_new();
      objc_msgSend(v12, "setScheme:", CFSTR("https"));
      objc_msgSend(v12, "setHost:", CFSTR("music.apple.com"));
      v64 = v7;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@/lyrics/%lld"), v7, objc_msgSend(*(id *)(a1 + 32), "songAdamID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v12;
      objc_msgSend(v12, "setPath:", v13);

      v14 = (void *)MEMORY[0x1E0CB39D8];
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "startTime");
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%.03f"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "queryItemWithName:value:", CFSTR("ts"), v17);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0CB39D8];
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "endTime");
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%.03f"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "queryItemWithName:value:", CFSTR("te"), v21);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0CB39D8];
      objc_msgSend(*(id *)(a1 + 32), "language");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "queryItemWithName:value:", CFSTR("l"), v23);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = *(void **)(a1 + 32);
      quot = objc_msgSend(v24, "songAdamID");
      v26 = quot;
      v27 = (char *)v70 + 1;
      do
      {
        v28 = lldiv(quot, 10);
        quot = v28.quot;
        if (v28.rem >= 0)
          LOBYTE(v29) = v28.rem;
        else
          v29 = -v28.rem;
        *(v27 - 2) = v29 + 48;
        v30 = (const UInt8 *)(v27 - 2);
        --v27;
      }
      while (v28.quot);
      if (v26 < 0)
      {
        *(v27 - 2) = 45;
        v30 = (const UInt8 *)(v27 - 2);
      }
      v31 = (__CFString *)CFStringCreateWithBytes(0, v30, (char *)v70 - (char *)v30, 0x8000100u, 0);
      objc_msgSend(v62, "value");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "value");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "language");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "signatureWithCountryCode:adamID:startTime:endTime:language:", v64, v31, v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v36, "mutableCopy");

      objc_msgSend(v37, "removeCharactersInString:", CFSTR(":/?#[]@!$&'()*+,;="));
      v56 = v37;
      objc_msgSend(v35, "stringByAddingPercentEncodingWithAllowedCharacters:", v37);
      v38 = objc_claimAutoreleasedReturnValue();

      v39 = (void *)MEMORY[0x1E0CB39D8];
      v55 = (void *)v38;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v63, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "queryItemWithName:value:", CFSTR("tk"), v40);
      v41 = objc_claimAutoreleasedReturnValue();

      v42 = (void *)objc_opt_new();
      objc_msgSend(v42, "addObject:", v62);
      objc_msgSend(v42, "addObject:", v61);
      objc_msgSend(v42, "addObject:", v60);
      v54 = (void *)v41;
      objc_msgSend(v42, "addObject:", v41);
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      objc_msgSend(*(id *)(a1 + 40), "keyEnumerator");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v45; ++i)
          {
            if (*(_QWORD *)v66 != v46)
              objc_enumerationMutation(v43);
            v48 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
            v49 = (void *)MEMORY[0x1E0CB39D8];
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v48);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "queryItemWithName:value:", v48, v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v42, "addObject:", v51);
          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
        }
        while (v45);
      }

      objc_msgSend(v57, "setPercentEncodedQueryItems:", v42);
      v52 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v57, "URL");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v52 + 16))(v52, v53);

      v6 = v59;
      v7 = v64;
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

@end
