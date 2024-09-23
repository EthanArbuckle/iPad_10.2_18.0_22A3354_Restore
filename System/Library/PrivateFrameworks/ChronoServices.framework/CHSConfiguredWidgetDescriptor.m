@implementation CHSConfiguredWidgetDescriptor

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CHSConfiguredWidgetDescriptor.m"), 45, CFSTR("use designated initializer"));

  return 0;
}

- (CHSConfiguredWidgetDescriptor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSConfiguredWidgetDescriptor.m"), 50, CFSTR("use designated initializer"));

  return 0;
}

- (CHSConfiguredWidgetDescriptor)initWithUniqueIdentifier:(id)a3 widget:(id)a4 metrics:(id)a5
{
  id v8;
  id v9;
  id v10;
  CHSConfiguredWidgetDescriptor *v11;
  uint64_t v12;
  CHSWidget *widget;
  uint64_t v14;
  NSString *uniqueIdentifier;
  uint64_t v16;
  CHSWidgetMetrics *metrics;
  uint64_t v18;
  CHSWidgetRefreshStrategy *refreshStrategy;
  CHSWidgetRenderScheme *v20;
  uint64_t v21;
  NSArray *supportedRenderSchemes;
  void *v23;
  id v24;
  CHSWidgetDisplayProperties *v25;
  void *v26;
  uint64_t v27;
  CHSWidgetDisplayProperties *displayProperties;
  objc_super v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)CHSConfiguredWidgetDescriptor;
  v11 = -[CHSConfiguredWidgetDescriptor init](&v30, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    widget = v11->_widget;
    v11->_widget = (CHSWidget *)v12;

    v14 = objc_msgSend(v8, "copy");
    uniqueIdentifier = v11->_uniqueIdentifier;
    v11->_uniqueIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    metrics = v11->_metrics;
    v11->_metrics = (CHSWidgetMetrics *)v16;

    *(_WORD *)&v11->_suggestion = 0;
    +[CHSWidgetRefreshStrategyFactory defaultStrategy](CHSWidgetRefreshStrategyFactory, "defaultStrategy");
    v18 = objc_claimAutoreleasedReturnValue();
    refreshStrategy = v11->_refreshStrategy;
    v11->_refreshStrategy = (CHSWidgetRefreshStrategy *)v18;

    v11->_supportedColorSchemes = 3;
    v20 = -[CHSWidgetRenderScheme initWithRenderingMode:backgroundViewPolicy:]([CHSWidgetRenderScheme alloc], "initWithRenderingMode:backgroundViewPolicy:", 0, 0);
    v36[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v21 = objc_claimAutoreleasedReturnValue();
    supportedRenderSchemes = v11->_supportedRenderSchemes;
    v11->_supportedRenderSchemes = (NSArray *)v21;

    *(_WORD *)&v11->_supportsLowLuminance = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x2050000000;
    v23 = (void *)getFBDisplayManagerClass_softClass;
    v35 = getFBDisplayManagerClass_softClass;
    if (!getFBDisplayManagerClass_softClass)
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __getFBDisplayManagerClass_block_invoke;
      v31[3] = &unk_1E2A5A6E8;
      v31[4] = &v32;
      __getFBDisplayManagerClass_block_invoke((uint64_t)v31);
      v23 = (void *)v33[3];
    }
    v24 = objc_retainAutorelease(v23);
    _Block_object_dispose(&v32, 8);
    v25 = [CHSWidgetDisplayProperties alloc];
    objc_msgSend(v24, "mainConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[CHSWidgetDisplayProperties initWithDisplayConfiguration:](v25, "initWithDisplayConfiguration:", v26);
    displayProperties = v11->_displayProperties;
    v11->_displayProperties = (CHSWidgetDisplayProperties *)v27;

  }
  return v11;
}

- (CHSConfiguredWidgetDescriptor)initWithUniqueIdentifier:(id)a3 widget:(id)a4 metrics:(id)a5 isSuggestion:(BOOL)a6 isSystemConfigured:(BOOL)a7
{
  CHSConfiguredWidgetDescriptor *result;

  result = -[CHSConfiguredWidgetDescriptor initWithUniqueIdentifier:widget:metrics:](self, "initWithUniqueIdentifier:widget:metrics:", a3, a4, a5);
  if (result)
  {
    result->_suggestion = a6;
    result->_systemConfigured = a7;
  }
  return result;
}

