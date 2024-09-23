void notificationBypass(int a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;

  if (a1 == 1060)
    _handleElementDestroyed((uint64_t)a3);
  v7 = _convertAXNotification(a1, a4);
  if (v7)
  {
    v8 = v7;
    v17 = 0;
    _convertAXNotificationForElementWithData(a1, a3, a4, &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v17;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __notificationBypass_block_invoke;
    v13[3] = &unk_24E6ABFF0;
    v15 = v10;
    v16 = v8;
    v14 = v9;
    v11 = v10;
    v12 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], v13);

  }
}

void _axEventHandler(uint64_t a1, void *a2, int a3, void *a4)
{
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  id v21;

  v7 = (void *)MEMORY[0x227666060]();
  if (a3 == 1060)
    _handleElementDestroyed((uint64_t)a2);
  +[AXPTranslator sharedInstance](AXPTranslator, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "runtimeDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = _convertAXNotification(a3, a4);
    if (v11)
    {
      v12 = v11;
      v21 = 0;
      _convertAXNotificationForElementWithData(a3, a2, a4, &v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = ___axEventHandler_block_invoke;
      v17[3] = &unk_24E6ABFF0;
      v19 = v14;
      v20 = v12;
      v18 = v13;
      v15 = v14;
      v16 = v13;
      dispatch_async(MEMORY[0x24BDAC9B8], v17);

    }
  }
  objc_autoreleasePoolPop(v7);
}

uint64_t _appLoadedAccessibilityCallback(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint8_t v5[16];

  AXPlatformTranslationLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_220DB6000, v3, OS_LOG_TYPE_DEFAULT, "Received app accessibility loaded, proceeding...", v5, 2u);
  }

  return objc_msgSend(a2, "_signalAppAXReady");
}

