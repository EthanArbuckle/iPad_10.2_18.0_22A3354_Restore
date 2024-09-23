@implementation LPPresentationSpecializations

+ (BOOL)isGoogleURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  googleSuffixChecker();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasSuffix:", v5);

  return v6;
}

+ (BOOL)isGoogleSearchURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v12;

  v3 = a3;
  googleSuffixChecker();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v6 = objc_msgSend(v4, "hasSuffix:remainingPrefix:", v5, &v12);
  v7 = v12;

  if ((v6 & 1) != 0
    && (!objc_msgSend(v7, "length") || objc_msgSend(v7, "_lp_isEqualIgnoringCase:", CFSTR("www."))))
  {
    objc_msgSend(v3, "pathComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "count") < 2)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v3, "_lp_pathComponentAtIndex:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F02E8);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)isGoogleMapsURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  id v12;

  v3 = a3;
  googleSuffixChecker();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v6 = objc_msgSend(v4, "hasSuffix:remainingPrefix:", v5, &v12);
  v7 = v12;

  if ((v6 & 1) != 0)
  {
    if ((objc_msgSend(v7, "_lp_isEqualIgnoringCase:", CFSTR("maps.")) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v3, "pathComponents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v9, "count") < 2)
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(v3, "_lp_pathComponentAtIndex:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v10, "_lp_isEqualIgnoringCase:", CFSTR("maps"));

      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)searchQueryForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  char v22;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  int v28;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "isGoogleSearchURL:", v5))
    {
      v7 = v5;
      objc_msgSend(v7, "_lp_valueForQueryKey:", CFSTR("q"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(v7, "_lp_components");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "fragment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setQuery:", v10);

        objc_msgSend(v9, "URL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_lp_valueForQueryKey:", CFSTR("q"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR(" "));
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if (yahooSuffixChecker_onceToken != -1)
      dispatch_once(&yahooSuffixChecker_onceToken, &__block_literal_global_322);
    if (objc_msgSend((id)yahooSuffixChecker_checker, "hasSuffix:", v6))
    {
      v14 = v5;
      objc_msgSend(v14, "_lp_pathComponentAtIndex:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0330);

      if ((v16 & 1) == 0)
      {
        objc_msgSend(v14, "pathComponents");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v8, "count") < 2)
        {
          v13 = 0;
          goto LABEL_23;
        }
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "_lp_hasCaseInsensitivePrefix:", CFSTR("search;"));

        if ((v25 & 1) == 0)
        {
LABEL_29:
          v13 = 0;
          goto LABEL_24;
        }
      }
      objc_msgSend(v14, "_lp_valueForQueryKey:", CFSTR("p"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR(" "));
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (yandexSuffixChecker_onceToken != -1)
        dispatch_once(&yandexSuffixChecker_onceToken, &__block_literal_global_337);
      if (objc_msgSend((id)yandexSuffixChecker_checker, "hasSuffix:", v6))
      {
        v17 = v5;
        objc_msgSend(v17, "_lp_pathComponentAtIndex:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0360);

        if ((v19 & 1) == 0)
          goto LABEL_29;
        objc_msgSend(v17, "_lp_valueForQueryKey:", CFSTR("text"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR(" "));
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (bingSuffixChecker_onceToken != -1)
          dispatch_once(&bingSuffixChecker_onceToken, &__block_literal_global_360);
        if (!objc_msgSend((id)bingSuffixChecker_checker, "hasSuffix:", v6))
        {
          if (duckDuckGoSuffixChecker_onceToken != -1)
            dispatch_once(&duckDuckGoSuffixChecker_onceToken, &__block_literal_global_371);
          if (objc_msgSend((id)duckDuckGoSuffixChecker_checker, "hasSuffix:", v6))
          {
            searchQueryForDuckDuckGoURL(v5);
            v26 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            baiduSuffixChecker();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "hasSuffix:", v6);

            if (!v28)
            {
              v13 = 0;
              goto LABEL_25;
            }
            searchQueryForBaiduURL(v5);
            v26 = objc_claimAutoreleasedReturnValue();
          }
          v13 = (void *)v26;
LABEL_25:

          goto LABEL_26;
        }
        v20 = v5;
        objc_msgSend(v20, "_lp_pathComponentAtIndex:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0390);

        if ((v22 & 1) == 0)
          goto LABEL_29;
        objc_msgSend(v20, "_lp_valueForQueryKey:", CFSTR("q"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR(" "));
        v12 = objc_claimAutoreleasedReturnValue();
      }
    }
LABEL_22:
    v13 = (void *)v12;
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  v13 = 0;
LABEL_26:

  return v13;
}

+ (BOOL)isArticleWithActivityPub:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (objc_msgSend(a1, "isArticle:", v4))
    v5 = objc_msgSend(v4, "usesActivityPub");
  else
    v5 = 0;

  return v5;
}

+ (BOOL)isMicroblogPost:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;

  v4 = a3;
  if ((objc_msgSend(a1, "isTwitterSummaryCardMetadata:", v4) & 1) != 0
    || objc_msgSend(a1, "isTwitterSummaryLargeImageCardMetadata:", v4))
  {
    v5 = objc_msgSend(a1, "isArticleWithActivityPub:", v4);
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "isTweetURL:", v6) & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v4, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "isSinaWeiboURL:", v7))
  {

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(v4, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(a1, "isTikTokURL:", v12) | v5;

  if ((v13 & 1) == 0)
    goto LABEL_13;
LABEL_9:
  objc_msgSend(v4, "summary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v4, "summary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10 >= 3)
    {
      objc_msgSend(v4, "selectedText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "length");

      LOBYTE(v8) = v11 == 0;
      goto LABEL_14;
    }
LABEL_13:
    LOBYTE(v8) = 0;
  }
LABEL_14:

  return (char)v8;
}

+ (BOOL)isTweetURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0408);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "_lp_pathComponentAtIndex:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_lp_isEqualIgnoringCase:", CFSTR("status"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isSinaWeiboURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0420);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "pathComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 3)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invertedSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v9) == 0x7FFFFFFFFFFFFFFFLL;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)isTwitterProfileImageURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_lp_isEqualIgnoringCase:", CFSTR("pbs.twimg.com"));

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "pathComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") >= 3)
    {
      objc_msgSend(v3, "_lp_pathComponentAtIndex:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "_lp_isEqualIgnoringCase:", CFSTR("profile_images"));

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isTwitterSummaryCardMetadata:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "twitterCard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", CFSTR("summary"));

  return v4;
}