- (id)_initWithDescriptor:(id)a3
{
  id v4;
  CHSConfiguredWidgetDescriptor *v5;
  CHSConfiguredWidgetDescriptor *v6;
  uint64_t v7;
  NSArray *supportedRenderSchemes;

  v4 = a3;
  v5 = -[CHSConfiguredWidgetDescriptor initWithUniqueIdentifier:widget:metrics:](self, "initWithUniqueIdentifier:widget:metrics:", *((_QWORD *)v4 + 8), *((_QWORD *)v4 + 9), *((_QWORD *)v4 + 10));
  v6 = v5;
  if (v5)
  {
    v5->_suggestion = *((_BYTE *)v4 + 16);
    v5->_systemConfigured = *((_BYTE *)v4 + 17);
    v5->_supportedColorSchemes = *((_QWORD *)v4 + 3);
    v7 = objc_msgSend(*((id *)v4 + 4), "copy");
    supportedRenderSchemes = v6->_supportedRenderSchemes;
    v6->_supportedRenderSchemes = (NSArray *)v7;

    v6->_supportsLowLuminance = *((_BYTE *)v4 + 40);
    v6->_showsWidgetLabel = *((_BYTE *)v4 + 41);
    objc_storeStrong((id *)&v6->_displayProperties, *((id *)v4 + 6));
    objc_storeStrong((id *)&v6->_refreshStrategy, *((id *)v4 + 7));
  }

  return v6;
}

- (CHSConfiguredWidgetContainerDescriptor)container
{
  return (CHSConfiguredWidgetContainerDescriptor *)objc_loadWeakRetained((id *)&self->_weak_container);
}

- (void)_setContainer:(id)a3
{
  objc_storeWeak((id *)&self->_weak_container, a3);
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
  CHSWidget *widget;
  id v15;
  id v16;
  CHSWidgetMetrics *metrics;
  id v18;
  id v19;
  _BOOL8 suggestion;
  id v21;
  id v22;
  _BOOL8 systemConfigured;
  id v24;
  id v25;
  unint64_t supportedColorSchemes;
  id v27;
  id v28;
  NSArray *supportedRenderSchemes;
  id v30;
  id v31;
  _BOOL8 supportsLowLuminance;
  id v33;
  id v34;
  _BOOL8 showsWidgetLabel;
  id v36;
  id v37;
  CHSWidgetDisplayProperties *displayProperties;
  id v39;
  id v40;
  CHSWidgetRefreshStrategy *refreshStrategy;
  id v42;
  char v43;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;

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
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke;
    v65[3] = &unk_1E2A5A5A8;
    v12 = v9;
    v66 = v12;
    v13 = (id)objc_msgSend(v5, "appendString:counterpart:", uniqueIdentifier, v65);
    widget = self->_widget;
    v63[0] = v11;
    v63[1] = 3221225472;
    v63[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_2;
    v63[3] = &unk_1E2A5A268;
    v15 = v12;
    v64 = v15;
    v16 = (id)objc_msgSend(v5, "appendObject:counterpart:", widget, v63);
    metrics = self->_metrics;
    v61[0] = v11;
    v61[1] = 3221225472;
    v61[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_3;
    v61[3] = &unk_1E2A5A268;
    v18 = v15;
    v62 = v18;
    v19 = (id)objc_msgSend(v5, "appendObject:counterpart:", metrics, v61);
    suggestion = self->_suggestion;
    v59[0] = v11;
    v59[1] = 3221225472;
    v59[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_4;
    v59[3] = &unk_1E2A5A508;
    v21 = v18;
    v60 = v21;
    v22 = (id)objc_msgSend(v5, "appendBool:counterpart:", suggestion, v59);
    systemConfigured = self->_systemConfigured;
    v57[0] = v11;
    v57[1] = 3221225472;
    v57[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_5;
    v57[3] = &unk_1E2A5A508;
    v24 = v21;
    v58 = v24;
    v25 = (id)objc_msgSend(v5, "appendBool:counterpart:", systemConfigured, v57);
    supportedColorSchemes = self->_supportedColorSchemes;
    v55[0] = v11;
    v55[1] = 3221225472;
    v55[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_6;
    v55[3] = &unk_1E2A5A558;
    v27 = v24;
    v56 = v27;
    v28 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", supportedColorSchemes, v55);
    supportedRenderSchemes = self->_supportedRenderSchemes;
    v53[0] = v11;
    v53[1] = 3221225472;
    v53[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_7;
    v53[3] = &unk_1E2A5A268;
    v30 = v27;
    v54 = v30;
    v31 = (id)objc_msgSend(v5, "appendObject:counterpart:", supportedRenderSchemes, v53);
    supportsLowLuminance = self->_supportsLowLuminance;
    v51[0] = v11;
    v51[1] = 3221225472;
    v51[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_8;
    v51[3] = &unk_1E2A5A508;
    v33 = v30;
    v52 = v33;
    v34 = (id)objc_msgSend(v5, "appendBool:counterpart:", supportsLowLuminance, v51);
    showsWidgetLabel = self->_showsWidgetLabel;
    v49[0] = v11;
    v49[1] = 3221225472;
    v49[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_9;
    v49[3] = &unk_1E2A5A508;
    v36 = v33;
    v50 = v36;
    v37 = (id)objc_msgSend(v5, "appendBool:counterpart:", showsWidgetLabel, v49);
    displayProperties = self->_displayProperties;
    v47[0] = v11;
    v47[1] = 3221225472;
    v47[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_10;
    v47[3] = &unk_1E2A5A268;
    v39 = v36;
    v48 = v39;
    v40 = (id)objc_msgSend(v5, "appendObject:counterpart:", displayProperties, v47);
    refreshStrategy = self->_refreshStrategy;
    v45[0] = v11;
    v45[1] = 3221225472;
    v45[2] = __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_11;
    v45[3] = &unk_1E2A5A268;
    v46 = v39;
    v42 = (id)objc_msgSend(v5, "appendObject:counterpart:", refreshStrategy, v45);
    v43 = objc_msgSend(v5, "isEqual");

  }
  else
  {
    v43 = 0;
  }

  return v43;
}

id __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 64);
}

id __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 72);
}

id __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 80);
}

uint64_t __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16);
}

