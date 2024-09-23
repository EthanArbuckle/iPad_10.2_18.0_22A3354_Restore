@implementation ProcessHIDElements

void __ProcessHIDElements_block_invoke(uint64_t a1, IOHIDElementRef element)
{
  signed int UsagePage;
  signed int Usage;
  IOHIDElementType Type;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id *v13;
  id *v14;
  unint64_t j;
  __IOHIDElement *v16;
  uint32_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  UsagePage = IOHIDElementGetUsagePage(element);
  Usage = IOHIDElementGetUsage(element);
  Type = IOHIDElementGetType(element);
  if (Type - 1 >= 3)
  {
    if (Type != kIOHIDElementTypeCollection)
      return;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    IOHIDElementGetChildren(element);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          (*(void (**)(uint64_t))(v12 + 16))(v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }
LABEL_34:

    return;
  }
  if (UsagePage > 8)
  {
    if (UsagePage == 9 || UsagePage == 12)
      goto LABEL_27;
  }
  else
  {
    if (UsagePage != 1)
    {
      if (UsagePage != 2 || (Usage - 186) > 0xB || ((1 << (Usage + 70)) & 0xC03) == 0)
        return;
      goto LABEL_22;
    }
    if (Usage <= 56)
    {
      if ((Usage - 48) >= 9)
        return;
LABEL_22:
      v13 = (id *)(a1 + 32);
      if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", element) & 1) != 0)
        return;
      v14 = (id *)(a1 + 40);
      goto LABEL_29;
    }
    if ((Usage - 133) <= 0xE && ((1 << (Usage + 123)) & 0x7801) != 0 || (Usage - 61) < 2)
    {
LABEL_27:
      v13 = (id *)(a1 + 32);
      if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", element) & 1) != 0)
        return;
      v14 = (id *)(a1 + 56);
      goto LABEL_29;
    }
    if (Usage == 57)
    {
      v13 = (id *)(a1 + 32);
      if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", element) & 1) == 0)
      {
        v14 = (id *)(a1 + 48);
LABEL_29:
        v7 = *v14;
        objc_msgSend(*v13, "addObject:", element);
        if (!v7)
          return;
        for (j = 0; j < objc_msgSend(v7, "count"); ++j)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", j);
          v16 = (__IOHIDElement *)objc_claimAutoreleasedReturnValue();
          v17 = IOHIDElementGetUsage(v16);

          if (Usage < v17)
            break;
        }
        objc_msgSend(v7, "insertObject:atIndex:", element, j);
        goto LABEL_34;
      }
    }
  }
}

void __ProcessHIDElements_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  __IOHIDElement *element;

  element = a2;
  IOHIDElementSetProperty(element, CFSTR("UsageType"), &unk_1EA4F16E8);
  IOHIDElementSetProperty(element, CFSTR("UsageTypeIndex"), +[NSNumber numberWithUnsignedInteger:](&off_1F03A9E90, "numberWithUnsignedInteger:", a3));

}

void __ProcessHIDElements_block_invoke_65(uint64_t a1, void *a2, uint64_t a3)
{
  __IOHIDElement *element;

  element = a2;
  IOHIDElementSetProperty(element, CFSTR("UsageType"), &unk_1EA4F1700);
  IOHIDElementSetProperty(element, CFSTR("UsageTypeIndex"), +[NSNumber numberWithUnsignedInteger:](&off_1F03A9E90, "numberWithUnsignedInteger:", a3));

}

void __ProcessHIDElements_block_invoke_68(uint64_t a1, void *a2, uint64_t a3)
{
  __IOHIDElement *element;

  element = a2;
  IOHIDElementSetProperty(element, CFSTR("UsageType"), &unk_1EA4F1718);
  IOHIDElementSetProperty(element, CFSTR("UsageTypeIndex"), +[NSNumber numberWithUnsignedInteger:](&off_1F03A9E90, "numberWithUnsignedInteger:", a3));

}

@end
