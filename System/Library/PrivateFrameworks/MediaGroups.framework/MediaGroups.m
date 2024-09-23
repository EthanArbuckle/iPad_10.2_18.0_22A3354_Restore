id MGLogForCategory(int a1)
{
  if (MGLogForCategory_onceToken != -1)
    dispatch_once(&MGLogForCategory_onceToken, &__block_literal_global);
  return (id)MGLogForCategory_oslog[a1];
}

void sub_2172B4824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
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

void sub_2172B515C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2172B5628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  id *v22;
  id *v23;
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v23);
  objc_destroyWeak(v24);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_2172B5768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_2172B59B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2172B6008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_2172B63DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2172B67F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2172B7978(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_2172B7BEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2172B7E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2172B7F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MGSetServiceXPCInterfacesOnConnection(void *a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v50;

  v50 = a1;
  v44 = &unk_254EEB188;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)MEMORY[0x24BDBCF20];
  v41 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v47, "setWithObjects:", v41, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:");
  if ((a2 & 1) != 0)
    objc_msgSend(v50, "setRemoteObjectInterface:", v2);
  else
    objc_msgSend(v50, "setExportedInterface:", v2);
  v48 = &unk_254EEB338;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", v48);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDBCF20];
  v45 = objc_opt_class();
  v40 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v45, v40, v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_createGroupWithType_name_members_completion_, 2, 0);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_createGroupWithType_name_members_completion_, 0, 1);
  v46 = (void *)MEMORY[0x24BDBCF20];
  v43 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  v30 = objc_opt_class();
  objc_msgSend(v46, "setWithObjects:", v43, v23, v24, v25, v26, v27, v28, v29, v30, objc_opt_class(), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_addMember_group_completion_, 0, 0);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_addMember_group_completion_, 1, 0);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_addMember_group_completion_, 0, 1);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_removeMember_group_completion_, 0, 0);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_removeMember_group_completion_, 1, 0);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_removeMember_group_completion_, 0, 1);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_deleteGroup_completion_, 1, 0);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_setName_group_completion_, 1, 0);
  v33 = (void *)MEMORY[0x24BDBCF20];
  v34 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_startQueryWithPredicate_completion_, 0, 0);
  v36 = (void *)MEMORY[0x24BDBCF20];
  v37 = objc_opt_class();
  v38 = objc_opt_class();
  objc_msgSend(v36, "setWithObjects:", v37, v38, objc_opt_class(), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_HomeKitAccessoryOfType_accessoryIdentifier_homeIdentifier_categoryType_name_properties_completion_, 5, 0);
  if ((a2 & 1) != 0)
    objc_msgSend(v50, "setExportedInterface:", v12);
  else
    objc_msgSend(v50, "setRemoteObjectInterface:", v12);

}

MGGroupIdentifier *MGGroupIdentifierCopyApplyingHashing(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MGGroupIdentifier *v18;
  void *v20;
  CC_SHA256_CTX c;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unsigned __int8 md[32];
  _QWORD data[2];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("mg-hk-entity"));

  if (!v4)
    goto LABEL_15;
  _MGRelevantComponentsForGroupIdentifierComponents(v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {

LABEL_15:
    v18 = (MGGroupIdentifier *)objc_msgSend(v1, "copy");
    goto LABEL_16;
  }
  v20 = v2;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(CFSTR("msi"), "isEqualToString:", v12, v20))
        {
          objc_msgSend(v7, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          memset(&c, 0, sizeof(c));
          CC_SHA256_Init(&c);
          data[0] = 0;
          data[1] = 0;
          objc_msgSend(v7, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "getUUIDBytes:", data);

          CC_SHA256_Update(&c, data, 0x10u);
          CC_SHA256_Final(md, &c);
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", md);
        }
        v15 = v13;
        objc_msgSend(v13, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", v12, v16);
        objc_msgSend(v6, "addObject:", v17);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v9);
  }

  v2 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend(v2, "setQueryItems:", v6);
  v18 = -[MGGroupIdentifier initWithURLComponents:]([MGGroupIdentifier alloc], "initWithURLComponents:", v2);

LABEL_16:
  return v18;
}

