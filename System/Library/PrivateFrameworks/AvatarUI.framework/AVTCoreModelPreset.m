@implementation AVTCoreModelPreset

+ (id)tagSetFromPreset:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__AVTCoreModelPreset_tagSetFromPreset___block_invoke;
  v10[3] = &unk_1EA51E308;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

  v8 = (void *)objc_msgSend(v7, "copy");
  return v8;
}

void __39__AVTCoreModelPreset_tagSetFromPreset___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0C99E10];
  v6 = a2;
  objc_msgSend(v5, "orderedSetWithArray:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (AVTCoreModelPreset)initWithPreset:(id)a3
{
  return -[AVTCoreModelPreset initWithPreset:isDefaultPreset:](self, "initWithPreset:isDefaultPreset:", a3, 0);
}

- (AVTCoreModelPreset)initWithPreset:(id)a3 isDefaultPreset:(BOOL)a4
{
  id v7;
  AVTCoreModelPreset *v8;
  AVTCoreModelPreset *v9;
  uint64_t v10;
  NSDictionary *tags;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AVTCoreModelPreset;
  v8 = -[AVTCoreModelPreset init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_preset, a3);
    objc_msgSend((id)objc_opt_class(), "tagSetFromPreset:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    tags = v9->_tags;
    v9->_tags = (NSDictionary *)v10;

    v9->_defaultPreset = a4;
  }

  return v9;
}

- (id)copyForPairedCategory:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  AVTCoreModelPreset *v7;

  v4 = (void *)MEMORY[0x1E0D00678];
  -[AVTCoreModelPreset identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presetWithCategory:identifier:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AVTCoreModelPreset initWithPreset:]([AVTCoreModelPreset alloc], "initWithPreset:", v6);
  return v7;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[AVTCoreModelPreset preset](self, "preset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;

  -[AVTCoreModelPreset preset](self, "preset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)localizedPairedName
{
  void *v2;
  void *v3;

  -[AVTCoreModelPreset preset](self, "preset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "localizedPairedName");
  else
    objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVTCoreModelPreset;
  -[AVTCoreModelPreset description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTCoreModelPreset localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" name: %@"), v5);

  -[AVTCoreModelPreset identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" identifier: %@"), v6);

  -[AVTCoreModelPreset tags](self, "tags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" tags: %@"), v7);

  if (-[AVTCoreModelPreset isDefaultPreset](self, "isDefaultPreset"))
    objc_msgSend(v4, "appendString:", CFSTR(" (default)"));
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  AVTCoreModelPreset *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = (AVTCoreModelPreset *)a3;
  if (v5 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AVTCoreModelPreset identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6
        || (-[AVTCoreModelPreset identifier](v5, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AVTCoreModelPreset identifier](self, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTCoreModelPreset identifier](v5, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if (v6)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        v9 = 1;
      }

      goto LABEL_11;
    }
    v9 = 0;
  }
LABEL_12:

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AVTCoreModelPreset identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSDictionary)tags
{
  return self->_tags;
}

- (BOOL)isDefaultPreset
{
  return self->_defaultPreset;
}

- (AVTPreset)preset
{
  return self->_preset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preset, 0);
  objc_storeStrong((id *)&self->_tags, 0);
}

@end
