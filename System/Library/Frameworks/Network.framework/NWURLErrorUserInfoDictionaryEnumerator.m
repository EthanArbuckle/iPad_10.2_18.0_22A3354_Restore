@implementation NWURLErrorUserInfoDictionaryEnumerator

- (id)nextObject
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  -[NWURLErrorUserInfoDictionaryEnumerator userInfoKeyEnumerator](self, "userInfoKeyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    while (1)
    {
      +[NWURLError allUserInfoKeys](NWURLError, "allUserInfoKeys");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v4);
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = NSSelectorFromString(v6);

      -[NWURLErrorUserInfoDictionaryEnumerator error](self, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        break;
      -[NWURLErrorUserInfoDictionaryEnumerator userInfoKeyEnumerator](self, "userInfoKeyEnumerator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nextObject");
      v11 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v11;
      if (!v11)
        goto LABEL_4;
    }
    v12 = v4;

  }
  else
  {
LABEL_4:
    v12 = 0;
  }
  return v12;
}

- (NWURLError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSEnumerator)userInfoKeyEnumerator
{
  return self->_userInfoKeyEnumerator;
}

- (void)setUserInfoKeyEnumerator:(id)a3
{
  objc_storeStrong((id *)&self->_userInfoKeyEnumerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoKeyEnumerator, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
