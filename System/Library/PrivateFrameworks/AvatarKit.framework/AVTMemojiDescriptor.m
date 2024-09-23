@implementation AVTMemojiDescriptor

- (AVTMemojiDescriptor)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  return -[AVTMemojiDescriptor initWithDictionaryRepresentation:error:isResettingToDefault:](self, "initWithDictionaryRepresentation:error:isResettingToDefault:", a3, a4, 0);
}

- (AVTMemojiDescriptor)initWithDictionaryRepresentation:(id)a3 error:(id *)a4 isResettingToDefault:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  AVTMemojiDescriptor *v9;
  AVTMemojiDescriptor *v10;
  objc_super v12;

  v5 = a5;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVTMemojiDescriptor;
  v9 = -[AVTMemojiDescriptor init](&v12, sel_init);
  v10 = v9;
  if (v9)
    -[AVTMemojiDescriptor _decode:isResettingToDefault:error:](v9, "_decode:isResettingToDefault:error:", v8, v5, a4);

  return v10;
}

- (AVTMemojiDescriptor)initWithMemoji:(id)a3
{
  id v4;
  AVTMemojiDescriptor *v5;
  AVTMemojiDescriptor *v6;
  uint64_t v7;
  AVTMemojiDescriptor *v8;
  void *v9;
  uint64_t v10;
  NSString *v11;
  uint64_t i;
  uint64_t v13;
  AVTColorPreset *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AVTMemojiDescriptor;
  v5 = -[AVTMemojiDescriptor init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = 0;
    v8 = v5;
    do
    {
      objc_msgSend(v4, "presetForCategory:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v6->_presetIdentifiers[v7];
      v6->_presetIdentifiers[v7] = (NSString *)v10;

      for (i = 0; i != 3; ++i)
      {
        objc_msgSend(v4, "colorPresetForCategory:colorIndex:", v7, i);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v8->_colorPresets[0][i];
        v8->_colorPresets[0][i] = (AVTColorPreset *)v13;

      }
      ++v7;
      v8 = (AVTMemojiDescriptor *)((char *)v8 + 24);
    }
    while (v7 != 40);
  }

  return v6;
}

+ (id)randomDescriptor
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v2 = objc_alloc_init((Class)a1);
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__AVTMemojiDescriptor_randomDescriptor__block_invoke;
  v10[3] = &unk_1EA61FC60;
  v11 = v2;
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __39__AVTMemojiDescriptor_randomDescriptor__block_invoke_2;
  v8[3] = &unk_1EA61FC88;
  v4 = v11;
  v9 = v4;
  _AVTMemojiRandomize(v10, v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

void __39__AVTMemojiDescriptor_randomDescriptor__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresetIdentifier:forCategory:", v5, a3);

}

uint64_t __39__AVTMemojiDescriptor_randomDescriptor__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setColorPreset:forCategory:colorIndex:", a2, a3, a4);
}

- (void)applyToMemoji:(id)a3
{
  uint64_t v4;
  NSString **presetIdentifiers;
  NSString *v6;
  void *v7;
  uint64_t i;
  AVTColorPreset *v9;
  id v10;

  v10 = a3;
  v4 = 0;
  presetIdentifiers = self->_presetIdentifiers;
  do
  {
    v6 = presetIdentifiers[v4];
    if (v6)
    {
      +[AVTPreset presetWithCategory:identifier:](AVTPreset, "presetWithCategory:identifier:", v4, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPreset:forCategory:animated:", v7, v4, 0);

    }
    else
    {
      objc_msgSend(v10, "setPreset:forCategory:animated:", 0, v4, 0);
    }
    for (i = 0; i != 3; ++i)
    {
      v9 = self->_colorPresets[0][i];
      if (v9)
        objc_msgSend(v10, "setColorPreset:forCategory:colorIndex:", v9, v4, i);
    }

    ++v4;
    self = (AVTMemojiDescriptor *)((char *)self + 24);
  }
  while (v4 != 40);

}

- (id)presetIdentifierForCategory:(int64_t)a3
{
  NSObject *v3;
  NSString *v4;

  if (a3 < 40)
  {
    v4 = self->_presetIdentifiers[a3];
  }
  else
  {
    avt_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[AVTMemojiDescriptor presetIdentifierForCategory:].cold.1();

    v4 = 0;
  }
  return v4;
}

- (void)setPresetIdentifier:(id)a3 forCategory:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString **presetIdentifiers;
  NSString *v19;

  v6 = a3;
  v7 = v6;
  if (a4 < 40)
  {
    if (v6)
    {
      +[AVTPreset presetWithCategory:identifier:](AVTPreset, "presetWithCategory:identifier:", a4, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        avt_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[AVTMemojiDescriptor setPresetIdentifier:forCategory:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);

      }
    }
    presetIdentifiers = self->_presetIdentifiers;
    v19 = v7;
    v8 = self->_presetIdentifiers[a4];
    presetIdentifiers[a4] = v19;
  }
  else
  {
    avt_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AVTMemojiDescriptor presetIdentifierForCategory:].cold.1();
  }

}