uint64_t _convertAXError(int a1)
{
  int v1;
  uint64_t result;

  v1 = a1 + 25218;
  result = 1;
  switch(v1)
  {
    case 0:
      result = 18;
      break;
    case 1:
    case 18:
      result = 6;
      break;
    case 2:
      result = 10;
      break;
    case 3:
      result = 17;
      break;
    case 4:
      result = 4;
      break;
    case 5:
      result = 16;
      break;
    case 6:
      result = 15;
      break;
    case 7:
      result = 2;
      break;
    case 8:
      result = 12;
      break;
    case 9:
      result = 11;
      break;
    case 10:
      result = 14;
      break;
    case 11:
      result = 13;
      break;
    case 12:
      return result;
    case 13:
      result = 3;
      break;
    case 14:
      result = 5;
      break;
    case 15:
      result = 9;
      break;
    case 16:
      result = 8;
      break;
    case 17:
      result = 7;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t _convertAXPActionToiOS(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x10)
    return 2021;
  else
    return dword_220DCA770[a1 - 1];
}

const __CFUUID *_AXPConvertOutgoingValueWithDesiredType(void *a1, uint64_t a2)
{
  const __CFUUID *v3;
  CFTypeID v4;
  CFStringRef v5;
  const __CFUUID *v6;
  const __CFUUID *v8;
  const __CFUUID *v9;
  const __CFUUID *v10;
  void *v11;
  const __CFUUID *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  CFTypeID v25;
  CFTypeID v26;
  CFTypeID v27;
  CFTypeID TypeID;
  CFTypeID v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  _QWORD v39[4];
  const __CFUUID *v40;
  id v41;
  _QWORD *v42;
  _QWORD v43[4];
  _BYTE v44[128];
  _QWORD v45[9];

  v45[7] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return (const __CFUUID *)0;
  v3 = a1;
  v4 = CFUUIDGetTypeID();
  if (v4 == CFGetTypeID(v3))
  {
    v5 = CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x24BDBD240], v3);
    v6 = (const __CFUUID *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v5);

    if (v5)
      CFRelease(v5);
  }
  else
  {
    v6 = v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v6;
    v11 = (void *)-[__CFUUID mutableCopy](v10, "mutableCopy");
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    v43[3] = 0;
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = ___convertAXAttributedStringToAXString_block_invoke;
    v39[3] = &unk_24E6AC038;
    v12 = v10;
    v40 = v12;
    v13 = v11;
    v41 = v13;
    v42 = v43;
    -[__CFUUID enumerateAttributesUsingBlock:](v12, "enumerateAttributesUsingBlock:", v39);
    v45[0] = CFSTR("NSParagraphStyle");
    v45[1] = CFSTR("NSFont");
    v45[2] = CFSTR("NSShadow");
    v45[3] = CFSTR("NSColor");
    v45[4] = CFSTR("NSTextAlternatives");
    v45[5] = CFSTR("NSTextEffect");
    v45[6] = CFSTR("NSOriginalFont");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAttributes:", v14);

    v15 = v41;
    v16 = v13;

    _Block_object_dispose(v43, 8);
    if (a2 && objc_opt_class() == a2 && objc_msgSend(v16, "hasAttributes"))
    {
      objc_msgSend(v16, "attributedString");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v16, "string");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (const __CFUUID *)v17;

    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = ___AXPConvertOutgoingValueWithDesiredType_block_invoke;
    v38[3] = &__block_descriptor_40_e8__16__0_8lu32l8;
    v38[4] = a2;
    -[__CFUUID ax_flatMappedArrayUsingBlock:](v6, "ax_flatMappedArrayUsingBlock:", v38);
    v8 = (const __CFUUID *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[__CFUUID allKeys](v6, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v9 = (const __CFUUID *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v35 != v21)
              objc_enumerationMutation(v19);
            v23 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            _AXPConvertOutgoingValueWithDesiredType(-[__CFUUID objectForKey:](v6, "objectForKey:", v23), a2);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
              -[__CFUUID setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v24, v23);

          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
        }
        while (v20);
      }

    }
    else
    {
      v9 = v6;
    }

    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (v25 = CFURLGetTypeID(), v25 == CFGetTypeID(v6))
    || (v26 = CGColorGetTypeID(), v26 == CFGetTypeID(v6))
    || (v27 = CGPathGetTypeID(), v27 == CFGetTypeID(v6)))
  {
LABEL_8:
    v8 = v6;
  }
  else
  {
    TypeID = AXValueGetTypeID();
    if (TypeID != CFGetTypeID(v6))
    {
      v29 = AXUIElementGetTypeID();
      if (v29 == CFGetTypeID(v6))
      {
        +[AXPTranslator_iOS sharedInstance](AXPTranslator_iOS, "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "translationObjectFromPlatformElement:", v6);
        v9 = (const __CFUUID *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v31 = (void *)MEMORY[0x24BDBCE88];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Illegal outgoing type: %@[%@]"), objc_opt_class(), v6);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "exceptionWithName:reason:userInfo:", CFSTR("Illegal outgoing type"), v32, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "raise");
        v9 = 0;
      }
      goto LABEL_25;
    }
    _AXPConvertAXValueRefToNSValue(v6);
    v8 = (const __CFUUID *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  v9 = v8;
LABEL_25:

  return v9;
}

void sub_220DBB184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

id _AXPiOSParameterFromPlatformParameter(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("parameter"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id _AXPConvertAXValueRefToNSValue(const __AXValue *a1)
{
  void *v2;
  __int128 v4;
  __int128 v5;

  switch(AXValueGetType(a1))
  {
    case kAXValueTypeCGPoint:
      v4 = 0uLL;
      if (!AXValueGetValue(a1, kAXValueTypeCGPoint, &v4))
        goto LABEL_12;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithPoint:", v4);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case kAXValueTypeCGSize:
      v4 = 0uLL;
      if (!AXValueGetValue(a1, kAXValueTypeCGSize, &v4))
        goto LABEL_12;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithSize:", v4);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case kAXValueTypeCGRect:
      v4 = 0u;
      v5 = 0u;
      if (!AXValueGetValue(a1, kAXValueTypeCGRect, &v4))
        goto LABEL_12;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v4, v5);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case kAXValueTypeCFRange:
      v4 = 0uLL;
      if (!AXValueGetValue(a1, kAXValueTypeCFRange, &v4))
        goto LABEL_12;
      v2 = 0;
      if ((v4 & 0x8000000000000000) == 0 && (*((_QWORD *)&v4 + 1) & 0x8000000000000000) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
      }
      break;
    default:
LABEL_12:
      v2 = 0;
      break;
  }
  return v2;
}

void sub_220DBBB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t _AXPElementIsTabButton(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a1;
  if ((*MEMORY[0x24BDFEE60] & ~a2) != 0 && (*MEMORY[0x24BDFEEE0] & ~a2) != 0 && (*MEMORY[0x24BDFEEE8] & ~a2) != 0)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BDFEA68], "elementWithUIElement:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "rowRange") == 0x7FFFFFFF)
  {

LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "elementParent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containerType");

  if (v6 != 2048)
    goto LABEL_8;
  v7 = 1;
LABEL_9:

  return v7;
}

void sub_220DBF7B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_220DC0510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220DC11B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _AXPAXUIElementReplaceWithRemotePid(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = 0;
  if (a1 && a2)
  {
    *a2 = 0;
    _AXUIElementIDForElement();
    if (v7 == 9999)
    {
      v8 = _AXUIElementIDForElement();
      *a2 = MEMORY[0x227665EC8](a3, v8, v9);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void _handleElementDestroyed(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  if (a1)
  {
    v2 = (void *)MEMORY[0x24BDFEA90];
    v3 = (void *)objc_opt_new();
    objc_msgSend(v2, "uiElementWithAXElement:cache:", a1, v3);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v4 = (void *)objc_opt_new();
    v5 = _AXUIElementIDForElement();
    objc_msgSend(v4, "setUid:", v5, v6);
    objc_msgSend(v4, "setPid:", objc_msgSend(v10, "pid"));
    +[AXPTranslator_iOS sharedInstance](AXPTranslator_iOS, "sharedInstance");
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v8 = v7[12];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___handleElementDestroyed_block_invoke;
    block[3] = &unk_24E6ABDB0;
    v12 = v4;
    v9 = v4;
    dispatch_sync(v8, block);

  }
}

uint64_t _convertAXNotification(int a1, void *a2)
{
  uint64_t v2;
  void *v4;

  if (a1 <= 1043)
  {
    v2 = 1;
    switch(a1)
    {
      case 1000:
        return 5;
      case 1001:
      case 1020:
        return 4;
      case 1005:
        if (!a2)
          return 8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          return 8;
        objc_msgSend(a2, "objectForKey:", *MEMORY[0x24BDFF110]);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_33;
        if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDFF0F0]) & 1) != 0)
        {
          v2 = 13;
LABEL_32:

          return v2;
        }
        if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDFF0F8]))
        {
          v2 = 14;
          goto LABEL_32;
        }
LABEL_33:

        break;
      case 1006:
        if (AXPIsCatalyst())
          return 11;
        else
          return 5;
      case 1007:
        return 10;
      case 1008:
        return v2;
      case 1009:
        return 12;
      case 1012:
        return 8;
      case 1017:
        return 6;
      case 1018:
        return 3;
      default:
        return 0;
    }
    return 8;
  }
  if (a1 > 1059)
  {
    switch(a1)
    {
      case 5550:
        return 9;
      case 4002:
        return 7;
      case 1060:
        return 2;
      default:
        return 0;
    }
  }
  else
  {
    switch(a1)
    {
      case 1044:
        return 15;
      case 1053:
        return 3;
      case 1054:
        return 8;
      default:
        return 0;
    }
  }
}

