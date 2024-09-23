@implementation WFStringContentItem

+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
LABEL_2:
    objc_msgSend(v13, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "itemWithObject:named:attributionSet:cachingIdentifier:", v18, v14, v15, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v18, v13, v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "itemWithFile:attributionSet:cachingIdentifier:", v20, v15, v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v19 = 0;
      }
    }
    v21 = v13;
    goto LABEL_19;
  }
  objc_msgSend(a1, "ownedTypes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v12, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v22)
  {
    v19 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v23 = v22;
  v27 = a1;
  v28 = v14;
  v24 = *(_QWORD *)v30;
LABEL_8:
  v25 = 0;
  while (1)
  {
    if (*(_QWORD *)v30 != v24)
      objc_enumerationMutation(v18);
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v25), v27);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "conformsToTypes:", v21) & 1) != 0)
      break;

    if (v23 == ++v25)
    {
      v23 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v23)
        goto LABEL_8;
      v19 = 0;
      v14 = v28;
      goto LABEL_19;
    }
  }

  a1 = v27;
  v14 = v28;
  if (v13)
    goto LABEL_2;
  v19 = 0;
LABEL_20:

  return v19;
}

+ (id)stringCoercionHandler
{
  return +[WFCoercionHandler block:](WFCoercionHandler, "block:", &__block_literal_global_2471);
}

+ (id)dictionaryCoercionHandler
{
  return +[WFCoercionHandler block:availabilityCheck:](WFCoercionHandler, "block:availabilityCheck:", &__block_literal_global_15, &__block_literal_global_17_2469);
}

+ (id)printFormatterCoercionHandler
{
  return +[WFCoercionHandler asynchronousBlock:](WFCoercionHandler, "asynchronousBlock:", &__block_literal_global_19_2466);
}

+ (id)textFileCoercionHandler
{
  return +[WFCoercionHandler block:](WFCoercionHandler, "block:", &__block_literal_global_21_2461);
}

