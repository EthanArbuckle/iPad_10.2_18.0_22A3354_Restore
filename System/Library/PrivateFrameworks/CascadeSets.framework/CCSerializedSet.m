@implementation CCSerializedSet

+ (id)setEnumeratorWithSerializedSets:(id)a3
{
  id v3;
  CCSerializedSetEnumerator *v4;

  v3 = a3;
  v4 = -[CCSerializedSetEnumerator initWithSerializedSets:]([CCSerializedSetEnumerator alloc], "initWithSerializedSets:", v3);

  return v4;
}

- (CCSerializedSet)initWithSetMessage:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  CCSetDescriptor *v14;
  void *v15;
  void *v16;
  CCSetDescriptor *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  CCSerializedSet *v24;
  CCSerializedSet *v25;
  uint64_t v26;
  NSData *data;
  CCSerializedSet *v28;
  CCSerializedSet *v29;
  void *v33;
  objc_super v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v33 = v5;
  objc_msgSend(v5, "descriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        v12 = v6;
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v14 = [CCSetDescriptor alloc];
        objc_msgSend(v13, "key");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[BMResourceDescriptor initWithKey:value:error:](v14, "initWithKey:value:error:", v15, v16, a4);

        if (!v17)
        {

          v29 = 0;
          v6 = v12;
          v28 = self;
          v18 = v33;
          goto LABEL_15;
        }
        v6 = v12;
        objc_msgSend(v12, "addObject:", v17);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v9)
        continue;
      break;
    }
  }

  v18 = v33;
  objc_msgSend(v33, "accountIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_alloc(MEMORY[0x24BE0C088]);
    objc_msgSend(v33, "accountIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithAccountIdentifier:", v21);

    v23 = CCAddAcountInfoToDescriptors(v6, (uint64_t)v22, (uint64_t)a4);
  }
  v34.receiver = self;
  v34.super_class = (Class)CCSerializedSet;
  v24 = -[CCSet initWithItemType:descriptors:error:](&v34, sel_initWithItemType_descriptors_error_, (unsigned __int16)objc_msgSend(v33, "itemType"), v6, a4);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_setMessage, a3);
    -[CCSerializedSetMessage data](v25->_setMessage, "data");
    v26 = objc_claimAutoreleasedReturnValue();
    data = v25->_data;
    v25->_data = (NSData *)v26;

  }
  v28 = v25;
  v29 = v28;
LABEL_15:

  return v29;
}

- (CCSerializedSet)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CCSerializedSet *v12;

  v6 = a3;
  objc_msgSend(v6, "subdataWithRange:", 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
  if (objc_msgSend(v8, "isEqual:", CFSTR("{")))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, a4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_4;
    v10 = (void *)v9;
    v11 = (void *)objc_msgSend(objc_alloc((Class)getCCSerializedSetMessageClass()), "initWithJSONDictionary:error:", v9, a4);

    if (!v11)
      goto LABEL_4;
LABEL_6:
    self = -[CCSerializedSet initWithSetMessage:error:](self, "initWithSetMessage:error:", v11, a4);

    v12 = self;
    goto LABEL_7;
  }
  v11 = (void *)objc_msgSend(objc_alloc((Class)getCCSerializedSetMessageClass()), "initWithData:error:", v6, a4);
  if (v11)
    goto LABEL_6;
LABEL_4:
  v12 = 0;
LABEL_7:

  return v12;
}

