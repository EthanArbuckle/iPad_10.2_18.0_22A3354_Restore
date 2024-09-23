@implementation CPLResourceTypeSet

- (BOOL)isEmpty
{
  return !self->_baseTypesBits && self->_extraTypeBits == 0;
}

- (unint64_t)count
{
  unint64_t baseTypesBits;
  unint64_t result;
  BOOL v5;
  unint64_t extraTypeBits;

  baseTypesBits = self->_baseTypesBits;
  if (baseTypesBits)
  {
    result = 0;
    do
    {
      result += baseTypesBits & 1;
      v5 = baseTypesBits >= 2;
      baseTypesBits >>= 1;
    }
    while (v5);
  }
  else
  {
    result = 0;
  }
  extraTypeBits = self->_extraTypeBits;
  if (extraTypeBits)
  {
    do
    {
      result += extraTypeBits & 1;
      v5 = extraTypeBits >= 2;
      extraTypeBits >>= 1;
    }
    while (v5);
  }
  return result;
}

- (void)addResourceType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v8;
  void *v9;

  if (a3 > 0x1C)
  {
    if (a3 != 1000)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResource.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 731, CFSTR("Invalid resource type %ld"), a3);

      abort();
    }
    v3 = 1;
    v4 = 16;
  }
  else
  {
    v3 = (1 << a3);
    v4 = 8;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)(*(uint64_t *)((char *)&self->super.isa + v4) | v3);
}

- (void)removeResourceType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v8;
  void *v9;

  if (a3 > 0x1C)
  {
    if (a3 != 1000)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResource.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 741, CFSTR("Invalid resource type %ld"), a3);

      abort();
    }
    v3 = -2;
    v4 = 16;
  }
  else
  {
    v3 = ~(1 << a3);
    v4 = 8;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)(*(uint64_t *)((char *)&self->super.isa + v4) & v3);
}

- (BOOL)containsResourceType:(unint64_t)a3
{
  unint64_t v3;
  void *v8;
  void *v9;

  if (a3 > 0x1C)
  {
    if (a3 != 1000)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResource.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 751, CFSTR("Invalid resource type %ld"), a3);

      abort();
    }
    v3 = self->_extraTypeBits & 1;
  }
  else
  {
    v3 = self->_baseTypesBits & (1 << a3);
  }
  return v3 != 0;
}

- (void)enumerateResourceTypesWithBlock:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__CPLResourceTypeSet_enumerateResourceTypesWithBlock___block_invoke;
  v7[3] = &unk_1E60DA4D8;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E08DC4](v7);
  v6[2](v6, 0, self->_baseTypesBits);
  if (!*((_BYTE *)v11 + 24))
    v6[2](v6, 1000, self->_extraTypeBits);

  _Block_object_dispose(&v10, 8);
}

- (id)intersectionWithSet:(id)a3
{
  _QWORD *v4;
  CPLResourceTypeSet *v5;
  unint64_t extraTypeBits;
  uint64_t v7;

  v4 = a3;
  v5 = objc_alloc_init(CPLResourceTypeSet);
  v5->_baseTypesBits = v4[1] & self->_baseTypesBits;
  extraTypeBits = self->_extraTypeBits;
  v7 = v4[2];

  v5->_extraTypeBits = v7 & extraTypeBits;
  return v5;
}

- (BOOL)intersectsWithSet:(id)a3
{
  return (*((_QWORD *)a3 + 1) & self->_baseTypesBits) != 0 || (*((_QWORD *)a3 + 2) & self->_extraTypeBits) != 0;
}

- (id)unionSet:(id)a3
{
  _QWORD *v4;
  CPLResourceTypeSet *v5;
  unint64_t extraTypeBits;
  uint64_t v7;

  v4 = a3;
  v5 = objc_alloc_init(CPLResourceTypeSet);
  v5->_baseTypesBits = v4[1] | self->_baseTypesBits;
  extraTypeBits = self->_extraTypeBits;
  v7 = v4[2];

  v5->_extraTypeBits = v7 | extraTypeBits;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  return self->_baseTypesBits == *((_QWORD *)a3 + 1) && self->_extraTypeBits == *((_QWORD *)a3 + 2);
}

- (id)description
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;

  if (!self->_baseTypesBits && !self->_extraTypeBits)
    return CFSTR("[<empty>]");
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __33__CPLResourceTypeSet_description__block_invoke;
  v12 = &unk_1E60DA500;
  v13 = v3;
  v4 = v3;
  -[CPLResourceTypeSet enumerateResourceTypesWithBlock:](self, "enumerateResourceTypesWithBlock:", &v9);
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("[%@]"), v6, v9, v10, v11, v12);

  return v7;
}

void __33__CPLResourceTypeSet_description__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __54__CPLResourceTypeSet_enumerateResourceTypesWithBlock___block_invoke(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v5;
  BOOL v6;

  if (a3)
  {
    v3 = a3;
    v5 = result;
    do
    {
      if ((v3 & 1) != 0)
      {
        result = (*(uint64_t (**)(void))(*(_QWORD *)(v5 + 32) + 16))();
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 24))
          break;
      }
      ++a2;
      v6 = v3 > 1;
      v3 >>= 1;
    }
    while (v6);
  }
  return result;
}

@end
