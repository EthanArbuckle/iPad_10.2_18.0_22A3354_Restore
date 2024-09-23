@implementation SGRe2Lazy

- (SGRe2Lazy)initWithRegexp:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  SGRe2Lazy *v10;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "UTF8String");
  v8 = objc_retainAutorelease(v6);
  v9 = (void *)objc_msgSend(v5, "initWithBytes:length:", v7, strlen((const char *)objc_msgSend(v8, "UTF8String")) + 1);
  v10 = -[SGRe2Lazy initWithRegexpData:](self, "initWithRegexpData:", v9);

  return v10;
}

- (SGRe2Lazy)initWithRegexpData:(id)a3
{
  id v6;
  SGRe2Lazy *v7;
  SGRe2Lazy *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGRe2.mm"), 692, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regexpUtf8"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SGRe2Lazy;
  v7 = -[SGRe2Lazy init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_regexp, a3);

  return v8;
}

- (id)existsInUtf8:(const char *)a3
{
  void *v4;
  void *v5;

  getInternal(self->_regexp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "existsInUtf8:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)matchesUtf8:(const char *)a3
{
  void *v4;
  void *v5;

  getInternal(self->_regexp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchesUtf8:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)_enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a4;
  v11 = a6;
  getInternal(self->_regexp);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v12, "_enumerateMatchesInUtf8:fromString:ngroups:block:", a3, v10, a5, v11);

  return a5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  getInternal(self->_regexp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_regexp, 4);
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<RE2-lazy(%i) %@>"), v4 != 0, v5);

  return v6;
}

- (id)hashId
{
  void *v2;
  void *v3;

  getInternal(self->_regexp);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hashId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regexp, 0);
}

@end
