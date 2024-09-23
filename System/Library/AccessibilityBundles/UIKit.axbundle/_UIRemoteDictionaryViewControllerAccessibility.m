@implementation _UIRemoteDictionaryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIRemoteDictionaryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id v5;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = "@";
  v3 = CFSTR("_UIRemoteDictionaryViewController");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_handleDownloadButton:"), "v", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, CFSTR("_availableDictionaries"), "NSArray");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIDefinitionDictionary"), CFSTR("_rawAsset"), "MAAsset");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASAsset"), CFSTR("attributes"), v4, 0);
  objc_storeStrong(v6, v5);
}

- (void)_handleDownloadButton:(id)a3
{
  objc_super v3;
  id location[2];
  _UIRemoteDictionaryViewControllerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIRemoteDictionaryViewControllerAccessibility;
  -[_UIRemoteDictionaryViewControllerAccessibility _handleDownloadButton:](&v3, sel__handleDownloadButton_, location[0]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(location, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  int v20;
  int v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25[2];
  uint64_t v26;
  uint64_t *v27;
  int v28;
  int v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  id v33;
  char v34;
  id v35;
  id v36;
  id v37;
  char v38;
  id v39[2];
  int v40;
  int v41;
  void (*v42)(id *);
  void *v43;
  id v44;
  objc_super v45;
  id v46;
  id v47;
  id location[2];
  _UIRemoteDictionaryViewControllerAccessibility *v49;

  v49 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v47 = 0;
  objc_storeStrong(&v47, a4);
  v45.receiver = v49;
  v45.super_class = (Class)_UIRemoteDictionaryViewControllerAccessibility;
  v46 = -[_UIRemoteDictionaryViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v45, sel_tableView_cellForRowAtIndexPath_, location[0], v47);
  v39[1] = (id)MEMORY[0x24BDAC760];
  v40 = -1073741824;
  v41 = 0;
  v42 = __82___UIRemoteDictionaryViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke;
  v43 = &unk_24FF3DA40;
  v44 = v46;
  AXPerformSafeBlock();
  v38 = 0;
  objc_opt_class();
  v10 = (id)-[_UIRemoteDictionaryViewControllerAccessibility safeValueForKey:](v49, "safeValueForKey:", CFSTR("_availableDictionaries"));
  v37 = (id)__UIAccessibilityCastAsClass();

  v36 = v37;
  objc_storeStrong(&v37, 0);
  v39[0] = v36;
  v34 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 838860800;
  v29 = 48;
  v30 = __Block_byref_object_copy__29;
  v31 = __Block_byref_object_dispose__29;
  v32 = 0;
  v19 = MEMORY[0x24BDAC760];
  v20 = -1073741824;
  v21 = 0;
  v22 = __82___UIRemoteDictionaryViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_233;
  v23 = &unk_24FF3DAB0;
  v25[1] = &v26;
  v24 = v36;
  v25[0] = v47;
  AXPerformSafeBlock();
  v18 = (id)v27[5];
  objc_storeStrong(v25, 0);
  objc_storeStrong(&v24, 0);
  _Block_object_dispose(&v26, 8);
  objc_storeStrong(&v32, 0);
  v33 = (id)__UIAccessibilitySafeClass();

  if ((v34 & 1) != 0)
    abort();
  v17 = v33;
  objc_storeStrong(&v33, 0);
  v35 = v17;
  v15 = 0;
  v8 = (id)objc_msgSend(v17, "safeValueForKey:", CFSTR("_rawAsset"));
  v14 = (id)__UIAccessibilitySafeClass();

  v13 = v14;
  objc_storeStrong(&v14, 0);
  v16 = v13;
  v5 = (id)objc_msgSend(v13, "attributes");
  v12 = (id)objc_msgSend(v5, "objectForKey:", CFSTR("IndexLanguages"));

  v11 = (id)objc_msgSend(v12, "firstObject");
  v6 = (id)objc_msgSend(v46, "detailTextLabel");
  objc_msgSend(v6, "setAccessibilityLanguage:", v11);

  v7 = v46;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(v39, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(location, 0);
  return v7;
}

@end