id _convertAXNotificationForElementWithData(int a1, void *a2, void *a3, _QWORD *a4)
{
  void *v8;
  _QWORD *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  if (!a4)
    _convertAXNotificationForElementWithData_cold_1();
  _AXPConvertOutgoingValueWithDesiredType(a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _AXPConvertOutgoingValueWithDesiredType(a2, 0);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  switch(a1)
  {
    case 1008:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a3, "objectForKey:", CFSTR("data"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(a3, "objectForKey:", CFSTR("data"));
          v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "attributeValueForKey:", *MEMORY[0x24BDFEBF0]);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "BOOLValue");

            if ((v14 & 1) != 0)
            {
              v15 = 0;
            }
            else
            {
              v16 = (void *)objc_msgSend(v8, "mutableCopy");
              v17 = objc_opt_class();
              _AXPConvertOutgoingValueWithDesiredType(v11, v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("data"));

              v15 = objc_msgSend(v16, "copy");
              v8 = v16;
            }

            v8 = (void *)v15;
          }
          goto LABEL_19;
        }
      }
      break;
    case 1053:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDFEF08]);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = objc_retainAutorelease(v11);
            *a4 = v11;

            v8 = 0;
          }
        }
        goto LABEL_19;
      }
      break;
    case 1020:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (_QWORD *)MEMORY[0x24BDFEF08];
        objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDFEF08]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v8, "objectForKey:", *v9);
          v11 = v8;
          v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

        }
      }
      break;
  }
  return v8;
}