- (CCSerializedSet)initWithItemType:(unsigned __int16)a3 descriptors:(id)a4 localInstances:(id)a5 error:(id *)a6
{
  unsigned int v8;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CCSerializedSet *v31;
  unsigned int v33;
  id v34;
  void *v35;
  CCSerializedSet *v36;
  void *v37;
  CCMutableRepeatedUInt32 *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v8 = a3;
  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = objc_msgSend(objc_alloc((Class)getCCSerializedSetDeviceClass()), "initWithDeviceIdentifier:options:error:", CFSTR("local-device-placeholder"), &unk_2509A1B98, a6);
  v13 = (void *)v12;
  if (v12)
  {
    v33 = v8;
    v36 = self;
    v37 = (void *)v12;
    v35 = v11;
    v38 = objc_alloc_init(CCMutableRepeatedUInt32);
    -[CCMutableRepeatedUInt32 appendUInt32Value:](v38, "appendUInt32Value:", 0);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v34 = v10;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v21 = objc_alloc((Class)getCCSerializedSetDescriptorClass());
          objc_msgSend(v20, "key");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "value");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v21, "initWithKey:value:error:", v22, v23, a6);

          if (!v24)
          {
            v31 = 0;
            v11 = v35;
            self = v36;
            goto LABEL_18;
          }
          objc_msgSend(v14, "addObject:", v24);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v17)
          continue;
        break;
      }
    }

    v11 = v35;
    self = v36;
    -[CCSerializedSet _deduplicateItemsOfType:localInstances:deviceIndexes:error:](v36, "_deduplicateItemsOfType:localInstances:deviceIndexes:error:", v33, v35, v38, a6);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v25 = objc_alloc((Class)getCCSerializedSetMessageClass());
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v33);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v35, "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v37;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v25, "initWithItemType:accountIdentifier:descriptors:sharedItemCount:localItemInstanceCount:devices:items:error:", v26, 0, v14, v27, v28, v29, v15, a6);

      if (v30)
      {
        self = -[CCSerializedSet initWithSetMessage:error:](v36, "initWithSetMessage:error:", v30, a6);
        v31 = self;
      }
      else
      {
        v31 = 0;
      }

    }
    else
    {
      v31 = 0;
    }
LABEL_18:
    v10 = v34;
    v13 = v37;

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)_deduplicateItemsOfType:(unsigned __int16)a3 localInstances:(id)a4 deviceIndexes:(id)a5 error:(id *)a6
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v52;
  id v53;
  id obj;
  id v55;
  uint64_t v56;
  id v57;
  unsigned int v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v58 = a3;
  v67 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v55 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v57 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  v53 = v10;
  if (v11)
  {
    v12 = v11;
    v56 = *(_QWORD *)v61;
    v52 = v8;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v61 != v56)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v14, "content");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend((id)objc_opt_class(), "itemType");

        if ((_DWORD)v16 != v58)
        {
          v41 = (void *)MEMORY[0x24BDD1540];
          v64 = *MEMORY[0x24BDD0BA0];
          v42 = (void *)MEMORY[0x24BDD17C8];
          CCTypeIdentifierRegistryBridge();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "descriptionForTypeIdentifier:", v16);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          CCTypeIdentifierRegistryBridge();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "descriptionForTypeIdentifier:", v58);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "stringWithFormat:", CFSTR("Inconsistent item type (%@) of instance: %@ expected itemType: %@"), v44, v14, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v47;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Item"), 2, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          CCSetError(a6, v49);

          v10 = v53;
LABEL_22:
          v40 = 0;
          v50 = obj;
          v34 = obj;
          v8 = v52;
          goto LABEL_25;
        }
        v17 = objc_alloc((Class)getCCSerializedSetItemInstanceClass());
        objc_msgSend(v14, "metaContent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "data");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "instanceIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v17, "initWithMetaContent:instanceIdentifier:error:", v19, v20, a6);

        if (!v21)
          goto LABEL_22;
        objc_msgSend(v14, "metaContent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sourceItemIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v10, "containsObject:", v23) & 1) == 0)
        {
          objc_msgSend(v10, "addObject:", v23);
          objc_msgSend(v14, "sharedIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v9, "indexOfObject:", v24);
          if (v25 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v26 = v9;
            objc_msgSend(v9, "addObject:", v24);
            v27 = objc_alloc((Class)getCCSerializedSetSharedItemClass());
            objc_msgSend(v14, "content");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "data");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)objc_msgSend(v27, "initWithContent:sharedIdentifier:error:", v29, v24, a6);

            if (!v30)
            {

              v40 = 0;
              v50 = obj;
              v34 = obj;
              v9 = v26;
              v8 = v52;
              v10 = v53;
              goto LABEL_25;
            }
            objc_msgSend(v55, "addObject:", v30);
            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v21, 0);
            objc_msgSend(v57, "addObject:", v31);

            v9 = v26;
            v10 = v53;
          }
          else
          {
            objc_msgSend(v57, "objectAtIndex:", v25);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v21);
          }

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      v8 = v52;
      if (v12)
        continue;
      break;
    }
  }

  v32 = v9;
  v33 = objc_msgSend(v9, "count");
  v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v33);
  if (v33)
  {
    v35 = 0;
    while (1)
    {
      v36 = objc_alloc((Class)getCCSerializedSetItemClass());
      objc_msgSend(v55, "objectAtIndex:", v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "objectAtIndex:", v35);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v36, "initWithSharedItem:deviceIndexes:localInstances:error:", v37, v8, v38, a6);

      if (!v39)
        break;
      objc_msgSend(v34, "addObject:", v39);

      if (v33 == ++v35)
        goto LABEL_20;
    }
    v40 = 0;
  }
  else
  {
LABEL_20:
    v34 = v34;
    v40 = v34;
  }
  v9 = v32;
  v10 = v53;
  v50 = obj;
