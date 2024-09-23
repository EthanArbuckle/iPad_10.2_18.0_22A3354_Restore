@implementation CreateDCSDictionaryCardClass

Ivar ___CreateDCSDictionaryCardClass_block_invoke(int a1, id obj, void *a3)
{
  return object_setInstanceVariableWithStrongDefault(obj, "_dictionaryID", a3);
}

Ivar ___CreateDCSDictionaryCardClass_block_invoke_2(int a1, id obj, void *a3)
{
  return object_setInstanceVariableWithStrongDefault(obj, "_searchString", a3);
}

id ___CreateDCSDictionaryCardClass_block_invoke_3(int a1, id obj)
{
  objc_super v4;
  void *outValue;

  outValue = 0;
  object_getInstanceVariable(obj, "_dictionaryID", &outValue);
  ReleaseObjCObject(outValue);
  object_getInstanceVariable(obj, "_searchString", &outValue);
  ReleaseObjCObject(outValue);
  v4.receiver = obj;
  v4.super_class = objc_getClass("SFCard");
  return objc_msgSendSuper(&v4, sel_dealloc);
}

uint64_t ___CreateDCSDictionaryCardClass_block_invoke_4()
{
  return 1;
}

id ___CreateDCSDictionaryCardClass_block_invoke_5(int a1, id obj, void *a3)
{
  objc_super v6;
  void *outValue;

  outValue = 0;
  object_getInstanceVariable(obj, "_dictionaryID", &outValue);
  objc_msgSend(a3, sel_encodeObject_forKey_, outValue, CFSTR("dcs_dictionaryID"));
  object_getInstanceVariable(obj, "_searchString", &outValue);
  objc_msgSend(a3, sel_encodeObject_forKey_, outValue, CFSTR("dcs_searchString"));
  v6.receiver = obj;
  v6.super_class = objc_getClass("SFCard");
  return objc_msgSendSuper(&v6, sel_encodeWithCoder_, a3);
}

id ___CreateDCSDictionaryCardClass_block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = a2;
  v8.super_class = objc_getClass("SFCard");
  v4 = objc_msgSendSuper(&v8, sel_initWithCoder_, a3);
  v5 = objc_msgSend(a3, sel_decodeObjectOfClass_forKey_, objc_getClass("NSString"), CFSTR("dcs_dictionaryID"));
  object_setInstanceVariableWithStrongDefault(v4, "_dictionaryID", v5);
  v6 = objc_msgSend(a3, sel_decodeObjectOfClass_forKey_, objc_getClass("NSString"), CFSTR("dcs_searchString"));
  object_setInstanceVariableWithStrongDefault(v4, "_searchString", v6);
  return v4;
}

void ___CreateDCSDictionaryCardClass_block_invoke_7(uint64_t a1, id a2, uint64_t a3)
{
  id v6;
  NSObject *global_queue;
  uint64_t v8;
  _QWORD block[7];

  v6 = objc_msgSend(a2, sel_cardSections);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v6);
  }
  else
  {
    global_queue = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___CreateDCSDictionaryCardClass_block_invoke_8;
    block[3] = &unk_1E8B577E8;
    v8 = *(_QWORD *)(a1 + 32);
    block[4] = a2;
    block[5] = v8;
    block[6] = a3;
    dispatch_async(global_queue, block);
  }
}

uint64_t ___CreateDCSDictionaryCardClass_block_invoke_8(uint64_t a1)
{
  const __CFString *v2;
  __CFArray *v3;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  const void *ValueAtIndex;
  const __CFString *Identifier;
  DCSDictionary **v10;
  const __CFString *v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  CFArrayRef v15;
  void *values;
  CFStringRef theString;
  void *outValue;
  CFRange v20;

  outValue = 0;
  object_getInstanceVariable(*(id *)(a1 + 32), "_dictionaryID", &outValue);
  v2 = (const __CFString *)outValue;
  v3 = DCSCopyActiveDictionaries(0);
  v4 = v3;
  if (v3)
  {
    Count = CFArrayGetCount(v3);
    if (Count < 1)
    {
LABEL_6:
      v10 = 0;
    }
    else
    {
      v6 = Count;
      v7 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v4, v7);
        Identifier = (const __CFString *)DCSDictionaryGetIdentifier((uint64_t)ValueAtIndex);
        if (CFStringCompare(Identifier, v2, 0) == kCFCompareEqualTo)
          break;
        if (v6 == ++v7)
          goto LABEL_6;
      }
      v10 = (DCSDictionary **)CFRetain(ValueAtIndex);
    }
    CFRelease(v4);
    if (v10)
    {
      theString = 0;
      object_getInstanceVariable(*(id *)(a1 + 32), "_searchString", (void **)&theString);
      v11 = theString;
      if (theString && CFStringGetLength(theString) >= 1)
      {
        v12 = (id)objc_opt_new();
        values = v12;
        v20.length = CFStringGetLength(v11);
        v20.location = 0;
        v13 = DCSCopyDefinitionMarkup(v10, v11, v20, 1, 0);
        if (v13)
        {
          v14 = v13;
          objc_msgSend(v12, sel_setHtmlString_, v13);
          CFRelease(v14);
        }
        v15 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
        objc_msgSend(*(id *)(a1 + 32), sel_setCardSections_, v15);
        CFRelease(v15);
      }
      CFRelease(v10);
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

@end
