@implementation GCAnalyticsSendCheckCompatibleHIDDeviceEvent

xpc_object_t __GCAnalyticsSendCheckCompatibleHIDDeviceEvent_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  xpc_object_t v11;
  id v12;
  const char *v13;
  id v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  void *v19;
  id v20;
  const char *v21;
  void *v22;
  id v23;
  const char *v24;
  id v25;
  uint64_t i;
  xpc_object_t values[4];
  char *keys[2];
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "vendorID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedShortValue");

  objc_msgSend(*(id *)(a1 + 32), "productID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedShortValue");

  objc_msgSend(*(id *)(a1 + 32), "versionNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedShortValue");

  *(_OWORD *)keys = xmmword_1EA4D4568;
  v30 = *(_OWORD *)off_1EA4D4578;
  objc_msgSend(*(id *)(a1 + 32), "vendorID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  values[0] = xpc_uint64_create(objc_msgSend(v8, "unsignedIntegerValue"));
  objc_msgSend(*(id *)(a1 + 32), "productID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  values[1] = xpc_uint64_create(objc_msgSend(v9, "unsignedIntegerValue"));
  objc_msgSend(*(id *)(a1 + 32), "versionNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  values[2] = xpc_uint64_create(objc_msgSend(v10, "unsignedIntegerValue"));
  values[3] = xpc_BOOL_create(*(_BYTE *)(a1 + 40));

  v11 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
  if (v11)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("v%05hu_p%05hu"), v3, v5);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    if (v13)
      xpc_dictionary_set_string(v11, "VendorProductID", v13);
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("v%05hu_p%05hu_r%05hu"), v3, v5, v7);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    if (v15)
      xpc_dictionary_set_string(v11, "VendorProductVersionID", v15);
    objc_msgSend(*(id *)(a1 + 32), "transport");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "length") || !objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("null")))
    {

      v16 = 0;
    }
    v17 = objc_retainAutorelease(v16);
    v18 = (const char *)objc_msgSend(v17, "UTF8String");
    if (v18)
      xpc_dictionary_set_string(v11, "Transport", v18);
    objc_msgSend(*(id *)(a1 + 32), "manufacturer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v19, "length")
      || !objc_msgSend(v19, "caseInsensitiveCompare:", CFSTR("null"))
      || !objc_msgSend(v19, "caseInsensitiveCompare:", CFSTR("unknown")))
    {

      v19 = 0;
    }
    v20 = objc_retainAutorelease(v19);
    v21 = (const char *)objc_msgSend(v20, "UTF8String");
    if (v21)
      xpc_dictionary_set_string(v11, "Manufacturer", v21);
    objc_msgSend(*(id *)(a1 + 32), "product");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v22, "length")
      || !objc_msgSend(v22, "caseInsensitiveCompare:", CFSTR("null"))
      || !objc_msgSend(v22, "caseInsensitiveCompare:", CFSTR("unknown")))
    {

      v22 = 0;
    }
    v23 = objc_retainAutorelease(v22);
    v24 = (const char *)objc_msgSend(v23, "UTF8String");
    if (v24)
      xpc_dictionary_set_string(v11, "Product", v24);
    v25 = v11;

  }
  for (i = 3; i != -1; --i)

  return v11;
}

@end