+ (BOOL)isTwitterSummaryLargeImageCardMetadata:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "twitterCard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", CFSTR("summary_large_image"));

  return v4;
}

+ (BOOL)isArticle:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "itemType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", CFSTR("article"));

  return v4;
}

+ (BOOL)isRedditURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_lp_isEqualIgnoringCase:", CFSTR("reddit.com")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "_lp_hasCaseInsensitiveSuffix:", CFSTR(".reddit.com"));

  }
  return v5;
}

+ (BOOL)isRedditStaticImage:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0438);

  return v4;
}

+ (BOOL)isTwitterShortenerURL:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", CFSTR("t.co"));

  return v4;
}

+ (BOOL)isTikTokURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_lp_isEqualIgnoringCase:", CFSTR("tiktok.com")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "_lp_hasCaseInsensitiveSuffix:", CFSTR(".tiktok.com"));

  }
  return v5;
}

+ (BOOL)isInstagramURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_lp_isEqualIgnoringCase:", CFSTR("instagram.com")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "_lp_hasCaseInsensitiveSuffix:", CFSTR(".instagram.com"));

  }
  return v5;
}

+ (BOOL)isMuninURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_lp_isEqualIgnoringCase:", CFSTR("maps.apple.com"));

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "_lp_components");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && objc_msgSend(v7, "indexOfObjectPassingTest:", &__block_literal_global_23) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = 0;
      v15 = &v14;
      v16 = 0x2050000000;
      v9 = (void *)getGEOResourceManifestManagerClass_softClass;
      v17 = getGEOResourceManifestManagerClass_softClass;
      if (!getGEOResourceManifestManagerClass_softClass)
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __getGEOResourceManifestManagerClass_block_invoke;
        v13[3] = &unk_1E44A7DB0;
        v13[4] = &v14;
        __getGEOResourceManifestManagerClass_block_invoke((uint64_t)v13);
        v9 = (void *)v15[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v14, 8);
      objc_msgSend(v10, "modernManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "isMuninEnabled");

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __44__LPPresentationSpecializations_isMuninURL___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0450);

  return v3;
}

+ (id)nonMobileTweetURLForTweetURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_lp_isEqualIgnoringCase:", CFSTR("mobile.twitter.com"));

  if ((v6 & 1) != 0 && objc_msgSend(a1, "isTweetURL:", v4))
  {
    objc_msgSend(v4, "_lp_components");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHost:", CFSTR("twitter.com"));
    objc_msgSend(v7, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)nonMobileRedditURLForRedditURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_lp_isEqualIgnoringCase:", CFSTR("m.reddit.com"));

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "_lp_components");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHost:", CFSTR("reddit.com"));
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)youTubeVideoComponentsForVideoURL:(id)a3
{
  id v4;
  LPYouTubeURLComponents *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  double v10;

  v4 = a3;
  if ((objc_msgSend(a1, "isYouTubeURL:", v4) & 1) != 0)
  {
    v5 = objc_alloc_init(LPYouTubeURLComponents);
    objc_msgSend(v4, "_lp_valueForQueryKey:", CFSTR("v"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPYouTubeURLComponents setVideoID:](v5, "setVideoID:", v6);

    v10 = 0.0;
    objc_msgSend(v4, "_lp_valueForQueryKey:", CFSTR("t"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[LPYouTubeURLComponents parseYouTubeTimeFormat:outTime:](LPYouTubeURLComponents, "parseYouTubeTimeFormat:outTime:", v7, &v10);

    if (v8)
      -[LPYouTubeURLComponents setStartTime:](v5, "setStartTime:", v10);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)youTubeVideoComponentsForEmbedURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  LPYouTubeURLComponents *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0468);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "pathComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") >= 3
      && (objc_msgSend(v3, "_lp_pathComponentAtIndex:", 1),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "_lp_isEqualIgnoringCase:", CFSTR("embed")),
          v7,
          (v8 & 1) != 0))
    {
      v9 = objc_alloc_init(LPYouTubeURLComponents);
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPYouTubeURLComponents setVideoID:](v9, "setVideoID:", v10);

      objc_msgSend(v3, "_lp_valueForQueryKey:", CFSTR("start"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPYouTubeURLComponents setStartTime:](v9, "setStartTime:", (double)objc_msgSend(v11, "integerValue"));

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)isYouTubeEmbedURL:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "youTubeVideoComponentsForEmbedURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)isYouTubeURL:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0480);

  return v4;
}

+ (BOOL)isAppleTVURL:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", CFSTR("tv.apple.com"));

  return v4;
}

+ (BOOL)isAppleNewsURL:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", CFSTR("apple.news"));

  return v4;
}

+ (BOOL)isiCloudSharingURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  if (+[LPPresentationSpecializations isiCloudURL:](LPPresentationSpecializations, "isiCloudURL:", v3))
  {
    objc_msgSend(v3, "pathComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0498);

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isiCloudURL:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F04B0);

  return v4;
}

