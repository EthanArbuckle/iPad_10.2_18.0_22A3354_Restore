@implementation NSObject

- (uint64_t)__accessibilityRespondsToTextInput
{
  unsigned __int8 v2;
  id v3;
  id v4;
  char v5;
  id location;
  dispatch_once_t *v7;

  v4 = a1;
  if (a1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((_UIApplicationIsWebKitLoaded() & 1) == 0)
        goto LABEL_10;
      v7 = (dispatch_once_t *)&__accessibilityRespondsToTextInput_onceToken;
      location = 0;
      objc_storeStrong(&location, &__block_literal_global_48);
      if (*v7 != -1)
        dispatch_once(v7, location);
      objc_storeStrong(&location, 0);
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = 0;
      }
      else
      {
LABEL_10:
        v3 = (id)objc_msgSend(v4, "_accessibilityValueForKey:", CFSTR("AXRespondsToTextInput"));
        if (v3)
        {
          v5 = objc_msgSend(v3, "BOOLValue") & 1;
        }
        else
        {
          v2 = objc_msgSend(v4, "conformsToProtocol:", &unk_255ED66F8) & 1;
          objc_msgSend(v4, "_accessibilitySetBoolValue:forKey:", v2, CFSTR("AXRespondsToTextInput"));
          v5 = v2 & 1;
        }
        objc_storeStrong(&v3, 0);
      }
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (uint64_t)__accessibilityRespondsToKeyInput
{
  unsigned __int8 v2;
  id location;
  id v4;
  char v5;

  v4 = a1;
  if (a1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      location = (id)objc_msgSend(v4, "_accessibilityValueForKey:", CFSTR("AXRespondsToKeyInput"));
      if (location)
      {
        v5 = objc_msgSend(location, "BOOLValue") & 1;
      }
      else
      {
        v2 = objc_msgSend(v4, "conformsToProtocol:", &unk_255ECB370) & 1;
        objc_msgSend(v4, "_accessibilitySetBoolValue:forKey:", v2, CFSTR("AXRespondsToKeyInput"));
        v5 = v2 & 1;
      }
      objc_storeStrong(&location, 0);
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (void)_accessibilitySetTextSelection:(uint64_t)a3
{
  id location;
  char v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v10 = a2;
  v11 = a3;
  v9 = a1;
  if (a1)
  {
    if ((objc_msgSend(v9, "conformsToProtocol:", &unk_255ED66F8) & 1) == 0)
      _AXAssert();
    if ((objc_msgSend(v9, "conformsToProtocol:", &unk_255ED66F8) & 1) != 0)
    {
      v8 = v9;
      v7 = (id)objc_msgSend(v8, "safeValueForKey:", CFSTR("beginningOfDocument"));
      v6 = (id)objc_msgSend(v8, "positionFromPosition:offset:", v7, v10);
      v5 = (id)objc_msgSend(v8, "positionFromPosition:offset:", v6, v11);
      if (v6 && v5)
      {
        v4 = 0;
        if (AXIsDictationListening())
        {
          AXHandleUserInteractionForDictation(1);
          v4 = 1;
        }
        location = (id)objc_msgSend(v8, "textRangeFromPosition:toPosition:", v6, v5);
        objc_msgSend(v8, "setSelectedTextRange:", location);
        if ((v4 & 1) != 0)
          AXHandleUserInteractionForDictation(0);
        objc_storeStrong(&location, 0);
      }
      objc_storeStrong(&v5, 0);
      objc_storeStrong(&v6, 0);
      objc_storeStrong(&v7, 0);
      objc_storeStrong(&v8, 0);
    }
  }
}

Class __65__NSObject_UITextInputAXPriv____accessibilityRespondsToTextInput__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("UIWebBrowserView"));
  __accessibilityRespondsToTextInput_WebBrowserView = (uint64_t)result;
  return result;
}

@end
