@implementation CPLEngineScopeFlagsUpdate

- (CPLEngineScopeFlagsUpdate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLEngineScopeFlagsUpdate;
  return -[CPLEngineScopeFlagsUpdate init](&v3, sel_init);
}

- (CPLEngineScopeFlagsUpdate)initWithFlags:(int64_t)a3
{
  CPLEngineScopeFlagsUpdate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPLEngineScopeFlagsUpdate;
  result = -[CPLEngineScopeFlagsUpdate init](&v5, sel_init);
  if (result)
    result->_flags = a3;
  return result;
}

- (BOOL)valueForFlag:(int64_t)a3
{
  return (self->_flags & a3) != 0;
}

- (void)setValue:(BOOL)a3 forFlag:(int64_t)a4
{
  int64_t flags;
  int64_t v5;
  int64_t v6;
  int64_t v7;

  flags = self->_flags;
  v5 = flags & a4;
  if (a3)
  {
    if (v5 == a4)
      return;
    v6 = flags | a4;
  }
  else
  {
    if (!v5)
      return;
    v6 = flags & ~a4;
  }
  v7 = self->_updatedFlagsMask | a4;
  self->_flags = v6;
  self->_updatedFlagsMask = v7;
}

- (void)updateFlags:(int64_t)a3 withFlagsValue:(int64_t)a4
{
  int64_t v4;

  v4 = self->_updatedFlagsMask | a3;
  self->_flags = self->_flags & ~a3 | a4 & a3;
  self->_updatedFlagsMask = v4;
}

- (void)updateFlags:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "updatedFlagsMask");
  v6 = objc_msgSend(v4, "flags");

  -[CPLEngineScopeFlagsUpdate updateFlags:withFlagsValue:](self, "updateFlags:withFlagsValue:", v5, v6);
}

- (int64_t)updatedFlagsFromFlags:(int64_t)a3
{
  return self->_flags & self->_updatedFlagsMask | a3 & ~self->_updatedFlagsMask;
}

- (BOOL)hasFlagUpdates
{
  return self->_updatedFlagsMask != 0;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  int64_t flags;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;

  if (self->_updatedFlagsMask)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend((id)objc_opt_class(), "flagsDescriptionMapping");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __40__CPLEngineScopeFlagsUpdate_description__block_invoke;
    v15[3] = &unk_1E60D8300;
    v15[4] = self;
    v5 = v3;
    v16 = v5;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v15);

    v6 = objc_msgSend(v5, "count");
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend((id)objc_opt_class(), "descriptionForFlags:", self->_flags);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    flags = self->_flags;
    if (v6)
    {
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@ (0x%lx %@)"), v9, flags, v11);

    }
    else
    {
      v12 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@ (0x%lx)"), v8, flags);
    }

  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend((id)objc_opt_class(), "descriptionForFlags:", self->_flags);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@ (0x%lx)"), v5, self->_flags);
  }

  return v12;
}

- (NSArray)arrayDescription
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v8;

  v8 = 0;
  objc_msgSend((id)objc_opt_class(), "_arrayDescriptionForFlags:remainingFlags:", self->_flags, &v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v8)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    v5 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("???(0x%lx)"), v8);
    objc_msgSend(v3, "arrayByAddingObject:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v2;
  }

  return (NSArray *)v6;
}

- (int64_t)flags
{
  return self->_flags;
}

- (int64_t)updatedFlagsMask
{
  return self->_updatedFlagsMask;
}

void __40__CPLEngineScopeFlagsUpdate_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const __CFString *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = objc_msgSend(a2, "integerValue");
  v6 = *(_QWORD *)(a1 + 32);
  if ((v5 & ~*(_QWORD *)(v6 + 16)) == 0)
  {
    v7 = v5;
    v8 = *(_QWORD *)(v6 + 8);
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    if ((v7 & ~v8) != 0)
      v10 = CFSTR("-%@");
    else
      v10 = CFSTR("+%@");
    v11 = (void *)objc_msgSend(v9, "initWithFormat:", v10, v12);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

  }
}

+ (id)flagsDescriptionMapping
{
  if (flagsDescriptionMapping_onceToken != -1)
    dispatch_once(&flagsDescriptionMapping_onceToken, &__block_literal_global_4849);
  return (id)flagsDescriptionMapping_descriptions;
}

+ (id)_arrayDescriptionForFlags:(int64_t)a3 remainingFlags:(int64_t *)a4
{
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int64_t v18;

  if (a3)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = a3;
    objc_msgSend(a1, "flagsDescriptionMapping");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__CPLEngineScopeFlagsUpdate__arrayDescriptionForFlags_remainingFlags___block_invoke;
    v11[3] = &unk_1E60D82D8;
    v13 = &v15;
    v14 = a3;
    v9 = v7;
    v12 = v9;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);

    *a4 = v16[3];
    _Block_object_dispose(&v15, 8);
    return v9;
  }
  else
  {
    *a4 = 0;
    return &unk_1E611B6D0;
  }
}

+ (id)descriptionForFlags:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;

  if (!a3)
    return CFSTR("none");
  v9 = 0;
  objc_msgSend(a1, "_arrayDescriptionForFlags:remainingFlags:", a3, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v9)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("|"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@|???(0x%lx)"), v6, v9);

  }
  else
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("|"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __70__CPLEngineScopeFlagsUpdate__arrayDescriptionForFlags_remainingFlags___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  v5 = objc_msgSend(a2, "integerValue");
  if (v5 && (v5 & ~*(_QWORD *)(a1 + 48)) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) &= ~v5;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }

}

void __52__CPLEngineScopeFlagsUpdate_flagsDescriptionMapping__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6119FA0;
  v2[1] = &unk_1E6119FB8;
  v3[0] = CFSTR("none");
  v3[1] = CFSTR("readonly");
  v2[2] = &unk_1E6119FD0;
  v2[3] = &unk_1E6119FE8;
  v3[2] = CFSTR("over-quota");
  v3[3] = CFSTR("deleted");
  v2[4] = &unk_1E611A000;
  v2[5] = &unk_1E611A018;
  v3[4] = CFSTR("disabled");
  v3[5] = CFSTR("inactive");
  v2[6] = &unk_1E611A030;
  v2[7] = &unk_1E611A048;
  v3[6] = CFSTR("scheduled-for-delete");
  v3[7] = CFSTR("staged");
  v2[8] = &unk_1E611A060;
  v2[9] = &unk_1E611A078;
  v3[8] = CFSTR("client-sync");
  v3[9] = CFSTR("push-high-priority");
  v2[10] = &unk_1E611A090;
  v3[10] = CFSTR("feature-disabled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)flagsDescriptionMapping_descriptions;
  flagsDescriptionMapping_descriptions = v0;

}

@end
