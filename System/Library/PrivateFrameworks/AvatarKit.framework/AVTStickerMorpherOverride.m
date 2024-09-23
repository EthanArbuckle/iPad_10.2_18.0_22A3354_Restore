@implementation AVTStickerMorpherOverride

+ (id)morpherOverrideFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  AVTStickerMorpherOverride *v8;
  void *v9;
  void *v10;
  AVTStickerMorpherOverride *v11;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("node"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("geometry"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v8 = [AVTStickerMorpherOverride alloc];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("morpher"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v11 = -[AVTStickerMorpherOverride initWithNodeNames:morphTargetName:weight:](v8, "initWithNodeNames:morphTargetName:weight:", v7, v9);

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p | %@[%@] = %f>"), v5, self, self->_nodeNames, self->_morphTargetName, self->_weight);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AVTStickerMorpherOverride)initWithNodeNames:(id)a3 morphTargetName:(id)a4 weight:(float)a5
{
  id v9;
  id v10;
  AVTStickerMorpherOverride *v11;
  AVTStickerMorpherOverride *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTStickerMorpherOverride;
  v11 = -[AVTStickerMorpherOverride init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_nodeNames, a3);
    objc_storeStrong((id *)&v12->_morphTargetName, a4);
    v12->_weight = a5;
  }

  return v12;
}

- (void)applyToAvatar:(id)a3 inHierarchy:(id)a4 reversionContext:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  float v19;
  AVTStickerMorpherOverride *v20;
  double v21;
  AVTStickerMorpherOverride *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(a3, "nodesMatchingStickerPattern:inHierarchy:options:includingDerivedNodes:", self->_nodeNames, a4, 1, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "morpher");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "_weightIndexForTargetNamed:", self->_morphTargetName);
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v17 = v16;
          if (!((v8 == 0) | v12 & 1))
          {
            objc_msgSend(v15, "weightForTargetAtIndex:", v16);
            v19 = v18;
            v20 = [AVTStickerMorpherOverride alloc];
            *(float *)&v21 = v19;
            v22 = -[AVTStickerMorpherOverride initWithNodeNames:morphTargetName:weight:](v20, "initWithNodeNames:morphTargetName:weight:", self->_nodeNames, self->_morphTargetName, v21);
            objc_msgSend(v8, "saveMorpherOverride:", v22);

            v12 = 1;
          }
          objc_msgSend(v15, "setWeight:forTargetAtIndex:", v17, self->_weight);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

}

- (id)nodeNames
{
  return self->_nodeNames;
}

- (NSString)morphTargetName
{
  return self->_morphTargetName;
}

- (float)weight
{
  return self->_weight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_morphTargetName, 0);
  objc_storeStrong(&self->_nodeNames, 0);
}

@end