LABEL_25:

  return v40;
}

- (CCSerializedSet)initWithSet:(id)a3 useCase:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  CCSerializedSet *v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "_serializeSet:useCase:error:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    self = -[CCSerializedSet initWithSetMessage:error:](self, "initWithSetMessage:error:", v10, a5);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)writeToStream:(id)a3 format:(unsigned __int8)a4 error:(id *)a5
{
  int v6;
  id v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  v8 = a3;
  if (v6 == 2)
  {
    -[CCSerializedSetMessage jsonDictionary](self->_setMessage, "jsonDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(MEMORY[0x24BDD1608], "writeJSONObject:toStream:options:error:", v10, v8, 9, a5);

  }
  else if (v6 == 1)
  {
    v9 = objc_msgSend(v8, "write:maxLength:", -[NSData bytes](self->_data, "bytes"), -[NSData length](self->_data, "length"));
  }
  else
  {
    v9 = 0;
  }

  return v9 > 0;
}

+ (id)_serializeSet:(id)a3 useCase:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id obj;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t *v70;
  _QWORD v71[5];
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v82 = 0;
  v83 = &v82;
  v84 = 0x2020000000;
  v85 = 0;
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy_;
  v76 = __Block_byref_object_dispose_;
  v77 = 0;
  v52 = v7;
  objc_msgSend(v7, "changePublisherWithUseCase:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "sharedItemCount"));
  v71[0] = MEMORY[0x24BDAC760];
  v71[1] = 3221225472;
  v71[2] = __47__CCSerializedSet__serializeSet_useCase_error___block_invoke;
  v71[3] = &unk_250990378;
  v71[4] = &v72;
  v64[0] = MEMORY[0x24BDAC760];
  v64[1] = 3221225472;
  v64[2] = __47__CCSerializedSet__serializeSet_useCase_error___block_invoke_2;
  v64[3] = &unk_2509903A0;
  v68 = &v72;
  v69 = &v78;
  v13 = v11;
  v65 = v13;
  v14 = v10;
  v66 = v14;
  v51 = v12;
  v67 = v51;
  v70 = &v82;
  v15 = (id)objc_msgSend(v9, "sinkWithCompletion:receiveInput:", v71, v64);
  v16 = (void *)v73[5];
  v47 = v8;
  v48 = v9;
  v49 = v14;
  v50 = v13;
  if (v16)
  {
    CCSetError(a5, v16);
    v17 = 0;
  }
  else
  {
    v46 = a5;
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v14, "count"));
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v18 = v14;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v60, v87, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v61;
      while (2)
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v61 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v21);
          v23 = objc_alloc((Class)getCCSerializedSetDeviceClass());
          objc_msgSend(v22, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v22, "options"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (id *)(v73 + 5);
          obj = (id)v73[5];
          v27 = (void *)objc_msgSend(v23, "initWithDeviceIdentifier:options:error:", v24, v25, &obj);
          objc_storeStrong(v26, obj);

          v28 = (void *)v73[5];
          if (v28)
          {
            CCSetError(v46, v28);
            v17 = 0;
            goto LABEL_23;
          }
          objc_msgSend(v53, "addObject:", v27);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v60, v87, 16);
        if (v19)
          continue;
        break;
      }
    }

    v29 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v52, "descriptors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v29, "initWithCapacity:", objc_msgSend(v30, "count"));

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v52, "descriptors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v55, v86, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v56;
      while (2)
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v56 != v32)
            objc_enumerationMutation(v27);
          v34 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v33);
          v35 = objc_alloc((Class)getCCSerializedSetDescriptorClass());
          objc_msgSend(v34, "key");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "value");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (id *)(v73 + 5);
          v54 = (id)v73[5];
          v39 = (void *)objc_msgSend(v35, "initWithKey:value:error:", v36, v37, &v54);
          objc_storeStrong(v38, v54);

          v40 = (void *)v73[5];
          if (v40)
          {
            CCSetError(v46, v40);
            v17 = 0;
            goto LABEL_22;
          }
          objc_msgSend(v18, "addObject:", v39);

          ++v33;
        }
        while (v31 != v33);
        v31 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v55, v86, 16);
        if (v31)
          continue;
        break;
      }
    }

    v41 = objc_alloc((Class)getCCSerializedSetMessageClass());
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v52, "itemType"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "account");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "accountIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v83[3]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v79[3]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v41, "initWithItemType:accountIdentifier:descriptors:sharedItemCount:localItemInstanceCount:devices:items:error:", v27, v42, v18, v43, v44, v53, v51, v46);

