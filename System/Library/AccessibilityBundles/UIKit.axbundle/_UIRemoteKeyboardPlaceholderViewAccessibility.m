@implementation _UIRemoteKeyboardPlaceholderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIRemoteKeyboardPlaceholderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("FBSSceneDefinition"), CFSTR("identity"));
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("FBSSceneIdentity"), CFSTR("workspaceIdentifier"), "@");
  objc_storeStrong(location, 0);
}

- (id)_accessibilityActiveKeyboard
{
  id v3;
  id v4[2];
  _UIRemoteKeyboardPlaceholderViewAccessibility *v5;
  id v6;

  v5 = self;
  v4[1] = (id)a2;
  if ((AXUIKeyboardIsOOP() & 1) != 0)
  {
    v4[0] = -[_UIRemoteKeyboardPlaceholderViewAccessibility accessibilityElements](v5, "accessibilityElements");
    v3 = (id)objc_msgSend(v4[0], "lastObject");
    v6 = (id)objc_msgSend(v3, "_accessibilityActiveKeyboard");
    objc_storeStrong(&v3, 0);
    objc_storeStrong(v4, 0);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)accessibilityElements
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id v9;
  unsigned int v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id location;
  int v19;
  id v20[2];
  _UIRemoteKeyboardPlaceholderViewAccessibility *v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v21 = self;
  v20[1] = (id)a2;
  v20[0] = (id)-[_UIRemoteKeyboardPlaceholderViewAccessibility window](self, "window");
  if (v20[0])
  {
    if ((AXUIKeyboardIsOOP() & 1) != 0)
    {
      location = 0;
      v8 = (id)objc_msgSend(v20[0], "windowScene");
      v17 = (id)objc_msgSend(v8, "safeValueForKey:", CFSTR("_FBSScene"));

      v9 = (id)objc_msgSend(v17, "safeValueForKey:", CFSTR("identity"));
      v16 = (id)objc_msgSend(v9, "safeStringForKey:", CFSTR("workspaceIdentifier"));

      if ((axIsAutomaticArbiterClientKeyboardActive() & 1) == 0
        || (axKeyboardInSeparateProcessAndScene(v20[0]) & 1) != 0
        || (objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.BannerKit")) & 1) != 0)
      {
        v22 = 0;
        v19 = 1;
      }
      else
      {
        v15 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
        v14 = (id)objc_msgSend(v15, "safeValueForKey:", CFSTR("remoteTextInputPartner"));
        NSClassFromString(CFSTR("UIKBRTIPartner"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = (id)objc_msgSend(v14, "safeValueForKey:", CFSTR("rtiClient"));
          NSClassFromString(CFSTR("RTIInputSystemClient"));
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = (id)objc_msgSend(v13, "safeDictionaryForKey:", CFSTR("connections"));
            v7 = getRTIInputUIServiceMachNameiOS();
            v11 = (id)objc_msgSend(v12, "objectForKey:");

            if (v11)
            {
              v10 = objc_msgSend(v11, "processIdentifier");
              objc_storeStrong(&location, (id)__AXUIRemoteKeyboardPlaceholderElement);
              if (!location || objc_msgSend(location, "remotePid") != v10)
              {
                v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA78]), "initWithUUID:andRemotePid:andContextId:", CFSTR("KeyboardSingleton"), v10, 0);
                v3 = location;
                location = v2;

                objc_storeStrong((id *)&__AXUIRemoteKeyboardPlaceholderElement, location);
              }
            }
            objc_storeStrong(&v11, 0);
            objc_storeStrong(&v12, 0);
          }
          objc_storeStrong(&v13, 0);
        }
        if (!location)
        {
          v4 = (id)AXUIRepresentedKeyboardElement();
          v5 = location;
          location = v4;

        }
        objc_msgSend(location, "setAccessibilityContainer:", v21);
        objc_msgSend(location, "setOnClientSide:", 1);
        v23[0] = location;
        v22 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
        v19 = 1;
        objc_storeStrong(&v14, 0);
        objc_storeStrong(&v15, 0);
      }
      objc_storeStrong(&v16, 0);
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&location, 0);
    }
    else
    {
      v22 = 0;
      v19 = 1;
    }
  }
  else
  {
    v22 = 0;
    v19 = 1;
  }
  objc_storeStrong(v20, 0);
  return v22;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end
