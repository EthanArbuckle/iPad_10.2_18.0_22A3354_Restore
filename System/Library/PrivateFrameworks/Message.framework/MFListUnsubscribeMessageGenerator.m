@implementation MFListUnsubscribeMessageGenerator

void __58__MFListUnsubscribeMessageGenerator_iOS_senderForCommand___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id obj;

  obj = a2;
  v7 = a3;
  if (objc_msgSend(v7, "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    v8 = obj;
    objc_msgSend(v8, "emailAddressValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "simpleAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v8, "stringValue");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    obj = v12;

    if (!objc_msgSend(obj, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32)))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
      *a4 = 1;
    }
  }

}

@end