+ (id)coercions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[13];

  v39[11] = *MEMORY[0x24BDAC8D0];
  v3 = objc_opt_class();
  objc_msgSend(a1, "stringCoercionHandler");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v3, v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v37;
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textFileCoercionHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToType:handler:](WFCoercion, "coercionToType:handler:", v36, v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v34;
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("UIPrintFormatter"), CFSTR("UIKit"), 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "printFormatterCoercionHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToType:handler:](WFCoercion, "coercionToType:handler:", v33, v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v31;
  v4 = objc_opt_class();
  +[WFCoercionHandler keyPath:unavailableIfNilOrEmpty:](WFCoercionHandler, "keyPath:unavailableIfNilOrEmpty:", CFSTR("dataDetectorResults.URLs"), 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v4, v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v29;
  v5 = objc_opt_class();
  +[WFCoercionHandler keyPath:unavailableIfNilOrEmpty:](WFCoercionHandler, "keyPath:unavailableIfNilOrEmpty:", CFSTR("dataDetectorResults.dates"), 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v5, v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v27;
  v6 = objc_opt_class();
  +[WFCoercionHandler keyPath:unavailableIfNilOrEmpty:](WFCoercionHandler, "keyPath:unavailableIfNilOrEmpty:", CFSTR("dataDetectorResults.streetAddresses"), 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v6, v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v25;
  v7 = objc_opt_class();
  +[WFCoercionHandler keyPath:unavailableIfNilOrEmpty:](WFCoercionHandler, "keyPath:unavailableIfNilOrEmpty:", CFSTR("dataDetectorResults.phoneNumbers"), 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v7, v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v39[6] = v23;
  v8 = objc_opt_class();
  objc_msgSend(a1, "dictionaryCoercionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[7] = v10;
  v11 = objc_opt_class();
  +[WFCoercionHandler keyPath:unavailableIfNilOrEmpty:](WFCoercionHandler, "keyPath:unavailableIfNilOrEmpty:", CFSTR("dataDetectorResults.number"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[8] = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  +[WFCoercionHandler block:](WFCoercionHandler, "block:", &__block_literal_global_44_2452);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39[9] = v17;
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84E0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pdfCoercionHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToType:handler:](WFCoercion, "coercionToType:handler:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[10] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 11);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)pdfCoercionHandler
{
  return +[WFCoercionHandler asynchronousBlock:](WFCoercionHandler, "asynchronousBlock:", &__block_literal_global_46);
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Documents");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Text (singular)"), CFSTR("Text"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Text (plural)"), CFSTR("Text"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Text Items"));
}

+ (int64_t)tableTemplateSubjectType
{
  return 2;
}

void __41__WFStringContentItem_pdfCoercionHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  Class (__cdecl *v12)();
  id v13;
  _QWORD v14[4];
  id v15;
  char v16;

  v6 = a4;
  v7 = a2;
  objc_msgSend(a3, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("WFCoercionOptionPDFIncludeMargin"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __41__WFStringContentItem_pdfCoercionHandler__block_invoke_2;
  v14[3] = &unk_24C4DC3E8;
  v16 = v11;
  v15 = v6;
  v12 = (Class (__cdecl *)())getUIPrintFormatterClass[0];
  v13 = v6;
  objc_msgSend(v7, "getObjectRepresentation:forClass:options:", v14, v12(), v8);

}

void __41__WFStringContentItem_pdfCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v6[0] = a2;
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFPDFContentItem getPDFFromPrintFormatters:nameIfKnown:matchingInputSize:withMargin:startingAtPage:endingAtPage:completionHandler:](WFPDFContentItem, "getPDFFromPrintFormatters:nameIfKnown:matchingInputSize:withMargin:startingAtPage:endingAtPage:completionHandler:", v5, 0, 1, *(unsigned __int8 *)(a1 + 40), 1, 0x7FFFFFFFFFFFFFFFLL, *(_QWORD *)(a1 + 32));

}

id __32__WFStringContentItem_coercions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "BOOLValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __46__WFStringContentItem_textFileCoercionHandler__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  int v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  objc_msgSend(v7, "requestedType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v7, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("WFCoercionOptionStringSecureFilename"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if ((v14 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", v16, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:](WFTemporaryFileManager, "proposedTemporaryFileURLForFilename:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "writeToURL:atomically:encoding:error:", v18, 0, 4, a4);

  if ((v20 & 1) != 0)
  {
    +[WFFileRepresentation fileWithURL:options:ofType:proposedFilename:](WFFileRepresentation, "fileWithURL:options:ofType:proposedFilename:", v18, 1, v10, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getWFContentGraphLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v24 = 136315138;
      v25 = "+[WFStringContentItem textFileCoercionHandler]_block_invoke";
      _os_log_impl(&dword_20BBAD000, v22, OS_LOG_TYPE_ERROR, "%s Failed to write data for WFStringContentItem", (uint8_t *)&v24, 0xCu);
    }

    v21 = 0;
  }

  return v21;
}

void __52__WFStringContentItem_printFormatterCoercionHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__WFStringContentItem_printFormatterCoercionHandler__block_invoke_2;
  v9[3] = &unk_24C4E00C0;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

void __52__WFStringContentItem_printFormatterCoercionHandler__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc((Class)getUISimpleTextPrintFormatterClass[0]());
  objc_msgSend(*(id *)(a1 + 32), "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "initWithText:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

BOOL __48__WFStringContentItem_dictionaryCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "dataDetectorResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

id __48__WFStringContentItem_dictionaryCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "dataDetectorResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "setWf_preferredFileType:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v4;
}

id __44__WFStringContentItem_stringCoercionHandler__block_invoke(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  objc_msgSend(v6, "internalRepresentationType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileRepresentationForType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "wf_stringWithData:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      getWFContentGraphLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v18 = 136315394;
        v19 = "+[WFStringContentItem stringCoercionHandler]_block_invoke";
        v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_20BBAD000, v14, OS_LOG_TYPE_FAULT, "%s Failed to decode string with data %@", (uint8_t *)&v18, 0x16u);
      }

      v15 = (void *)objc_opt_class();
      objc_msgSend(v7, "requestedType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "badCoercionErrorForType:", v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)includesFileRepresentationInSerializedItem
{
  void *v2;
  char isKindOfClass;

  -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSString)string
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

  return (NSString *)v6;
}

- (WFDataDetectorResults)dataDetectorResults
{
  WFDataDetectorResults *dataDetectorResults;
  void *v4;
  void *v5;
  WFDataDetectorResults *v6;
  WFDataDetectorResults *v7;
  WFDataDetectorResults *v8;

  dataDetectorResults = self->_dataDetectorResults;
  if (!dataDetectorResults)
  {
    -[WFStringContentItem string](self, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[WFStringContentItem string](self, "string");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFDataDetector resultsForString:ofTypes:error:](WFDataDetector, "resultsForString:ofTypes:error:", v5, 0x600000838, 0);
      v6 = (WFDataDetectorResults *)objc_claimAutoreleasedReturnValue();
      v7 = self->_dataDetectorResults;
      self->_dataDetectorResults = v6;

    }
    else
    {
      v8 = (WFDataDetectorResults *)objc_opt_new();
      v5 = self->_dataDetectorResults;
      self->_dataDetectorResults = v8;
    }

    dataDetectorResults = self->_dataDetectorResults;
  }
  return dataDetectorResults;
}

- (BOOL)isContent
{
  return 1;
}

- (void)setDataDetectorResults:(id)a3
{
  objc_storeStrong((id *)&self->_dataDetectorResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDetectorResults, 0);
}

@end
