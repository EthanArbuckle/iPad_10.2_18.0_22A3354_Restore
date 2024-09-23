@implementation FBSSceneSnapshotContext

+ (FBSSceneSnapshotContext)contextWithSceneID:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSceneID:settings:", v7, v6);

  return (FBSSceneSnapshotContext *)v8;
}

- (FBSSceneSnapshotContext)initWithSceneID:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  FBSSceneSnapshotContext *v8;
  uint64_t v9;
  NSString *sceneID;
  uint64_t v11;
  FBSSceneSettings *settings;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FBSSceneSnapshotContext;
  v8 = -[FBSSceneSnapshotContext init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    sceneID = v8->_sceneID;
    v8->_sceneID = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    settings = v8->_settings;
    v8->_settings = (FBSSceneSettings *)v11;

    objc_msgSend(v7, "frame");
    BSRectWithSize();
    v8->_frame.origin.x = v13;
    v8->_frame.origin.y = v14;
    v8->_frame.size.width = v15;
    v8->_frame.size.height = v16;
  }

  return v8;
}

- (NSString)description
{
  return (NSString *)-[FBSSceneSnapshotContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)setExpirationInterval:(double)a3
{
  void *v5;
  int v6;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceNow");
  v6 = BSFloatGreaterThanOrEqualToFloat();

  if (v6)
    a3 = 0.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v8 = v7;
  v9 = BSFloatGreaterThanOrEqualToFloat();
  v10 = round(a3 - v8);
  if (!v9)
    v10 = a3;
  if (v10 >= 3153600000.0)
    v11 = 0.0;
  else
    v11 = v10;
  if (BSFloatLessThanOrEqualToFloat())
    v12 = 0.0;
  else
    v12 = v11;
  self->_expirationInterval = v12;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSSceneSnapshotContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSSceneSnapshotContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  FBSSceneSnapshotContext *v11;

  v4 = a3;
  -[FBSSceneSnapshotContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__FBSSceneSnapshotContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E38EAE08;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __65__FBSSceneSnapshotContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("sceneID"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("name"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", CFSTR("frame"), *(double *)(*(_QWORD *)(a1 + 40) + 64), *(double *)(*(_QWORD *)(a1 + 40) + 72), *(double *)(*(_QWORD *)(a1 + 40) + 80), *(double *)(*(_QWORD *)(a1 + 40) + 88));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("scale"), 0, *(double *)(*(_QWORD *)(a1 + 40) + 32));
  v6 = *(_QWORD *)(a1 + 40);
  if (*(double *)(v6 + 48) > 0.0)
  {
    v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("expirationInterval"), 1);
    v6 = *(_QWORD *)(a1 + 40);
  }
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(v6 + 16), CFSTR("requestedSettings"));
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendArraySection:withName:skipIfEmpty:", v10, CFSTR("layersToExclude"), 1);

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("clientExtendedData"));
}

- (FBSSceneSnapshotContext)initWithXPCDictionary:(id)a3
{
  id v4;
  FBSSceneSnapshotContext *v5;
  uint64_t v6;
  NSString *sceneID;
  uint64_t v8;
  NSString *name;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  uint64_t v16;
  NSSet *layersToExclude;
  void *v18;
  void *v19;
  uint64_t v20;
  FBSSceneSettings *settings;
  uint64_t v22;
  BSSettings *clientExtendedData;

  v4 = a3;
  v5 = -[FBSSceneSnapshotContext init](self, "init");
  if (v5)
  {
    v6 = BSCreateDeserializedStringFromXPCDictionaryWithKey();
    sceneID = v5->_sceneID;
    v5->_sceneID = (NSString *)v6;

    v8 = BSCreateDeserializedStringFromXPCDictionaryWithKey();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    BSDeserializeCGRectFromXPCDictionaryWithKey();
    v5->_frame.origin.x = v10;
    v5->_frame.origin.y = v11;
    v5->_frame.size.width = v12;
    v5->_frame.size.height = v13;
    BSDeserializeDoubleFromXPCDictionaryWithKey();
    v5->_scale = v14;
    BSDeserializeDoubleFromXPCDictionaryWithKey();
    v5->_expirationInterval = v15;
    v16 = BSCreateDeserializedSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
    layersToExclude = v5->_layersToExclude;
    v5->_layersToExclude = (NSSet *)v16;

    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "settingsByApplyingToMutableCopyOfSettings:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    settings = v5->_settings;
    v5->_settings = (FBSSceneSettings *)v20;

    v22 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
    clientExtendedData = v5->_clientExtendedData;
    v5->_clientExtendedData = (BSSettings *)v22;

  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  BSSerializeStringToXPCDictionaryWithKey();
  BSSerializeStringToXPCDictionaryWithKey();
  BSSerializeCGRectToXPCDictionaryWithKey();
  BSSerializeDoubleToXPCDictionaryWithKey();
  BSSerializeDoubleToXPCDictionaryWithKey();
  +[FBSSceneSettingsDiff diffFromSettings:toSettings:](FBSSceneSettingsDiff, "diffFromSettings:toSettings:", 0, self->_settings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

  BSSerializeSetOfBSXPCEncodableObjectsToXPCDictionaryWithKey();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (FBSSceneSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (NSSet)layersToExclude
{
  return self->_layersToExclude;
}

- (void)setLayersToExclude:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)expirationInterval
{
  return self->_expirationInterval;
}

- (BSSettings)clientExtendedData
{
  return self->_clientExtendedData;
}

- (void)setClientExtendedData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientExtendedData, 0);
  objc_storeStrong((id *)&self->_layersToExclude, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
}

@end
