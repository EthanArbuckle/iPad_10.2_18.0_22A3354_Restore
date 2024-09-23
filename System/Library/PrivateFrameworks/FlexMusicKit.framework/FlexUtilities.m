@implementation FlexUtilities

+ (id)_decodeItem:(id)a3 asClass:(Class)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;

  v5 = a3;
  if (!v5)
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_decodeItemsInDict_asClass_(FlexUtilities, v21, (uint64_t)v5, (uint64_t)a4, v22);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_decodeItemsInArray_asClass_(FlexUtilities, v23, (uint64_t)v5, (uint64_t)a4, v24);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v20 = v5;
      goto LABEL_12;
    }
LABEL_13:
    v25 = 0;
    goto LABEL_14;
  }
  objc_msgSend_allKeys(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_count(v10, v11, v12, v13, v14);

  if (!v15)
    goto LABEL_13;
  v16 = [a4 alloc];
  v20 = (id)objc_msgSend_initWithDictionary_(v16, v17, (uint64_t)v5, v18, v19);
LABEL_12:
  v25 = v20;
LABEL_14:

  return v25;
}

+ (id)decodeItemsInArray:(id)a3 asClass:(Class)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v32 = v5;
    v11 = v5;
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v33, (uint64_t)v37, 16);
    if (v13)
    {
      v16 = v13;
      v17 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(v11);
          objc_msgSend__decodeItem_asClass_(FlexUtilities, v14, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), (uint64_t)a4, v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend_addObject_(v10, v19, (uint64_t)v22, v20, v21);
          }
          else
          {
            v23 = (void *)objc_opt_new();
            objc_msgSend_addObject_(v10, v24, (uint64_t)v23, v25, v26);

          }
        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v33, (uint64_t)v37, 16);
      }
      while (v16);
    }

    objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v27, (uint64_t)v10, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v32;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

+ (id)decodeItemsInDict:(id)a3 asClass:(Class)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v6, v7, v8, v9);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend_allKeys(v5, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v36, (uint64_t)v40, 16);
    if (v16)
    {
      v20 = v16;
      v21 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v37 != v21)
            objc_enumerationMutation(v14);
          v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend_objectForKey_(v5, v17, v23, v18, v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__decodeItem_asClass_(FlexUtilities, v25, (uint64_t)v24, (uint64_t)a4, v26);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
            objc_msgSend_setObject_forKey_(v35, v27, (uint64_t)v29, v23, v28);

        }
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v36, (uint64_t)v40, 16);
      }
      while (v20);
    }

    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCE70], v30, (uint64_t)v35, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

+ (id)encodeItemsInArray:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v9 = v3;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v47, (uint64_t)v51, 16);
  if (!v11)
    goto LABEL_24;
  v12 = v11;
  v13 = *(_QWORD *)v48;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v48 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v14);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_encodeAsDictionary(v15, v16, v17, v18, v19);
        v20 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v30 = (void *)v20;
        if (v20)
          objc_msgSend_addObject_(v8, v21, v20, v22, v23);

        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_encodeItemsInDict_(FlexUtilities, v24, (uint64_t)v15, v25, v26);
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_encodeItemsInArray_(FlexUtilities, v27, (uint64_t)v15, v28, v29);
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_addObject_(v8, v32, MEMORY[0x24BDBD1B8], v33, v34, (_QWORD)v47);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          objc_msgSend_addObject_(v8, v31, (uint64_t)v15, v35, v36, (_QWORD)v47);
      }
LABEL_15:
      ++v14;
    }
    while (v12 != v14);
    v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v31, (uint64_t)&v47, (uint64_t)v51, 16);
    v12 = v37;
  }
  while (v37);
LABEL_24:

  if (objc_msgSend_count(v8, v38, v39, v40, v41))
  {
    objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v42, (uint64_t)v8, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = 0;
  }

  return v45;
}

+ (id)encodeItemsInDict:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend_allKeys(v3, v9, v10, v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v50, (uint64_t)v54, 16);
  if (!v15)
    goto LABEL_21;
  v19 = v15;
  v20 = *(_QWORD *)v51;
  do
  {
    v21 = 0;
    do
    {
      if (*(_QWORD *)v51 != v20)
        objc_enumerationMutation(v13);
      v22 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v21);
      objc_msgSend_objectForKey_(v3, v16, v22, v17, v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_encodeAsDictionary(v23, v24, v25, v26, v27);
        v28 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v37 = (void *)v28;
        if (v28)
          objc_msgSend_setObject_forKey_(v8, v29, v28, v22, v30);

        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_encodeItemsInDict_(FlexUtilities, v31, (uint64_t)v23, v32, v33);
        v28 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_encodeItemsInArray_(FlexUtilities, v34, (uint64_t)v23, v35, v36);
        v28 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        objc_msgSend_setObject_forKey_(v8, v38, (uint64_t)v23, v22, v39);
LABEL_15:

      ++v21;
    }
    while (v19 != v21);
    v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v50, (uint64_t)v54, 16);
    v19 = v40;
  }
  while (v40);
