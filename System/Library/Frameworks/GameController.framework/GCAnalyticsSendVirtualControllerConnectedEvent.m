@implementation GCAnalyticsSendVirtualControllerConnectedEvent

xpc_object_t __GCAnalyticsSendVirtualControllerConnectedEvent_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  xpc_object_t v13;
  id v14;
  const char *v15;
  id v16;
  uint64_t i;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  xpc_object_t v24;
  char *keys[2];
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  +[NSBundle mainBundle](&off_254DF2768, "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[NSProcessInfo processInfo](&off_254DF29B0, "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "processName");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v7 = *(unsigned __int8 *)(a1 + 40);
  v8 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("Left Thumbstick"));
  v9 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("Right Thumbstick"));
  v10 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("Direction Pad"));
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("Left Shoulder")) & 1) != 0)
    v11 = 1;
  else
    v11 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("Right Shoulder"));
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("Left Trigger")) & 1) != 0)
    v12 = 1;
  else
    v12 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", CFSTR("Right Trigger"));
  *(_OWORD *)keys = xmmword_24D2B4EC0;
  v26 = *(_OWORD *)&off_24D2B4ED0;
  v27 = xmmword_24D2B4EE0;
  v19 = xpc_BOOL_create(v7 != 0);
  v20 = xpc_BOOL_create(v8);
  v21 = xpc_BOOL_create(v9);
  v22 = xpc_BOOL_create(v10);
  v23 = xpc_BOOL_create(v11);
  v24 = xpc_BOOL_create(v12);
  v13 = xpc_dictionary_create((const char *const *)keys, &v19, 6uLL);
  if (v13)
  {
    v14 = objc_retainAutorelease(v5);
    v15 = (const char *)objc_msgSend(v14, "UTF8String", v19, v20, v21, v22, v23);
    if (v15)
      xpc_dictionary_set_string(v13, "bundleID", v15);
    v16 = v13;
  }

  for (i = 40; i != -8; i -= 8)
  return v13;
}

@end
