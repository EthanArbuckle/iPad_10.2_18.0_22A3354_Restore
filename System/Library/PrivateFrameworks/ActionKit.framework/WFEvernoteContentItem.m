@implementation WFEvernoteContentItem

- (ENNoteRef)noteRef
{
  return (ENNoteRef *)-[WFEvernoteContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)name
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[WFEvernoteContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wfName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "wfName");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFEvernoteContentItem;
    -[WFEvernoteContentItem name](&v8, sel_name);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  Class v18;
  _QWORD v19[4];
  id v20;
  Class v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v7 = a3;
  if ((Class)objc_opt_class() == a5)
  {
    +[WFEvernoteAccessResource evernoteSession](WFEvernoteAccessResource, "evernoteSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFEvernoteContentItem noteRef](self, "noteRef");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke;
    v24[3] = &unk_24F8B9D50;
    v25 = v7;
    objc_msgSend(v12, "downloadNote:progress:completion:", v13, 0, v24);

    v11 = v25;
  }
  else if ((Class)objc_opt_class() == a5)
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_2;
    v22[3] = &unk_24F8B9C10;
    v23 = v7;
    -[WFEvernoteContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v22, objc_opt_class());
    v11 = v23;
  }
  else if ((Class)objc_opt_class() == a5)
  {
    v14 = objc_opt_class();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_4;
    v19[3] = &unk_24F8B9DE0;
    v20 = v7;
    v21 = a5;
    -[WFEvernoteContentItem coerceToItemClass:completionHandler:](self, "coerceToItemClass:completionHandler:", v14, v19);
    v11 = v20;
  }
  else
  {
    NSStringFromClass(a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(CFSTR("UIPrintFormatter"), "isEqualToString:", v8);

    if (!v9)
    {
      objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v15);

      goto LABEL_10;
    }
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_6;
    v16[3] = &unk_24F8B9E30;
    v17 = v7;
    v18 = a5;
    objc_msgSend(MEMORY[0x24BEC14A0], "typeFromPasteboardType:", *MEMORY[0x24BEC1CB8], v16[0], 3221225472, __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_6, &unk_24F8B9E30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFEvernoteContentItem getFileRepresentation:forType:](self, "getFileRepresentation:forType:", v16, v10);

    v11 = v17;
  }

LABEL_10:
}

- (void)generateFileRepresentations:(id)a3 options:(id)a4 forType:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  WFEvernoteContentItem *v13;
  id v14;

  v7 = a3;
  v8 = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke;
  v11[3] = &unk_24F8B9ED0;
  v13 = self;
  v14 = v7;
  v12 = v8;
  v9 = v8;
  v10 = v7;
  -[WFEvernoteContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v11, objc_opt_class());

}

- (WFFileType)preferredFileType
{
  return (WFFileType *)objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84E0]);
}

- (BOOL)includesFileRepresentationInSerializedItem
{
  return 0;
}

- (BOOL)canEncodeWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "wfFileCoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "wfFileCoder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "targetPlatform") == 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)getListSubtitle:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __41__WFEvernoteContentItem_getListSubtitle___block_invoke;
    v7[3] = &unk_24F8B9C10;
    v8 = v4;
    -[WFEvernoteContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v7, objc_opt_class());

  }
  return 1;
}

void __41__WFEvernoteContentItem_getListSubtitle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a2)
  {
    objc_msgSend(a2, "modificationDate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v3, "setDoesRelativeDateFormatting:", 1);
    objc_msgSend(v3, "setDateStyle:", 1);
    objc_msgSend(v7, "timeIntervalSinceNow");
    objc_msgSend(v3, "setTimeStyle:", fabs(v4) < 172800.0);
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "stringFromDate:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "conformsToUTType:", *MEMORY[0x24BDF8658]))
    {
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke_2;
      v27[3] = &unk_24F8B9E58;
      v28 = *(id *)(a1 + 32);
      v29 = v7;
      v30 = *(id *)(a1 + 48);
      objc_msgSend(v29, "generateWebArchiveData:", v27);

      v10 = v28;
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "conformsToUTType:", *MEMORY[0x24BDF83F8]))
      {
        objc_msgSend(v7, "resources");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12)
        {
          objc_msgSend(v7, "resources");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x24BDAC760];
          v21[1] = 3221225472;
          v21[2] = __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke_4;
          v21[3] = &unk_24F8B9E80;
          v22 = *(id *)(a1 + 32);
          objc_msgSend(v13, "if_compactMap:", v21);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "count"))
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

            v10 = v22;
            goto LABEL_13;
          }

        }
        if (!objc_msgSend(*(id *)(a1 + 32), "conformsToUTType:", *MEMORY[0x24BDF84E0]))
        {
          v16 = *(_QWORD *)(a1 + 48);
          objc_msgSend((id)objc_opt_class(), "badCoercionErrorForType:", *(_QWORD *)(a1 + 32));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v17);

          goto LABEL_14;
        }
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke_5;
        v18[3] = &unk_24F8B9EA8;
        v15 = *(void **)(a1 + 40);
        v20 = *(id *)(a1 + 48);
        v19 = *(id *)(a1 + 32);
        objc_msgSend(v15, "getObjectRepresentation:forClass:", v18, getUIPrintFormatterClass());

        v10 = v20;
        goto LABEL_13;
      }
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke_3;
      v23[3] = &unk_24F8B9E58;
      v24 = *(id *)(a1 + 32);
      v25 = v7;
      v26 = *(id *)(a1 + 48);
      objc_msgSend(v25, "generateHTMLData:", v23);

      v10 = v24;
    }
