@implementation DOMDocument(DDExtension)

- (void)dd_resetResults
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  objc_msgSend(a1, "webFrame");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedDOMRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "startContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "startOffset");
  objc_msgSend(v3, "endContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "endOffset");
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  objc_msgSend(a1, "getElementsByTagName:", CFSTR("A"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _DDArrayWithList(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __43__DOMDocument_DDExtension__dd_resetResults__block_invoke;
  v16[3] = &unk_1E4258698;
  v10 = v4;
  v17 = v10;
  v11 = v6;
  v18 = v11;
  v19 = &v20;
  _DDRemoveResultLinksFromArrayOfAnchors(v9, v16);
  if (*((_BYTE *)v21 + 24))
  {
    if (v3)
    {
      objc_msgSend(a1, "webFrame");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "selectedDOMRange");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        objc_msgSend(a1, "createRange");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setStart:offset:", v10, v5);
        objc_msgSend(v14, "setEnd:offset:", v11, v7);
        objc_msgSend(a1, "webFrame");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setSelectedDOMRange:affinity:closeTyping:", v14, 0, 0);

      }
    }
  }

  _Block_object_dispose(&v20, 8);
}

@end
