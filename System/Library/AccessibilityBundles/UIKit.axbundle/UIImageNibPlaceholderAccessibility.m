@implementation UIImageNibPlaceholderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIImageNibPlaceholder");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (UIImageNibPlaceholderAccessibility)initWithData:(id)a3 andRuntimeResourceName:(id)a4
{
  UIImageNibPlaceholderAccessibility *v4;
  UIImageNibPlaceholderAccessibility *v7;
  objc_super v8;
  id v9;
  id location[2];
  UIImageNibPlaceholderAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)UIImageNibPlaceholderAccessibility;
  v11 = -[UIImageNibPlaceholderAccessibility initWithData:andRuntimeResourceName:](&v8, sel_initWithData_andRuntimeResourceName_, location[0], v9);
  objc_storeStrong((id *)&v11, v11);
  -[UIImageNibPlaceholderAccessibility accessibilitySetIdentification:](v11, "accessibilitySetIdentification:", v9);
  v7 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (UIImageNibPlaceholderAccessibility)initWithCoder:(id)a3
{
  UIImageNibPlaceholderAccessibility *v3;
  UIImageNibPlaceholderAccessibility *v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  UIImageNibPlaceholderAccessibility *v11;
  id v12;
  id v13;
  objc_super v14;
  UIImageNibPlaceholderAccessibility *v15;
  id location[2];
  UIImageNibPlaceholderAccessibility *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v17;
  v17 = 0;
  v14.receiver = v3;
  v14.super_class = (Class)UIImageNibPlaceholderAccessibility;
  v17 = -[UIImageNibPlaceholderAccessibility initWithCoder:](&v14, sel_initWithCoder_, location[0]);
  v15 = v17;
  v13 = (id)objc_msgSend(location[0], "decodeObjectForKey:", CFSTR("UIResourceName"));
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __52__UIImageNibPlaceholderAccessibility_initWithCoder___block_invoke;
  v10 = &unk_24FF3E050;
  v11 = v15;
  v12 = v13;
  AXPerformSafeBlock();
  v5 = v15;
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v5;
}

uint64_t __52__UIImageNibPlaceholderAccessibility_initWithCoder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilitySetIdentification:", *(_QWORD *)(a1 + 40), a1, a1);
}

@end