LABEL_13:

    goto LABEL_14;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_14:

}

void __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE194F8];
  v4 = a1[4];
  v5 = (void *)a1[5];
  v6 = a2;
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileWithData:ofType:proposedFilename:", v6, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = a1[6];
  v11[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

}

void __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE194F8];
  v4 = a1[4];
  v5 = (void *)a1[5];
  v6 = a2;
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileWithData:ofType:proposedFilename:", v6, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = a1[6];
  v11[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

}

id __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BEC14A0];
  objc_msgSend(v3, "mimeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeFromMIMEType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "conformsToType:", *(_QWORD *)(a1 + 32)))
  {
    v7 = (void *)MEMORY[0x24BE194F8];
    objc_msgSend(v3, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "filename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileWithData:ofType:proposedFilename:", v8, v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __69__WFEvernoteContentItem_generateFileRepresentations_options_forType___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BE19450], "itemWithObject:named:", a2, a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getFileRepresentations:forType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x24BE19590];
  v6 = a3;
  objc_msgSend(v5, "object:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v8, v6);

}

void __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a2, "resources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_compactMap:", &__block_literal_global_140_44839);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_5;
    v7[3] = &unk_24F8B9DB8;
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v6, "getObjectRepresentation:forClass:", v7, *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a2;
  v6 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__44832;
  v15 = __Block_byref_object_dispose__44833;
  objc_msgSend(MEMORY[0x24BE195E8], "itemWithFile:", v5);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v12[5];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_7;
  v8[3] = &unk_24F8B9E08;
  v9 = *(id *)(a1 + 32);
  v10 = &v11;
  objc_msgSend(v7, "getObjectRepresentation:forClass:", v8, *(_QWORD *)(a1 + 40));

  _Block_object_dispose(&v11, 8);
}

void __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)(a1 + 32);
  v8 = (void *)MEMORY[0x24BE19590];
  v9 = a4;
  objc_msgSend(v8, "object:named:", a2, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v11, v9);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

}

void __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = (void *)MEMORY[0x24BE19590];
  v8 = a4;
  objc_msgSend(v7, "object:named:", a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v10, v8);

}

id __72__WFEvernoteContentItem_generateObjectRepresentations_options_forClass___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = a2;
  v3 = (void *)MEMORY[0x24BEC14A0];
  objc_msgSend(v2, "mimeType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "typeFromMIMEType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "conformsToUTType:", *MEMORY[0x24BDF8410]))
  {
    v6 = (void *)MEMORY[0x24BEC14E0];
    objc_msgSend(v2, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithData:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x24BE19590];
      objc_msgSend(v2, "filename");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByDeletingPathExtension");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "object:named:", v8, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
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
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_44889, CFSTR("Creation Date"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo:", *MEMORY[0x24BE197F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tense:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeUnits:", 8444);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_109, CFSTR("Last Modified Date"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo:", *MEMORY[0x24BE197F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tense:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeUnits:", 8444);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)createNoteWithContent:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[7];

  v14[6] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__44832;
  v12[4] = __Block_byref_object_dispose__44833;
  v13 = 0;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v14[2] = objc_opt_class();
  v14[3] = objc_opt_class();
  v14[4] = objc_opt_class();
  v14[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke;
  v9[3] = &unk_24F8B9D28;
  v11 = v12;
  v8 = v6;
  v10 = v8;
  objc_msgSend(v5, "generateCollectionByCoercingToItemClasses:completionHandler:", v7, v9);

  _Block_object_dispose(v12, 8);
}

+ (id)itemWithNoteRef:(id)a3 note:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a1, "itemWithObject:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19590], "object:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();

  objc_msgSend(v7, "setObjectRepresentations:forClass:", v9, v10);
  return v7;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClassName:frameworkName:location:", CFSTR("UIPrintFormatter"), CFSTR("UIKit"), 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeFromPasteboardType:", *MEMORY[0x24BEC1CB8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8350]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v7, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BE196E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Evernote note"), CFSTR("Evernote note"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Evernote notes"), CFSTR("Evernote notes"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Evernote notes"));
}

