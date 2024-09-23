@implementation CHSMutableAvocadoDescriptor

- (CHSMutableAvocadoDescriptor)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 supportedFamilies:(unint64_t)a5 intentType:(id)a6
{
  id v10;
  id v11;
  id v12;
  CHSMutableWidgetDescriptor *v13;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[CHSWidgetDescriptor initWithExtensionBundleIdentifier:kind:supportedFamilies:intentType:]([CHSMutableWidgetDescriptor alloc], "initWithExtensionBundleIdentifier:kind:supportedFamilies:intentType:", v10, v11, a5, v12);

  return (CHSMutableAvocadoDescriptor *)v13;
}

- (CHSMutableAvocadoDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 supportedFamilies:(unint64_t)a6 intentType:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CHSMutableWidgetDescriptor *v16;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = -[CHSWidgetDescriptor initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:supportedFamilies:intentType:]([CHSMutableWidgetDescriptor alloc], "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:supportedFamilies:intentType:", v12, v13, v14, a6, v15);

  return (CHSMutableAvocadoDescriptor *)v16;
}

- (CHSMutableAvocadoDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 displayName:(id)a6 intentType:(id)a7 supportedSizeClasses:(unint64_t)a8 widgetDescription:(id)a9 widgetVisibility:(int64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CHSMutableWidgetDescriptor *v22;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = -[CHSWidgetDescriptor initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:displayName:intentType:supportedSizeClasses:widgetDescription:widgetVisibility:]([CHSMutableWidgetDescriptor alloc], "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:displayName:intentType:supportedSizeClasses:widgetDescription:widgetVisibility:", v16, v17, v18, v19, v20, a8, v21, a10);

  return (CHSMutableAvocadoDescriptor *)v22;
}

- (CHSMutableAvocadoDescriptor)initWithCoder:(id)a3
{
  id v4;
  CHSMutableWidgetDescriptor *v5;

  v4 = a3;
  v5 = -[CHSWidgetDescriptor initWithCoder:]([CHSMutableWidgetDescriptor alloc], "initWithCoder:", v4);

  return (CHSMutableAvocadoDescriptor *)v5;
}

@end
