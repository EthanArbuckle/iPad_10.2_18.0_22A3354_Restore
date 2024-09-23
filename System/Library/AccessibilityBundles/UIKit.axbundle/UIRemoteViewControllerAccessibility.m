@implementation UIRemoteViewControllerAccessibility

uint64_t __93___UIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation_retryTime___block_invoke(uint64_t a1)
{
  double v2;

  if (*(double *)(a1 + 40) * 2.0 >= 5.0)
    v2 = 5.0;
  else
    v2 = *(double *)(a1 + 40) * 2.0;
  return -[_UIRemoteViewControllerAccessibility _accessibilityLoadAccessibilityInformation:retryTime:](*(_QWORD *)(a1 + 32), 0, v2);
}

void __93___UIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation_retryTime___block_invoke_261(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v5;
  id v6;

  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_viewControllerOperatorProxy"));
  v5 = (id)objc_msgSend(v6, "_target");
  v1 = (id)objc_msgSend(v5, "_target");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

void __93___UIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation_retryTime___block_invoke_2(_xpc_connection_s *a1)
{
  xpc_connection_t connection[3];

  connection[2] = a1;
  connection[1] = a1;
  connection[0] = (xpc_connection_t)(id)objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 4)+ 8)+ 40), "connection");
  if (connection[0])
    *(_DWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 24) = xpc_connection_get_pid(connection[0]);
  objc_storeStrong((id *)connection, 0);
}

void __76___UIRemoteViewControllerAccessibility___setViewServiceIsDisplayingPopover___block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_hostedDimmingView"));
  objc_msgSend(v1, "setAccessibilityViewIsModal:", 0);

}

void __50___UIRemoteViewControllerAccessibility_disconnect__block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v9;
  id obj;
  uint64_t v11;
  _QWORD __b[8];
  id v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = a1;
  v14 = a1;
  memset(__b, 0, sizeof(__b));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_sizeTrackingView"));
  obj = (id)objc_msgSend(v9, "subviews");

  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
  if (v11)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v11;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v13 = *(id *)(__b[1] + 8 * v6);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v13, "_accessibilityUnregisterRemoteView");
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
        if (!v7)
          break;
      }
    }
  }

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_remoteKeyboardRemoteView"));
  objc_msgSend(v1, "_accessibilityUnregisterRemoteView");

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_fullScreenTextEffectsRemoteView"));
  objc_msgSend(v2, "_accessibilityUnregisterRemoteView");

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_textEffectsAboveStatusBarRemoteView"));
  objc_msgSend(v3, "_accessibilityUnregisterRemoteView");

}

uint64_t __68___UIRemoteViewControllerAccessibility___handleFocusMovementAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setEnabled:", 1, a1, a1);
}

void __68___UIRemoteViewControllerAccessibility__axTakeBakeFocusWithHeading___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityFocusContainer");
  objc_msgSend(v2, "_accessibilityMoveFocusWithHeading:", objc_msgSend(*(id *)(a1 + 40), "heading"));

}

uint64_t __68___UIRemoteViewControllerAccessibility__axTakeBakeFocusWithHeading___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setHeading:", *(_QWORD *)(a1 + 40), a1, a1);
}

void __68___UIRemoteViewControllerAccessibility__axTakeBakeFocusWithHeading___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = (void *)MEMORY[0x24BDF6A68];
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_msgSend(v1, "focusSystemForEnvironment:");
  objc_msgSend(v2, "_setEnabled:", 0);

}

uint64_t __68___UIRemoteViewControllerAccessibility__axTakeBakeFocusWithHeading___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setWantsKeyboardEnvironmentEventDeferring:", 0, a1, a1);
}

@end