void __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  char v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46[2];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  v46[0] = v7;
  objc_msgSend(v7, "collectionByFilteringToItemClass:excludedItems:", objc_opt_class(), v46);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v46[0];

  v45 = v11;
  objc_msgSend(v11, "collectionByFilteringToItemClass:excludedItems:", objc_opt_class(), &v45);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v45;

  v44 = v13;
  objc_msgSend(v13, "collectionByFilteringToItemClass:excludedItems:", objc_opt_class(), &v44);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v44;

  v43 = v15;
  objc_msgSend(v15, "collectionByFilteringToItemClass:excludedItems:", objc_opt_class(), &v43);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v43;

  v42 = v17;
  objc_msgSend(v17, "collectionByFilteringToItemClass:excludedItems:", objc_opt_class(), &v42);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v42;

  v32 = v9;
  if (objc_msgSend(v10, "numberOfItems"))
  {
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke_2;
    v40[3] = &unk_24F8B9C10;
    v20 = &v41;
    v41 = *(id *)(a1 + 32);
    objc_msgSend(v10, "getObjectRepresentation:forClass:", v40, objc_opt_class());
  }
  else
  {
    v30 = v19;
    v31 = v10;
    objc_msgSend(v16, "items");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = v12;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "preferredFileType");
    v24 = v14;
    v25 = v8;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x24BDF83F8];
    v27 = objc_msgSend(v26, "conformsToUTType:");

    v8 = v25;
    v14 = v24;

    v12 = v22;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke_3;
    v33[3] = &unk_24F8B9D00;
    v38 = *(_QWORD *)(a1 + 40);
    v39 = v27;
    v20 = &v34;
    v34 = v22;
    v35 = v24;
    v36 = v18;
    v37 = *(id *)(a1 + 32);
    if ((v27 & 1) != 0)
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", v29);
    else
      objc_msgSend(MEMORY[0x24BEC14A0], "typeFromPasteboardType:", *MEMORY[0x24BEC1CB8]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "getFileRepresentation:forType:", v33, v28);

    v19 = v30;
    v10 = v31;
  }

}

uint64_t __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  ENWebContentTransformer *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;

  v5 = a2;
  v6 = a3;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  if (v5)
  {
    v7 = objc_alloc_init(ENWebContentTransformer);
    objc_msgSend(v5, "wfName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENWebContentTransformer setTitle:](v7, "setTitle:", v8);

    objc_msgSend(v5, "wfType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "MIMEType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENWebContentTransformer setMimeType:](v7, "setMimeType:", v10);

    if (*(_BYTE *)(a1 + 72))
    {
      v11 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v5, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "initWithData:encoding:", v12, 4);
    }
    else
    {
      objc_msgSend(v5, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[ENWebArchive webArchiveWithData:](ENWebArchive, "webArchiveWithData:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v13;
    -[ENWebContentTransformer transformedValue:](v7, "transformedValue:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "if_map:", &__block_literal_global_123_44879);
    v7 = (ENWebContentTransformer *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "items");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "if_map:", &__block_literal_global_125_44880);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[ENWebContentTransformer arrayByAddingObjectsFromArray:](v7, "arrayByAddingObjectsFromArray:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      +[ENNoteContent noteContentWithString:](ENNoteContent, "noteContentWithString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setContent:", v19);

    }
  }

  v20 = *(void **)(a1 + 48);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke_6;
  v24[3] = &unk_24F8B9CD8;
  v25 = v14;
  v23 = *(_OWORD *)(a1 + 56);
  v21 = (id)v23;
  v26 = v23;
  v22 = v14;
  objc_msgSend(v20, "getFileRepresentations:forType:", v24, 0);

}

void __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  ENResource *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ENResource *v16;
  void *v17;
  void *v18;
  void (*v19)(void);
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v20 = a3;
  if (v20)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v11 = [ENResource alloc];
        objc_msgSend(v10, "data", v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "wfType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "MIMEType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "filename");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[ENResource initWithData:mimeType:filename:](v11, "initWithData:mimeType:filename:", v12, v14, v15);

        objc_msgSend(*(id *)(a1 + 32), "addResource:", v16);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "resources");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "content");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v19 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      goto LABEL_14;
    }
  }
  v19 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_14:
  v19();

}

id __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __65__WFEvernoteContentItem_createNoteWithContent_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "string");
}

void __41__WFEvernoteContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__WFEvernoteContentItem_propertyBuilders__block_invoke_4;
  v8[3] = &unk_24F8B9C10;
  v9 = v5;
  v6 = v5;
  v7 = a2;
  objc_msgSend(v7, "getObjectRepresentation:forClass:", v8, objc_opt_class());

}

void __41__WFEvernoteContentItem_propertyBuilders__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "modificationDate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __41__WFEvernoteContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__WFEvernoteContentItem_propertyBuilders__block_invoke_2;
  v8[3] = &unk_24F8B9C10;
  v9 = v5;
  v6 = v5;
  v7 = a2;
  objc_msgSend(v7, "getObjectRepresentation:forClass:", v8, objc_opt_class());

}

void __41__WFEvernoteContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "creationDate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

@end
