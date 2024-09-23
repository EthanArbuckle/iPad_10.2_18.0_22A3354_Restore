@implementation NWURLErrorUserInfoDictionary

- (NWURLErrorUserInfoDictionary)initWithError:(id)a3
{
  id v4;
  NWURLErrorUserInfoDictionary *v5;
  NWURLErrorUserInfoDictionary *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NWURLErrorUserInfoDictionary;
  v5 = -[NWURLErrorUserInfoDictionary init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[NWURLErrorUserInfoDictionary setError:](v5, "setError:", v4);

  return v6;
}

- (unint64_t)count
{
  void *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  +[NWURLError allUserInfoKeys](NWURLError, "allUserInfoKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__NWURLErrorUserInfoDictionary_count__block_invoke;
  v6[3] = &unk_1E14AA8E8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  +[NWURLError allUserInfoKeys](NWURLError, "allUserInfoKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = NSSelectorFromString(v6);

  if (v7)
  {
    -[NWURLErrorUserInfoDictionary error](self, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend((id)*MEMORY[0x1E0CB3300], "isEqual:", v4))
    {
      v9 = 0;
      goto LABEL_7;
    }
    -[NWURLErrorUserInfoDictionary error](self, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "failingURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return v9;
}

- (id)keyEnumerator
{
  NWURLErrorUserInfoDictionaryEnumerator *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(NWURLErrorUserInfoDictionaryEnumerator);
  -[NWURLErrorUserInfoDictionary error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLErrorUserInfoDictionaryEnumerator setError:](v3, "setError:", v4);

  +[NWURLError allUserInfoKeys](NWURLError, "allUserInfoKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLErrorUserInfoDictionaryEnumerator setUserInfoKeyEnumerator:](v3, "setUserInfoKeyEnumerator:", v6);

  return v3;
}

- (NWURLError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

void __37__NWURLErrorUserInfoDictionary_count__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  NSString *v5;
  void *v6;
  const char *v7;
  void *v8;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = NSSelectorFromString(v5);

  objc_msgSend(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

@end
