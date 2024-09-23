@implementation BKSDisplayRenderOverlayDescriptor

- (id)_initWithName:(id)a3 displayUUID:(id)a4
{
  id v7;
  id v8;
  BKSDisplayRenderOverlayDescriptor *v9;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *displayUUID;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSDisplayRenderOverlayDescriptor.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v16.receiver = self;
  v16.super_class = (Class)BKSDisplayRenderOverlayDescriptor;
  v9 = -[BKSDisplayRenderOverlayDescriptor init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v10;

    v12 = objc_msgSend(v8, "copy");
    displayUUID = v9->_displayUUID;
    v9->_displayUUID = (NSString *)v12;

    *(_WORD *)&v9->_lockBacklight = 1;
  }

  return v9;
}

- (BKSDisplayRenderOverlayDescriptor)initWithName:(id)a3 display:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  BKSDisplayRenderOverlayDescriptor *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSDisplayRenderOverlayDescriptor.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSDisplayRenderOverlayDescriptor.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("display"));

LABEL_3:
  objc_msgSend(v9, "uniqueId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BKSDisplayRenderOverlayDescriptor _initWithName:displayUUID:](self, "_initWithName:displayUUID:", v7, v10);

  if (v11)
    objc_storeStrong((id *)&v11->_display, a4);

  return v11;
}

