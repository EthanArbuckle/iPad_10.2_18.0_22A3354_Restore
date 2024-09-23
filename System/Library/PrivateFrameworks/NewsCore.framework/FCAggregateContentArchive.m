@implementation FCAggregateContentArchive

void __51__FCAggregateContentArchive_initWithChildArchives___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v3, "addObjectsFromArray:", v10[1]);
        }
        else
        {
          objc_msgSend(v3, "addObject:", v9, (_QWORD)v11);
          v10 = 0;
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)description
{
  FCDescription *v3;
  void *v4;
  void *v5;

  v3 = -[FCDescription initWithObject:]([FCDescription alloc], "initWithObject:", self);
  FCCFArrayDescription((const __CFArray *)self->_childArchives);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("childArchives"), v4);

  -[FCDescription descriptionString](v3, "descriptionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCAggregateContentArchive)initWithCoder:(id)a3
{
  id v4;
  FCAggregateContentArchive *v5;
  uint64_t v6;
  NSArray *childArchives;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCAggregateContentArchive;
  v5 = -[FCAggregateContentArchive init](&v9, sel_init);
  if (v5)
  {
    if (qword_1ED0F7D08 != -1)
      dispatch_once(&qword_1ED0F7D08, &__block_literal_global_173);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", qword_1ED0F7D00, CFSTR("childArchives"));
    v6 = objc_claimAutoreleasedReturnValue();
    childArchives = v5->_childArchives;
    v5->_childArchives = (NSArray *)v6;

  }
  return v5;
}

void __43__FCAggregateContentArchive_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0F7D00;
  qword_1ED0F7D00 = v2;

}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_childArchives, CFSTR("childArchives"));
}

- (id)unarchiveIntoContentContext:(id)a3
{
  id v4;
  NSArray *childArchives;
  id v6;
  void *v7;
  FCContentUnarchiveResult *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  childArchives = self->_childArchives;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__FCAggregateContentArchive_unarchiveIntoContentContext___block_invoke;
  v10[3] = &unk_1E463AE40;
  v11 = v4;
  v6 = v4;
  -[NSArray fc_arrayByTransformingWithBlock:](childArchives, "fc_arrayByTransformingWithBlock:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCContentUnarchiveResult initWithInterestToken:storageSize:]([FCContentUnarchiveResult alloc], "initWithInterestToken:storageSize:", v7, -[FCAggregateContentArchive storageSize](self, "storageSize"));

  return v8;
}

uint64_t __57__FCAggregateContentArchive_unarchiveIntoContentContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unarchiveIntoContentContext:", *(_QWORD *)(a1 + 32));
}

- (id)manifest
{
  void *v2;
  FCContentManifest *v3;

  -[NSArray fc_arrayByTransformingWithBlock:](self->_childArchives, "fc_arrayByTransformingWithBlock:", &__block_literal_global_175);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[FCContentManifest initWithManifests:]([FCContentManifest alloc], "initWithManifests:", v2);

  return v3;
}

uint64_t __37__FCAggregateContentArchive_manifest__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "manifest");
}

- (int64_t)storageSize
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_childArchives;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "storageSize", (_QWORD)v9);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childArchives, 0);
}

@end
