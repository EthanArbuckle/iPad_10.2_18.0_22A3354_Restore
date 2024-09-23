@implementation NSAttributedString

void __81__NSAttributedString_TextAttachmentExtraction__wf_contentAsStringsAndAttachments__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v7 = a2;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v8 = (_QWORD *)getNSAttachmentAttributeNameSymbolLoc_ptr_11546;
  v40 = getNSAttachmentAttributeNameSymbolLoc_ptr_11546;
  if (!getNSAttachmentAttributeNameSymbolLoc_ptr_11546)
  {
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __getNSAttachmentAttributeNameSymbolLoc_block_invoke;
    v36[3] = &unk_24C4E3118;
    v36[4] = &v37;
    __getNSAttachmentAttributeNameSymbolLoc_block_invoke(v36);
    v8 = (_QWORD *)v38[3];
  }
  _Block_object_dispose(&v37, 8);
  if (v8)
  {
    objc_msgSend(v7, "objectForKey:", *v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v9)
    {
      v23 = objc_msgSend(v13, "length");

      if (v23)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
      goto LABEL_23;
    }

    v35 = a1;
    if (!objc_msgSend(v14, "length") || objc_msgSend(v14, "isEqualToString:", CFSTR("\uFFFC")))
    {

      v14 = 0;
    }
    objc_msgSend(v9, "fileWrapper");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferredFilename");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileWrapper");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isRegularFile");

    if (v18)
    {
      objc_msgSend(v15, "regularFileContents");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEC14A0], "typeFromFilename:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        v21 = v14;
      else
        v21 = v16;
      +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "contents");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v9, "contents");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x24BEC14A0];
        objc_msgSend(v9, "fileType");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "typeWithString:", v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v19;
      }
      else
      {
        objc_msgSend(v9, "image");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
LABEL_22:

LABEL_23:
          return;
        }
        v29 = objc_alloc(MEMORY[0x24BEC14E0]);
        objc_msgSend(v9, "image");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v29, "initWithPlatformImage:", v30);

        objc_msgSend(v19, "PNGRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84F8]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v20;
      }
      +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v27, v26, v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v22)
    {
      v31 = *(void **)(v35 + 40);
      +[WFContentItem itemWithFile:](WFContentItem, "itemWithFile:", v22);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v32);

    }
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSAttributedStringKey getNSAttachmentAttributeName(void)");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("NSAttributedString+TextAttachmentExtraction.m"), 16, CFSTR("%s"), dlerror());

  __break(1u);
}

void __58__NSAttributedString_ImageExtraction__containedImageFiles__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
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
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;

  v7 = a2;
  v8 = (void *)MEMORY[0x24BEC14A0];
  v30 = v7;
  objc_msgSend(v7, "fileType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "typeWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "conformsToUTType:", *MEMORY[0x24BDF8410]))
  {
    objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a3, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v14, "length") || objc_msgSend(v14, "isEqualToString:", CFSTR("\uFFFC")))
    {

      v14 = 0;
    }
    objc_msgSend(v30, "fileWrapper");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferredFilename");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fileWrapper");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isRegularFile");

    if (v18)
    {
      objc_msgSend(v15, "regularFileContents");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEC14A0], "typeFromFilename:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        v21 = v14;
      else
        v21 = v16;
      +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v30, "contents");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v30, "contents");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x24BEC14A0];
        objc_msgSend(v30, "fileType");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "typeWithString:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v19;
      }
      else
      {
        objc_msgSend(v30, "image");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
LABEL_17:

          goto LABEL_18;
        }
        v28 = objc_alloc(MEMORY[0x24BEC14E0]);
        objc_msgSend(v30, "image");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v28, "initWithPlatformImage:", v29);

        objc_msgSend(v19, "PNGRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84F8]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v20;
      }
      +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v26, v25, v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v22)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v22);

    }
    goto LABEL_17;
  }
LABEL_18:

}

@end
