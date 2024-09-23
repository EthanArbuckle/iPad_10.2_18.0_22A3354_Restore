@implementation ECMessageFlags

- (BOOL)replied
{
  return (LOWORD(self->_storage.hashValue) >> 2) & 1;
}

- (BOOL)forwarded
{
  return (LOWORD(self->_storage.hashValue) >> 5) & 1;
}

- (ECMessageFlags)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  ECMessageFlags *v7;
  ECMessageFlags *v8;
  _QWORD v10[4];
  ECMessageFlags *v11;
  uint64_t v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_hash"));
  v6 = (void *)objc_opt_class();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__ECMessageFlags_initWithCoder___block_invoke;
  v10[3] = &unk_1E7121550;
  v7 = self;
  v11 = v7;
  v12 = v5;
  objc_msgSend(v6, "cachedFlagsWithHash:generator:", v5, v10);
  v8 = (ECMessageFlags *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (ECMessageFlags)initWithBuilder:(id)a3
{
  void (**v4)(id, ECMessageFlags *);
  ECMessageFlags *v5;
  void *v6;
  ECMessageFlagsHashedBitField v7;
  ECMessageFlags *v8;
  _QWORD v10[4];
  ECMessageFlags *v11;
  objc_super v12;

  v4 = (void (**)(id, ECMessageFlags *))a3;
  v12.receiver = self;
  v12.super_class = (Class)ECMessageFlags;
  v5 = -[ECMessageFlags init](&v12, sel_init);
  if (v5)
  {
    v4[2](v4, v5);
    v6 = (void *)objc_opt_class();
    v7.hashValue = (unint64_t)v5->_storage;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __34__ECMessageFlags_initWithBuilder___block_invoke;
    v10[3] = &unk_1E7121500;
    v8 = v5;
    v11 = v8;
    objc_msgSend(v6, "cachedFlagsWithHash:generator:", v7.hashValue, v10);
    v5 = (ECMessageFlags *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)cachedFlagsWithHash:(unint64_t)a3 generator:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (cachedFlagsWithHash_generator__onceToken != -1)
    dispatch_once(&cachedFlagsWithHash_generator__onceToken, &__block_literal_global_14);
  v6 = (void *)cachedFlagsWithHash_generator__cache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:generator:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)ef_publicDescription
{
  const __CFString *v3;
  __int16 hashValue;
  const __CFString *v5;
  __int16 v6;
  const __CFString *v7;
  const __CFString *v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  __CFString *v12;
  __int16 v13;
  void *v14;
  void *v15;
  void *v16;
  __int16 v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  char v27;
  char v28;
  char v29;
  __CFString *v30;
  _QWORD v31[10];

  v31[9] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("Read");
  hashValue = self->_storage.hashValue;
  if ((hashValue & 1) == 0)
    v3 = CFSTR("Unread");
  v31[0] = v3;
  v29 = hashValue;
  if ((hashValue & 2) != 0)
  {
    LOBYTE(v6) = hashValue;
    v5 = CFSTR("Deleted");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_storage.hashValue;
  }
  v30 = (__CFString *)v5;
  v31[1] = v5;
  v27 = v6;
  if ((v6 & 4) != 0)
  {
    v7 = CFSTR("Replied");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_storage.hashValue;
  }
  v26 = (__CFString *)v7;
  v31[2] = v7;
  v28 = v6;
  if ((v6 & 0x20) != 0)
  {
    v8 = CFSTR("Forwarded");
    LOBYTE(v9) = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_storage.hashValue;
  }
  v31[3] = v8;
  v25 = (__CFString *)v8;
  if ((v9 & 0x40) != 0)
  {
    v10 = CFSTR("Redirected");
    LOBYTE(v11) = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v11 = self->_storage.hashValue;
  }
  v31[4] = v10;
  v24 = (__CFString *)v10;
  if ((v11 & 0x10) != 0)
  {
    v12 = CFSTR("Draft");
    LOBYTE(v13) = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13 = self->_storage.hashValue;
  }
  v31[5] = v12;
  if ((v13 & 8) != 0)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[ECMessageFlags _flagColorDebugDescription](self, "_flagColorDebugDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Flagged:%@"), v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
  }
  v31[6] = v14;
  v17 = self->_storage.hashValue;
  if ((v17 & 0x80) != 0)
  {
    v18 = CFSTR("JunkLevelSetByUser");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v31[7] = v18;
  -[ECMessageFlags _junkLevelDebugDescription](self, "_junkLevelDebugDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v17 & 0x80) == 0)
  if ((v13 & 8) != 0)

  if ((v11 & 0x10) == 0)
  if ((v9 & 0x40) == 0)

  if ((v28 & 0x20) == 0)
  if ((v27 & 4) == 0)

  if ((v29 & 2) == 0)
  objc_msgSend(v20, "ef_filter:", *MEMORY[0x1E0D1ED88]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "componentsJoinedByString:", CFSTR("|"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v22;
}

- (id)_junkLevelDebugDescription
{
  return off_1E7121570[BYTE1(self->_storage.hashValue) & 3];
}

- (BOOL)read
{
  return self->_storage.hashValue & 1;
}

- (BOOL)flagged
{
  return (LOWORD(self->_storage.hashValue) >> 3) & 1;
}

- (BOOL)draft
{
  return (LOWORD(self->_storage.hashValue) >> 4) & 1;
}

- (void)setRead:(BOOL)a3
{
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFFFE | a3;
}

- (void)setJunkLevel:(unint64_t)a3
{
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFCFF | ((a3 & 3) << 8);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ECMessageFlags hash](self, "hash"), CFSTR("EFPropertyKey_hash"));

}

- (unint64_t)hash
{
  return self->_storage.hashValue;
}

- (void)setReplied:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFFFB | v3;
}

- (void)setRedirected:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFFBF | v3;
}

- (void)setJunkLevelSetByUser:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFF7F | v3;
}

