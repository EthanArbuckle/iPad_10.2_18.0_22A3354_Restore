@implementation DAEASOAuthPKCEChallenge

- (DAEASOAuthPKCEChallenge)initWithCodeChallengeMethod:(int64_t)a3
{
  DAEASOAuthPKCEChallenge *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DAEASOAuthPKCEChallenge;
  v4 = -[DAEASOAuthPKCEChallenge init](&v9, sel_init);
  -[DAEASOAuthPKCEChallenge setCodeChallengeMethod:](v4, "setCodeChallengeMethod:", a3);
  v5 = +[DAEASOAuthPKCEChallenge newCodeVerifier](DAEASOAuthPKCEChallenge, "newCodeVerifier");
  -[DAEASOAuthPKCEChallenge setCodeVerifier:](v4, "setCodeVerifier:", v5);

  -[DAEASOAuthPKCEChallenge codeVerifier](v4, "codeVerifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAEASOAuthPKCEChallenge codeChallengeFromVerifier:withCodeChallengeMethod:](v4, "codeChallengeFromVerifier:withCodeChallengeMethod:", v6, -[DAEASOAuthPKCEChallenge codeChallengeMethod](v4, "codeChallengeMethod"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAEASOAuthPKCEChallenge setCodeChallenge:](v4, "setCodeChallenge:", v7);

  return v4;
}

+ (id)newCodeVerifier
{
  void *v2;
  const __SecRandom *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const __SecRandom *)*MEMORY[0x24BDE94B8];
  v4 = objc_retainAutorelease(v2);
  if (SecRandomCopyBytes(v3, 0x20uLL, (void *)objc_msgSend(v4, "mutableBytes")))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDD1880]);
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[DAEASOAuthPKCEChallenge base64URLEncode:](DAEASOAuthPKCEChallenge, "base64URLEncode:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)codeChallengeFromVerifier:(id)a3 withCodeChallengeMethod:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (a4 == 1)
  {
    objc_msgSend(v5, "dataUsingEncoding:", 4, 0, 0, 0, 0);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CC_SHA256((const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), (unsigned __int8 *)&v11);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v11, 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[DAEASOAuthPKCEChallenge base64URLEncode:](DAEASOAuthPKCEChallenge, "base64URLEncode:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v5;
  }

  return v9;
}

+ (id)convertToString:(int64_t)a3
{
  if (a3 == 1)
    return CFSTR("S256");
  else
    return CFSTR("plain");
}

+ (id)base64URLEncode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("="), &stru_24E370C58);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)codeChallengeMethod
{
  return self->_codeChallengeMethod;
}

- (void)setCodeChallengeMethod:(int64_t)a3
{
  self->_codeChallengeMethod = a3;
}

- (NSString)codeVerifier
{
  return self->_codeVerifier;
}

- (void)setCodeVerifier:(id)a3
{
  objc_storeStrong((id *)&self->_codeVerifier, a3);
}

- (NSString)codeChallenge
{
  return self->_codeChallenge;
}

- (void)setCodeChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_codeChallenge, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codeChallenge, 0);
  objc_storeStrong((id *)&self->_codeVerifier, 0);
}

@end
