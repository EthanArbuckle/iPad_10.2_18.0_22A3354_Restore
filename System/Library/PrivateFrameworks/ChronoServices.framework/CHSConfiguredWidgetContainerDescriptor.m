@implementation CHSConfiguredWidgetContainerDescriptor

+ (CHSConfiguredWidgetContainerDescriptor)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CHSConfiguredWidgetContainerDescriptor.m"), 29, CFSTR("use the designated initializer"));

  return 0;
}

- (CHSConfiguredWidgetContainerDescriptor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSConfiguredWidgetContainerDescriptor.m"), 34, CFSTR("use the designated initializer"));

  return 0;
}

- (CHSConfiguredWidgetContainerDescriptor)initWithUniqueIdentifier:(id)a3 location:(int64_t)a4 page:(unint64_t)a5 family:(int64_t)a6 widgets:(id)a7 activeWidget:(id)a8
{
  return -[CHSConfiguredWidgetContainerDescriptor initWithUniqueIdentifier:location:canAppearInSecureEnvironment:page:family:widgets:activeWidget:](self, "initWithUniqueIdentifier:location:canAppearInSecureEnvironment:page:family:widgets:activeWidget:", a3, a4, 0, a5, a6, a7, a8);
}

- (CHSConfiguredWidgetContainerDescriptor)initWithUniqueIdentifier:(id)a3 location:(int64_t)a4 canAppearInSecureEnvironment:(BOOL)a5 page:(unint64_t)a6 family:(int64_t)a7 widgets:(id)a8 activeWidget:(id)a9
{
  id v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  CHSConfiguredWidgetContainerDescriptor *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  NSString *uniqueIdentifier;
  uint64_t v29;
  NSArray *widgets;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v12 = a8;
  v13 = a9;
  if (objc_msgSend(v12, "count"))
  {
    if (v12)
      goto LABEL_3;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSConfiguredWidgetContainerDescriptor.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("widgets"));

    if (v13)
      goto LABEL_4;
LABEL_14:
    v15 = -1;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSConfiguredWidgetContainerDescriptor.m"), 55, CFSTR("Widget count must be > 0."));

  if (!v12)
    goto LABEL_13;
LABEL_3:
  if (!v13)
    goto LABEL_14;
LABEL_4:
  v14 = 0;
  v15 = -1;
  while (v14 < objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", v13);

    if (v18)
      v15 = v14;
    ++v14;
  }
  if ((v15 & 0x8000000000000000) != 0 || v15 >= objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSConfiguredWidgetContainerDescriptor.m"), 64, CFSTR("Active widget provided is invalid or not found in the widget list."));

  }
LABEL_15:
  v41.receiver = self;
  v41.super_class = (Class)CHSConfiguredWidgetContainerDescriptor;
  v22 = -[CHSConfiguredWidgetContainerDescriptor init](&v41, sel_init);
  if (v22)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v23 = v12;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v38 != v25)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "_setContainer:", v22);
        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v24);
    }

    v22->_activeWidgetIndex = v15;
    objc_storeStrong((id *)&v22->_activeWidgetUniqueIdentifier, a9);
    v27 = objc_msgSend(v36, "copy");
    uniqueIdentifier = v22->_uniqueIdentifier;
    v22->_uniqueIdentifier = (NSString *)v27;

    v22->_canAppearInSecureEnvironment = a5;
    v22->_location = a4;
    v22->_page = a6;
    v22->_family = a7;
    v29 = objc_msgSend(v23, "copy");
    widgets = v22->_widgets;
    v22->_widgets = (NSArray *)v29;

    v22->_stack = (unint64_t)objc_msgSend(v23, "count") > 1;
  }

  return v22;
}

- (BOOL)isSystemConfigured
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  BOOL v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_widgets;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isSystemConfigured", (_QWORD)v8) & 1) == 0)
        {
          v6 = 0;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 1;
LABEL_11:

  return v6;
}