uint64_t __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_5(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 17);
}

uint64_t __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_6(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
}

id __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_7(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

uint64_t __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_8(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40);
}

uint64_t __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_9(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 41);
}

id __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_10(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 48);
}

id __41__CHSConfiguredWidgetDescriptor_isEqual___block_invoke_11(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 56);
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
  id v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_uniqueIdentifier);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_widget);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_metrics);
  v7 = (id)objc_msgSend(v3, "appendBool:", self->_suggestion);
  v8 = (id)objc_msgSend(v3, "appendBool:", self->_systemConfigured);
  v9 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_supportedColorSchemes);
  v10 = (id)objc_msgSend(v3, "appendObject:", self->_supportedRenderSchemes);
  v11 = (id)objc_msgSend(v3, "appendBool:", self->_supportsLowLuminance);
  v12 = (id)objc_msgSend(v3, "appendBool:", self->_showsWidgetLabel);
  v13 = (id)objc_msgSend(v3, "appendObject:", self->_displayProperties);
  v14 = (id)objc_msgSend(v3, "appendObject:", self->_refreshStrategy);
  v15 = objc_msgSend(v3, "hash");

  return v15;
}

- (NSString)description
{
  return (NSString *)-[CHSConfiguredWidgetDescriptor descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CHSConfiguredWidgetDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[CHSConfiguredWidgetDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  CHSConfiguredWidgetDescriptor *v11;

  v4 = a3;
  -[CHSConfiguredWidgetDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__CHSConfiguredWidgetDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E2A5A290;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);
  v7 = v6;

  return v7;
}

id __71__CHSConfiguredWidgetDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("uniqueIdentifier"));
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72), CFSTR("widget"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), CFSTR("metrics"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("isSuggestion"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 17), CFSTR("isSystemConfigured"));
  v6 = *(void **)(a1 + 32);
  NSStringFromCHSWidgetColorSchemes(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v7, CFSTR("supportedColorSchemes"));

  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("supportedRenderSchemes"));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("supportsLowLuminance"));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 41), CFSTR("showsWidgetLabel"));
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("displayProperties"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("refreshStrategy"));
}

