@implementation INJoinCallIntent

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INJoinCallIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INJoinCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INJoinCallIntent)initWithGroupConversationFilter:(id)a3 groupConversation:(id)a4
{
  id v6;
  id v7;
  INJoinCallIntent *v8;
  INJoinCallIntent *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INJoinCallIntent;
  v8 = -[INIntent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[INJoinCallIntent setGroupConversationFilter:](v8, "setGroupConversationFilter:", v6);
    -[INJoinCallIntent setGroupConversation:](v9, "setGroupConversation:", v7);
  }

  return v9;
}

- (INCallGroupConversationFilter)groupConversationFilter
{
  void *v2;
  void *v3;
  void *v4;

  -[INJoinCallIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupConversationFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromCallGroupConversationFilter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INCallGroupConversationFilter *)v4;
}

- (void)setGroupConversationFilter:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INJoinCallIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToCallGroupConversationFilter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setGroupConversationFilter:", v5);
}

- (INCallGroupConversation)groupConversation
{
  void *v2;
  void *v3;
  void *v4;

  -[INJoinCallIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupConversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromCallGroupConversation(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INCallGroupConversation *)v4;
}

- (void)setGroupConversation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INJoinCallIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToCallGroupConversation(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setGroupConversation:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("groupConversationFilter");
  -[INJoinCallIntent groupConversationFilter](self, "groupConversationFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("groupConversation");
  v10[0] = v4;
  -[INJoinCallIntent groupConversation](self, "groupConversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)

  if (!v3)
  return v7;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INJoinCallIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("Calls");
}

- (id)verb
{
  return CFSTR("JoinCall");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