LABEL_21:

  if (objc_msgSend_count(v8, v41, v42, v43, v44))
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCE70], v45, (uint64_t)v8, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = 0;
  }

  return v48;
}

+ (id)pathToBundledResourceWithName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = objc_opt_class();
  objc_msgSend_bundleForClass_(v4, v6, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathForResource_ofType_(v9, v10, (uint64_t)v3, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathForResource_ofType_(v17, v18, (uint64_t)v3, 0, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend_bundleWithIdentifier_(MEMORY[0x24BDD1488], v20, (uint64_t)CFSTR("com.apple.Memories"), v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pathForResource_ofType_(v23, v24, (uint64_t)v3, 0, v25);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v26 = (void *)MEMORY[0x24BDD1488];
        v27 = objc_opt_class();
        objc_msgSend_bundleForClass_(v26, v28, v27, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingPathComponent_(CFSTR("Assets"), v32, (uint64_t)v3, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pathForResource_ofType_(v31, v36, (uint64_t)v35, 0, v37);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return v12;
}

+ (id)songsFoundInDeepScanOfDirectory:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  const char *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  int isEqualToString;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v45;
  id v46;
  id obj;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDBCCD0];
  v10 = *MEMORY[0x24BDBCC60];
  objc_msgSend_arrayWithObjects_(MEMORY[0x24BDBCE30], v11, *MEMORY[0x24BDBCCD0], v12, v13, *MEMORY[0x24BDBCC60], 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v3;
  objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v8, v15, (uint64_t)v3, (uint64_t)v14, 4, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = (id)objc_opt_new();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v16;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v50, (uint64_t)v54, 16);
  if (v18)
  {
    v20 = v18;
    v21 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v51 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        v49 = 0;
        objc_msgSend_getResourceValue_forKey_error_(v23, v19, (uint64_t)&v49, v9, 0);
        v24 = v49;
        v48 = 0;
        objc_msgSend_getResourceValue_forKey_error_(v23, v25, (uint64_t)&v48, v10, 0);
        v26 = v48;
        if (objc_msgSend_BOOLValue(v26, v27, v28, v29, v30))
        {
          objc_msgSend_pathExtension(v23, v31, v32, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v35, v36, (uint64_t)CFSTR("smsbundle"), v37, v38);

          if (isEqualToString)
          {
            v43 = v46;
            if (!v46)
              v43 = (void *)objc_opt_new();
            v46 = v43;
            objc_msgSend_addObject_(v43, v40, (uint64_t)v23, v41, v42);
          }
        }

      }
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v50, (uint64_t)v54, 16);
    }
    while (v20);
  }

  return v46;
}

+ (id)backendForSongBundleURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  objc_msgSend_path(a3, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__songFormatForBundleAtPath_(FlexUtilities, v6, (uint64_t)v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v9, v10, (uint64_t)CFSTR("LG"), v11, v12))
  {
    objc_msgSend_loadSongInFolderWithPath_(FlexSong, v13, (uint64_t)v5, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(v9, v13, (uint64_t)CFSTR("ML"), v14, v15))
    {
      v20 = 0;
      goto LABEL_7;
    }
    objc_msgSend_loadSongAtPath_(FlexMLSong, v17, (uint64_t)v5, v18, v19);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v16;
LABEL_7:

  return v20;
}

+ (id)_songFormatForBundleAtPath:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  id v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  id v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_stringByAppendingPathComponent_(v3, v4, (uint64_t)CFSTR("metadata.smm"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_fileExistsAtPath_(v12, v13, (uint64_t)v7, v14, v15);

  if (v16)
  {
    v21 = CFSTR("LG");
  }
  else
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    objc_msgSend_contentsOfDirectoryAtPath_error_(v22, v23, (uint64_t)v3, (uint64_t)&v58, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v58;

    if (objc_msgSend_count(v25, v27, v28, v29, v30))
      v31 = v26 == 0;
    else
      v31 = 0;
    if (v31)
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v32 = v25;
      v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v54, (uint64_t)v59, 16);
      if (v34)
      {
        v39 = v34;
        v52 = v26;
        v53 = v25;
        v40 = *(_QWORD *)v55;
        v21 = CFSTR("?");
        while (2)
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v55 != v40)
              objc_enumerationMutation(v32);
            objc_msgSend_pathExtension(*(void **)(*((_QWORD *)&v54 + 1) + 8 * i), v35, v36, v37, v38, v52, v53, (_QWORD)v54);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lowercaseString(v42, v43, v44, v45, v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend_isEqualToString_(v47, v48, (uint64_t)CFSTR("metadata"), v49, v50) & 1) != 0)
            {
              v21 = CFSTR("ML");

              goto LABEL_18;
            }

          }
          v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v54, (uint64_t)v59, 16);
          if (v39)
            continue;
          break;
        }
LABEL_18:
        v26 = v52;
        v25 = v53;
      }
      else
      {
        v21 = CFSTR("?");
      }

    }
    else
    {
      v21 = CFSTR("?");
    }

  }
  return v21;
}

@end
