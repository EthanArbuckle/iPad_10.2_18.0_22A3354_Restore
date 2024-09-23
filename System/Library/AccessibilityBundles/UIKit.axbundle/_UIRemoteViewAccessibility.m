@implementation _UIRemoteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIRemoteView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (uint64_t)_accessibilityRemoteMachPort
{
  if (a1)
    return __UIAccessibilityGetAssociatedUnsignedInt();
  else
    return 0;
}

- (uint64_t)_accessibilitySetRemoteMachPort:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedUnsignedInt();
  return result;
}

- (uint64_t)_accessibilityRemoteViewPid
{
  if (a1)
    return __UIAccessibilityGetAssociatedInt();
  else
    return 0;
}

- (uint64_t)_accessibilitySetRemoteViewPid:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedInt();
  return result;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:", CFSTR("_UISizeTrackingView"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIRemoteView"), CFSTR("hostedWindowHostingHandle"), "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIHostedWindowHostingHandle"), CFSTR("_pid"), "i");
  objc_storeStrong(v4, obj);
}

- (id)_accessibilityGetRemoteElementArray
{
  if (a1)
    return objc_getAssociatedObject(a1, &___UIRemoteViewAccessibility___accessibilityGetRemoteElementArray);
  else
    return 0;
}

- (void)_accessibilitySetRemoteElementArray:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityRemoteElementCommunicationQueue
{
  id location;
  dispatch_once_t *v3;

  if (!a1)
    return 0;
  v3 = (dispatch_once_t *)&_accessibilityRemoteElementCommunicationQueue_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_56);
  if (*v3 != -1)
    dispatch_once(v3, location);
  objc_storeStrong(&location, 0);
  return (id)_accessibilityRemoteElementCommunicationQueue_q;
}