- (void)setColorPreset:(id)a3 forCategory:(int64_t)a4 colorIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  NSObject *p_super;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  AVTColorPreset **v19;
  AVTColorPreset *v20;

  v8 = a3;
  v9 = v8;
  if (a4 < 40)
  {
    if (v8 && objc_msgSend(v8, "category") != a4)
    {
      avt_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[AVTMemojiDescriptor setColorPreset:forCategory:colorIndex:].cold.3(v11, v12, v13, v14, v15, v16, v17, v18);

    }
    if (a5 >= 3)
      -[AVTMemojiDescriptor setColorPreset:forCategory:colorIndex:].cold.2();
    v19 = self->_colorPresets[a4];
    v20 = v9;
    p_super = &v19[a5]->super;
    v19[a5] = v20;
  }
  else
  {
    avt_default_log();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      -[AVTMemojiDescriptor presetIdentifierForCategory:].cold.1();
  }

}

- (id)colorPresetForCategory:(int64_t)a3 colorIndex:(unint64_t)a4
{
  NSObject *v4;
  AVTColorPreset *v5;

  if (a3 < 40)
  {
    if (a4 >= 3)
      -[AVTMemojiDescriptor colorPresetForCategory:colorIndex:].cold.2();
    v5 = self->_colorPresets[a3][a4];
  }
  else
  {
    avt_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AVTMemojiDescriptor presetIdentifierForCategory:].cold.1();

    v5 = 0;
  }
  return v5;
}