- (CHSConfiguredWidgetDescriptor)activeWidget
{
  unint64_t activeWidgetIndex;
  void *v4;

  activeWidgetIndex = self->_activeWidgetIndex;
  if ((activeWidgetIndex & 0x8000000000000000) != 0 || activeWidgetIndex >= -[NSArray count](self->_widgets, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_widgets, "objectAtIndexedSubscript:", self->_activeWidgetIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (CHSConfiguredWidgetDescriptor *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  NSString *uniqueIdentifier;
  uint64_t v11;
  id v12;
  id v13;
  int64_t location;
  id v15;
  id v16;
  _BOOL8 canAppearInSecureEnvironment;
  id v18;
  id v19;
  unint64_t page;
  id v21;
  id v22;
  int64_t family;
  id v24;
  id v25;
  NSArray *widgets;
  id v27;
  id v28;
  NSString *activeWidgetUniqueIdentifier;
  id v30;
  char v31;
  uint64_t v33;
  uint64_t v34;
  id (*v35)(uint64_t);
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v4;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (v9)
  {
    uniqueIdentifier = self->_uniqueIdentifier;
    v11 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke;
    v48[3] = &unk_1E2A5A5A8;
    v12 = v9;
    v49 = v12;
    v13 = (id)objc_msgSend(v5, "appendString:counterpart:", uniqueIdentifier, v48);
    location = self->_location;
    v46[0] = v11;
    v46[1] = 3221225472;
    v46[2] = __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_2;
    v46[3] = &unk_1E2A5A5D0;
    v15 = v12;
    v47 = v15;
    v16 = (id)objc_msgSend(v5, "appendInteger:counterpart:", location, v46);
    canAppearInSecureEnvironment = self->_canAppearInSecureEnvironment;
    v44[0] = v11;
    v44[1] = 3221225472;
    v44[2] = __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_3;
    v44[3] = &unk_1E2A5A508;
    v18 = v15;
    v45 = v18;
    v19 = (id)objc_msgSend(v5, "appendBool:counterpart:", canAppearInSecureEnvironment, v44);
    page = self->_page;
    v42[0] = v11;
    v42[1] = 3221225472;
    v42[2] = __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_4;
    v42[3] = &unk_1E2A5A558;
    v21 = v18;
    v43 = v21;
    v22 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", page, v42);
    family = self->_family;
    v40[0] = v11;
    v40[1] = 3221225472;
    v40[2] = __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_5;
    v40[3] = &unk_1E2A5A5D0;
    v24 = v21;
    v41 = v24;
    v25 = (id)objc_msgSend(v5, "appendInteger:counterpart:", family, v40);
    widgets = self->_widgets;
    v38[0] = v11;
    v38[1] = 3221225472;
    v38[2] = __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_6;
    v38[3] = &unk_1E2A5A218;
    v27 = v24;
    v39 = v27;
    v28 = (id)objc_msgSend(v5, "appendObject:counterpart:", widgets, v38);
    activeWidgetUniqueIdentifier = self->_activeWidgetUniqueIdentifier;
    v33 = v11;
    v34 = 3221225472;
    v35 = __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_7;
    v36 = &unk_1E2A5A5A8;
    v37 = v27;
    v30 = (id)objc_msgSend(v5, "appendString:counterpart:", activeWidgetUniqueIdentifier, &v33);
    v31 = objc_msgSend(v5, "isEqual", v33, v34, v35, v36);

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

id __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

uint64_t __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
}

uint64_t __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24);
}

uint64_t __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
}

uint64_t __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_5(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
}

id __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 40);
}

id __50__CHSConfiguredWidgetContainerDescriptor_isEqual___block_invoke_7(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  unint64_t v11;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_uniqueIdentifier);
  v5 = (id)objc_msgSend(v3, "appendInteger:", self->_location);
  v6 = (id)objc_msgSend(v3, "appendBool:", self->_canAppearInSecureEnvironment);
  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_page);
  v8 = (id)objc_msgSend(v3, "appendInteger:", self->_family);
  v9 = (id)objc_msgSend(v3, "appendObject:", self->_widgets);
  v10 = (id)objc_msgSend(v3, "appendString:", self->_activeWidgetUniqueIdentifier);
  v11 = objc_msgSend(v3, "hash");

  return v11;
}

