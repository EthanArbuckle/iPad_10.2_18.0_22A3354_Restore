@implementation ABAddressBookSetBestMeIfNeeded

void __ABAddressBookSetBestMeIfNeeded_block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  void **v7;
  void *v8;

  v7 = (void **)objc_msgSend(a2, "context");
  if (objc_msgSend(a3, "count"))
  {
    v8 = *v7;
    if (!*v7)
    {
      v8 = (void *)objc_opt_new();
      *v7 = v8;
    }
    objc_msgSend(v8, "addObjectsFromArray:", a3);
  }
  if ((a4 & 1) == 0)
    CFRunLoopStop(*(CFRunLoopRef *)(a1 + 32));
}

void __ABAddressBookSetBestMeIfNeeded_block_invoke_2(uint64_t a1, ABRecordRef person, uint64_t a3, _BYTE *a4)
{
  ABRecordRef v6;
  const void *v7;
  int v8;
  void *v9;

  v6 = ABPersonCopySource(person);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6);
    v9 = *(void **)(a1 + 32);
    if (v8)
    {
      objc_msgSend(v9, "removeAllObjects");
      *a4 = 1;
    }
    else
    {
      objc_msgSend(v9, "addObject:", v7);
    }
    CFRelease(v7);
  }
}

uint64_t __ABAddressBookSetBestMeIfNeeded_block_invoke_3(uint64_t a1, ABRecordRef person, const void *a3)
{
  ABRecordRef v4;
  ABRecordRef v5;
  ABRecordRef v6;
  const void *v7;
  int IntValue;
  int v9;
  uint64_t v10;

  v4 = *(ABRecordRef *)(a1 + 32);
  v5 = ABPersonCopySource(person);
  v6 = ABPersonCopySource(a3);
  v7 = v6;
  if (v5 == v6)
  {
    v10 = 0;
    if (!v5)
      goto LABEL_23;
    goto LABEL_22;
  }
  if (v5 == v4)
  {
    v10 = 1;
    if (!v5)
      goto LABEL_23;
LABEL_22:
    CFRelease(v5);
    goto LABEL_23;
  }
  if (v6 != v4)
  {
    if (v5 && v6)
    {
      IntValue = ABRecordGetIntValue((uint64_t)v5, kABSourceTypeProperty);
      v9 = ABRecordGetIntValue((uint64_t)v7, kABSourceTypeProperty);
      if ((int)(IntValue & 0xFEFFFFFF) <= (int)(v9 & 0xFEFFFFFF))
      {
        if ((int)(v9 & 0xFEFFFFFF) <= (int)(IntValue & 0xFEFFFFFF))
          v10 = 0;
        else
          v10 = -1;
      }
      else
      {
        v10 = 1;
      }
    }
    else
    {
      if (v5)
        v10 = v6 == 0;
      else
        v10 = -1;
      if (!v5)
        goto LABEL_23;
    }
    goto LABEL_22;
  }
  v10 = -1;
  if (v5)
    goto LABEL_22;
LABEL_23:
  if (v7)
    CFRelease(v7);
  return v10;
}

@end
