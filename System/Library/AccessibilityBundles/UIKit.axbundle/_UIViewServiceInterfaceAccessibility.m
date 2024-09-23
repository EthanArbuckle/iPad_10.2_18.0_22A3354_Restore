@implementation _UIViewServiceInterfaceAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIViewServiceInterface");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIViewServiceInterface");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIViewServiceInterface"), CFSTR("_serviceProcessAssertion"), "BKSProcessAssertion");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("BKSProcessAssertion"), CFSTR("_target"), "RBSTarget");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("RBSTarget"), CFSTR("_processIdentifier"), "RBSProcessIdentifier");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RBSProcessIdentifier"), CFSTR("pid"), "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIConcreteRemoteViewService"), CFSTR("plugin"), "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_terminateUnconditionallyThen:"), "v", "@?", 0);
  objc_storeStrong(v5, obj);
}

- (void)_terminateUnconditionallyThen:(id)a3
{
  id v3;
  _UIRemotePidManagerAccessibility *v4;
  id v5;
  _UIRemotePidManagerAccessibility *v6;
  id v7;
  id v8;
  id v9;
  unsigned int v10;
  id v11;
  objc_super v12;
  id v13;
  id v14;
  unsigned int v15;
  id v16;
  id v17;
  char v18;
  id v19;
  id location[2];
  _UIViewServiceInterfaceAccessibility *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_opt_class();
  v11 = (id)-[_UIViewServiceInterfaceAccessibility safeValueForKey:](v21, "safeValueForKey:", CFSTR("_serviceProcessAssertion"));
  v17 = (id)__UIAccessibilityCastAsClass();

  v16 = v17;
  objc_storeStrong(&v17, 0);
  v19 = v16;
  v9 = (id)objc_msgSend(v16, "safeValueForKey:", CFSTR("_target"));
  v8 = (id)objc_msgSend(v9, "safeValueForKey:", CFSTR("_processIdentifier"));
  v7 = (id)objc_msgSend(v8, "safeValueForKey:", CFSTR("pid"));
  v10 = objc_msgSend(v7, "longValue");

  v15 = v10;
  if (v10)
  {
    v14 = (id)-[_UIViewServiceInterfaceAccessibility safeValueForKeyPath:](v21, "safeValueForKeyPath:", CFSTR("_service.plugin"));
    if ((objc_msgSend(v14, "conformsToProtocol:", &unk_255ED6F10) & 1) != 0)
    {
      v13 = v14;
      if ((objc_msgSend(v13, "active") & 1) == 0)
      {
        v6 = +[_UIRemotePidManagerAccessibility sharedInstance](_UIRemotePidManagerAccessibility, "sharedInstance");
        v5 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), v19);
        -[_UIRemotePidManagerAccessibility suspendPid:forAssertionPointer:](v6, "suspendPid:forAssertionPointer:", v15);

      }
      objc_storeStrong(&v13, 0);
    }
    else
    {
      v4 = +[_UIRemotePidManagerAccessibility sharedInstance](_UIRemotePidManagerAccessibility, "sharedInstance");
      v3 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), v19);
      -[_UIRemotePidManagerAccessibility suspendPid:forAssertionPointer:](v4, "suspendPid:forAssertionPointer:", v15);

    }
    objc_storeStrong(&v14, 0);
  }
  v12.receiver = v21;
  v12.super_class = (Class)_UIViewServiceInterfaceAccessibility;
  -[_UIViewServiceInterfaceAccessibility _terminateUnconditionallyThen:](&v12, sel__terminateUnconditionallyThen_, location[0]);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

@end