id _MGRelevantComponentsForGroupIdentifierComponents(void *a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("mg-hk-entity"));

  if (v3)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = v1;
    objc_msgSend(v1, "queryItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v9, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(CFSTR("hi"), "isEqualToString:", v10) & 1) != 0
            || (objc_msgSend(CFSTR("zi"), "isEqualToString:", v10) & 1) != 0
            || (objc_msgSend(CFSTR("ri"), "isEqualToString:", v10) & 1) != 0
            || (objc_msgSend(CFSTR("ai"), "isEqualToString:", v10) & 1) != 0
            || (objc_msgSend(CFSTR("msi"), "isEqualToString:", v10) & 1) != 0
            || objc_msgSend(CFSTR("ht"), "isEqualToString:", v10))
          {
            v11 = objc_alloc(MEMORY[0x24BDD1880]);
            objc_msgSend(v9, "value");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);

            if (v13)
              objc_msgSend(v16, "setObject:forKey:", v13, v10);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

    v1 = v15;
  }

  return v16;
}

id MGHomeUniqueIdentifierForAccessory(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "home");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id MGAccessoryCategoryTypeForAccessory(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "category");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id MGGroupIdentifierForAccessory(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  MGAccessoryCategoryTypeForAccessory(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v6;
  v9 = v5;
  _MGGroupIdentifierAccessoryPathForCategoryType(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _MGGroupIdentifierHomeKitComponents(v10, v8, v12, v13, v14, v15, v16, v17, CFSTR("ai"), (uint64_t)v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

const __CFString *_MGGroupIdentifierAccessoryPathForCategoryType(void *a1)
{
  id v1;
  const __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(CFSTR("1D8FD40E-7CAE-4AD5-9973-977D18890DE2"), "isEqualToString:", v1) & 1) != 0)
  {
    v2 = CFSTR("com.apple.media-group.solo-HomePodAccessory");
  }
  else if ((objc_msgSend(CFSTR("F6D2A2AC-3A6E-4E6F-8196-678ABE909D8E"), "isEqualToString:", v1) & 1) != 0)
  {
    v2 = CFSTR("com.apple.media-group.solo-AppleTVAccessory");
  }
  else if ((objc_msgSend(CFSTR("C0F5EDC5-4003-464A-9E5D-0DB36677BC35"), "isEqualToString:", v1) & 1) != 0)
  {
    v2 = CFSTR("com.apple.media-group.solo-SpeakerAccessory");
  }
  else if (objc_msgSend(CFSTR("BE15659C-3CE6-4FD0-B152-BCDB488446C6"), "isEqualToString:", v1))
  {
    v2 = CFSTR("com.apple.media-group.solo-AudioReceiverAccessory");
  }
  else
  {
    v2 = CFSTR("com.apple.media-group.solo-Accessory");
  }

  return v2;
}

MGGroupIdentifier *_MGGroupIdentifierHomeKitComponents(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id *v19;
  id v20;
  void *v21;
  void *v22;
  id *v23;
  id v24;
  MGGroupIdentifier *v25;
  id *v27;
  id *v28;

  v11 = a1;
  v12 = a2;
  v13 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v13, "setScheme:", CFSTR("mg-hk-entity"));
  if (v11)
    objc_msgSend(v13, "setPath:", v11);
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(v12, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("hi"), v16);
  objc_msgSend(v14, "addObject:", v17);

  v27 = (id *)&a10;
  v18 = a9;
  if (v18)
  {
    do
    {
      v19 = v27;
      v28 = v27 + 1;
      v20 = *v19;
      if (!v20)
        break;
      v21 = v20;
      if ((objc_msgSend(CFSTR("hi"), "isEqualToString:", v18) & 1) == 0 && _NSIsNSString())
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", v18, v21);
        objc_msgSend(v14, "addObject:", v22);

      }
      v23 = v28;
      v27 = v28 + 1;
      v24 = *v23;

      v18 = v24;
    }
    while (v24);
  }
  objc_msgSend(v13, "setQueryItems:", v14);
  v25 = -[MGGroupIdentifier initWithURLComponents:]([MGGroupIdentifier alloc], "initWithURLComponents:", v13);

  return v25;
}

id MGAccessoryIdentifierForGroupIdentifier(void *a1)
{
  return _MGHomeKitIdentifierForGroupIdentifier(a1, CFSTR("ai"));
}

