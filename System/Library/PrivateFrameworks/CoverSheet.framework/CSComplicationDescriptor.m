@implementation CSComplicationDescriptor

- (CSComplicationDescriptor)initWithUniqueIdentifier:(id)a3 widget:(id)a4 metrics:(id)a5 blockedForScreenTimeExpiration:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  CSComplicationDescriptor *v14;
  CSComplicationDescriptor *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CSComplicationDescriptor;
  v14 = -[CSComplicationDescriptor init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_uniqueIdentifier, a3);
    objc_storeStrong((id *)&v15->_widget, a4);
    objc_storeStrong((id *)&v15->_metrics, a5);
    v15->_blockedForScreenTimeExpiration = a6;
  }

  return v15;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"), 1);
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_widget, CFSTR("widget"), 1);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)descriptorBlockedForScreenTimeExpiration:(BOOL)a3
{
  return -[CSComplicationDescriptor initWithUniqueIdentifier:widget:metrics:blockedForScreenTimeExpiration:]([CSComplicationDescriptor alloc], "initWithUniqueIdentifier:widget:metrics:blockedForScreenTimeExpiration:", self->_uniqueIdentifier, self->_widget, self->_metrics, a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSString *uniqueIdentifier;
  uint64_t v7;
  id v8;
  id v9;
  CHSWidget *widget;
  id v11;
  id v12;
  CHSWidgetMetrics *metrics;
  id v14;
  id v15;
  uint64_t blockedForScreenTimeExpiration;
  id v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uniqueIdentifier = self->_uniqueIdentifier;
  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __36__CSComplicationDescriptor_isEqual___block_invoke;
  v29[3] = &unk_1E8E2FC80;
  v8 = v4;
  v30 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", uniqueIdentifier, v29);
  widget = self->_widget;
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __36__CSComplicationDescriptor_isEqual___block_invoke_2;
  v27[3] = &unk_1E8E2FCA8;
  v11 = v8;
  v28 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", widget, v27);
  metrics = self->_metrics;
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __36__CSComplicationDescriptor_isEqual___block_invoke_3;
  v25[3] = &unk_1E8E2FCD0;
  v14 = v11;
  v26 = v14;
  v15 = (id)objc_msgSend(v5, "appendObject:counterpart:", metrics, v25);
  blockedForScreenTimeExpiration = self->_blockedForScreenTimeExpiration;
  v20 = v7;
  v21 = 3221225472;
  v22 = __36__CSComplicationDescriptor_isEqual___block_invoke_4;
  v23 = &unk_1E8E2FCF8;
  v24 = v14;
  v17 = v14;
  v18 = (id)objc_msgSend(v5, "appendBool:counterpart:", blockedForScreenTimeExpiration, &v20);
  LOBYTE(blockedForScreenTimeExpiration) = objc_msgSend(v5, "isEqual", v20, v21, v22, v23);

  return blockedForScreenTimeExpiration;
}

id __36__CSComplicationDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

id __36__CSComplicationDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

id __36__CSComplicationDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

uint64_t __36__CSComplicationDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUniqueIdentifier:widget:metrics:blockedForScreenTimeExpiration:", self->_uniqueIdentifier, self->_widget, self->_metrics, self->_blockedForScreenTimeExpiration);
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

- (BOOL)isBlockedForScreenTimeExpiration
{
  return self->_blockedForScreenTimeExpiration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_widget, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
