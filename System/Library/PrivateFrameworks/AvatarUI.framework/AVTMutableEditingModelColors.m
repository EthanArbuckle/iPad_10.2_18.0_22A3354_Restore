@implementation AVTMutableEditingModelColors

- (AVTMutableEditingModelColors)initWithStorage:(id)a3 variationStore:(id)a4
{
  return -[AVTMutableEditingModelColors initWithVariationStore:](self, "initWithVariationStore:", a4);
}

- (AVTMutableEditingModelColors)initWithVariationStore:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  AVTMutableEditingModelColors *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)AVTMutableEditingModelColors;
  v7 = -[AVTEditingModelColors initWithStorage:variationStore:](&v9, sel_initWithStorage_variationStore_, v6, v5);

  if (v7)
    objc_storeStrong((id *)&v7->_mutableStorage, v6);

  return v7;
}

- (void)setColor:(id)a3 forSettingKind:(id)a4 identifier:(id)a5
{
  int64_t var1;
  unint64_t var0;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  var1 = a4.var1;
  var0 = a4.var0;
  v15 = a3;
  v9 = a5;
  -[AVTMutableEditingModelColors mutableStorage](self, "mutableStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AVTAvatarSettingKindIdentifier(var0, var1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTMutableEditingModelColors mutableStorage](self, "mutableStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AVTAvatarSettingKindIdentifier(var0, var1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, v9);

}

- (NSMutableDictionary)mutableStorage
{
  return self->_mutableStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableStorage, 0);
}

@end