id _MGHomeKitIdentifierForGroupIdentifier(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(a1, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MGRelevantComponentsForGroupIdentifierComponents(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

id MGAccessoryFromHomeManagerForGroupIdentifier(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MGRelevantComponentsForGroupIdentifierComponents(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("hi"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ai"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v6 && v7)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v3, "homes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v11)
    {
      v12 = v11;
      v34 = v5;
      v35 = v4;
      v13 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v41 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v15, "uniqueIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqual:", v6);

          if (v17)
          {
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            objc_msgSend(v15, "accessories");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            if (v19)
            {
              v20 = v19;
              v33 = v3;
              v21 = *(_QWORD *)v37;
              while (2)
              {
                for (j = 0; j != v20; ++j)
                {
                  if (*(_QWORD *)v37 != v21)
                    objc_enumerationMutation(v18);
                  v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
                  objc_msgSend(v23, "uniqueIdentifier");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = objc_msgSend(v24, "isEqual:", v8);

                  if (v25)
                  {
                    objc_msgSend(v23, "category");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "categoryType");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();

                    v4 = v35;
                    objc_msgSend(v35, "path");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v32 = v27;
                    _MGGroupIdentifierAccessoryPathForCategoryType(v27);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v30 = objc_msgSend(v28, "isEqualToString:", v29);

                    if (v30)
                      v9 = v23;
                    else
                      v9 = 0;
                    v3 = v33;
                    v5 = v34;

                    goto LABEL_28;
                  }
                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
                if (v20)
                  continue;
                break;
              }
              v9 = 0;
              v3 = v33;
            }
            else
            {
              v9 = 0;
            }
            v5 = v34;
            v4 = v35;
LABEL_28:

            goto LABEL_29;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v12)
          continue;
        break;
      }
      v9 = 0;
      v5 = v34;
      v4 = v35;
    }
    else
    {
      v9 = 0;
    }
LABEL_29:

  }
  return v9;
}

id MGMemberIdentifiersForMediaSystem(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = v3;
  v6 = v4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  objc_msgSend(v5, "components");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, &v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11), "mediaProfile");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "accessory");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v7, "arrayByAddingObject:", v13);
          v14 = objc_claimAutoreleasedReturnValue();

          v7 = (id)v14;
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, &v25, 16);
    }
    while (v9);
  }

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __MGMemberIdentifiersForMediaSystem_block_invoke;
  v18[3] = &unk_24D726CF8;
  v15 = v6;
  v19 = v15;
  v20 = &v25;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v18);
  v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v16;
}

void sub_2172B9B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

id MGMediaSystemFromHomeManagerForGroupIdentifier(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  int v23;
  id v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MGRelevantComponentsForGroupIdentifierComponents(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("hi"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("msi"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v6 && v7)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v3, "homes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v11)
    {
      v12 = v11;
      v26 = v5;
      v27 = v4;
      v13 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v15, "uniqueIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqual:", v6);

          if (v17)
          {
            v30 = 0u;
            v31 = 0u;
            v28 = 0u;
            v29 = 0u;
            objc_msgSend(v15, "mediaSystems");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v9)
            {
              v25 = v3;
              v19 = *(_QWORD *)v29;
              while (2)
              {
                for (j = 0; j != v9; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v29 != v19)
                    objc_enumerationMutation(v18);
                  v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
                  objc_msgSend(v21, "uniqueIdentifier");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v22, "isEqual:", v8);

                  if (v23)
                  {
                    v9 = v21;
                    goto LABEL_23;
                  }
                }
                v9 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
                if (v9)
                  continue;
                break;
              }
LABEL_23:
              v3 = v25;
            }

            goto LABEL_25;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v12)
          continue;
        break;
      }
      v9 = 0;
LABEL_25:
      v5 = v26;
      v4 = v27;
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

id MGMemberIdentifiersForRoomInHome(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a1;
  v4 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  objc_msgSend(v3, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __MGMemberIdentifiersForRoomInHome_block_invoke;
  v9[3] = &unk_24D726CF8;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void sub_2172B9F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MGRoomFromHomeManagerForGroupIdentifier(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  int v23;
  id v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MGRelevantComponentsForGroupIdentifierComponents(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("hi"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ri"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v6 && v7)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v3, "homes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v11)
    {
      v12 = v11;
      v26 = v5;
      v27 = v4;
      v13 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v15, "uniqueIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqual:", v6);

          if (v17)
          {
            v30 = 0u;
            v31 = 0u;
            v28 = 0u;
            v29 = 0u;
            objc_msgSend(v15, "rooms");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v9)
            {
              v25 = v3;
              v19 = *(_QWORD *)v29;
              while (2)
              {
                for (j = 0; j != v9; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v29 != v19)
                    objc_enumerationMutation(v18);
                  v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
                  objc_msgSend(v21, "uniqueIdentifier");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v22, "isEqual:", v8);

                  if (v23)
                  {
                    v9 = v21;
                    goto LABEL_23;
                  }
                }
                v9 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
                if (v9)
                  continue;
                break;
              }
LABEL_23:
              v3 = v25;
            }

            goto LABEL_25;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v12)
          continue;
        break;
      }
      v9 = 0;
