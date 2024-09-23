@implementation QLImageItemTransformerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLImageItemTransformer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("QLItemTransformerProtocol"), CFSTR("transformedContentsFromData:context:error:"));
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("QLItemTransformerProtocol"), CFSTR("transformedContentsFromURL:context:error:"));

}

- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)QLImageItemTransformerAccessibility;
  v7 = a4;
  -[QLImageItemTransformerAccessibility transformedContentsFromData:context:error:](&v11, sel_transformedContentsFromData_context_error_, a3, v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel", v11.receiver, v11.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAccessibilityLabel:", v9);
  return v8;
}

- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)QLImageItemTransformerAccessibility;
  v7 = a4;
  -[QLImageItemTransformerAccessibility transformedContentsFromURL:context:error:](&v11, sel_transformedContentsFromURL_context_error_, a3, v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel", v11.receiver, v11.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAccessibilityLabel:", v9);
  return v8;
}

@end