void __notificationBypass_block_invoke(_QWORD *a1)
{
  id v2;

  +[AXPTranslator sharedInstance](AXPTranslator, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleNotification:data:associatedObject:", a1[6], a1[4], a1[5]);

}

void ___handleElementDestroyed_block_invoke(uint64_t a1)
{
  id v2;

  +[AXPTranslator_iOS sharedInstance](AXPTranslator_iOS, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeCacheEntriesForElement:", *(_QWORD *)(a1 + 32));

}

void ___axEventHandler_block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  +[AXPTranslator sharedInstance](AXPTranslator, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "runtimeDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleNotification:data:associatedObject:", a1[6], a1[4], a1[5]);

}

void ___convertAXAttributedStringToAXString_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BDFEB30]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "BOOLValue") & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BDFEB38]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "BOOLValue"))
  {

LABEL_4:
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "substringWithRange:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _convertDurationTime(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v12 = (_QWORD *)MEMORY[0x24BDFEB28];
  objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BDFEB28]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "string");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "substringWithRange:", a3, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(":"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    v12 = (_QWORD *)MEMORY[0x24BDFEB28];
    if (v17 == 3)
      goto LABEL_5;
  }
  else
  {

  }
  objc_msgSend(v22, "objectForKeyedSubscript:", *v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if (!v19)
    goto LABEL_8;
  v20 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringWithRange:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@:00"), v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _convertDurationTime(v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + a3, a4, v11);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v11, "length") - a4;

  }
LABEL_8:

}

id _convertDurationTime(void *a1)
{
  id v1;
  void (*v2)(id);
  void *v3;
  _Unwind_Exception *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v1 = a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (void (*)(id))getAXLocalizeDurationTimeSymbolLoc_ptr;
  v10 = getAXLocalizeDurationTimeSymbolLoc_ptr;
  if (!getAXLocalizeDurationTimeSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __getAXLocalizeDurationTimeSymbolLoc_block_invoke;
    v6[3] = &unk_24E6AC060;
    v6[4] = &v7;
    __getAXLocalizeDurationTimeSymbolLoc_block_invoke((uint64_t)v6);
    v2 = (void (*)(id))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)_convertDurationTime_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  v2(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void *__getAXLocalizeDurationTimeSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary;
  }
  else
  {
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary;
    if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AXLocalizeDurationTime");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAXLocalizeDurationTimeSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _AXPConvertAXAttribute(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXLabelAttribute")))
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXHintAttribute")))
    {
      if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXFrameAttribute")))
      {
        if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXTraitsAttribute")))
        {
          if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXSelectedTextRangeAttribute")))
          {
            if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXValueAttribute")))
            {
              if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXCenterPointAttribute")))
              {
                if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXLanguageAttribute")))
                {
                  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXScrollStatusAttribute")))
                  {
                    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXTextOperationsAttribute")))
                    {
                      if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXTextOperationsOperatorAttribute")))
                      {
                        if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXTouchContainerAttribute")))
                        {
                          if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXVisibleElementInListAttribute")))
                          {
                            if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXNextContainerAttribute")))
                            {
                              if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXPreviousContainerAttribute")))
                              {
                                if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXIsElementAttribute")))
                                {
                                  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXApplicationAttribute")))
                                  {
                                    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXAssistiveTechnologyFocusedAttribute")))
                                    {
                                      if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXSupportsActivateActionAttribute")))
                                      {
                                        if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXURLAttribute")))
                                        {
                                          if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXWindowContextIdAttribute")))
                                          {
                                            if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXFirstSiblingAttribute")))
                                            {
                                              if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXLastSiblingAttribute")))
                                              {
                                                if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXLinkedElementAttribute")))
                                                {
                                                  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXIsVisibleAttribute")))
                                                  {
                                                    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("kAXHeaderElementsAttribute")))
                                                    {
                                                      v2 = 0;
                                                    }
                                                    else
                                                    {
                                                      v2 = 2026;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v2 = 2025;
                                                  }
                                                }
                                                else
                                                {
                                                  v2 = 2024;
                                                }
                                              }
                                              else
                                              {
                                                v2 = 2023;
                                              }
                                            }
                                            else
                                            {
                                              v2 = 2022;
                                            }
                                          }
                                          else
                                          {
                                            v2 = 2021;
                                          }
                                        }
                                        else
                                        {
                                          v2 = 2020;
                                        }
                                      }
                                      else
                                      {
                                        v2 = 2019;
                                      }
                                    }
                                    else
                                    {
                                      v2 = 2018;
                                    }
                                  }
                                  else
                                  {
                                    v2 = 2017;
                                  }
                                }
                                else
                                {
                                  v2 = 2016;
                                }
                              }
                              else
                              {
                                v2 = 2015;
                              }
                            }
                            else
                            {
                              v2 = 2014;
                            }
                          }
                          else
                          {
                            v2 = 2013;
                          }
                        }
                        else
                        {
                          v2 = 2012;
                        }
                      }
                      else
                      {
                        v2 = 2011;
                      }
                    }
                    else
                    {
                      v2 = 2010;
                    }
                  }
                  else
                  {
                    v2 = 2009;
                  }
                }
                else
                {
                  v2 = 2008;
                }
              }
              else
              {
                v2 = 2007;
              }
            }
            else
            {
              v2 = 2006;
            }
          }
          else
          {
            v2 = 2005;
          }
        }
        else
        {
          v2 = 2004;
        }
      }
      else
      {
        v2 = 2003;
      }
    }
    else
    {
      v2 = 2002;
    }
  }
  else
  {
    v2 = 2001;
  }

  return v2;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id AXPConvertValue(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v6);
          AXPConvertValue(*(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), a2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v8);
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v3;
      v12 = v3;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(v12, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
            objc_msgSend(v12, "objectForKeyedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            AXPConvertValue(v19, a2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, v18);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v15);
      }

      v3 = v24;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[AXPTranslator sharedInstance](AXPTranslator, "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "platformTranslator");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "platformElementFromTranslation:", v3);
        v5 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v5 = v3;
      }
    }
  }

  return v5;
}

