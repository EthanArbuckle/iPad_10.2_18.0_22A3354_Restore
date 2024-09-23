@implementation FBSSceneClientSettingsCore

uint64_t __36__FBSSceneClientSettingsCore_layers__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __36__FBSSceneClientSettingsCore_layers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

+ (id)protocol
{
  return &unk_1EE3BAC90;
}

- (BSKeyedSettings)layers
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  -[FBSSceneClientSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__FBSSceneClientSettingsCore_layers__block_invoke;
  v6[3] = &unk_1E38ED778;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateKeyedObjectsWithBlock:", v6);
  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_25);

  return (BSKeyedSettings *)v4;
}

- (double)preferredLevel
{
  void *v2;
  double v3;
  double v4;

  -[FBSSceneClientSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_CGFloatValue");
  v4 = v3;

  return v4;
}

- (FBSSceneIdentityToken)preferredSceneHostIdentity
{
  return (FBSSceneIdentityToken *)-[FBSSceneClientSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
}

- (int64_t)preferredInterfaceOrientation
{
  void *v2;
  int64_t v3;

  -[FBSSceneClientSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSString)preferredSceneHostIdentifier
{
  return (NSString *)-[FBSSceneClientSettingsCore valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
}

- (void)setPreferredSceneHostIdentity:(id)a3
{
  -[FBSSceneClientSettingsCore setValue:forProperty:](self, "setValue:forProperty:", a3, a2);
}

- (void)setPreferredLevel:(double)a3
{
  id v6;

  if (BSFloatIsZero())
  {
    -[FBSSceneClientSettingsCore setValue:forProperty:](self, "setValue:forProperty:", 0, a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[FBSSceneClientSettingsCore setValue:forProperty:](self, "setValue:forProperty:", v6, a2);

  }
}

- (void)setPreferredSceneHostIdentifier:(id)a3
{
  -[FBSSceneClientSettingsCore setValue:forProperty:](self, "setValue:forProperty:", a3, a2);
}

- (void)setPreferredInterfaceOrientation:(int64_t)a3
{
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[FBSSceneClientSettingsCore setValue:forProperty:](self, "setValue:forProperty:", v5, a2);

  }
  else
  {
    -[FBSSceneClientSettingsCore setValue:forProperty:](self, "setValue:forProperty:", 0, a2);
  }
}

+ (id)descriptionOfValue:(id)a3 forSetting:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "matchesProperty:", sel_preferredInterfaceOrientation))
  {
    objc_msgSend(v7, "integerValue");

    BSInterfaceOrientationDescription();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___FBSSceneClientSettingsCore;
    objc_msgSendSuper2(&v10, sel_descriptionOfValue_forSetting_, v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (void)configureSetting:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___FBSSceneClientSettingsCore;
  v3 = a3;
  objc_msgSendSuper2(&v4, sel_configureSetting_, v3);
  objc_msgSend(v3, "setVolatile:", objc_msgSend(v3, "matchesProperty:", sel_layers, v4.receiver, v4.super_class));

}

- (void)setLayers:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[FBSSceneClientSettingsCore setValue:forProperty:](self, "setValue:forProperty:", 0, a2);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[FBSSceneClientSettingsCore addLayer:](self, "addLayer:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

@end