LABEL_25:
      v5 = v26;
      v4 = v27;
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

id MGMemberIdentifiersForZoneInHome(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a1;
  v4 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  objc_msgSend(v3, "rooms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __MGMemberIdentifiersForZoneInHome_block_invoke;
  v9[3] = &unk_24D726D20;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void sub_2172BA3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MGGroupIdentifierForRoomInHome(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(a1, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MGGroupIdentifierForRoomIdentifierInHome(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id MGZoneFromHomeManagerForGroupIdentifier(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  int v23;
  id v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MGRelevantComponentsForGroupIdentifierComponents(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("hi"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("zi"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v6 && v7)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v3, "homes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v11)
    {
      v12 = v11;
      v26 = v5;
      v27 = v4;
      v13 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v15, "uniqueIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqual:", v6);

          if (v17)
          {
            v30 = 0u;
            v31 = 0u;
            v28 = 0u;
            v29 = 0u;
            objc_msgSend(v15, "zones");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v9)
            {
              v25 = v3;
              v19 = *(_QWORD *)v29;
              while (2)
              {
                for (j = 0; j != v9; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v29 != v19)
                    objc_enumerationMutation(v18);
                  v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
                  objc_msgSend(v21, "uniqueIdentifier");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v22, "isEqual:", v8);

                  if (v23)
                  {
                    v9 = v21;
                    goto LABEL_23;
                  }
                }
                v9 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
                if (v9)
                  continue;
                break;
              }
LABEL_23:
              v3 = v25;
            }

            goto LABEL_25;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v12)
          continue;
        break;
      }
      v9 = 0;
LABEL_25:
      v5 = v26;
      v4 = v27;
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

id MGGroupIdentifierForHomeInHome(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(a1, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MGGroupIdentifierForHomeIdentifierInHome(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id MGMemberIdentifiersForHome(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v1 = a1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  objc_msgSend(v1, "rooms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __MGMemberIdentifiersForHome_block_invoke;
  v6[3] = &unk_24D726D20;
  v8 = &v9;
  v3 = v1;
  v7 = v3;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v4;
}

void sub_2172BA894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MGHomeFromHomeManagerForGroupIdentifier(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MGRelevantComponentsForGroupIdentifierComponents(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("hi"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "homes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v15 = v3;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "uniqueIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", v6);

          if (v13)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
LABEL_12:
      v3 = v15;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id MGGroupIdentifierForHomeIdentifierInHome(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  objc_msgSend(a1, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MGGroupIdentifierHomeKitComponents(0, v3, v5, v6, v7, v8, v9, v10, CFSTR("hi"), (uint64_t)v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id MGHomeIdentifierForGroupIdentifier(void *a1)
{
  return _MGHomeKitIdentifierForGroupIdentifier(a1, CFSTR("hi"));
}

id MGGroupIdentifierForZoneInHome(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(a1, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MGGroupIdentifierForZoneIdentifierInHome(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id MGGroupIdentifierForZoneIdentifierInHome(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  objc_msgSend(a1, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MGGroupIdentifierHomeKitComponents(0, v3, v5, v6, v7, v8, v9, v10, CFSTR("zi"), (uint64_t)v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id MGZoneIdentifierForGroupIdentifier(void *a1)
{
  return _MGHomeKitIdentifierForGroupIdentifier(a1, CFSTR("zi"));
}

id MGGroupIdentifierForRoomIdentifierInHome(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  objc_msgSend(a1, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MGGroupIdentifierHomeKitComponents(0, v3, v5, v6, v7, v8, v9, v10, CFSTR("ri"), (uint64_t)v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id MGRoomIdentifierForGroupIdentifier(void *a1)
{
  return _MGHomeKitIdentifierForGroupIdentifier(a1, CFSTR("ri"));
}

id MGGroupIdentifierForMediaSystemInHome(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(a1, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MGGroupIdentifierForMediaSystemIdentifierInHome(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id MGGroupIdentifierForMediaSystemIdentifierInHome(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  objc_msgSend(a1, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MGGroupIdentifierHomeKitComponents(0, v3, v5, v6, v7, v8, v9, v10, CFSTR("msi"), (uint64_t)v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id MGMediaSystemIdentifierForGroupIdentifier(void *a1)
{
  return _MGHomeKitIdentifierForGroupIdentifier(a1, CFSTR("msi"));
}

void sub_2172BB49C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x24BDD1250](proto);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x24BDBD178]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x24BEDCE80](cls, outCount);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

