@implementation AVTStickerShaderModifierProperty

+ (id)shaderModifierPropertyCache
{
  if (shaderModifierPropertyCache_onceToken != -1)
    dispatch_once(&shaderModifierPropertyCache_onceToken, &__block_literal_global_25);
  return (id)shaderModifierPropertyCache_kCache;
}

void __63__AVTStickerShaderModifierProperty_shaderModifierPropertyCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)shaderModifierPropertyCache_kCache;
  shaderModifierPropertyCache_kCache = (uint64_t)v0;

}

+ (id)shaderModifierPropertyFromDictionary:(id)a3 assetsPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AVTStickerShaderModifierProperty *v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "stringByAppendingPathComponent:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "standardizedURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "shaderModifierPropertyCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v14);
    v16 = (AVTStickerShaderModifierProperty *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v16 = -[AVTStickerShaderModifierProperty initWithName:type:value:originalValue:]([AVTStickerShaderModifierProperty alloc], "initWithName:type:value:originalValue:", v9, v10, v11, v8);
      objc_msgSend(v15, "setObject:forKey:", v16, v14);
    }

  }
  else
  {
    v16 = -[AVTStickerShaderModifierProperty initWithName:type:value:originalValue:]([AVTStickerShaderModifierProperty alloc], "initWithName:type:value:originalValue:", v9, v10, v8, v8);
  }

  return v16;
}

- (AVTStickerShaderModifierProperty)initWithName:(id)a3 type:(id)a4 value:(id)a5 originalValue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AVTStickerShaderModifierProperty *v15;
  AVTStickerShaderModifierProperty *v16;
  id v17;
  void *v18;
  id effectiveValue;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)AVTStickerShaderModifierProperty;
  v15 = -[AVTStickerShaderModifierProperty init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_type, a4);
    objc_storeStrong(&v16->_value, a5);
    objc_storeStrong(&v16->_originalValue, a6);
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("texture")))
    {
      objc_msgSend(MEMORY[0x1E0CD59C8], "materialPropertyWithContents:", v13);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("float")))
    {
      v18 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v13, "floatValue");
      objc_msgSend(v18, "numberWithFloat:");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = v13;
    }
    effectiveValue = v16->_effectiveValue;
    v16->_effectiveValue = v17;

  }
  return v16;
}

- (id)dictionaryWithTargetPath:(id)a3
{
  __int128 v3;
  _QWORD v5[3];
  __int128 v6;
  id originalValue;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)&self->_name;
  v5[0] = CFSTR("name");
  v5[1] = CFSTR("type");
  v6 = v3;
  v5[2] = CFSTR("value");
  originalValue = self->_originalValue;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, v5, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)name
{
  return self->_name;
}

- (NSString)type
{
  return self->_type;
}

- (id)value
{
  return self->_value;
}

- (id)originalValue
{
  return self->_originalValue;
}

- (void)setOriginalValue:(id)a3
{
  objc_storeStrong(&self->_originalValue, a3);
}

- (id)effectiveValue
{
  return self->_effectiveValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_effectiveValue, 0);
  objc_storeStrong(&self->_originalValue, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