+ (BOOL)isiCloudPhotoShareURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;

  v3 = a3;
  if ((objc_msgSend(v3, "_lp_isHTTPFamilyURL") & 1) != 0
    && (objc_msgSend(v3, "host"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("share.icloud.com")),
        v4,
        (v5 & 1) != 0))
  {
    objc_msgSend(v3, "pathComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "_lp_isEqualIgnoringCase:", CFSTR("photos"));

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isApplePhotosSharedLibraryInvitationURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;

  v3 = a3;
  if ((objc_msgSend(v3, "_lp_isHTTPFamilyURL") & 1) != 0
    && (objc_msgSend(v3, "host"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F04C8),
        v4,
        (v5 & 1) != 0))
  {
    objc_msgSend(v3, "pathComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F04E0);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isSharedPasswordsInviteURL:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isiCloudURL:", v3))
  {
    objc_msgSend(v3, "_lp_pathComponentAtIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("unavailable_shared_passwords"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isStockSymbolURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  unint64_t v7;
  char v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_lp_isEqualIgnoringCase:", CFSTR("stocks.apple.com"));

  if ((v5 & 1) != 0
    && (objc_msgSend(v3, "pathComponents"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7 >= 3))
  {
    objc_msgSend(v3, "_lp_pathComponentAtIndex:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "_lp_isEqualIgnoringCase:", CFSTR("symbol"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isStocksNewsURL:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_lp_isEqualIgnoringCase:", CFSTR("stocks.apple.com")))
    v6 = objc_msgSend(a1, "isStockSymbolURL:", v4) ^ 1;
  else
    LOBYTE(v6) = 0;

  return v6;
}

+ (BOOL)isiTunesStoreOrAdjacentURL:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F04F8);

  return v4;
}

+ (BOOL)isAppleBookSeriesURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0510);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "pathComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") >= 3)
    {
      objc_msgSend(v3, "_lp_pathComponentAtIndex:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0528) & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        objc_msgSend(v3, "_lp_pathComponentAtIndex:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v9, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0528);

      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isAppleMusicClassicalURL:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", CFSTR("classical.music.apple.com"));

  return v4;
}

+ (BOOL)isAppStoreStoryURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0540);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "pathComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") >= 3)
    {
      objc_msgSend(v3, "_lp_pathComponentAtIndex:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "_lp_isEqualIgnoringCase:", CFSTR("story")) & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        objc_msgSend(v3, "_lp_pathComponentAtIndex:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v9, "_lp_isEqualIgnoringCase:", CFSTR("story"));

      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isiTunesStoreURLThatUsesWebMetadata:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(a1, "isAppStoreStoryURL:", v4) & 1) != 0 || (objc_msgSend(a1, "isAppleTVURL:", v4) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(a1, "isAppleBookSeriesURL:", v4);

  return v5;
}

+ (BOOL)isAppleMapsURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_lp_isEqualIgnoringCase:", CFSTR("maps")) & 1) != 0)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v3, "_lp_isHTTPFamilyURL"))
  {
    objc_msgSend(v3, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "_lp_isEqualIgnoringCase:", CFSTR("maps.apple.com"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isAppleFitnessURL:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "_lp_isHTTPFamilyURL"))
  {
    objc_msgSend(v3, "host");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_lp_isEqualIgnoringCase:", CFSTR("fitness.apple.com"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isAppleMapsCollectionURL:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if ((objc_msgSend(v3, "_lp_isHTTPFamilyURL") & 1) != 0)
  {
    objc_msgSend(v3, "host");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0558);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isAppleHealthURL:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "_lp_isHTTPFamilyURL"))
  {
    objc_msgSend(v3, "host");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_lp_isEqualIgnoringCase:", CFSTR("health.apple.com"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isWikipediaURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_lp_isEqualIgnoringCase:", CFSTR("wikipedia.org")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "_lp_hasCaseInsensitiveSuffix:", CFSTR(".wikipedia.org"));

  }
  return v5;
}

+ (BOOL)isWebexSiteURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  void *v11;
  int v12;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_lp_hasCaseInsensitiveSuffix:", CFSTR(".webex.com"));

  if ((v5 & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v3, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "_lp_isEqualIgnoringCase:", CFSTR("www.webex.com")))
    goto LABEL_3;
  objc_msgSend(v3, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_lp_hasCaseInsensitiveSuffix:", CFSTR(".www.webex.com"));

  if ((v8 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v3, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "_lp_isEqualIgnoringCase:", CFSTR("help.webex.com")))
  {
LABEL_3:

  }
  else
  {
    objc_msgSend(v3, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "_lp_hasCaseInsensitiveSuffix:", CFSTR(".help.webex.com"));

    if (!v12)
    {
      v9 = 1;
      goto LABEL_6;
    }
  }
LABEL_5:
  v9 = 0;
LABEL_6:

  return v9;
}

+ (id)nonMobileYouTubeURLForURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_lp_isEqualIgnoringCase:", CFSTR("m.youtube.com"));

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "_lp_components");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHost:", CFSTR("youtube.com"));
    objc_msgSend(v6, "fragment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("/"));

    if (v8)
    {
      objc_msgSend(v6, "fragment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("?"));
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v9, "substringToIndex:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setPath:", v11);

        if (objc_msgSend(v9, "length") > (unint64_t)(v10 + 1))
        {
          objc_msgSend(v9, "substringFromIndex:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setQuery:", v12);

        }
        objc_msgSend(v6, "setFragment:", 0);
      }

    }
    objc_msgSend(v6, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)youTubeVideoURLForEmbedURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_msgSend(a1, "youTubeVideoComponentsForEmbedURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v4, "scheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScheme:", v7);

    objc_msgSend(v6, "setHost:", CFSTR("youtube.com"));
    objc_msgSend(v6, "setPath:", CFSTR("/watch"));
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = objc_alloc(MEMORY[0x1E0CB39D8]);
    objc_msgSend(v5, "videoID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("v"), v10);
    objc_msgSend(v8, "addObject:", v11);

    objc_msgSend(v5, "startTime");
    if (v12 != 0.0)
    {
      v13 = objc_alloc(MEMORY[0x1E0CB39D8]);
      objc_msgSend(v5, "startTime");
      +[LPYouTubeURLComponents formatAsYouTubeTime:](LPYouTubeURLComponents, "formatAsYouTubeTime:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("t"), v14);
      objc_msgSend(v8, "addObject:", v15);

    }
    objc_msgSend(v6, "setQueryItems:", v8);
    objc_msgSend(v6, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)nonDirectURLForImgurURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_lp_isEqualIgnoringCase:", CFSTR("i.imgur.com"));

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "_lp_components");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHost:", CFSTR("imgur.com"));
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByDeletingPathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPath:", v8);

    objc_msgSend(v6, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)destinationForGoogleRedirectURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((objc_msgSend(a1, "isGoogleURL:", v4) & 1) != 0
    && (objc_msgSend(v4, "_lp_pathComponentAtIndex:", 1),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "_lp_isEqualIgnoringCase:", CFSTR("url")),
        v5,
        (v6 & 1) != 0))
  {
    objc_msgSend(v4, "_lp_valueForQueryKey:", CFSTR("url"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)canonicalMetadataURLForURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "nonMobileTweetURLForTweetURL:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(a1, "nonMobileRedditURLForRedditURL:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        objc_msgSend(a1, "nonDirectURLForImgurURL:", v4);
        v5 = (id)objc_claimAutoreleasedReturnValue();
        if (!v5)
        {
          objc_msgSend(a1, "nonMobileYouTubeURLForURL:", v4);
          v5 = (id)objc_claimAutoreleasedReturnValue();
          if (!v5)
          {
            objc_msgSend(a1, "youTubeVideoURLForEmbedURL:", v4);
            v5 = (id)objc_claimAutoreleasedReturnValue();
            if (!v5)
            {
              objc_msgSend(a1, "destinationForGoogleRedirectURL:", v4);
              v5 = (id)objc_claimAutoreleasedReturnValue();
              if (!v5)
                v5 = v4;
            }
          }
        }
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldLoadInsteadOfUsingExistingWebViewForURL:(id)a3
{
  id v4;
  BOOL v5;
  void *v7;
  void *v8;

  v4 = a3;
  if ((objc_msgSend(a1, "isYouTubeURL:", v4) & 1) != 0
    || (objc_msgSend(a1, "isTweetURL:", v4) & 1) != 0
    || (objc_msgSend(a1, "isTikTokURL:", v4) & 1) != 0
    || (objc_msgSend(a1, "isGoogleMapsURL:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(a1, "canonicalMetadataURLForURL:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v5 = v7 && (objc_msgSend(v7, "isEqual:", v4) & 1) == 0;

  }
  return v5;
}

+ (BOOL)shouldAllowMultipleImagesForURL:(id)a3
{
  return objc_msgSend(a1, "isWikipediaURL:", a3) ^ 1;
}

+ (BOOL)shouldAllowHoistingContentImagesForURL:(id)a3
{
  return objc_msgSend(a1, "isRedditURL:", a3) ^ 1;
}

+ (BOOL)isKnownBlankImageURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_lp_isEqualIgnoringCase:", CFSTR("s0.wp.com")))
  {
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_lp_isEqualIgnoringCase:", CFSTR("/i/blank.jpg"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)userAgentForURL:(id)a3
{
  id v4;
  __CFString *v5;

  v4 = a3;
  if ((objc_msgSend(a1, "isTwitterShortenerURL:", v4) & 1) != 0)
  {
    v5 = CFSTR("curl/7.54.0");
  }
  else if ((objc_msgSend(a1, "isTikTokURL:", v4) & 1) != 0)
  {
    v5 = CFSTR("facebookexternalhit/1.1");
  }
  else if ((objc_msgSend(a1, "isInstagramURL:", v4) & 1) != 0)
  {
    v5 = CFSTR("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.4");
  }
  else
  {
    +[LPMetadataProvider _defaultUserAgent](LPMetadataProvider, "_defaultUserAgent");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)articleTitleFromTitle:(id)a3 withURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v5 = a4;
  v35 = v5;
  objc_msgSend(v5, "_lp_highLevelDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(v5, "_lp_simplifiedStringForDisplayOnly:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "lowercaseString");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)

  objc_msgSend(v38, "_lp_hostByStrippingTopLevelDomain");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = 0;
  v9 = objc_msgSend(&unk_1E44F0570, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v9)
    goto LABEL_31;
  v10 = *(_QWORD *)v40;
  v11 = 0.0;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v40 != v10)
        objc_enumerationMutation(&unk_1E44F0570);
      objc_msgSend(v37, "componentsSeparatedByString:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count") == 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "lowercaseString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lowercaseString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_lp_similarityToString:", v38);
        v22 = v21;
        objc_msgSend(v19, "_lp_similarityToString:", v36);
        if (v22 >= v23)
          v24 = v22;
        else
          v24 = v23;
        objc_msgSend(v20, "_lp_similarityToString:", v38);
        v26 = v25;
        objc_msgSend(v20, "_lp_similarityToString:", v36);
        if (v26 >= v27)
          v27 = v26;
        if (v24 >= v27)
          v28 = v24;
        else
          v28 = v27;
        if (v28 <= v11)
        {
          v28 = v11;
        }
        else
        {
          if (v24 <= v27)
            v29 = v16;
          else
            v29 = v18;
          v30 = v29;
          v31 = v8;
          v8 = v30;

        }
        v11 = v28;
      }

    }
    v9 = objc_msgSend(&unk_1E44F0570, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  }
  while (v9);
  if (v8 && v11 >= 0.6)
  {
    objc_msgSend(v8, "_lp_stringByTrimmingWhitespace");
    v32 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_31:
    v32 = v37;
  }
  v33 = v32;

  return v33;
}

+ (id)businessChatURLToOpenForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend(v3, "_lp_components");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", CFSTR("sms://open"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("service"), CFSTR("iMessage"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("recipient"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);
      objc_msgSend(v6, "queryItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v12);

      objc_msgSend(v8, "setQueryItems:", v7);
      objc_msgSend(v8, "URL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)URLToOpenForURL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_lp_isEqualIgnoringCase:", CFSTR("bcrw.apple.com"));

  v7 = v4;
  if (v6)
  {
    objc_msgSend(a1, "businessChatURLToOpenForURL:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v4;
    v7 = v10;

  }
  urlByRemovingTrackingInformation(v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
