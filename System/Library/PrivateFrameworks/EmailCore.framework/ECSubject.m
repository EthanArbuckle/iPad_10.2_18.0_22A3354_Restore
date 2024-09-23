@implementation ECSubject

void __32__ECSubject__uniqueString_type___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v0 = dispatch_queue_create("com.apple.emailcore.subject_uniqueStrings", 0);
  v1 = (void *)_uniqueString_type__uniqueStringsQueue;
  _uniqueString_type__uniqueStringsQueue = (uint64_t)v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 20);
  v3 = (void *)_uniqueString_type__prefixUniqueStrings;
  _uniqueString_type__prefixUniqueStrings = v2;

  v4 = (void *)_uniqueString_type__prefixUniqueStrings;
  +[ECSubjectFormatter nonLocalizedReplyPrefix](ECSubjectFormatter, "nonLocalizedReplyPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "ef_uniquedObject:", v5);

  v7 = (void *)_uniqueString_type__prefixUniqueStrings;
  +[ECSubjectFormatter nonLocalizedForwardPrefix](ECSubjectFormatter, "nonLocalizedForwardPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "ef_uniquedObject:", v8);

  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 100);
  v11 = (void *)_uniqueString_type__subjectUniqueStrings;
  _uniqueString_type__subjectUniqueStrings = v10;

}

void __32__ECSubject__uniqueString_type___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = a1[6];
  if (!v2)
  {
    v3 = &_uniqueString_type__prefixUniqueStrings;
    v4 = 20;
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    v3 = &_uniqueString_type__subjectUniqueStrings;
    v4 = 100;
LABEL_5:
    v5 = (id)*v3;
    goto LABEL_7;
  }
  v5 = 0;
  v4 = 0;
LABEL_7:
  v9 = v5;
  if (objc_msgSend(v5, "count") >= v4)
    objc_msgSend(v9, "removeAllObjects");
  objc_msgSend(v9, "ef_uniquedObject:", a1[4]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (NSString)subjectString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[ECSubject prefix](self, "prefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECSubject subjectWithoutPrefix](self, "subjectWithoutPrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v3, "stringByAppendingString:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return (NSString *)v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[ECSubject prefix](self, "prefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_prefix"));

  -[ECSubject subjectWithoutPrefix](self, "subjectWithoutPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_subjectWithoutPrefix"));

}

- (ECSubject)subjectWithoutPrefix
{
  return (ECSubject *)self->_subjectWithoutPrefix;
}

- (NSString)prefix
{
  return self->_prefix;
}

+ (id)_prefixTruncatedToMaximumAllowableSize:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4 >= 0x3E8)
    v5 = 1000;
  else
    v5 = v4;
  objc_msgSend(v3, "substringToIndex:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ECSubject)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ECSubject *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_prefix"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_subjectWithoutPrefix"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ECSubject initWithPrefix:subjectWithoutPrefix:](self, "initWithPrefix:subjectWithoutPrefix:", v5, v6);

  return v7;
}

- (ECSubject)initWithPrefix:(id)a3 subjectWithoutPrefix:(id)a4
{
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ECSubject;
  v8 = -[ECSubject init](&v18, sel_init);
  if (v8)
  {
    if (objc_msgSend(v6, "length"))
    {
      +[ECSubject _prefixTruncatedToMaximumAllowableSize:](ECSubject, "_prefixTruncatedToMaximumAllowableSize:", v6);
      v9 = objc_claimAutoreleasedReturnValue();

      +[ECSubject _uniqueString:type:](ECSubject, "_uniqueString:type:", v9, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)*((_QWORD *)v8 + 5);
      *((_QWORD *)v8 + 5) = v10;

      v12 = objc_msgSend(*((id *)v8 + 5), "length");
      *((_QWORD *)v8 + 6) = v12;
      v8[24] = v12 != 0;
      v6 = (id)v9;
    }
    else
    {
      *(int64x2_t *)(v8 + 8) = vdupq_n_s64(1uLL);
    }
    if (objc_msgSend(v7, "length"))
    {
      +[ECSubject _subjectTruncatedToMaximumAllowableSize:](ECSubject, "_subjectTruncatedToMaximumAllowableSize:", v7);
      v13 = objc_claimAutoreleasedReturnValue();

      +[ECSubject _uniqueString:type:](ECSubject, "_uniqueString:type:", v13, 1);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)*((_QWORD *)v8 + 7);
      *((_QWORD *)v8 + 7) = v14;
      v7 = (id)v13;
    }
    else
    {
      v15 = (void *)*((_QWORD *)v8 + 7);
      *((_QWORD *)v8 + 7) = &stru_1E7123500;
    }

    v16 = *((_QWORD *)v8 + 6);
    *((_QWORD *)v8 + 4) = objc_msgSend(*((id *)v8 + 7), "length") + v16;
  }

  return (ECSubject *)v8;
}

