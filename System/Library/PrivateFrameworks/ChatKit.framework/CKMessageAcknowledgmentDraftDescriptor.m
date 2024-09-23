@implementation CKMessageAcknowledgmentDraftDescriptor

- (CKMessageAcknowledgmentDraftDescriptor)initWithMessageAcknowledgmentType:(int64_t)a3 serviceName:(id)a4
{
  id v6;
  CKMessageAcknowledgmentDraftDescriptor *v7;
  CKMessageAcknowledgmentDraftDescriptor *v8;
  uint64_t v9;
  NSString *serviceName;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKMessageAcknowledgmentDraftDescriptor;
  v7 = -[CKMessageAcknowledgmentDraftDescriptor init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_messageAcknowledgmentType = a3;
    v9 = objc_msgSend(v6, "copy");
    serviceName = v8->_serviceName;
    v8->_serviceName = (NSString *)v9;

  }
  return v8;
}

- (NSString)acknowledgmentImageName
{
  void *v3;
  void *v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageAcknowledgmentImageNameForType:", -[CKMessageAcknowledgmentDraftDescriptor messageAcknowledgmentType](self, "messageAcknowledgmentType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)symbolName
{
  int64_t v2;

  v2 = -[CKMessageAcknowledgmentDraftDescriptor messageAcknowledgmentType](self, "messageAcknowledgmentType");
  if ((unint64_t)(v2 - 2000) > 5)
    return 0;
  else
    return off_1E2750A38[v2 - 2000];
}

- (int64_t)themeColor
{
  if (self->_messageAcknowledgmentType == 2000)
    return -[NSString isEqualToString:](self->_serviceName, "isEqualToString:", *MEMORY[0x1E0D38F68]);
  else
    return 0;
}

- (UIColor)acknowledgmentImageColor
{
  void *v2;
  void *v3;
  void *v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageAcknowledgment:acknowledgmentImageColor:", 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (UIColor)selectedAcknowledgmentImageColor
{
  void *v3;
  void *v4;
  void *v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageAcknowledgment:selectedAcknowledgmentImageColor:", 2, -[CKMessageAcknowledgmentDraftDescriptor themeColor](self, "themeColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v5;
}

- (UIColor)selectedBalloonColor
{
  void *v3;
  void *v4;
  void *v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageAcknowledgmentSelectedBalloonColorForStyle:serviceName:", 2, self->_serviceName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v5;
}

+ (id)acknowledgmentBarColor
{
  void *v2;
  void *v3;
  void *v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageAcknowledgmentBalloonColorForStyle:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allMessageAcknowledgmentDescriptorsWithServiceName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CKMessageAcknowledgmentDraftDescriptor *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageAcknowledgmentPickerBarAcknowledgmentOrder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = -[CKMessageAcknowledgmentDraftDescriptor initWithMessageAcknowledgmentType:serviceName:]([CKMessageAcknowledgmentDraftDescriptor alloc], "initWithMessageAcknowledgmentType:serviceName:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "integerValue"), v3);
        objc_msgSend(v4, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v4;
}

- (int64_t)messageAcknowledgmentType
{
  return self->_messageAcknowledgmentType;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