- (NSString)description
{
  return (NSString *)-[CHSConfiguredWidgetContainerDescriptor descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CHSConfiguredWidgetContainerDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CHSConfiguredWidgetContainerDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  CHSConfiguredWidgetContainerDescriptor *v11;

  v4 = a3;
  -[CHSConfiguredWidgetContainerDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__CHSConfiguredWidgetContainerDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E2A5A290;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);
  v7 = v6;

  return v7;
}

uint64_t __80__CHSConfiguredWidgetContainerDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("uniqueIdentifier"));
  v2 = *(void **)(a1 + 32);
  CHSWidgetLocationDescription(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("location"));

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("canAppearInSecureEnvironment"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("page"));
  v6 = *(void **)(a1 + 32);
  CHSWidgetFamilyDescription(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v7, CFSTR("widgetFamily"));

  objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("widgets"), 0);
  return objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("activeWidget"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueIdentifier, CFSTR("uid"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_page);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("page"));

  objc_msgSend(v5, "encodeInteger:forKey:", self->_family, CFSTR("family"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_widgets, CFSTR("widgets"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activeWidgetUniqueIdentifier, CFSTR("activeWidget"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canAppearInSecureEnvironment, CFSTR("canAppearInSE"));

}

- (CHSConfiguredWidgetContainerDescriptor)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void (**v12)(void *, void *);
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  CHSConfiguredWidgetContainerDescriptor *v18;
  void *v20;
  uint64_t v21;
  _QWORD aBlock[4];
  id v24;
  id v25;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uid"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("location"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("page"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v7 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("family"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeWidget"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  v9 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("canAppearInSE"));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__CHSConfiguredWidgetContainerDescriptor_initWithCoder___block_invoke;
  aBlock[3] = &unk_1E2A5B430;
  v10 = v8;
  v24 = v10;
  v11 = v20;
  v25 = v11;
  v12 = (void (**)(void *, void *))_Block_copy(aBlock);
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v15, CFSTR("widgets"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v12[2](v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 && CHSWidgetFamilyIsValid(v7))
  {
    v18 = -[CHSConfiguredWidgetContainerDescriptor initWithUniqueIdentifier:location:canAppearInSecureEnvironment:page:family:widgets:activeWidget:](self, "initWithUniqueIdentifier:location:canAppearInSecureEnvironment:page:family:widgets:activeWidget:", v11, v4, v9, v21, v7, v17, v10);
    self = v18;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

id __56__CHSConfiguredWidgetContainerDescriptor_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[16];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CHSLogChronoServices();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      __56__CHSConfiguredWidgetContainerDescriptor_initWithCoder___block_invoke_cold_3(v15, (uint64_t)v26, v13);
    }

    goto LABEL_24;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = v3;
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          CHSLogChronoServices();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            __56__CHSConfiguredWidgetContainerDescriptor_initWithCoder___block_invoke_cold_2(v18, (uint64_t)v26, v16);
          }

          goto LABEL_24;
        }
        if (*(_QWORD *)(a1 + 32))
        {
          objc_msgSend(v9, "uniqueIdentifier", (_QWORD)v21);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 32));

        }
        else
        {
          v11 = 0;
        }
        v5 |= v11;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (!((*(_QWORD *)(a1 + 32) == 0) | v5 & 1))
  {
    CHSLogChronoServices();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __56__CHSConfiguredWidgetContainerDescriptor_initWithCoder___block_invoke_cold_1((uint64_t *)(a1 + 32), a1, v19);

LABEL_24:
    v12 = 0;
    goto LABEL_25;
  }
  v12 = v4;
LABEL_25:

  return v12;
}

- (BOOL)canAppearInSecureEnvironment
{
  return self->_canAppearInSecureEnvironment;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSArray)widgets
{
  return self->_widgets;
}

- (int64_t)family
{
  return self->_family;
}

- (int64_t)location
{
  return self->_location;
}

- (unint64_t)page
{
  return self->_page;
}

- (BOOL)isStack
{
  return self->_stack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgets, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_activeWidgetUniqueIdentifier, 0);
}

void __56__CHSConfiguredWidgetContainerDescriptor_initWithCoder___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *(_QWORD *)(a2 + 40);
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_18FB18000, log, OS_LOG_TYPE_ERROR, "Unable to find active widget (%{public}@) matching in widget container %{public}@", (uint8_t *)&v5, 0x16u);
}

void __56__CHSConfiguredWidgetContainerDescriptor_initWithCoder___block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_18FB18000, a2, a3, "Unexpected type (%{public}@) deserializing widgets.", (uint8_t *)a2);

}

void __56__CHSConfiguredWidgetContainerDescriptor_initWithCoder___block_invoke_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_18FB18000, a2, a3, "Unexpected collection type (%{public}@) deserializing widgets.", (uint8_t *)a2);

}

@end