- (CHSExtensionIdentity)extensionIdentity
{
  return -[CHSWidget extensionIdentity](self->_widget, "extensionIdentity");
}

- (BOOL)matches:(id)a3
{
  return -[CHSWidget matches:](self->_widget, "matches:", a3);
}

- (NSString)kind
{
  return -[CHSWidget kind](self->_widget, "kind");
}

- (id)extensionBundleIdentifier
{
  void *v2;
  void *v3;

  -[CHSWidget extensionIdentity](self->_widget, "extensionIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)matchesPersonality:(id)a3
{
  return -[CHSWidget matchesPersonality:](self->_widget, "matchesPersonality:", a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CHSConfiguredWidgetDescriptor _initWithDescriptor:]([CHSMutableConfiguredWidgetDescriptor alloc], "_initWithDescriptor:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_widget, CFSTR("widget"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metrics, CFSTR("metrics"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_suggestion, CFSTR("isSuggestion"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_systemConfigured, CFSTR("isSystemConfigured"));
  objc_msgSend(v4, "encodeInt32:forKey:", LODWORD(self->_supportedColorSchemes), CFSTR("supportedColorSchemes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedRenderSchemes, CFSTR("supportedRenderSchemes2"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsLowLuminance, CFSTR("supportsLowLuminance"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_showsWidgetLabel, CFSTR("showsWidgetLabel"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayProperties, CFSTR("displayProperties"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_refreshStrategy, CFSTR("refreshStrategy"));

}

- (CHSConfiguredWidgetDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  int IsValid;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  CHSWidgetRenderScheme *v12;
  void *v13;
  char v14;
  uint64_t v15;
  CHSWidgetRenderScheme *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  char v22;
  char v23;
  CHSConfiguredWidgetDescriptor *v24;
  BOOL v25;
  CHSConfiguredWidgetDescriptor *v26;
  CHSConfiguredWidgetDescriptor *v27;
  uint64_t v28;
  NSArray *supportedRenderSchemes;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  id obj;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widget"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSystemConfigured"));
  v33 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSuggestion"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayProperties"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("supportedColorSchemes")))
  {
    v31 = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("supportedColorSchemes"));
    IsValid = CHSWidgetColorSchemesIsValid();
  }
  else
  {
    CHSLogChronoServices();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v41 = v37;
      _os_log_impl(&dword_18FB18000, v7, OS_LOG_TYPE_DEFAULT, "Cannot find color schemes encoded; using all as a fallback for %{public}@",
        buf,
        0xCu);
    }

    v31 = -1;
    IsValid = 1;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("supportedRenderSchemes2"), v31))
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("supportedRenderSchemes2"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("supportedRenderSchemes")))
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("supportedRenderSchemes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __47__CHSConfiguredWidgetDescriptor_initWithCoder___block_invoke;
    v38[3] = &unk_1E2A5B3C8;
    v11 = v10;
    v39 = v11;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v38);
    v12 = (CHSWidgetRenderScheme *)v11;

    v13 = v39;
    v8 = v12;