+ (id)presetsDictionaryFromRecipe:(id)a3 didFail:(BOOL *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;

  v7 = a3;
  objc_msgSend(v7, "avt_objectForKey:ofClass:didFail:error:", CFSTR("presets"), objc_opt_class(), a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (*a4)
  {
    v9 = 0;
  }
  else
  {
    AVTUpgradePairedPresetCategoriesIfNeeded(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v10;
    v8 = v9;
  }

  return v9;
}

+ (id)colorPresetFromColorData:(id)a3 forCategory:(int64_t)a4 colorIndex:(unint64_t)a5 version:(unsigned __int16)a6 didFail:(BOOL *)a7 error:(id *)a8
{
  unsigned int v10;
  id v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  uint64_t v22;
  double v23;

  v10 = a6;
  v13 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    AVTUpgradeColorPresetIdentifierIfNeeded(a4, v13, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 0;
    +[AVTColorPreset colorPresetWithName:category:colorIndex:variation:](AVTColorPreset, "colorPresetWithName:category:colorIndex:variation:", v14, a4, a5, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "avt_objectForKey:ofClass:didFail:error:", CFSTR("variation"), objc_opt_class(), a7, a8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;
    if (*a7)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v17, "floatValue");
      v19 = v18;
      objc_msgSend(v13, "avt_objectForKey:ofClass:didFail:error:", CFSTR("name"), objc_opt_class(), a7, a8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (*a7)
      {
        v16 = 0;
      }
      else
      {
        if (v10 < 8 && a4 == 10)
          v19 = -v19;
        AVTUpgradeColorPresetIdentifierIfNeeded(a4, v20, v10);
        v22 = objc_claimAutoreleasedReturnValue();

        *(float *)&v23 = v19;
        +[AVTColorPreset colorPresetWithName:category:colorIndex:variation:](AVTColorPreset, "colorPresetWithName:category:colorIndex:variation:", v22, a4, a5, v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)v22;
      }

    }
    goto LABEL_16;
  }
  v16 = 0;
LABEL_17:

  return v16;
}

+ (unsigned)classIdentifier
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  AVTMemojiDescriptor *v32;
  unint64_t v33;
  void *v34;
  int v35;
  int v36;
  void *v37;
  double v38;
  void *v39;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)AVTMemojiDescriptor;
  -[AVTAvatarDescriptor encodeWithCoder:](&v40, sel_encodeWithCoder_, v4);
  v5 = 0;
  v6 = 0x1E0CB3000uLL;
  do
  {
    AVTPresetCategoryToString(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTMemojiDescriptor presetIdentifierForCategory:](self, "presetIdentifierForCategory:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(v6 + 2368), "stringWithFormat:", CFSTR("%@-presetIdentifier"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v8, v9);

    }
    -[AVTMemojiDescriptor colorPresetForCategory:colorIndex:](self, "colorPresetForCategory:colorIndex:", v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v6 + 2368), "stringWithFormat:", CFSTR("%@-primaryColorName"), v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v12, v13);

      objc_msgSend(v11, "variation");
      v15 = v14;
      objc_msgSend(*(id *)(v6 + 2368), "stringWithFormat:", CFSTR("%@-primaryColorVariation"), v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = v15;
      objc_msgSend(v4, "encodeFloat:forKey:", v16, v17);

    }
    -[AVTMemojiDescriptor colorPresetForCategory:colorIndex:](self, "colorPresetForCategory:colorIndex:", v5, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v6 + 2368), "stringWithFormat:", CFSTR("%@-secondaryColorName"), v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v20, v21);

      objc_msgSend(v19, "variation");
      v23 = v22;
      objc_msgSend(*(id *)(v6 + 2368), "stringWithFormat:", CFSTR("%@-secondaryColorVariation"), v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v25) = v23;
      objc_msgSend(v4, "encodeFloat:forKey:", v24, v25);

    }
    -[AVTMemojiDescriptor colorPresetForCategory:colorIndex:](self, "colorPresetForCategory:colorIndex:", v5, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      objc_msgSend(v26, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v6 + 2368), "stringWithFormat:", CFSTR("%@-tertiaryColorName"), v7);
      v39 = v19;
      v29 = v7;
      v30 = v11;
      v31 = v8;
      v32 = self;
      v33 = v6;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v28, v34);

      v6 = v33;
      self = v32;
      v8 = v31;
      v11 = v30;
      v7 = v29;
      v19 = v39;

      objc_msgSend(v27, "variation");
      v36 = v35;
      objc_msgSend(*(id *)(v6 + 2368), "stringWithFormat:", CFSTR("%@-tertiaryColorVariation"), v7);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v38) = v36;
      objc_msgSend(v4, "encodeFloat:forKey:", v37, v38);

    }
    ++v5;
  }
  while (v5 != 40);

}

