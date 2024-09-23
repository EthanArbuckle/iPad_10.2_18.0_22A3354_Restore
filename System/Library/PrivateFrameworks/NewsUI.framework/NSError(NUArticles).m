@implementation NSError(NUArticles)

+ (id)nu_errorArticleMissingHeadline:()NUArticles
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v12[0] = CFSTR("articleId");
  objc_msgSend(a3, "articleID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("nil");
  if (v4)
    v6 = (const __CFString *)v4;
  v13[0] = v6;
  v12[1] = *MEMORY[0x24BDD0FC8];
  NUBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Article did not load a headline"), &stru_24D5A3F98, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("NUNewsUIErrorDomain"), -1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)nu_errorArticleContentTypeUnsupported:()NUArticles
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  NUBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Article content type %llu is not supported by article viewer"), &stru_24D5A3F98, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v5, objc_msgSend(v3, "contentType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1540];
  v17[0] = CFSTR("articleId");
  objc_msgSend(v3, "identifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("nil");
  if (v8)
    v10 = (const __CFString *)v8;
  v18[0] = v10;
  v17[1] = CFSTR("contentType");
  v11 = (void *)MEMORY[0x24BDD16E0];
  v12 = objc_msgSend(v3, "contentType");

  objc_msgSend(v11, "numberWithUnsignedLongLong:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = *MEMORY[0x24BDD0FC8];
  v18[1] = v13;
  v18[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("NUNewsUIErrorDomain"), -2, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)nu_errorArticleMissingContentURL:()NUArticles
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v12[0] = CFSTR("articleId");
  objc_msgSend(a3, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("nil");
  if (v4)
    v6 = (const __CFString *)v4;
  v13[0] = v6;
  v12[1] = *MEMORY[0x24BDD0FC8];
  NUBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Article missing content URL needed to load web view"), &stru_24D5A3F98, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("NUNewsUIErrorDomain"), -3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)nu_errorArticleDownloadFailed:()NUArticles underlyingError:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BDBCED8];
  v7 = a3;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "articleID");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = CFSTR("nil");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("articleId"));

  NUBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Article download failed"), &stru_24D5A3F98, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDD0FC8]);

  if (v5)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD1398]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NUNewsUIErrorDomain"), -4, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