- (id)accessibilityIdentifier
{
  return CFSTR("RemoteViewBridge");
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  _UIRemoteViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  -[_UIRemoteViewAccessibility _accessibilityUnregisterRemoteView](self, "_accessibilityUnregisterRemoteView");
  v2.receiver = v4;
  v2.super_class = (Class)_UIRemoteViewAccessibility;
  -[_UIRemoteViewAccessibility dealloc](&v2, sel_dealloc);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5;
  id location[2];
  _UIRemoteViewAccessibility *v7;
  CGPoint v8;
  id v9;

  v8 = a3;
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if ((-[_UIRemoteViewAccessibility pointInside:withEvent:](v7, "pointInside:withEvent:", location[0], v8.x, v8.y) & 1) != 0)
  {
    v5 = -[_UIRemoteViewAccessibility accessibilityElements](v7, "accessibilityElements");
    v9 = (id)objc_msgSend(v5, "lastObject");

  }
  else
  {
    v9 = 0;
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  _UIRemoteViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIRemoteViewAccessibility;
  -[_UIRemoteViewAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[_UIRemoteViewAccessibility _accessibilitySetRemoteElementIfNecessary](v4);
}

- (void)_accessibilitySetRemoteElementIfNecessary
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id *v7;
  id *v8;
  id *v9;
  id obj;
  os_log_t v11;
  os_log_type_t v12[4];
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t *v17;
  id v18;
  id v19;
  id v20;
  CFAllocatorRef *v21;
  os_log_t v22;
  os_log_type_t v23[4];
  uint8_t *v24;
  os_log_t v25;
  os_log_type_t v26[4];
  uint8_t *v27;
  uint64_t v28;
  id v29;
  os_log_t log;
  os_log_type_t type[4];
  uint8_t *buf;
  id v33;
  int v34;
  id v35;
  int v36;
  id v37;
  unsigned int v38;
  int v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  void (*v44)(uint64_t);
  void *v45;
  _QWORD v46[2];
  unsigned int v47;
  unsigned int v48;
  os_log_type_t v49;
  os_log_t oslog;
  id v51;
  id v52;
  id v53;
  const __CFUUID *v54;
  os_log_type_t v55;
  id v56;
  os_log_type_t v57;
  id v58;
  os_log_type_t v59;
  id location;
  char v61;
  id v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  id v66;
  void *v67;
  __CFString *v68;
  _BYTE v69[40];
  id v70;
  uint8_t v71[16];
  uint8_t v72[16];
  uint8_t v73[24];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v67 = a1;
  if (a1)
  {
    if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
      _AXAssert();
    v66 = -[_UIRemoteViewAccessibility _accessibilityGetRemoteElementArray](v67);
    if (!v66)
    {
      v39 = 0;
      v37 = (id)objc_msgSend(v67, "safeValueForKey:", CFSTR("layer"));
      v38 = objc_msgSend(v37, "contextId");

      v65 = v38;
      v64 = -[_UIRemoteViewAccessibility _accessibilityRemoteViewPid]((uint64_t)v67);
      v63 = -[_UIRemoteViewAccessibility _accessibilityRemoteMachPort]((uint64_t)v67);
      v61 = 0;
      v40 = 0;
      if (!v64)
      {
        v35 = (id)objc_msgSend(v67, "safeValueForKey:", CFSTR("superview"));
        v62 = v35;
        v36 = 1;
        v61 = 1;
        NSClassFromString(CFSTR("_UISizeTrackingView"));
        v40 = objc_opt_isKindOfClass() ^ 1;
      }
      v34 = v40;
      if ((v61 & 1) != 0)

      if ((v34 & 1) != 0)
      {
        v33 = (id)objc_msgSend(v67, "safeValueForKey:", CFSTR("hostedWindowHostingHandle"));
        v64 = objc_msgSend(v33, "safeIntForKey:", CFSTR("_pid"));

      }
      if (v64)
      {
        v54 = 0;
        v21 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
        v54 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x24BDBD240]);
        v68 = (__CFString *)CFUUIDCreateString(*v21, v54);
        v53 = v68;
        if (v54)
        {
          CFRelease(v54);
          v54 = 0;
        }
        v52 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA78]), "initWithUUID:andRemotePid:andContextId:", v53, v64, v65);
        objc_msgSend(v52, "setOnClientSide:", 1);
        objc_msgSend(v52, "setAccessibilityContainer:", v67);
        objc_msgSend(v52, "setMachPort:", v63);
        v70 = v52;
        v1 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v70, 1);
        v2 = v66;
        v66 = v1;

        -[_UIRemoteViewAccessibility _accessibilitySetRemoteElementArray:]((uint64_t)v67, v66);
        v16 = (id)MEMORY[0x24BDBCE70];
        v15 = 0x24BDD1000uLL;
        v20 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v63);
        v14 = MEMORY[0x24BDD16E0];
        v19 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", getpid());
        v18 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v65);
        v3 = *MEMORY[0x24BDBD270];
        v17 = &v4;
        v51 = (id)objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v20, CFSTR("ax-machport"), v19, CFSTR("ax-pid"), v18, CFSTR("ax-context"), v53, CFSTR("ax-uuid"), v3, CFSTR("ax-register"), 0);

        oslog = (os_log_t)(id)AXLogRemoteElement();
        v49 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
        {
          v11 = oslog;
          *(_DWORD *)v12 = v49;
          v13 = v69;
          __os_log_helper_16_2_3_8_64_4_0_8_64((uint64_t)v69, (uint64_t)v67, v64, (uint64_t)v51);
          _os_log_impl(&dword_230C4A000, v11, v12[0], "%@: transmitting UUID to remote side with pid: %d, value: %@", v13, 0x1Cu);
        }
        obj = 0;
        objc_storeStrong((id *)&oslog, 0);
        queue = (dispatch_queue_t)-[_UIRemoteViewAccessibility _accessibilityRemoteElementCommunicationQueue]((uint64_t)v67);
        block = &v41;
        v41 = MEMORY[0x24BDAC760];
        v42 = -1073741824;
        v43 = 0;
        v44 = __71___UIRemoteViewAccessibility__accessibilitySetRemoteElementIfNecessary__block_invoke;
        v45 = &unk_24FF3E138;
        v8 = (id *)v46;
        v46[0] = v67;
        v47 = v64;
        v48 = v63;
        v7 = (id *)((char *)block + 40);
        v9 = &v51;
        v46[1] = v51;
        dispatch_async(queue, block);

        objc_storeStrong(v7, obj);
        objc_storeStrong(v8, obj);
        objc_storeStrong(v9, obj);
        objc_storeStrong(&v52, obj);
        objc_storeStrong(&v53, obj);
      }
      else if (_AXSApplicationAccessibilityEnabled())
      {
        if ((objc_msgSend(v67, "_accessibilityBoolValueForKey:", CFSTR("AXDidRequestRemoteViewLoad")) & 1) != 0)
        {
          v58 = (id)AXLogRemoteElement();
          v57 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled((os_log_t)v58, OS_LOG_TYPE_INFO))
          {
            v25 = (os_log_t)v58;
            *(_DWORD *)v26 = v57;
            v27 = v72;
            __os_log_helper_16_2_1_8_64((uint64_t)v72, (uint64_t)v67);
            _os_log_impl(&dword_230C4A000, (os_log_t)v58, v57, "%@: no remote pid, but already requested a remote view load once", v72, 0xCu);
          }
          objc_storeStrong(&v58, 0);
        }
        else
        {
          objc_msgSend(v67, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXDidRequestRemoteViewLoad"));
          location = (id)AXLogRemoteElement();
          v59 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
          {
            log = (os_log_t)location;
            *(_DWORD *)type = v59;
            buf = v73;
            __os_log_helper_16_2_1_8_64((uint64_t)v73, (uint64_t)v67);
            _os_log_impl(&dword_230C4A000, (os_log_t)location, v59, "%@: no remote pid set, so requesting that info from the remote view controller", v73, 0xCu);
          }
          v28 = 0;
          objc_storeStrong(&location, 0);
          v29 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          objc_msgSend(v29, "postNotificationName:object:", CFSTR("AXRequestRemoteViewLoad"), 0);

        }
      }
      else
      {
        v56 = (id)AXLogRemoteElement();
        v55 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled((os_log_t)v56, OS_LOG_TYPE_INFO))
        {
          v22 = (os_log_t)v56;
          *(_DWORD *)v23 = v55;
          v24 = v71;
          __os_log_helper_16_2_1_8_64((uint64_t)v71, (uint64_t)v67);
          _os_log_impl(&dword_230C4A000, (os_log_t)v56, v55, "%@: no remote pid, but AX is not enabled so there's no use trying to get that info yet", v71, 0xCu);
        }
        objc_storeStrong(&v56, 0);
      }
    }
    objc_storeStrong(&v66, 0);
  }
}

