@implementation NTKUpNextDisabledDataSourcesEditOption

- (NTKUpNextDisabledDataSourcesEditOption)initWithDisabledDataSourceIdentifiers:(id)a3 forDevice:(id)a4
{
  id v6;
  NTKUpNextDisabledDataSourcesEditOption *v7;
  uint64_t v8;
  NSSet *disabledBundleIdentifiers;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKUpNextDisabledDataSourcesEditOption;
  v7 = -[NTKEditOption initWithDevice:](&v11, sel_initWithDevice_, a4);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    disabledBundleIdentifiers = v7->_disabledBundleIdentifiers;
    v7->_disabledBundleIdentifiers = (NSSet *)v8;

  }
  return v7;
}

+ (id)optionWithDisabledDataSourceIdentifiers:(id)a3 forDevice:(id)a4
{
  id v5;
  id v6;
  NTKUpNextDisabledDataSourcesEditOption *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NTKUpNextDisabledDataSourcesEditOption initWithDisabledDataSourceIdentifiers:forDevice:]([NTKUpNextDisabledDataSourcesEditOption alloc], "initWithDisabledDataSourceIdentifiers:forDevice:", v6, v5);

  return v7;
}

- (NTKUpNextDisabledDataSourcesEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NTKUpNextDisabledDataSourcesEditOption *v9;

  v6 = a3;
  v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[NTKUpNextDisabledDataSourcesEditOption initWithDisabledDataSourceIdentifiers:forDevice:](self, "initWithDisabledDataSourceIdentifiers:forDevice:", v8, v7);

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)dailySnapshotKey
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_disabledBundleIdentifiers;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v5 ^= objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "hash", (_QWORD)v11);
      }
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKUpNextDisabledDataSourcesEditOption;
  v4 = a3;
  -[NTKEditOption encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[NTKUpNextDisabledDataSourcesEditOption _alphabeticallySortedIdentifiers](self, "_alphabeticallySortedIdentifiers", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kDisabledDataSourcesKey"));

}

- (NTKUpNextDisabledDataSourcesEditOption)initWithCoder:(id)a3
{
  id v4;
  NTKUpNextDisabledDataSourcesEditOption *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSSet *disabledBundleIdentifiers;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NTKUpNextDisabledDataSourcesEditOption;
  v5 = -[NTKEditOption initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kDisabledDataSourcesKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    disabledBundleIdentifiers = v5->_disabledBundleIdentifiers;
    v5->_disabledBundleIdentifiers = (NSSet *)v11;

  }
  return v5;
}

- (id)_alphabeticallySortedIdentifiers
{
  void *v2;
  void *v3;

  -[NSSet allObjects](self->_disabledBundleIdentifiers, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_1124);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __74__NTKUpNextDisabledDataSourcesEditOption__alphabeticallySortedIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)isValidOption
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  char v5;

  v4 = (void **)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = NTKEqualObjects(self->_disabledBundleIdentifiers, v4[2]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[NSSet hash](self->_disabledBundleIdentifiers, "hash");
}

- (NSSet)disabledBundleIdentifiers
{
  return self->_disabledBundleIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledBundleIdentifiers, 0);
}

@end
