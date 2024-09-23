@implementation _UIViewServiceInterfaceConnectionRequestAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIViewServiceInterfaceConnectionRequest");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIViewServiceInterfaceConnectionRequest");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("BKSProcessAssertion"), CFSTR("_target"), "RBSTarget");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("RBSTarget"), CFSTR("_processIdentifier"), "RBSProcessIdentifier");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RBSProcessIdentifier"), CFSTR("pid"), "i", 0);
  v4 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_cancelUnconditionallyThen:"), "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_didConnectToService"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (void)_cancelUnconditionallyThen:(id)a3
{
  id v3;
  _UIRemotePidManagerAccessibility *v4;
  id v5;
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  objc_super v10;
  unsigned int v11;
  id v12;
  id v13;
  char v14;
  id v15;
  id location[2];
  _UIViewServiceInterfaceConnectionRequestAccessibility *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_opt_class();
  v9 = (id)-[_UIViewServiceInterfaceConnectionRequestAccessibility safeValueForKey:](v17, "safeValueForKey:", CFSTR("_serviceProcessAssertion"));
  v13 = (id)__UIAccessibilityCastAsClass();

  v12 = v13;
  objc_storeStrong(&v13, 0);
  v15 = v12;
  v7 = (id)objc_msgSend(v12, "safeValueForKey:", CFSTR("_target"));
  v6 = (id)objc_msgSend(v7, "safeValueForKey:", CFSTR("_processIdentifier"));
  v5 = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("pid"));
  v8 = objc_msgSend(v5, "longValue");

  v11 = v8;
  if (v8)
  {
    v4 = +[_UIRemotePidManagerAccessibility sharedInstance](_UIRemotePidManagerAccessibility, "sharedInstance");
    v3 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), v15);
    -[_UIRemotePidManagerAccessibility suspendPid:forAssertionPointer:](v4, "suspendPid:forAssertionPointer:", v11);

  }
  v10.receiver = v17;
  v10.super_class = (Class)_UIViewServiceInterfaceConnectionRequestAccessibility;
  -[_UIViewServiceInterfaceConnectionRequestAccessibility _cancelUnconditionallyThen:](&v10, sel__cancelUnconditionallyThen_, location[0]);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)_didConnectToService
{
  id v2;
  _UIRemotePidManagerAccessibility *v3;
  id v4;
  id v5;
  id v6;
  unsigned int v7;
  id v8;
  objc_super v9;
  unsigned int v10;
  id v11;
  id v12;
  char v13;
  id v14[2];
  _UIViewServiceInterfaceConnectionRequestAccessibility *v15;

  v15 = self;
  v14[1] = (id)a2;
  v13 = 0;
  objc_opt_class();
  v8 = (id)-[_UIViewServiceInterfaceConnectionRequestAccessibility safeValueForKey:](v15, "safeValueForKey:", CFSTR("_serviceProcessAssertion"));
  v12 = (id)__UIAccessibilityCastAsClass();

  v11 = v12;
  objc_storeStrong(&v12, 0);
  v14[0] = v11;
  v6 = (id)objc_msgSend(v11, "safeValueForKey:", CFSTR("_target"));
  v5 = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("_processIdentifier"));
  v4 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("pid"));
  v7 = objc_msgSend(v4, "longValue");

  v10 = v7;
  if (v7)
  {
    v3 = +[_UIRemotePidManagerAccessibility sharedInstance](_UIRemotePidManagerAccessibility, "sharedInstance");
    v2 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), v14[0]);
    -[_UIRemotePidManagerAccessibility unsuspendPid:forAssertionPointer:](v3, "unsuspendPid:forAssertionPointer:", v10);

  }
  v9.receiver = v15;
  v9.super_class = (Class)_UIViewServiceInterfaceConnectionRequestAccessibility;
  -[_UIViewServiceInterfaceConnectionRequestAccessibility _didConnectToService](&v9, sel__didConnectToService);
  objc_storeStrong(v14, 0);
}

@end