- (void)setForwarded:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFFDF | v3;
}

- (void)setFlagged:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFFF7 | v3;
}

- (void)setDraft:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFFEF | v3;
}

id __34__ECMessageFlags_initWithBuilder___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

id __32__ECMessageFlags_initWithCoder___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "initWithHash:", *(_QWORD *)(a1 + 40));
}

- (ECMessageFlags)initWithHash:(unint64_t)a3
{
  ECMessageFlags *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ECMessageFlags;
  result = -[ECMessageFlags init](&v5, sel_init);
  if (result)
    result->_storage.hashValue = a3;
  return result;
}

void __48__ECMessageFlags_cachedFlagsWithHash_generator___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D1EED8]);
  v1 = (void *)cachedFlagsWithHash_generator__cache;
  cachedFlagsWithHash_generator__cache = (uint64_t)v0;

}

- (ECMessageFlags)init
{
  return -[ECMessageFlags initWithBuilder:](self, "initWithBuilder:", &__block_literal_global_3);
}

- (id)updatedFlagsWithBuilder:(id)a3
{
  id v4;
  ECMessageFlags *v5;
  id v6;
  ECMessageFlags *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = [ECMessageFlags alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__ECMessageFlags_updatedFlagsWithBuilder___block_invoke;
  v9[3] = &unk_1E7121528;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v7 = -[ECMessageFlags initWithBuilder:](v5, "initWithBuilder:", v9);

  return v7;
}

void __42__ECMessageFlags_updatedFlagsWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setRead:", objc_msgSend(*(id *)(a1 + 32), "read"));
  objc_msgSend(v3, "setDeleted:", objc_msgSend(*(id *)(a1 + 32), "deleted"));
  objc_msgSend(v3, "setReplied:", objc_msgSend(*(id *)(a1 + 32), "replied"));
  objc_msgSend(v3, "setFlagged:", objc_msgSend(*(id *)(a1 + 32), "flagged"));
  objc_msgSend(v3, "setDraft:", objc_msgSend(*(id *)(a1 + 32), "draft"));
  objc_msgSend(v3, "setForwarded:", objc_msgSend(*(id *)(a1 + 32), "forwarded"));
  objc_msgSend(v3, "setRedirected:", objc_msgSend(*(id *)(a1 + 32), "redirected"));
  objc_msgSend(v3, "setJunkLevelSetByUser:", objc_msgSend(*(id *)(a1 + 32), "junkLevelSetByUser"));
  objc_msgSend(v3, "setJunkLevel:", objc_msgSend(*(id *)(a1 + 32), "junkLevel"));
  objc_msgSend(v3, "setFlagColor:", objc_msgSend(*(id *)(a1 + 32), "flagColor"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[ECMessageFlags hash](self, "hash");
    v6 = v5 == objc_msgSend(v4, "hash");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)deleted
{
  return (LOWORD(self->_storage.hashValue) >> 1) & 1;
}

- (void)setDeleted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFFFD | v3;
}

- (BOOL)redirected
{
  return (LOWORD(self->_storage.hashValue) >> 6) & 1;
}

- (BOOL)junkLevelSetByUser
{
  return (LOWORD(self->_storage.hashValue) >> 7) & 1;
}

- (unint64_t)junkLevel
{
  return BYTE1(self->_storage.hashValue) & 3;
}

- (unint64_t)flagColor
{
  return ((unint64_t)LOWORD(self->_storage.hashValue) >> 10) & 7;
}

- (void)setFlagColor:(unint64_t)a3
{
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xE3FF | ((a3 & 7) << 10);
}

- (BOOL)isJunk
{
  return -[ECMessageFlags junkLevel](self, "junkLevel") == 1;
}

- (id)_flagColorDebugDescription
{
  return off_1E7121590[((unint64_t)LOWORD(self->_storage.hashValue) >> 10) & 7];
}

@end
