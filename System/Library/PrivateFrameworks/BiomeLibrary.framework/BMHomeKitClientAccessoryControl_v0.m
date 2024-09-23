@implementation BMHomeKitClientAccessoryControl_v0

- (id)accessoryState
{
  void *v2;
  BMHomeKitAccessoryState_v0 *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BMHomeKitAccessoryState_v0 *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BMHomeKitClientAccessoryControl_v0;
  -[BMHomeKitClientAccessoryControl accessoryState](&v12, sel_accessoryState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [BMHomeKitAccessoryState_v0 alloc];
  objc_msgSend(v2, "mediaPropertyType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "valueType");
  objc_msgSend(v2, "dataValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "numValue");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BMHomeKitAccessoryState initWithMediaPropertyType:valueType:dataValue:stringValue:numValue:](v3, "initWithMediaPropertyType:valueType:dataValue:stringValue:numValue:", v4, v5, v6, v7, v9);

  return v10;
}

@end