uint64_t AXPClientIsEntitledForRemoteDeviceContent()
{
  return 1;
}

uint64_t AXPIsCatalyst()
{
  if (AXPIsCatalyst_onceToken != -1)
    dispatch_once(&AXPIsCatalyst_onceToken, &__block_literal_global_0);
  return 0;
}

uint64_t AXPIsiOSAppOnMac()
{
  if (AXPIsiOSAppOnMac_onceToken != -1)
    dispatch_once(&AXPIsiOSAppOnMac_onceToken, &__block_literal_global_5);
  return 0;
}

uint64_t AXPLinkedOnOrAfterGozul()
{
  if (AXPLinkedOnOrAfterGozul_onceToken != -1)
    dispatch_once(&AXPLinkedOnOrAfterGozul_onceToken, &__block_literal_global_6);
  return AXPLinkedOnOrAfterGozul_isLinkedOnOrAfterGozul;
}

uint64_t AXPIsGoodOldAppleCatalystApp()
{
  if (AXPIsGoodOldAppleCatalystApp_onceToken != -1)
    dispatch_once(&AXPIsGoodOldAppleCatalystApp_onceToken, &__block_literal_global_7);
  return AXPIsGoodOldAppleCatalystApp_isGoodOldApp;
}

uint64_t AXPIsSwiftPlaygrounds()
{
  if (AXPIsSwiftPlaygrounds_onceToken != -1)
    dispatch_once(&AXPIsSwiftPlaygrounds_onceToken, &__block_literal_global_29);
  return AXPIsSwiftPlaygrounds_isSwiftPlaygrounds;
}

BOOL AXPNilOrEmptyString(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  if (v1)
  {
    objc_opt_class();
    v2 = ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && objc_msgSend(v1, "length") == 0;
  }
  else
  {
    v2 = 1;
  }

  return v2;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_4()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

__CFString *_AXPNotificationToString(unint64_t a1)
{
  if (a1 > 0xF)
    return 0;
  else
    return off_24E6AC2A0[a1];
}

__CFString *_AXPActionToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x10)
    return 0;
  else
    return off_24E6AC320[a1 - 1];
}

__CFString *_AXPAttributeToString(unint64_t a1)
{
  if (a1 > 0x7C)
    return 0;
  else
    return off_24E6AC3A8[a1];
}

void _convertAXNotificationForElementWithData_cold_1()
{
  __assert_rtn("_convertAXNotificationForElementWithData", "AXPTranslator_iOS.m", 890, "outTranslationObject != nil");
}

uint64_t _convertDurationTime_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __30__AXPRemoteCacheManager_start__block_invoke_cold_1(v0);
}

