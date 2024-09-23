@implementation NWUtilsCreateNSArrayFromXPCArray

uint64_t __NWUtilsCreateNSArrayFromXPCArray_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  Class Class;
  id NSObjectFromSimpleXPCObject;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t applier;
  uint64_t v14;
  uint64_t (*v15)();
  void *v16;
  id v17;

  v4 = a3;
  Class = object_getClass(v4);
  if (Class == (Class)MEMORY[0x1E0C812C8])
  {
    v7 = (void *)MEMORY[0x1E0C99DE8];
    v8 = v4;
    objc_msgSend(v7, "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    applier = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __NWUtilsCreateNSArrayFromXPCArray_block_invoke;
    v16 = &unk_1E14AC908;
    NSObjectFromSimpleXPCObject = v9;
    v17 = NSObjectFromSimpleXPCObject;
    xpc_array_apply(v8, &applier);
  }
  else
  {
    if (Class != (Class)MEMORY[0x1E0C812F8])
    {
      NSObjectFromSimpleXPCObject = NWUtilsCreateNSObjectFromSimpleXPCObject(v4);
      if (!NSObjectFromSimpleXPCObject)
        goto LABEL_9;
      goto LABEL_8;
    }
    v10 = (void *)MEMORY[0x1E0C99E08];
    v8 = v4;
    objc_msgSend(v10, "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    applier = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke;
    v16 = &unk_1E14A8E38;
    NSObjectFromSimpleXPCObject = v11;
    v17 = NSObjectFromSimpleXPCObject;
    xpc_dictionary_apply(v8, &applier);
  }

  if (NSObjectFromSimpleXPCObject)
LABEL_8:
    objc_msgSend(*(id *)(a1 + 32), "addObject:", NSObjectFromSimpleXPCObject);
LABEL_9:

  return 1;
}

@end