LABEL_22:
LABEL_23:

  }
  _Block_object_dispose(&v72, 8);

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v82, 8);

  return v17;
}

void __47__CCSerializedSet__serializeSet_useCase_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "state") == 1)
  {
    objc_msgSend(v6, "error");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __47__CCSerializedSet__serializeSet_useCase_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id obj;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "sharedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc((Class)getCCSerializedSetSharedItemClass());
    objc_msgSend(v3, "sharedItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sharedItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sharedIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v11 + 40);
    v35 = (void *)objc_msgSend(v5, "initWithContent:sharedIdentifier:error:", v8, v10, &obj);
    objc_storeStrong((id *)(v11 + 40), obj);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      goto LABEL_25;
  }
  else
  {
    v35 = 0;
  }
  v12 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "allLocalInstances");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v34 = v3;
  objc_msgSend(v3, "allLocalInstances");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v15)
  {
    v16 = v15;
    v36 = *(_QWORD *)v45;
LABEL_7:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v36)
        objc_enumerationMutation(v14);
      v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v17);
      v19 = objc_alloc((Class)getCCSerializedSetItemInstanceClass());
      objc_msgSend(v18, "metaContent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "data");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "instanceIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v43 = *(id *)(v23 + 40);
      v24 = (void *)objc_msgSend(v19, "initWithMetaContent:instanceIdentifier:error:", v21, v22, &v43);
      objc_storeStrong((id *)(v23 + 40), v43);

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        break;
      objc_msgSend(v37, "addObject:", v24);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

      if (v16 == ++v17)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        if (v16)
          goto LABEL_7;
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:

    v14 = (void *)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v34, "allDevices");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v40 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v31)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v31, v30);
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v30);
          }
          objc_msgSend(v14, "appendUInt32Value:", objc_msgSend(v31, "unsignedIntegerValue"));

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      }
      while (v27);
    }

    v32 = objc_alloc((Class)getCCSerializedSetItemClass());
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v38 = *(id *)(v33 + 40);
    v24 = (void *)objc_msgSend(v32, "initWithSharedItem:deviceIndexes:localInstances:error:", v35, v14, v37, &v38);
    objc_storeStrong((id *)(v33 + 40), v38);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v24);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    }
  }

  v3 = v34;
LABEL_25:

}

- (id)changePublisher
{
  return -[CCSerializedSet changePublisherWithUseCase:](self, "changePublisherWithUseCase:", *MEMORY[0x24BE0C058]);
}

- (id)changePublisherWithUseCase:(id)a3
{
  CCSetChangePublisher *v4;
  CCSerializedSetChangeEnumerator *v5;
  CCSetChangePublisher *v6;

  v4 = [CCSetChangePublisher alloc];
  v5 = -[CCSerializedSetChangeEnumerator initWithSetMessage:]([CCSerializedSetChangeEnumerator alloc], "initWithSetMessage:", self->_setMessage);
  v6 = -[CCSetChangePublisher initWithEnumerator:](v4, "initWithEnumerator:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_data, CFSTR("d"));
}

- (CCSerializedSet)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CCSerializedSet *v6;
  id v7;
  CCSerializedSet *v8;
  CCSerializedSet *v9;
  CCSerializedSet *v10;
  NSObject *v11;
  uint64_t v12;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v6 = -[CCSerializedSet initWithData:error:](self, "initWithData:error:", v5, &v14);
  v7 = v14;
  v8 = v6;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CCSerializedSet initWithCoder:].cold.1((uint64_t)v7, v11, v12);

  }
  return v9;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_setMessage, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_237B25000, a2, a3, "Failed to decode serialized set %@", (uint8_t *)&v3);
}

@end