- (CADisplay)display
{
  CADisplay *display;
  CADisplay **p_display;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  CADisplay *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_display = &self->_display;
  display = self->_display;
  if (!display)
  {
    if (!self->_displayUUID)
    {
      objc_msgSend(getCADisplayClass_6520(), "mainDisplay");
      v12 = (CADisplay *)objc_claimAutoreleasedReturnValue();
      return v12;
    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(getCADisplayClass_6520(), "displays", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v9, "uniqueId");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = BSEqualStrings();

          if (v11)
          {
            objc_storeStrong((id *)p_display, v9);
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

    display = *p_display;
  }
  v12 = display;
  return v12;
}

- (BOOL)isInterstitial
{
  return self->_interstitial;
}

- (void)_appendDescriptionToFormatterCore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSString *displayUUID;
  id v9;
  int64_t interfaceOrientation;
  id v11;
  BKSDisplayProgressIndicatorProperties *progressIndicatorProperties;
  id v13;
  id v14;

  v14 = a3;
  v4 = (id)objc_msgSend(v14, "appendObject:withName:", self->_name, CFSTR("name"));
  -[BKSDisplayRenderOverlayDescriptor display](self, "display");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = (id)objc_msgSend(v14, "appendObject:withName:", v6, CFSTR("displayName"));
  displayUUID = self->_displayUUID;
  if (displayUUID)
    v9 = (id)objc_msgSend(v14, "appendObject:withName:", displayUUID, CFSTR("displayUUID"));
  interfaceOrientation = self->_interfaceOrientation;
  if (interfaceOrientation)
    v11 = (id)objc_msgSend(v14, "appendInteger:withName:", interfaceOrientation, CFSTR("interfaceOrientation"));
  if (self->_lockBacklight)
    objc_msgSend(v14, "appendString:withName:", CFSTR("lockBacklight"), 0);
  if (self->_interstitial)
    objc_msgSend(v14, "appendString:withName:", CFSTR("interstitial"), 0);
  progressIndicatorProperties = self->_progressIndicatorProperties;
  if (progressIndicatorProperties)
    v13 = (id)objc_msgSend(v14, "appendObject:withName:", progressIndicatorProperties, CFSTR("progressIndicatorProperties"));

}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayUUID, CFSTR("displayUUID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_interfaceOrientation, CFSTR("interfaceOrientation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_lockBacklight, CFSTR("lockBacklight"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_progressIndicatorProperties, CFSTR("progressIndicatorProperties"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_interstitial, CFSTR("interstitial"));

}

- (BKSDisplayRenderOverlayDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BKSDisplayRenderOverlayDescriptor *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BKSDisplayRenderOverlayDescriptor _initWithName:displayUUID:](self, "_initWithName:displayUUID:", v5, v6);
  if (v7)
  {
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interfaceOrientation"));
    if (BSInterfaceOrientationIsValid())
      v9 = v8;
    else
      v9 = 0;
    -[BKSDisplayRenderOverlayDescriptor setInterfaceOrientation:](v7, "setInterfaceOrientation:", v9);
    -[BKSDisplayRenderOverlayDescriptor setLockBacklight:](v7, "setLockBacklight:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lockBacklight")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("progressIndicatorProperties"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSDisplayRenderOverlayDescriptor setProgressIndicatorProperties:](v7, "setProgressIndicatorProperties:", v10);

    -[BKSDisplayRenderOverlayDescriptor _setInterstitial:](v7, "_setInterstitial:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("interstitial")));
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int64_t interfaceOrientation;
  id v12;
  void *v13;
  _BOOL8 lockBacklight;
  id v15;
  void *v16;
  BKSDisplayProgressIndicatorProperties *progressIndicatorProperties;
  id v18;
  void *v19;
  uint64_t interstitial;
  id v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  v6 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke;
  v37[3] = &unk_1E1EA0C98;
  v7 = v4;
  v38 = v7;
  objc_msgSend(v26, "appendString:counterpart:", name, v37);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKSDisplayRenderOverlayDescriptor display](self, "display");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v6;
  v35[1] = 3221225472;
  v35[2] = __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_2;
  v35[3] = &unk_1E1EA0C98;
  v9 = v7;
  v36 = v9;
  objc_msgSend(v24, "appendString:counterpart:", v8, v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  interfaceOrientation = self->_interfaceOrientation;
  v33[0] = v6;
  v33[1] = 3221225472;
  v33[2] = __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_3;
  v33[3] = &unk_1E1EA0CC0;
  v12 = v9;
  v34 = v12;
  objc_msgSend(v10, "appendInteger:counterpart:", interfaceOrientation, v33);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  lockBacklight = self->_lockBacklight;
  v31[0] = v6;
  v31[1] = 3221225472;
  v31[2] = __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_4;
  v31[3] = &unk_1E1EA0CE8;
  v15 = v12;
  v32 = v15;
  objc_msgSend(v13, "appendBool:counterpart:", lockBacklight, v31);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  progressIndicatorProperties = self->_progressIndicatorProperties;
  v29[0] = v6;
  v29[1] = 3221225472;
  v29[2] = __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_5;
  v29[3] = &unk_1E1EA0D10;
  v18 = v15;
  v30 = v18;
  objc_msgSend(v16, "appendObject:counterpart:", progressIndicatorProperties, v29);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  interstitial = self->_interstitial;
  v27[0] = v6;
  v27[1] = 3221225472;
  v27[2] = __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_6;
  v27[3] = &unk_1E1EA0CE8;
  v28 = v18;
  v21 = v18;
  objc_msgSend(v19, "appendBool:counterpart:", interstitial, v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(interstitial) = objc_msgSend(v22, "isEqual");

  return interstitial;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_name, "hash");
  -[BKSDisplayRenderOverlayDescriptor display](self, "display");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + self->_interfaceOrientation + v3;

  return v6;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = objc_opt_class();
  v8 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v8;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__BKSDisplayRenderOverlayDescriptor_appendDescriptionToFormatter___block_invoke;
    v9[3] = &unk_1E1EA1BF8;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v10, "appendProem:block:", self, v9);

  }
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BKSDisplayRenderOverlayDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKSDisplayRenderOverlayDescriptor _appendDescriptionToFormatterCore:](self, "_appendDescriptionToFormatterCore:", v3);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BKSDisplayRenderOverlayDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (void)setDisplayUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (BOOL)lockBacklight
{
  return self->_lockBacklight;
}

- (void)setLockBacklight:(BOOL)a3
{
  self->_lockBacklight = a3;
}

- (BKSDisplayProgressIndicatorProperties)progressIndicatorProperties
{
  return self->_progressIndicatorProperties;
}

- (void)setProgressIndicatorProperties:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicatorProperties, a3);
}

- (void)_setInterstitial:(BOOL)a3
{
  self->_interstitial = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicatorProperties, 0);
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_displayUUID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

uint64_t __66__BKSDisplayRenderOverlayDescriptor_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appendDescriptionToFormatterCore:", *(_QWORD *)(a1 + 40));
}

uint64_t __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "name");
}

id __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "display");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation");
}

uint64_t __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "lockBacklight");
}

uint64_t __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "progressIndicatorProperties");
}

uint64_t __45__BKSDisplayRenderOverlayDescriptor_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isInterstitial");
}

+ (BKSDisplayRenderOverlayDescriptor)descriptorWithName:(id)a3 display:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:display:", v6, v5);

  return (BKSDisplayRenderOverlayDescriptor *)v7;
}

+ (id)_classesRequiredToDecode
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
