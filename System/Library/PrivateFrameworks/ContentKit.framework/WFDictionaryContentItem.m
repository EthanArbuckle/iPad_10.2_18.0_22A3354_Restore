@implementation WFDictionaryContentItem

- (NSDictionary)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem getRepresentationsForType:error:](self, "getRepresentationsForType:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (WFFileType)preferredFileType
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[WFDictionaryContentItem dictionary](self, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wf_preferredFileType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFDictionaryContentItem;
    -[WFContentItem preferredFileType](&v9, sel_preferredFileType);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (WFFileType *)v7;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  WFOrderedDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;

  if ((Class)objc_opt_class() == a3)
  {
    -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC14A0], "typeFromMIMEType:", CFSTR("application/x-www-form-urlencoded"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "conformsToType:", v10);

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BEC14A0], "typeFromMIMEType:", CFSTR("application/x-www-form-urlencoded"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v14 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v13, "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithData:encoding:", v15, 4);

      objc_msgSend(MEMORY[0x24BDBCF48], "dc_queryItemsFromQueryString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[WFOrderedDictionary initWithQueryItems:]([WFOrderedDictionary alloc], "initWithQueryItems:", v17);
      +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_26:
      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x24BEC14A0], "typeFromMIMEType:", CFSTR("application/json"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v9, "conformsToType:", v23);

    if (v24)
    {
      objc_msgSend(MEMORY[0x24BEC14A0], "typeFromMIMEType:", CFSTR("application/json"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v25);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v26 = (void *)MEMORY[0x24BDD1608];
      objc_msgSend(v13, "data");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "JSONObjectWithData:options:error:", v27, 0, a5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      WFPropertyListRepresentationFromJSON(v28);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
LABEL_13:
        +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
      if ((objc_msgSend(v9, "conformsToString:", CFSTR("com.apple.property-list")) & 1) == 0
        && !objc_msgSend(v9, "conformsToString:", CFSTR("com.apple.plist")))
      {
        v8 = 0;
        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", CFSTR("com.apple.property-list"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
      {
        v13 = v30;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", CFSTR("com.apple.plist"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v38);
        v13 = (id)objc_claimAutoreleasedReturnValue();

      }
      v39 = (void *)MEMORY[0x24BDD1770];
      objc_msgSend(v13, "data");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "propertyListWithData:options:format:error:", v40, 0, 0, a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_13;
    }
    v8 = 0;
    goto LABEL_27;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFDictionaryContentItem preferredFileType](self, "preferredFileType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "conformsToString:", CFSTR("com.apple.property-list")) & 1) != 0
      || objc_msgSend(v9, "conformsToString:", CFSTR("com.apple.plist")))
    {
      -[WFDictionaryContentItem dictionary](self, "dictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      WFPlistSerializable(v19);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v20 = (void *)MEMORY[0x24BDD1770];
        -[WFDictionaryContentItem dictionary](self, "dictionary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        WFPlistSerializable(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "dataWithPropertyList:format:options:error:", v22, 100, 0, a5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          goto LABEL_24;
        goto LABEL_21;
      }
    }
    else
    {
      -[WFDictionaryContentItem dictionary](self, "dictionary");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      WFJavaScriptRepresentationFromPropertyList(v32, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      WFJSONSerializable(v33);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v13, 0, a5);
        v34 = objc_claimAutoreleasedReturnValue();
        if (!v34)
        {
LABEL_24:
          objc_msgSend(v13, "description");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v17);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 0;
          goto LABEL_26;
        }
        v16 = (void *)v34;
LABEL_21:
        v35 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v16, 4);
        if (v35)
        {
          v17 = (void *)v35;
          +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v35);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v13, "description");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v36);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = 0;
        }
        goto LABEL_26;
      }
    }
    v8 = 0;
LABEL_28:

LABEL_29:
    return v8;
  }
  v8 = 0;
  return v8;
}

- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BEC14A0], "typeFromMIMEType:", CFSTR("application/x-www-form-urlencoded"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "conformsToType:", v8);

  if (v9)
  {
    -[WFDictionaryContentItem dictionary](self, "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __75__WFDictionaryContentItem_generateFileRepresentationForType_options_error___block_invoke;
    v26[3] = &unk_24C4DBFF0;
    v27 = v10;
    v12 = v10;
    objc_msgSend(v11, "if_map:", v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    WFHTTPBodyFromQueryItems(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem name](self, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v14, v7, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeFromMIMEType:", CFSTR("application/json"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v7, "conformsToType:", v17);

    if (v18)
    {
      v19 = (void *)MEMORY[0x24BDD1608];
      -[WFDictionaryContentItem dictionary](self, "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      WFJavaScriptRepresentationFromPropertyList(v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      WFJSONSerializable(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dataWithJSONObject:options:error:", v22, 0, a5);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if ((objc_msgSend(v7, "conformsToString:", CFSTR("com.apple.property-list")) & 1) == 0
        && !objc_msgSend(v7, "conformsToString:", CFSTR("com.apple.plist")))
      {
        v16 = 0;
        goto LABEL_12;
      }
      v23 = (void *)MEMORY[0x24BDD1770];
      -[WFDictionaryContentItem dictionary](self, "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      WFPlistSerializable(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dataWithPropertyList:format:options:error:", v21, 100, 0, a5);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }

    if (v12)
    {
      -[WFContentItem name](self, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v12, v7, v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
  }

LABEL_12:
  return v16;
}

- (id)allowedClassesForDecodingInternalRepresentations
{
  _QWORD v3[9];

  v3[8] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __75__WFDictionaryContentItem_generateFileRepresentationForType_options_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD1838];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryItemWithName:value:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyNameMarker(CFSTR("Keys"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_1515, v2, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "multipleValues:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  WFLocalizedContentPropertyNameMarker(CFSTR("Values"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_11, v5, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "multipleValues:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)itemsWithJSONFileRepresentation:(id)a3 attributionSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "inputStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "open");
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithStream:options:error:", v8, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "close");
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeFromMIMEType:", CFSTR("application/json"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wfName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "itemsWithPropertyListObject:preferredDictionaryType:topLevelName:attributionSet:", v9, v10, v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "fileURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wfName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[WFFileRepresentation fileWithURL:options:ofType:proposedFilename:](WFFileRepresentation, "fileWithURL:options:ofType:proposedFilename:", v13, 5, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[WFContentItem itemWithFile:attributionSet:](WFContentItem, "itemWithFile:attributionSet:", v16, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (id)itemsWithPlistFileRepresentation:(id)a3 attributionSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "inputStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "open");
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithStream:options:format:error:", v8, 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "close");
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", CFSTR("com.apple.property-list"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wfName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "itemsWithPropertyListObject:preferredDictionaryType:topLevelName:attributionSet:", v9, v10, v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)itemsWithPropertyListObject:(id)a3 preferredDictionaryType:(id)a4 attributionSet:(id)a5
{
  return (id)objc_msgSend(a1, "itemsWithPropertyListObject:preferredDictionaryType:topLevelName:attributionSet:", a3, a4, 0, a5);
}

+ (id)itemsWithPropertyListObject:(id)a3 preferredDictionaryType:(id)a4 topLevelName:(id)a5 attributionSet:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  if (a3)
  {
    v9 = a6;
    v10 = a5;
    v11 = a4;
    v12 = a3;
    v13 = (void *)objc_opt_new();
    WFAddDictionaryObjectToItemArray(v12, v13, v11, v10, v9);

  }
  else
  {
    v13 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v13;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BEC14A0], "typeFromMIMEType:", CFSTR("application/json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeFromMIMEType:", CFSTR("application/x-www-form-urlencoded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", CFSTR("com.apple.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", CFSTR("com.apple.property-list"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Scripting");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Dictionary"), CFSTR("Dictionary"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Dictionaries"), CFSTR("Dictionaries"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Dictionaries"));
}

void __43__WFDictionaryContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void (**v17)(id, void *);
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v17 = a4;
  objc_msgSend(v5, "preferredFileType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v5, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v5, "attributionSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFDictionaryContentItem itemsWithPropertyListObject:preferredDictionaryType:attributionSet:](WFDictionaryContentItem, "itemsWithPropertyListObject:preferredDictionaryType:attributionSet:", v14, v6, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v17[2](v17, v7);
}

void __43__WFDictionaryContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a2, "dictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v6, v7);

}

@end
