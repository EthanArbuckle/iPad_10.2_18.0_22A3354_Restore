@implementation CPLExpungeableResourceState

+ (id)normalizedExpungeableResourceStatesFromExpungeableResourceStates:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unint64_t v12;
  char *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  char *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[18];

  v31[16] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "count"))
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v28 != v8)
              objc_enumerationMutation(v6);
            v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "resourceType"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v10, v11);

          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v7);
      }

      v12 = +[CPLResource countOfResourceTypes](CPLResource, "countOfResourceTypes");
      v13 = (char *)&v19[-1] - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v13, 8 * v12);
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v26 = 0;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __96__CPLExpungeableResourceState_normalizedExpungeableResourceStatesFromExpungeableResourceStates___block_invoke;
      v19[3] = &unk_1E60DA420;
      v14 = v5;
      v21 = &v23;
      v22 = v13;
      v20 = v14;
      +[CPLResource enumerateResourceTypesWithBlock:](CPLResource, "enumerateResourceTypesWithBlock:", v19);
      if (v24[3])
      {
        v15 = objc_alloc(MEMORY[0x1E0C99D20]);
        v16 = (void *)objc_msgSend(v15, "initWithObjects:count:", v13, v24[3]);
      }
      else
      {
        v16 = (void *)MEMORY[0x1E0C9AA60];
      }

      _Block_object_dispose(&v23, 8);
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __96__CPLExpungeableResourceState_normalizedExpungeableResourceStatesFromExpungeableResourceStates___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    *(_QWORD *)(a1[6] + 8 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))++) = v5;

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", -[CPLExpungeableResourceState resourceType](self, "resourceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CPLExpungeableResourceState expungedState](self, "expungedState");
  -[CPLExpungeableResourceState expungedDate](self, "expungedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ %@ expungedState: %lu expungedDate: %@]"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)resourceType
{
  return self->_resourceType;
}

- (void)setResourceType:(unint64_t)a3
{
  self->_resourceType = a3;
}

- (unint64_t)expungedState
{
  return self->_expungedState;
}

- (void)setExpungedState:(unint64_t)a3
{
  self->_expungedState = a3;
}

- (NSDate)expungedDate
{
  return self->_expungedDate;
}

- (void)setExpungedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expungedDate, 0);
}

- (CPLExpungeableResourceState)initWithCoder:(id)a3
{
  id v4;
  CPLExpungeableResourceState *v5;
  CPLExpungeableResourceState *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLExpungeableResourceState;
  v5 = -[CPLExpungeableResourceState init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[NSObject cplDecodePropertiesFromCoder:](v5, "cplDecodePropertiesFromCoder:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "cplCopyPropertiesFromObject:withCopyBlock:", self, 0);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