- (AVTMemojiDescriptor)initWithCoder:(id)a3
{
  id v4;
  AVTMemojiDescriptor *v5;
  AVTMemojiDescriptor *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  const __CFString *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  int v45;
  double v46;
  void *v47;
  unint64_t v48;
  void *v49;
  const __CFString *v50;
  unint64_t v51;
  id v52;
  unint64_t v53;
  void *v54;
  void *v56;
  AVTMemojiDescriptor *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  objc_super v64;
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[4];

  v70[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)AVTMemojiDescriptor;
  v5 = -[AVTAvatarDescriptor initWithCoder:](&v64, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v57 = v5;
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    v9 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v7;
    objc_msgSend(v7, "setValue:forKey:", v10, CFSTR("version"));

    v60 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v59 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v61 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v58 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = 0;
    v12 = CFSTR("name");
    v13 = 0x1E0CB3000uLL;
    do
    {
      AVTPresetCategoryToString(v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_class();
      objc_msgSend(*(id *)(v13 + 2368), "stringWithFormat:", CFSTR("%@-presetIdentifier"), v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();

      if (v17)
        objc_msgSend(v60, "setObject:forKeyedSubscript:", v17, v14);
      v63 = (void *)v17;
      v18 = objc_opt_class();
      objc_msgSend(*(id *)(v13 + 2368), "stringWithFormat:", CFSTR("%@-primaryColorName"), v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(*(id *)(v13 + 2368), "stringWithFormat:", CFSTR("%@-primaryColorVariation"), v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeFloatForKey:", v21);
        v23 = v22;

        v69[0] = v12;
        v69[1] = CFSTR("variation");
        v70[0] = v20;
        LODWORD(v24) = v23;
        objc_msgSend(*(id *)(v9 + 2024), "numberWithFloat:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v70[1] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setObject:forKeyedSubscript:", v26, v14);

      }
      v27 = objc_opt_class();
      objc_msgSend(*(id *)(v13 + 2368), "stringWithFormat:", CFSTR("%@-secondaryColorName"), v14);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(*(id *)(v13 + 2368), "stringWithFormat:", CFSTR("%@-secondaryColorVariation"), v14);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeFloatForKey:", v30);
        v32 = v31;

        v67[0] = v12;
        v67[1] = CFSTR("variation");
        v68[0] = v29;
        LODWORD(v33) = v32;
        objc_msgSend(*(id *)(v9 + 2024), "numberWithFloat:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v68[1] = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
        v35 = v29;
        v36 = v20;
        v37 = v13;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setObject:forKeyedSubscript:", v38, v14);

        v13 = v37;
        v20 = v36;
        v29 = v35;

      }
      v39 = objc_opt_class();
      objc_msgSend(*(id *)(v13 + 2368), "stringWithFormat:", CFSTR("%@-tertiaryColorName"), v14);
      v40 = v13;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v39, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        objc_msgSend(*(id *)(v40 + 2368), "stringWithFormat:", CFSTR("%@-tertiaryColorVariation"), v14);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeFloatForKey:", v43);
        v45 = v44;

        v65[0] = v12;
        v65[1] = CFSTR("variation");
        v66[0] = v42;
        LODWORD(v46) = v45;
        objc_msgSend(*(id *)(v9 + 2024), "numberWithFloat:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v66[1] = v47;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
        v62 = v29;
        v48 = v11;
        v49 = v20;
        v50 = v12;
        v51 = v9;
        v52 = v4;
        v53 = v40;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v54, v14);

        v40 = v53;
        v4 = v52;
        v9 = v51;
        v12 = v50;
        v20 = v49;
        v11 = v48;
        v29 = v62;

      }
      ++v11;
      v13 = v40;
    }
    while (v11 != 40);
    objc_msgSend(v56, "setObject:forKeyedSubscript:", v60, CFSTR("presets"));
    objc_msgSend(v56, "setObject:forKeyedSubscript:", v59, CFSTR("colors"));
    if (objc_msgSend(v61, "count"))
      objc_msgSend(v56, "setObject:forKeyedSubscript:", v61, CFSTR("secondaryColors"));
    v6 = v57;
    if (objc_msgSend(v58, "count"))
      objc_msgSend(v56, "setObject:forKeyedSubscript:", v58, CFSTR("tertiaryColors"));
    -[AVTMemojiDescriptor _decode:isResettingToDefault:error:](v57, "_decode:isResettingToDefault:error:", v56, 0, 0);

  }
  return v6;
}

- (void)encodeInDictionaryRepresentation:(id)a3
{
  unint64_t v4;
  const __CFString *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  const __CFString *v29;
  AVTMemojiDescriptor *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = 0;
  v5 = CFSTR("name");
  v6 = 0x1E0CB3000uLL;
  v7 = 0x1E0C99000uLL;
  do
  {
    AVTPresetCategoryToString(v4);
    v8 = objc_claimAutoreleasedReturnValue();
    -[AVTMemojiDescriptor presetIdentifierForCategory:](self, "presetIdentifierForCategory:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v9, v8);
    v40 = (void *)v9;
    -[AVTMemojiDescriptor colorPresetForCategory:colorIndex:](self, "colorPresetForCategory:colorIndex:", v4, 0, v33);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v45[0] = v5;
      objc_msgSend(v10, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v12;
      v45[1] = CFSTR("variation");
      v13 = *(void **)(v6 + 2024);
      objc_msgSend(v11, "variation");
      objc_msgSend(v13, "numberWithFloat:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v14;
      objc_msgSend(*(id *)(v7 + 3456), "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v15, v8);

    }
    v39 = v11;
    v16 = (void *)v8;
    -[AVTMemojiDescriptor colorPresetForCategory:colorIndex:](self, "colorPresetForCategory:colorIndex:", v4, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v43[0] = v5;
      objc_msgSend(v17, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = CFSTR("variation");
      v44[0] = v19;
      v20 = *(void **)(v6 + 2024);
      objc_msgSend(v18, "variation");
      objc_msgSend(v20, "numberWithFloat:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v21;
      objc_msgSend(*(id *)(v7 + 3456), "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v22, v16);

    }
    -[AVTMemojiDescriptor colorPresetForCategory:colorIndex:](self, "colorPresetForCategory:colorIndex:", v4, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v41[0] = v5;
      objc_msgSend(v23, "name");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = CFSTR("variation");
      v42[0] = v38;
      v25 = *(void **)(v6 + 2024);
      objc_msgSend(v24, "variation");
      objc_msgSend(v25, "numberWithFloat:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v26;
      objc_msgSend(*(id *)(v7 + 3456), "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
      v27 = v7;
      v28 = v6;
      v29 = v5;
      v30 = self;
      v31 = v16;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v32, v31);

      v16 = v31;
      self = v30;
      v5 = v29;
      v6 = v28;
      v7 = v27;

    }
    ++v4;
  }
  while (v4 != 40);
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v36, CFSTR("presets"));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, CFSTR("colors"));
  if (objc_msgSend(v37, "count"))
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v37, CFSTR("secondaryColors"));
  if (objc_msgSend(v34, "count"))
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, CFSTR("tertiaryColors"));

}

- (void)_decode:(id)a3 isResettingToDefault:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  AVTMemojiDescriptor *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;
  int v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  BOOL v47;
  void *v48;
  int v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  AVTMemojiDescriptor *v59;
  char v60;
  AVTMemojiDescriptor *v61;
  uint64_t v62;
  void *v63;
  id v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  BOOL v68;
  void *v69;
  void *v70;
  void *v71;
  AVTMemojiDescriptor *v72;
  unsigned __int16 v73;
  int v74;
  int v75;
  _QWORD v76[5];
  int v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  unsigned __int8 v82;
  _BYTE v83[128];
  uint64_t v84;

  v6 = a4;
  v84 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v82 = 0;
  objc_msgSend(v8, "avt_objectForKey:ofClass:didFail:error:", CFSTR("version"), objc_opt_class(), &v82, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "presetsDictionaryFromRecipe:didFail:error:", v8, &v82, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "avt_objectForKey:ofClass:didFail:error:", CFSTR("colors"), objc_opt_class(), &v82, a5);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "avt_objectForKey:ofClass:didFail:error:", CFSTR("secondaryColors"), objc_opt_class(), &v82, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "avt_objectForKey:ofClass:didFail:error:", CFSTR("tertiaryColors"), objc_opt_class(), &v82, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v82)
    goto LABEL_90;
  v66 = v12;
  v67 = v11;
  v72 = self;
  v63 = v9;
  v64 = v8;
  v73 = objc_msgSend(v9, "intValue");
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v65 = v6;
  v68 = !v6;
  while (1)
  {
    AVTPresetCategoryToString(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "avt_objectForKey:ofClass:didFail:error:", v16, objc_opt_class(), &v82, a5);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v82)
      break;
    if (v17)
    {
LABEL_5:
      AVTUpgradePresetIdentifierIfNeeded(v15, v18, v73);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 == v18)
        LOBYTE(v20) = 1;
      else
        v20 = objc_msgSend(v18, "isEqualToString:", CFSTR("none")) ^ 1;
      -[AVTMemojiDescriptor setPresetIdentifier:forCategory:](v72, "setPresetIdentifier:forCategory:", v19, v15);
      goto LABEL_20;
    }
    AVTUpgradesForPresetCategory(v15, v73);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v22 = v21;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v79;
      while (2)
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v79 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(v10, "avt_objectForKey:ofClass:didFail:error:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i), objc_opt_class(), &v82, a5);
          v27 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v27;
          if (v82)
          {

            goto LABEL_88;
          }
          if (v27)
          {

            goto LABEL_5;
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
        if (v24)
          continue;
        break;
      }
    }

    if (v65)
    {
      +[AVTPreset availablePresetsForCategory:](AVTPreset, "availablePresetsForCategory:", v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTMemojiDescriptor setPresetIdentifier:forCategory:](v72, "setPresetIdentifier:forCategory:", v29, v15);

      v19 = 0;
      LOBYTE(v20) = 1;
LABEL_20:

      goto LABEL_21;
    }
    v19 = 0;
    LOBYTE(v20) = 1;
LABEL_21:
    v77 = 0;
    AVTIdentifierOfUpgradedColorPresetForAssetPresetIdentifier(v15, v19, 0, &v77, v73);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      LODWORD(v31) = v77;
      +[AVTColorPreset colorPresetWithName:category:colorIndex:variation:](AVTColorPreset, "colorPresetWithName:category:colorIndex:variation:", v30, v15, 0, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v72;
      -[AVTMemojiDescriptor setColorPreset:forCategory:colorIndex:](v72, "setColorPreset:forCategory:colorIndex:", v32, v15, 0);
      goto LABEL_23;
    }
    objc_msgSend(v71, "avt_objectForKey:ofClasses:didFail:error:", v16, v70, &v82, a5);
    v41 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v41;
    if (v82)
      goto LABEL_30;
    v47 = v15 == 34 && v41 == 0;
    if (v47)
      v32 = 0;
    if (v47 && !v65)
    {
      AVTPresetCategoryToColorCategoryString(4uLL);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "avt_objectForKey:ofClasses:didFail:error:", v48, v70, &v82, a5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v82;

      v30 = 0;
      if (v49)
      {
LABEL_30:

        v42 = 1;
        goto LABEL_77;
      }
    }
    v50 = v20 ^ 1;
    if (!v32)
      v50 = 1;
    if ((v50 & 1) == 0)
    {
      v33 = v72;
      objc_msgSend((id)objc_opt_class(), "colorPresetFromColorData:forCategory:colorIndex:version:didFail:error:", v32, v15, 0, v73, &v82, a5);
      v51 = v30;
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTMemojiDescriptor setColorPreset:forCategory:colorIndex:](v72, "setColorPreset:forCategory:colorIndex:", v52, v15, 0);

      v30 = v51;
LABEL_23:
      v34 = v68;
LABEL_24:

      goto LABEL_25;
    }

    v34 = v68;
    v33 = v72;
    if (v65)
    {
      +[AVTColorPreset fallbackColorPresetForNilPresetAndCategory:colorIndex:](AVTColorPreset, "fallbackColorPresetForNilPresetAndCategory:colorIndex:", v15, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
        -[AVTMemojiDescriptor setColorPreset:forCategory:colorIndex:](v72, "setColorPreset:forCategory:colorIndex:", v32, v15, 0);
      v34 = 0;
      goto LABEL_24;
    }
LABEL_25:
    -[AVTMemojiDescriptor colorPresetForCategory:colorIndex:](v33, "colorPresetForCategory:colorIndex:", v15, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __58__AVTMemojiDescriptor__decode_isResettingToDefault_error___block_invoke;
    v76[3] = &unk_1EA61FCB0;
    v76[4] = v33;
    objc_msgSend(v35, "enumerateDerivedColorPresetsUsingBlock:", v76);

    v75 = 0;
    AVTIdentifierOfUpgradedColorPresetForAssetPresetIdentifier(v15, v19, 1uLL, &v75, v73);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    v69 = v30;
    if (v36)
    {
      if (!objc_msgSend(v36, "isEqualToString:", CFSTR("$archived-primary")))
      {
        LODWORD(v38) = v75;
        +[AVTColorPreset colorPresetWithName:category:colorIndex:variation:](AVTColorPreset, "colorPresetWithName:category:colorIndex:variation:", v37, v15, 1, v38);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_53;
      }
      objc_msgSend(v71, "avt_objectForKey:ofClasses:didFail:error:", v16, v70, &v82, a5);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (!v82)
      {
        objc_msgSend((id)objc_opt_class(), "colorPresetFromColorData:forCategory:colorIndex:version:didFail:error:", v39, v15, 0, v73, &v82, a5);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_53;
      }

    }
    else
    {
      objc_msgSend(v67, "avt_objectForKey:ofClasses:didFail:error:", v16, v70, &v82, a5);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      v45 = v82;
      if (!v82 && v43)
      {
        objc_msgSend((id)objc_opt_class(), "colorPresetFromColorData:forCategory:colorIndex:version:didFail:error:", v43, v15, 1, v73, &v82, a5);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTMemojiDescriptor setColorPreset:forCategory:colorIndex:](v33, "setColorPreset:forCategory:colorIndex:", v46, v15, 1);

        goto LABEL_54;
      }

      if (!v45)
      {
        if ((v34 & 1) == 0)
        {
          +[AVTColorPreset fallbackColorPresetForNilPresetAndCategory:colorIndex:](AVTColorPreset, "fallbackColorPresetForNilPresetAndCategory:colorIndex:", v15, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v44)
          {
LABEL_54:

            goto LABEL_55;
          }
LABEL_53:
          -[AVTMemojiDescriptor setColorPreset:forCategory:colorIndex:](v33, "setColorPreset:forCategory:colorIndex:", v44, v15, 1);
          goto LABEL_54;
        }
LABEL_55:
        v74 = 0;
        AVTIdentifierOfUpgradedColorPresetForAssetPresetIdentifier(v15, v19, 2uLL, &v74, v73);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v53;
        if (v53)
        {
          if (objc_msgSend(v53, "isEqualToString:", CFSTR("$archived-primary")))
          {
            objc_msgSend(v71, "avt_objectForKey:ofClasses:didFail:error:", v16, v70, &v82, a5);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (v82)
            {
              v42 = 1;
              goto LABEL_74;
            }
            v59 = v72;
            objc_msgSend((id)objc_opt_class(), "colorPresetFromColorData:forCategory:colorIndex:version:didFail:error:", v56, v15, 0, v73, &v82, a5);
            v62 = objc_claimAutoreleasedReturnValue();

            v56 = (void *)v62;
          }
          else
          {
            LODWORD(v55) = v74;
            +[AVTColorPreset colorPresetWithName:category:colorIndex:variation:](AVTColorPreset, "colorPresetWithName:category:colorIndex:variation:", v54, v15, 2, v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v72;
          }
          v61 = v59;
LABEL_72:
          -[AVTMemojiDescriptor setColorPreset:forCategory:colorIndex:](v61, "setColorPreset:forCategory:colorIndex:", v56, v15, 2);
          goto LABEL_73;
        }
        objc_msgSend(v66, "avt_objectForKey:ofClasses:didFail:error:", v16, v70, &v82, a5);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v57;
        v42 = v82;
        if (!v82 && v57)
        {
          objc_msgSend((id)objc_opt_class(), "colorPresetFromColorData:forCategory:colorIndex:version:didFail:error:", v57, v15, 2, v73, &v82, a5);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVTMemojiDescriptor setColorPreset:forCategory:colorIndex:](v72, "setColorPreset:forCategory:colorIndex:", v58, v15, 2);

          goto LABEL_73;
        }

        if (v42)
          v60 = 1;
        else
          v60 = v34;
        if ((v60 & 1) == 0)
        {
          +[AVTColorPreset fallbackColorPresetForNilPresetAndCategory:colorIndex:](AVTColorPreset, "fallbackColorPresetForNilPresetAndCategory:colorIndex:", v15, 2);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (v56)
          {
            v61 = v72;
            goto LABEL_72;
          }
LABEL_73:
          v42 = 0;
LABEL_74:

        }
        goto LABEL_76;
      }
    }
    v42 = 1;
LABEL_76:

    v30 = v69;
LABEL_77:

    if (!v42 && ++v15 != 40)
      continue;
    goto LABEL_89;
  }
LABEL_88:

LABEL_89:
  v9 = v63;
  v8 = v64;
  v12 = v66;
  v11 = v67;
LABEL_90:

}

uint64_t __58__AVTMemojiDescriptor__decode_isResettingToDefault_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setColorPreset:forCategory:colorIndex:", a3, a2, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVTMemojiDescriptor *v4;
  uint64_t v5;
  NSString **presetIdentifiers;
  AVTMemojiDescriptor *v7;
  uint64_t i;

  v4 = objc_alloc_init(AVTMemojiDescriptor);
  v5 = 0;
  presetIdentifiers = self->_presetIdentifiers;
  v7 = v4;
  do
  {
    objc_storeStrong((id *)&v4->_presetIdentifiers[v5], presetIdentifiers[v5]);
    for (i = 0; i != 3; ++i)
      objc_storeStrong((id *)&v7->_colorPresets[0][i], self->_colorPresets[0][i]);
    ++v5;
    self = (AVTMemojiDescriptor *)((char *)self + 24);
    v7 = (AVTMemojiDescriptor *)((char *)v7 + 24);
  }
  while (v5 != 40);
  return v4;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTMemojiDescriptor;
  -[AVTMemojiDescriptor description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)debugDescription
{
  id v3;
  unint64_t i;
  NSString *v5;
  NSString *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  for (i = 0; i != 40; ++i)
  {
    v5 = self->_presetIdentifiers[i];
    v6 = v5;
    if (v5 && !-[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("none")))
    {
      AVTPresetCategoryToString(i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR(", %@=%@"), v7, v6);

    }
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p%@>"), v10, self, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  AVTColorPreset *(*colorPresets)[3];
  uint64_t i;
  NSString **presetIdentifiers;
  uint64_t j;

  colorPresets = self->_colorPresets;
  for (i = 119; i != -1; --i)
    objc_storeStrong((id *)&(*colorPresets)[i], 0);
  presetIdentifiers = self->_presetIdentifiers;
  for (j = 39; j != -1; --j)
    objc_storeStrong((id *)&presetIdentifiers[j], 0);
}

- (void)presetIdentifierForCategory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_2(&dword_1DD1FA000, v0, v1, "Error: Unreachable code: Unexpected category %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setPresetIdentifier:(uint64_t)a3 forCategory:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0();
}

- (void)setColorPreset:forCategory:colorIndex:.cold.2()
{
  __assert_rtn("-[AVTMemojiDescriptor setColorPreset:forCategory:colorIndex:]", "AVTMemoji.m", 319, "colorIndex < AVT_MAX_COLOR_PRESETS");
}

- (void)setColorPreset:(uint64_t)a3 forCategory:(uint64_t)a4 colorIndex:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Preset category mismatch", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)colorPresetForCategory:colorIndex:.cold.2()
{
  __assert_rtn("-[AVTMemojiDescriptor colorPresetForCategory:colorIndex:]", "AVTMemoji.m", 330, "colorIndex < AVT_MAX_COLOR_PRESETS");
}

@end