+ (id)_uniqueString:(id)a3 type:(int64_t)a4
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v11;
  uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  if (_uniqueString_type__onceToken != -1)
    dispatch_once(&_uniqueString_type__onceToken, &__block_literal_global_18);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v6 = _uniqueString_type__uniqueStringsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__ECSubject__uniqueString_type___block_invoke_3;
  block[3] = &unk_1E7121AF0;
  v12 = &v14;
  v13 = a4;
  v11 = v5;
  v7 = v5;
  dispatch_sync(v6, block);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

+ (id)_subjectTruncatedToMaximumAllowableSize:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4 >= 0x3E8)
    v5 = 1000;
  else
    v5 = v4;
  objc_msgSend(v3, "substringToIndex:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectWithoutPrefix, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)subjectWithString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:", v4);

  return v5;
}

- (ECSubject)initWithString:(id)a3
{
  void *v4;
  id v5;
  ECSubject *v6;
  id v8;

  v8 = 0;
  +[ECSubjectParser subjectWithoutPrefixForSubject:prefix:](ECSubjectParser, "subjectWithoutPrefixForSubject:prefix:", a3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  v6 = -[ECSubject initWithPrefix:subjectWithoutPrefix:](self, "initWithPrefix:subjectWithoutPrefix:", v5, v4);

  return v6;
}

- (ECSubject)init
{
  return -[ECSubject initWithPrefix:subjectWithoutPrefix:](self, "initWithPrefix:subjectWithoutPrefix:", 0, 0);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[ECSubject prefix](self, "prefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[ECSubject subjectWithoutPrefix](self, "subjectWithoutPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 33 * v4 + objc_msgSend(v5, "hash") + 1089;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ECSubject *v4;
  BOOL v5;

  v4 = (ECSubject *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[ECSubject isEqualToSubject:](self, "isEqualToSubject:", v4);
  }

  return v5;
}

- (NSString)ef_publicDescription
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");
  v5 = (void *)MEMORY[0x1E0D1EF48];
  if (v4)
  {
    -[ECSubject subjectWithoutPrefix](self, "subjectWithoutPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ec_partiallyRedactedStringForSubjectOrSummary:", v6);
  }
  else
  {
    -[ECSubject subjectWithoutPrefix](self, "subjectWithoutPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fullyRedactedStringForString:", v6);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ECSubject prefix](self, "prefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "stringByAppendingString:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v7;
  }
  v11 = v10;

  return (NSString *)v11;
}

- (BOOL)hasReplyPrefix
{
  unint64_t hasReplyPrefixState;
  void *v4;
  _BOOL4 v5;
  unint64_t v6;

  hasReplyPrefixState = self->_hasReplyPrefixState;
  if (!hasReplyPrefixState)
  {
    -[ECSubject prefix](self, "prefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[ECSubjectParser subjectHasReplyPrefix:](ECSubjectParser, "subjectHasReplyPrefix:", v4);
    v6 = 1;
    if (v5)
      v6 = 2;
    self->_hasReplyPrefixState = v6;

    hasReplyPrefixState = self->_hasReplyPrefixState;
  }
  return hasReplyPrefixState == 2;
}

- (BOOL)hasForwardPrefix
{
  unint64_t hasForwardPrefixState;
  void *v4;
  _BOOL4 v5;
  unint64_t v6;

  hasForwardPrefixState = self->_hasForwardPrefixState;
  if (!hasForwardPrefixState)
  {
    -[ECSubject prefix](self, "prefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[ECSubjectParser subjectHasForwardPrefix:](ECSubjectParser, "subjectHasForwardPrefix:", v4);
    v6 = 1;
    if (v5)
      v6 = 2;
    self->_hasForwardPrefixState = v6;

    hasForwardPrefixState = self->_hasForwardPrefixState;
  }
  return hasForwardPrefixState == 2;
}

- (BOOL)isEqualToSubject:(id)a3
{
  ECSubject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;

  v4 = (ECSubject *)a3;
  if (v4 == self)
  {
    v10 = 1;
    goto LABEL_8;
  }
  -[ECSubject prefix](self, "prefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECSubject prefix](v4, "prefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {

    goto LABEL_7;
  }
  -[ECSubject prefix](self, "prefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECSubject prefix](v4, "prefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
  {
LABEL_7:
    -[ECSubject subjectWithoutPrefix](self, "subjectWithoutPrefix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ECSubject subjectWithoutPrefix](v4, "subjectWithoutPrefix");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "isEqualToString:", v12);

    goto LABEL_8;
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (BOOL)isEqualToString:(id)a3
{
  id v4;
  ECSubject *v5;

  v4 = a3;
  v5 = -[ECSubject initWithString:]([ECSubject alloc], "initWithString:", v4);
  LOBYTE(self) = -[ECSubject isEqualToSubject:](self, "isEqualToSubject:", v5);

  return (char)self;
}

- (BOOL)isEqualToSubjectIgnoringPrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[ECSubject subjectWithoutPrefix](self, "subjectWithoutPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subjectWithoutPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)prefixLength
{
  return self->_prefixLength;
}

- (void)setSubjectWithoutPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)hasPrefix
{
  return self->_hasPrefix;
}

@end