uint64_t AXConvertPointFromHostedCoordinates()
{
  return MEMORY[0x24BDFE8C0]();
}

uint64_t AXDisableAccessibilityOnTermination()
{
  return MEMORY[0x24BDFE8E0]();
}

AXError AXObserverAddNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification, void *refcon)
{
  return MEMORY[0x24BDFE900](observer, element, notification, refcon);
}

AXError AXObserverCreate(pid_t application, AXObserverCallback callback, AXObserverRef *outObserver)
{
  return MEMORY[0x24BDFE908](*(_QWORD *)&application, callback, outObserver);
}

CFRunLoopSourceRef AXObserverGetRunLoopSource(AXObserverRef observer)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDFE910](observer);
}

uint64_t AXOverrideRequestingClientType()
{
  return MEMORY[0x24BDFE920]();
}

uint64_t AXPlatformTranslationLogCommon()
{
  return MEMORY[0x24BDFE288]();
}

uint64_t AXUIElementCopyElementUsingDisplayIdAtPosition()
{
  return MEMORY[0x24BDFE9C8]();
}

AXError AXUIElementCopyMultipleAttributeValues(AXUIElementRef element, CFArrayRef attributes, AXCopyMultipleAttributeOptions options, CFArrayRef *values)
{
  return MEMORY[0x24BDFE9D0](element, attributes, *(_QWORD *)&options, values);
}

AXUIElementRef AXUIElementCreateSystemWide(void)
{
  return (AXUIElementRef)MEMORY[0x24BDFE9D8]();
}

AXError AXUIElementGetPid(AXUIElementRef element, pid_t *pid)
{
  return MEMORY[0x24BDFE9E0](element, pid);
}

CFTypeID AXUIElementGetTypeID(void)
{
  return MEMORY[0x24BDFE9E8]();
}

uint64_t AXUIElementIsApplication()
{
  return MEMORY[0x24BDFE9F0]();
}

AXValueRef AXValueCreate(AXValueType theType, const void *valuePtr)
{
  return (AXValueRef)MEMORY[0x24BDFEA28](*(_QWORD *)&theType, valuePtr);
}

AXValueType AXValueGetType(AXValueRef value)
{
  return MEMORY[0x24BDFEA30](value);
}

CFTypeID AXValueGetTypeID(void)
{
  return MEMORY[0x24BDFEA38]();
}

Boolean AXValueGetValue(AXValueRef value, AXValueType theType, void *valuePtr)
{
  return MEMORY[0x24BDFEA40](value, *(_QWORD *)&theType, valuePtr);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x24BDBC8B0]();
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x24BDBC900]();
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x24BDBDB20]();
}

CFTypeID CGPathGetTypeID(void)
{
  return MEMORY[0x24BDBEEE8]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x24BDD11E8]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x24BDE8CC8](rnd, count, bytes);
}

uint64_t _AXBroadcastEventProcessNotification()
{
  return MEMORY[0x24BDFECF0]();
}

uint64_t _AXCreateAXUIElementWithElement()
{
  return MEMORY[0x24BDFECF8]();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x24BED2040]();
}

uint64_t _AXSApplicationAccessibilitySetEnabled()
{
  return MEMORY[0x24BED2048]();
}

uint64_t _AXUIElementCopyElementAtPositionWithParams()
{
  return MEMORY[0x24BDFED38]();
}

uint64_t _AXUIElementCreateAppElementWithPid()
{
  return MEMORY[0x24BDFED40]();
}

uint64_t _AXUIElementCreateData()
{
  return MEMORY[0x24BDFED48]();
}

uint64_t _AXUIElementCreateWithData()
{
  return MEMORY[0x24BDFED50]();
}

uint64_t _AXUIElementCreateWithPIDAndID()
{
  return MEMORY[0x24BDFED58]();
}

uint64_t _AXUIElementIDForElement()
{
  return MEMORY[0x24BDFED60]();
}

uint64_t _AXUIElementRegisterNotificationBypassCallback()
{
  return MEMORY[0x24BDFED68]();
}

uint64_t _AXUIElementRegisterSystemWideServerBroadcastRelayerCallback()
{
  return MEMORY[0x24BDFED70]();
}

uint64_t _AXUIElementServerRegistered()
{
  return MEMORY[0x24BDFED80]();
}

uint64_t _AXUIElementUnregisterServer()
{
  return MEMORY[0x24BDFED90]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

