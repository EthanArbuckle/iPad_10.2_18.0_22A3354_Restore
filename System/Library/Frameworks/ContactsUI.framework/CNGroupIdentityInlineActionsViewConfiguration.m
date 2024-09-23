@implementation CNGroupIdentityInlineActionsViewConfiguration

- (CNGroupIdentityInlineActionsViewConfiguration)initWithDefaultActionItems:(id)a3 displaysUnavailableActionTypes:(BOOL)a4
{
  return -[CNGroupIdentityInlineActionsViewConfiguration initWithDefaultActionItems:displaysUnavailableActionTypes:actionViewStyle:](self, "initWithDefaultActionItems:displaysUnavailableActionTypes:actionViewStyle:", a3, a4, 7);
}

- (CNGroupIdentityInlineActionsViewConfiguration)initWithDefaultActionItems:(id)a3 displaysUnavailableActionTypes:(BOOL)a4 actionViewStyle:(int64_t)a5
{
  id v8;
  CNGroupIdentityInlineActionsViewConfiguration *v9;
  CNGroupIdentityInlineActionsViewConfiguration *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSDictionary *actionsPerType;
  uint64_t v15;
  NSArray *supportedActionTypes;
  CNGroupIdentityInlineActionsViewConfiguration *v17;
  _QWORD v19[4];
  id v20;
  objc_super v21;

  v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CNGroupIdentityInlineActionsViewConfiguration;
  v9 = -[CNGroupIdentityInlineActionsViewConfiguration init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_displaysUnavailableActionTypes = a4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __123__CNGroupIdentityInlineActionsViewConfiguration_initWithDefaultActionItems_displaysUnavailableActionTypes_actionViewStyle___block_invoke;
    v19[3] = &unk_1E20493C8;
    v20 = v11;
    v12 = v11;
    objc_msgSend(v8, "_cn_indexBy:", v19);
    v13 = objc_claimAutoreleasedReturnValue();
    actionsPerType = v10->_actionsPerType;
    v10->_actionsPerType = (NSDictionary *)v13;

    v15 = objc_msgSend(v12, "copy");
    supportedActionTypes = v10->_supportedActionTypes;
    v10->_supportedActionTypes = (NSArray *)v15;

    v10->_actionViewStyle = a5;
    v17 = v10;

  }
  return v10;
}

- (BOOL)displaysUnavailableActionTypes
{
  return self->_displaysUnavailableActionTypes;
}

- (NSArray)supportedActionTypes
{
  return self->_supportedActionTypes;
}

- (NSDictionary)actionsPerType
{
  return self->_actionsPerType;
}

- (int64_t)actionViewStyle
{
  return self->_actionViewStyle;
}

- (NSString)geminiChannelIdentifier
{
  return self->_geminiChannelIdentifier;
}

- (void)setGeminiChannelIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_geminiChannelIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geminiChannelIdentifier, 0);
  objc_storeStrong((id *)&self->_actionsPerType, 0);
  objc_storeStrong((id *)&self->_supportedActionTypes, 0);
}

id __123__CNGroupIdentityInlineActionsViewConfiguration_initWithDefaultActionItems_displaysUnavailableActionTypes_actionViewStyle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "actionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_cn_addNonNilObjectIfNotPresent:", v3);
  return v3;
}

@end