LABEL_19:

    goto LABEL_21;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("supportedRenderingModes")))
  {
    v14 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("supportedRenderingModes"));
    if (CHSWidgetRenderingModesIsValid(v14))
    {
      v15 = v14 & 6;
      if ((v14 & 1) == 0)
      {
        v8 = (void *)MEMORY[0x1E0C9AA60];
LABEL_17:
        if (!v15)
          goto LABEL_21;
        v12 = -[CHSWidgetRenderScheme initWithRenderingModes:backgroundViewPolicy:]([CHSWidgetRenderScheme alloc], "initWithRenderingModes:backgroundViewPolicy:", v15, 1);
        -[CHSWidgetRenderScheme _compatibilityRenderSchemesFromDeprecatedRenderingModes](v12, "_compatibilityRenderSchemesFromDeprecatedRenderingModes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v13);
        v18 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v18;
        goto LABEL_19;
      }
LABEL_16:
      v16 = -[CHSWidgetRenderScheme initWithRenderingModes:backgroundViewPolicy:]([CHSWidgetRenderScheme alloc], "initWithRenderingModes:backgroundViewPolicy:", 1, 0);
      -[CHSWidgetRenderScheme _compatibilityRenderSchemesFromDeprecatedRenderingModes](v16, "_compatibilityRenderSchemesFromDeprecatedRenderingModes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObjectsFromArray:", v17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
  }
  else if ((objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsTinting")) & 1) != 0)
  {
    v15 = 6;
    goto LABEL_16;
  }
  v8 = (void *)MEMORY[0x1E0C9AA60];
LABEL_21:
  v19 = objc_msgSend(v8, "count");
  +[CHSWidgetRefreshStrategyFactory defaultStrategy](CHSWidgetRefreshStrategyFactory, "defaultStrategy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("refreshStrategy")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("refreshStrategy"));
    v21 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v21;
  }
  v22 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsLowLuminance"));
  v23 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsWidgetLabel"));
  v24 = 0;
  if (v37 && v36 && v5 && ((IsValid ^ 1) & 1) == 0 && v19)
  {
    v25 = v23;
    v26 = -[CHSConfiguredWidgetDescriptor initWithUniqueIdentifier:widget:metrics:](self, "initWithUniqueIdentifier:widget:metrics:", v36, v37, v5);
    v27 = v26;
    if (v26)
    {
      v26->_suggestion = v33;
      v26->_systemConfigured = v34;
      v26->_supportedColorSchemes = v32;
      v28 = objc_msgSend(v8, "copy");
      supportedRenderSchemes = v27->_supportedRenderSchemes;
      v27->_supportedRenderSchemes = (NSArray *)v28;

      v27->_supportsLowLuminance = v22;
      v27->_showsWidgetLabel = v25;
      objc_storeStrong((id *)&v27->_displayProperties, obj);
      objc_storeStrong((id *)&v27->_refreshStrategy, v20);
    }
    self = v27;
    v24 = self;
  }

  return v24;
}

void __47__CHSConfiguredWidgetDescriptor_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "_compatibilityRenderSchemesFromDeprecatedRenderingModes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);

}

- (unint64_t)supportedRenderingModes
{
  NSArray *supportedRenderSchemes;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  supportedRenderSchemes = self->_supportedRenderSchemes;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__CHSConfiguredWidgetDescriptor_supportedRenderingModes__block_invoke;
  v5[3] = &unk_1E2A5B3F0;
  v5[4] = &v6;
  -[NSArray enumerateObjectsUsingBlock:](supportedRenderSchemes, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

unint64_t __56__CHSConfiguredWidgetDescriptor_supportedRenderingModes__block_invoke(uint64_t a1, void *a2)
{
  unint64_t result;

  result = objc_msgSend(a2, "renderingMode");
  if (result <= 2)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= qword_18FBD52D8[result];
  return result;
}

- (BOOL)supportsTinting
{
  NSArray *supportedRenderSchemes;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  supportedRenderSchemes = self->_supportedRenderSchemes;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__CHSConfiguredWidgetDescriptor_supportsTinting__block_invoke;
  v5[3] = &unk_1E2A5B3F0;
  v5[4] = &v6;
  -[NSArray enumerateObjectsUsingBlock:](supportedRenderSchemes, "enumerateObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __48__CHSConfiguredWidgetDescriptor_supportsTinting__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "renderingMode") == 4 || objc_msgSend(v6, "renderingMode") == 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (CHSWidget)widget
{
  return self->_widget;
}

- (CHSWidgetMetrics)metrics
{
  return self->_metrics;
}

- (BOOL)isSuggestion
{
  return self->_suggestion;
}

- (BOOL)isSystemConfigured
{
  return self->_systemConfigured;
}

- (unint64_t)supportedColorSchemes
{
  return self->_supportedColorSchemes;
}

- (NSArray)supportedRenderSchemes
{
  return self->_supportedRenderSchemes;
}

- (BOOL)supportsLowLuminance
{
  return self->_supportsLowLuminance;
}

- (BOOL)showsWidgetLabel
{
  return self->_showsWidgetLabel;
}

- (CHSWidgetDisplayProperties)displayProperties
{
  return self->_displayProperties;
}

- (CHSWidgetRefreshStrategy)refreshStrategy
{
  return self->_refreshStrategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_widget, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_refreshStrategy, 0);
  objc_storeStrong((id *)&self->_displayProperties, 0);
  objc_storeStrong((id *)&self->_supportedRenderSchemes, 0);
  objc_destroyWeak((id *)&self->_weak_container);
}

@end
