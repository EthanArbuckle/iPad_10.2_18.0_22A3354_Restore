@implementation HFAnalyticsTileInteractionEvent

- (HFAnalyticsTileInteractionEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  HFAnalyticsTileInteractionEvent *v16;
  HFAnalyticsTileInteractionEvent *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSString *v22;
  NSString *itemClassName;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSString *processName;
  objc_class *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  objc_super v37;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interactionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (!v6)
    NSLog(CFSTR("HFAnalyticsTileInteractionEvent interactionType is invalid"));
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("item"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (!v9)
    NSLog(CFSTR("HFAnalyticsTileInteractionEvent item is nil"));
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tileInteractionArea"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  v37.receiver = self;
  v37.super_class = (Class)HFAnalyticsTileInteractionEvent;
  v16 = -[HFAnalyticsEvent initWithEventType:](&v37, sel_initWithEventType_, 13);
  v17 = v16;
  if (v16)
  {
    v16->_interactionType = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("room"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_isRoomDashboard = v18 != 0;

    objc_opt_class();
    v17->_isActionSetItem = objc_opt_isKindOfClass() & 1;
    objc_opt_class();
    v17->_isCameraItem = objc_opt_isKindOfClass() & 1;
    v17->_isServiceLikeItem = objc_msgSend(v9, "conformsToProtocol:", &unk_1F03F0E10);
    objc_opt_class();
    v17->_isStatusItem = objc_opt_isKindOfClass() & 1;
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("overrideItemClassName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    if (objc_msgSend(v21, "length"))
    {
      v22 = (NSString *)v21;
    }
    else
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    itemClassName = v17->_itemClassName;
    v17->_itemClassName = v22;

    objc_msgSend(v9, "latestResults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("state"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_itemPrimaryState = objc_msgSend(v26, "integerValue");

    objc_msgSend(v9, "latestResults");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("priority"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_itemPriority = objc_msgSend(v28, "integerValue");

    v17->_numberOfRepresentedHomeKitObjects = objc_msgSend((id)objc_opt_class(), "_numberOfRepresentedHomeKitObjectsForItem:", v9);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "processName");
    v30 = objc_claimAutoreleasedReturnValue();
    processName = v17->_processName;
    v17->_processName = (NSString *)v30;

    if (v15)
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = CFSTR("nil");
    }
    objc_storeStrong((id *)&v17->_sourceViewControllerClassName, v33);
    if (v15)

    objc_storeStrong((id *)&v17->_tileInteractionArea, v11);
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dashboardContextType"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v34;
    else
      v35 = 0;
    objc_storeStrong((id *)&v17->_contextType, v35);

  }
  return v17;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HFAnalyticsTileInteractionEvent;
  -[HFAnalyticsEvent payload](&v21, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFAnalyticsTileInteractionEvent interactionType](self, "interactionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("interactionType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsTileInteractionEvent isRoomDashboard](self, "isRoomDashboard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("isRoomDashboard"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsTileInteractionEvent isActionSetItem](self, "isActionSetItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("isActionSetItem"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsTileInteractionEvent isCameraItem](self, "isCameraItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("isCameraItem"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsTileInteractionEvent isServiceLikeItem](self, "isServiceLikeItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("isServiceLikeItem"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsTileInteractionEvent isStatusItem](self, "isStatusItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("isStatusItem"));

  -[HFAnalyticsTileInteractionEvent itemClassName](self, "itemClassName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("item"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFAnalyticsTileInteractionEvent numberOfRepresentedHomeKitObjects](self, "numberOfRepresentedHomeKitObjects"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("numberOfRepresentedHomeKitObjects"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HFAnalyticsTileInteractionEvent itemPrimaryState](self, "itemPrimaryState"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("primaryState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HFAnalyticsTileInteractionEvent itemPriority](self, "itemPriority"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("priority"));

  -[HFAnalyticsTileInteractionEvent processName](self, "processName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("processName"));

  -[HFAnalyticsTileInteractionEvent sourceViewControllerClassName](self, "sourceViewControllerClassName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("sourceViewController"));

  -[HFAnalyticsTileInteractionEvent tileIsEditing](self, "tileIsEditing");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("tileIsEditing"));

  -[HFAnalyticsTileInteractionEvent tileInteractionArea](self, "tileInteractionArea");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("tileInteractionArea"));

  -[HFAnalyticsTileInteractionEvent contextType](self, "contextType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("dashboardContext"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1EA7CCBB0, CFSTR("homeAppEventCount"));
  return v4;
}

+ (unint64_t)_numberOfRepresentedHomeKitObjectsForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  unsigned int v8;
  void *v10;
  unint64_t v11;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "latestResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("representedHomeKitObjects"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v7;

    v11 = objc_msgSend(v10, "count");
    return v11;
  }
  else
  {
    v8 = objc_msgSend(v3, "conformsToProtocol:", &unk_1F03F0850);

    return v8;
  }
}

- (unint64_t)interactionType
{
  return self->_interactionType;
}

- (void)setInteractionType:(unint64_t)a3
{
  self->_interactionType = a3;
}

- (BOOL)isRoomDashboard
{
  return self->_isRoomDashboard;
}

- (void)setIsRoomDashboard:(BOOL)a3
{
  self->_isRoomDashboard = a3;
}

- (BOOL)isActionSetItem
{
  return self->_isActionSetItem;
}

- (void)setIsActionSetItem:(BOOL)a3
{
  self->_isActionSetItem = a3;
}

- (BOOL)isCameraItem
{
  return self->_isCameraItem;
}

- (void)setIsCameraItem:(BOOL)a3
{
  self->_isCameraItem = a3;
}

- (BOOL)isServiceLikeItem
{
  return self->_isServiceLikeItem;
}

- (void)setIsServiceLikeItem:(BOOL)a3
{
  self->_isServiceLikeItem = a3;
}

- (BOOL)isStatusItem
{
  return self->_isStatusItem;
}

- (void)setIsStatusItem:(BOOL)a3
{
  self->_isStatusItem = a3;
}

- (NSNumber)tileIsEditing
{
  return self->_tileIsEditing;
}

- (void)setTileIsEditing:(id)a3
{
  self->_tileIsEditing = (NSNumber *)a3;
}

- (NSString)tileInteractionArea
{
  return self->_tileInteractionArea;
}

- (void)setTileInteractionArea:(id)a3
{
  objc_storeStrong((id *)&self->_tileInteractionArea, a3);
}

- (NSString)itemClassName
{
  return self->_itemClassName;
}

- (void)setItemClassName:(id)a3
{
  objc_storeStrong((id *)&self->_itemClassName, a3);
}

- (int64_t)itemPrimaryState
{
  return self->_itemPrimaryState;
}

- (void)setItemPrimaryState:(int64_t)a3
{
  self->_itemPrimaryState = a3;
}

- (int64_t)itemPriority
{
  return self->_itemPriority;
}

- (void)setItemPriority:(int64_t)a3
{
  self->_itemPriority = a3;
}

- (unint64_t)numberOfRepresentedHomeKitObjects
{
  return self->_numberOfRepresentedHomeKitObjects;
}

- (void)setNumberOfRepresentedHomeKitObjects:(unint64_t)a3
{
  self->_numberOfRepresentedHomeKitObjects = a3;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (NSString)sourceViewControllerClassName
{
  return self->_sourceViewControllerClassName;
}

- (void)setSourceViewControllerClassName:(id)a3
{
  objc_storeStrong((id *)&self->_sourceViewControllerClassName, a3);
}

- (NSString)contextType
{
  return self->_contextType;
}

- (void)setContextType:(id)a3
{
  objc_storeStrong((id *)&self->_contextType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextType, 0);
  objc_storeStrong((id *)&self->_sourceViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_itemClassName, 0);
  objc_storeStrong((id *)&self->_tileInteractionArea, 0);
}

@end
