@implementation CNSocialProfileURLParser

+ (id)parseSocialProfileURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v4))
  {
    +[CNFoundationSocialProfile emptySocialProfile](CNFoundationSocialProfile, "emptySocialProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "parseURLStringWithRegularExpressions:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEmpty"))
    {
      objc_msgSend(a1, "parseURLStringByInference:", v4);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
  }

  return v5;
}

+ (id)parseURLStringWithRegularExpressions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  +[CNFoundationSocialProfile emptySocialProfile](CNFoundationSocialProfile, "emptySocialProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __65__CNSocialProfileURLParser_parseURLStringWithRegularExpressions___block_invoke;
  v15 = &unk_1E29B99B0;
  v16 = v4;
  v17 = v7;
  v8 = v7;
  v9 = v4;
  objc_msgSend(a1, "enumerateServiceMatchesForURLString:withBlock:", v9, &v12);
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __65__CNSocialProfileURLParser_parseURLStringWithRegularExpressions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CNFoundationSocialProfile *v11;
  id v12;

  v12 = a3;
  v5 = a2;
  if ((unint64_t)objc_msgSend(v12, "numberOfRanges") < 3)
  {
    v10 = 0;
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    v7 = objc_msgSend(v12, "rangeAtIndex:", 2);
    objc_msgSend(v6, "substringWithRange:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByRemovingPercentEncoding");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = -[CNFoundationSocialProfile initWithUrlString:username:userIdentifier:service:displayName:]([CNFoundationSocialProfile alloc], "initWithUrlString:username:userIdentifier:service:displayName:", *(_QWORD *)(a1 + 32), v10, 0, v5, 0);

  objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v11, 0);
}

+ (void)enumerateServiceMatchesForURLString:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "servicesDictionary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__CNSocialProfileURLParser_enumerateServiceMatchesForURLString_withBlock___block_invoke;
  v11[3] = &unk_1E29B9A00;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v11);

}

void __74__CNSocialProfileURLParser_enumerateServiceMatchesForURLString_withBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__CNSocialProfileURLParser_enumerateServiceMatchesForURLString_withBlock___block_invoke_2;
  v10[3] = &unk_1E29B99D8;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v11 = v5;
  v12 = v8;
  v9 = v5;
  objc_msgSend(v7, "enumerateMatchesWithRegexPattern:inString:withBlock:", a2, v6, v10);

}

uint64_t __74__CNSocialProfileURLParser_enumerateServiceMatchesForURLString_withBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

+ (void)enumerateMatchesWithRegexPattern:(id)a3 inString:(id)a4 withBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(v8, "length");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__CNSocialProfileURLParser_enumerateMatchesWithRegexPattern_inString_withBlock___block_invoke;
  v12[3] = &unk_1E29B9A28;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v9, "enumerateMatchesInString:options:range:usingBlock:", v8, 0, 0, v10, v12);

}

uint64_t __80__CNSocialProfileURLParser_enumerateMatchesWithRegexPattern_inString_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)parseURLStringByInference:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  CNFoundationSocialProfile *v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("x-apple")))
  {
    objc_msgSend(v4, "resourceSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByRemovingPercentEncoding");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
  }
  else
  {
    v10 = objc_msgSend(v5, "length");
    if (v10)
      v9 = v6;
    else
      v9 = 0;
    if (v10)
      v8 = 0;
    else
      v8 = v6;
  }
  objc_msgSend(v4, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && !objc_msgSend(v11, "rangeOfString:", CFSTR("www.")))
  {
    objc_msgSend(v12, "substringFromIndex:", 4);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v12))
    v14 = 0;
  else
    v14 = v12;
  v15 = v14;

  v16 = -[CNFoundationSocialProfile initWithUrlString:username:userIdentifier:service:displayName:]([CNFoundationSocialProfile alloc], "initWithUrlString:username:userIdentifier:service:displayName:", v9, v8, 0, v15, 0);
  return v16;
}

+ (id)servicesDictionary
{
  if (servicesDictionary_cn_once_token_0 != -1)
    dispatch_once(&servicesDictionary_cn_once_token_0, &__block_literal_global_17);
  return (id)servicesDictionary_cn_once_object_0;
}

void __46__CNSocialProfileURLParser_servicesDictionary__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[13];
  _QWORD v17[15];

  v17[13] = *MEMORY[0x1E0C80C00];
  sRE((uint64_t)CFSTR("https?://(?:www\\.)?(facebook\\.com)/profile\\.php\\?id=(?:\\d+)$"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v15;
  v17[0] = CFSTR("Facebook");
  sRE((uint64_t)CFSTR("https?://(?:www\\.)?(facebook\\.com)/([%\\w\\d\\.]+)$"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v14;
  v17[1] = CFSTR("Facebook");
  sRE((uint64_t)CFSTR("http://(?:www\\.)?(flickr\\.com)(?:/photos|profile)?/([%\\w\\d]+)/?$"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v13;
  v17[2] = CFSTR("Flickr");
  sRE((uint64_t)CFSTR("https?://(?:www\\.)?(linkedin\\.com)/in/([%\\w\\d]+)/?$"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v12;
  v17[3] = CFSTR("LinkedIn");
  sRE((uint64_t)CFSTR("https?://(?:www\\.)?(linkedin\\.com)/pub/[%\\w\\d-]+/.+$"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v0;
  v17[4] = CFSTR("LinkedIn");
  sRE((uint64_t)CFSTR("https?://(?:www\\.)?(linkedin\\.com)/profile/view\\?id=(?:\\d+).*"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v1;
  v17[5] = CFSTR("LinkedIn");
  sRE((uint64_t)CFSTR("http://(?:www\\.)?(myspace\\.com)/([%\\w\\d]+)/?$"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v2;
  v17[6] = CFSTR("MySpace");
  sRE((uint64_t)CFSTR("https?://(?:www\\.)?(twitter\\.com)/(?:#!/)?([%\\w\\d]+)/?$"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v3;
  v17[7] = CFSTR("Twitter");
  sRE((uint64_t)CFSTR("https?://(?:www\\.)?(weibo\\.com)/u/(?:\\d+)/?$"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v4;
  v17[8] = CFSTR("SinaWeibo");
  sRE((uint64_t)CFSTR("https?://(?:www\\.)?(weibo\\.com)/(?:n/)?([%\\w\\d]+)/?$"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v5;
  v17[9] = CFSTR("SinaWeibo");
  sRE((uint64_t)CFSTR("https?://(?:www\\.)?(t\\.qq\\.com)/([%\\w\\d]+)/?$"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[10] = v6;
  v17[10] = CFSTR("TencentWeibo");
  sRE((uint64_t)CFSTR("https?://(?:www\\.)?(yelp\\.com)/biz/([-\\w\\d]+)/?$"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[11] = v7;
  v17[11] = CFSTR("Yelp");
  sRE((uint64_t)CFSTR("https?://(?:www\\.)?(yelp\\.com)/user_details\\?userid=(?:[\\w\\d_-]+)$"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[12] = v8;
  v17[12] = CFSTR("Yelp");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)servicesDictionary_cn_once_object_0;
  servicesDictionary_cn_once_object_0 = v10;

}

@end