- (BOOL)_accessibilityServesAsFirstResponder
{
  return 1;
}

- (id)_accessibilityActiveKeyboard
{
  id v3;
  id v4;
  id v5[3];

  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = -[_UIRemoteViewAccessibility _accessibilityGetRemoteElementArray](self);
  v4 = (id)objc_msgSend(v5[0], "lastObject");
  v3 = (id)objc_msgSend(v4, "_accessibilityActiveKeyboard");
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v5, 0);
  return v3;
}

- (id)_accessibilityResponderElement
{
  id v3;
  id v4;
  id v5[3];

  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = -[_UIRemoteViewAccessibility _accessibilityGetRemoteElementArray](self);
  v4 = (id)objc_msgSend(v5[0], "lastObject");
  v3 = (id)objc_msgSend(v4, "_accessibilityResponderElement");
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v5, 0);
  return v3;
}

- (void)_accessibilityTransmitRemoteUUIDToPid:(int)a3 machPort:(id)obj value:
{
  NSObject *queue;
  NSObject *v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11[2];
  int v12;
  int v13;
  int v14;
  os_log_type_t v15;
  id v16;
  AXUIElementRef AppElementWithPid;
  int v18;
  id location;
  int v20;
  int v21;
  id v22;
  uint8_t v23[8];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22 = a1;
  v21 = a2;
  v20 = a3;
  location = 0;
  objc_storeStrong(&location, obj);
  if (v22)
  {
    v5 = -[_UIRemoteViewAccessibility _accessibilityRemoteElementCommunicationQueue]((uint64_t)v22);
    dispatch_assert_queue_V2(v5);

    AppElementWithPid = (AXUIElementRef)_AXUIElementCreateAppElementWithPid();
    AXUIElementSetMessagingTimeout(AppElementWithPid, 1.0);
    if (!v20)
    {
      v20 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityMachPort");
      v16 = (id)AXLogRemoteElement();
      v15 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v23, v20);
        _os_log_impl(&dword_230C4A000, (os_log_t)v16, v15, "mach port was not initialized by the remote view controller, so using app's mach port %u", v23, 8u);
      }
      objc_storeStrong(&v16, 0);
    }
    _AXUIElementSetMachPortForNextMessage();
    v14 = AXUIElementPerformFencedActionWithValue();
    queue = MEMORY[0x24BDAC9B8];
    v6 = MEMORY[0x24BDAC760];
    v7 = -1073741824;
    v8 = 0;
    v9 = __83___UIRemoteViewAccessibility__accessibilityTransmitRemoteUUIDToPid_machPort_value___block_invoke;
    v10 = &unk_24FF3F4E8;
    v12 = v14;
    v11[0] = v22;
    v13 = v21;
    v11[1] = AppElementWithPid;
    dispatch_async(queue, &v6);

    objc_storeStrong(v11, 0);
    v18 = 0;
  }
  else
  {
    v18 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (id)accessibilityElements
{
  id v3;
  id v4[2];
  _UIRemoteViewAccessibility *v5;

  v5 = self;
  v4[1] = (id)a2;
  v4[0] = -[_UIRemoteViewAccessibility _accessibilityGetRemoteElementArray](self);
  if (!v4[0])
  {
    -[_UIRemoteViewAccessibility _accessibilitySetRemoteElementIfNecessary](v5);
    v4[0] = -[_UIRemoteViewAccessibility _accessibilityGetRemoteElementArray](v5);

  }
  v3 = v4[0];
  objc_storeStrong(v4, 0);
  return v3;
}

- (void)_accessibilityUnregisterRemoteView
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id *v9;
  id *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  uint64_t *v16;
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  void (*v32)();
  void *v33;
  id v34;
  int v35;
  int v36;
  id v37;
  _QWORD __b[8];
  id v39;
  id v40;
  int v41;
  int v42;
  SEL v43;
  _UIRemoteViewAccessibility *v44;
  id location;
  dispatch_once_t *v46;
  _BYTE v47[128];
  uint64_t v48;

  v28 = 0;
  v48 = *MEMORY[0x24BDAC8D0];
  v44 = self;
  v43 = a2;
  v42 = -[_UIRemoteViewAccessibility _accessibilityRemoteViewPid]((uint64_t)self);
  v41 = -[_UIRemoteViewAccessibility _accessibilityRemoteMachPort]((uint64_t)v44);
  if (v42)
  {
    v40 = -[_UIRemoteViewAccessibility _accessibilityGetRemoteElementArray](v44);
    v25 = __b;
    memset(__b, 0, sizeof(__b));
    obj = v40;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v47, 16);
    if (v27)
    {
      v22 = *(_QWORD *)__b[2];
      v23 = v28;
      v24 = v27;
      while (1)
      {
        v20 = v24;
        v21 = v23;
        if (*(_QWORD *)__b[2] != v22)
          objc_enumerationMutation(obj);
        v39 = *(id *)(__b[1] + 8 * v21);
        v15 = (id)MEMORY[0x24BDBCE70];
        v13 = 0x24BDD1000uLL;
        v12 = MEMORY[0x24BDD16E0];
        v19 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", getpid());
        v14 = *(id *)(v13 + 1760);
        v2 = objc_msgSend(v39, "contextId");
        v18 = (id)objc_msgSend(v14, "numberWithUnsignedInt:", v2);
        v17 = (id)objc_msgSend(v39, "uuid");
        v3 = *MEMORY[0x24BDBD268];
        v16 = &v5;
        v37 = (id)objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v19, CFSTR("ax-pid"), v18, CFSTR("ax-context"), v17, CFSTR("ax-uuid"), v3, CFSTR("ax-register"), 0);

        v46 = (dispatch_once_t *)&_accessibilityUnregisterRemoteView_onceToken;
        location = 0;
        objc_storeStrong(&location, &__block_literal_global_240);
        if (*v46 != -1)
          dispatch_once(v46, location);
        v11 = 0;
        objc_storeStrong(&location, 0);
        queue = (dispatch_queue_t)_accessibilityUnregisterRemoteView_UnregisterQueue;
        block = &v29;
        v29 = MEMORY[0x24BDAC760];
        v30 = -1073741824;
        v31 = 0;
        v32 = __64___UIRemoteViewAccessibility__accessibilityUnregisterRemoteView__block_invoke_2;
        v33 = &unk_24FF3D7E0;
        v35 = v42;
        v9 = &v34;
        v10 = &v37;
        v34 = v37;
        v36 = v41;
        dispatch_async(queue, block);
        objc_msgSend(v39, "setAccessibilityContainer:", v11);
        objc_msgSend(v39, "unregister");
        objc_storeStrong(v9, v11);
        objc_storeStrong(v10, v11);
        v23 = v21 + 1;
        v24 = v20;
        if (v21 + 1 >= v20)
        {
          v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v47, 16);
          v23 = v28;
          v24 = v4;
          if (!v4)
            break;
        }
      }
    }

    v6 = 0;
    -[_UIRemoteViewAccessibility _accessibilitySetRemoteElementArray:]((uint64_t)v44, 0);
    objc_storeStrong(&v40, v6);
  }
}

- (void)_accessibilitySetFocusOnElement:(BOOL)a3
{
  id v3;
  BOOL v4;

  v4 = a3;
  v3 = (id)-[_UIRemoteViewAccessibility accessibilityContainer](self, "accessibilityContainer");
  objc_msgSend(v3, "_accessibilitySetFocusOnElement:", v4);

}

@end
