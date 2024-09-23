@implementation FBSceneSnapshotContext

+ (id)contextWithFBSContext:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFBSContext:", v4);

  return v5;
}

- (FBSceneSnapshotContext)initWithScene:(id)a3
{
  id v5;
  void *v6;
  FBSceneSnapshotContext *v7;
  void *v8;
  uint64_t v9;
  NSString *sceneID;
  void *v11;
  uint64_t v12;
  FBSSceneSettings *settings;
  void *v14;
  uint64_t v15;
  FBSSceneClientSettings *clientSettings;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  FBSceneSnapshotContext *result;
  void *v22;
  objc_super v23;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v23.receiver = self;
    v23.super_class = (Class)FBSceneSnapshotContext;
    v7 = -[FBSceneSnapshotContext init](&v23, sel_init);
    if (v7)
    {
      objc_msgSend(v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      sceneID = v7->_sceneID;
      v7->_sceneID = (NSString *)v9;

      objc_msgSend(v6, "settings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      settings = v7->_settings;
      v7->_settings = (FBSSceneSettings *)v12;

      objc_msgSend(v6, "clientSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      clientSettings = v7->_clientSettings;
      v7->_clientSettings = (FBSSceneClientSettings *)v15;

      -[FBSSceneSettings frame](v7->_settings, "frame");
      BSRectWithSize();
      v7->_frame.origin.x = v17;
      v7->_frame.origin.y = v18;
      v7->_frame.size.width = v19;
      v7->_frame.size.height = v20;
      v7->_opaque = 1;
      v7->_orientation = 0;
    }

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("scene"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneSnapshotContext initWithScene:].cold.1(a2, (uint64_t)self, (uint64_t)v22);
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    result = (FBSceneSnapshotContext *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (FBSceneSnapshotContext)initWithFBSContext:(id)a3
{
  id v4;
  FBSceneSnapshotContext *v5;
  void *v6;
  uint64_t v7;
  NSString *sceneID;
  void *v9;
  uint64_t v10;
  FBSSceneSettings *settings;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  NSSet *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSSet *layersToExclude;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  uint64_t v42;
  NSDate *expirationDate;
  void *v44;
  void *v45;
  uint64_t v46;
  BSSettings *clientExtendedData;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  _BYTE v54[128];
  uint64_t v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)FBSceneSnapshotContext;
  v5 = -[FBSceneSnapshotContext init](&v53, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sceneID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    sceneID = v5->_sceneID;
    v5->_sceneID = (NSString *)v7;

    objc_msgSend(v4, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    settings = v5->_settings;
    v5->_settings = (FBSSceneSettings *)v10;

    v5->_orientation = 0;
    -[FBSSceneSettings frame](v5->_settings, "frame");
    objc_msgSend(v4, "frame");
    v13 = v12;
    v15 = v14;
    BSRectWithSize();
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    objc_msgSend(v4, "frame");
    v58.origin.x = v24;
    v58.origin.y = v25;
    v58.size.width = v26;
    v58.size.height = v27;
    v56.origin.x = v17;
    v56.origin.y = v19;
    v56.size.width = v21;
    v56.size.height = v23;
    v57 = CGRectIntersection(v56, v58);
    v5->_frame.origin.x = v13;
    v5->_frame.origin.y = v15;
    v5->_frame.size.width = v57.size.width;
    v5->_frame.size.height = v57.size.height;
    objc_msgSend(v4, "layersToExclude", v57.origin.x, v57.origin.y);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v29 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      objc_msgSend(v4, "layersToExclude", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v50;
        do
        {
          v34 = 0;
          do
          {
            if (*(_QWORD *)v50 != v33)
              objc_enumerationMutation(v30);
            +[FBSceneLayer layerWithFBSSceneLayer:](FBSceneLayer, "layerWithFBSSceneLayer:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v34));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
              -[NSSet addObject:](v29, "addObject:", v35);

            ++v34;
          }
          while (v32 != v34);
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        }
        while (v32);
      }

      layersToExclude = v5->_layersToExclude;
      v5->_layersToExclude = v29;

    }
    objc_msgSend(v4, "expirationInterval");
    if (v37 > 0.0)
    {
      v38 = v37;
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "timeIntervalSinceReferenceDate");
      v41 = v40;

      if (v38 < v41)
      {
        v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", v38);
        expirationDate = v5->_expirationDate;
        v5->_expirationDate = (NSDate *)v42;

      }
    }
    objc_msgSend(v4, "clientExtendedData");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v44)
    {
      v46 = objc_msgSend(v44, "copy");
      clientExtendedData = v5->_clientExtendedData;
      v5->_clientExtendedData = (BSSettings *)v46;

    }
  }

  return v5;
}

- (double)scale
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSceneSettings displayConfiguration](self->_settings, "displayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "pointScale");
    v5 = v4;
  }
  else
  {
    v5 = 1.0;
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)-[FBSceneSnapshotContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSceneSnapshotContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSceneSnapshotContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  FBSceneSnapshotContext *v11;

  v4 = a3;
  -[FBSceneSnapshotContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__FBSceneSnapshotContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E4A11FD0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __64__FBSceneSnapshotContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  const __CFString *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", CFSTR("frame"), *(double *)(*(_QWORD *)(a1 + 40) + 72), *(double *)(*(_QWORD *)(a1 + 40) + 80), *(double *)(*(_QWORD *)(a1 + 40) + 88), *(double *)(*(_QWORD *)(a1 + 40) + 96));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("opaque"));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48))
    v4 = CFSTR("Reference");
  else
    v4 = CFSTR("Natural");
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v4, CFSTR("orientation"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("settings"));
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendArraySection:withName:skipIfEmpty:", v8, CFSTR("layersToExclude"), 1);

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("expirationDate"), 1);
}

- (NSString)sceneID
{
  return self->_sceneID;
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

- (BOOL)isOpaque
{
  return self->_opaque;
}

- (void)setOpaque:(BOOL)a3
{
  self->_opaque = a3;
}

- (FBSSceneSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FBSSceneClientSettings)clientSettings
{
  return self->_clientSettings;
}

- (void)setClientSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)layersToExclude
{
  return self->_layersToExclude;
}

- (void)setLayersToExclude:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (BSSettings)clientExtendedData
{
  return self->_clientExtendedData;
}

- (void)setClientExtendedData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientExtendedData, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_layersToExclude, 0);
  objc_storeStrong((id *)&self->_clientSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
}

- (void)initWithScene:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("FBSceneSnapshotContext.m");
  v16 = 1024;
  v17 = 27;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
