@implementation WFRichTextContentItem

- (id)attributedString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  -[WFContentItem getRepresentationsForType:error:](self, "getRepresentationsForType:error:", v3, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = 1;
  else
    v8 = v5 == 0;
  if (!v8)
  {
    getWFContentGraphLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[WFRichTextContentItem attributedString]";
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_20BBAD000, v9, OS_LOG_TYPE_ERROR, "%s Error getting attributed string from rich text content item: %@", buf, 0x16u);
    }

  }
  return v7;
}

- (void)generateRTFDRepresentation:(id)a3 fromAttributedString:(id)a4 forType:(id)a5
{
  void (**v8)(id, void *, _QWORD);
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *, _QWORD))a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend((id)objc_opt_class(), "attributesDictionaryForType:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v10, "fileWrapperFromRange:documentAttributes:error:", 0, objc_msgSend(v10, "length"), v11, &v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v26;
  if (v12)
  {
    if (objc_msgSend(v9, "conformsToUTType:", *MEMORY[0x24BDF83B0]))
    {
      objc_msgSend(v12, "serializedRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentItem name](self, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v14, v9, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v28[0] = v16;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, v17, 0);

      }
      else
      {
        v8[2](v8, 0, 0);
      }

    }
    else
    {
      -[WFContentItem name](self, "name");
      v18 = objc_claimAutoreleasedReturnValue();
      +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", v18, v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:](WFTemporaryFileManager, "proposedTemporaryFileURLForFilename:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v13;
      LOBYTE(v18) = objc_msgSend(v12, "writeToURL:options:originalContentsURL:error:", v20, 0, 0, &v25);
      v21 = v25;

      if ((v18 & 1) != 0)
      {
        -[WFContentItem name](self, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFFileRepresentation fileWithURL:options:ofType:proposedFilename:](WFFileRepresentation, "fileWithURL:options:ofType:proposedFilename:", v20, 1, v9, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v23;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, v24, 0);

      }
      else
      {
        ((void (**)(id, void *, id))v8)[2](v8, 0, v21);
      }

      v13 = v21;
    }
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v13);
  }

}

- (void)generateDataRepresentation:(id)a3 fromAttributedString:(id)a4 forType:(id)a5
{
  void (**v8)(id, void *, _QWORD);
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *, _QWORD))a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend((id)objc_opt_class(), "attributesDictionaryForType:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v10, "dataFromRange:documentAttributes:error:", 0, objc_msgSend(v10, "length"), v11, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v17;
  -[WFContentItem name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v12, v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v18[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v16, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v13);
  }

}

- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  WFWebResource *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  WFWebResource *v19;
  WFWebArchive *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = (void *)MEMORY[0x24BEC14A0];
  v7 = *MEMORY[0x24BEC1CB8];
  v8 = a3;
  objc_msgSend(v6, "typeFromPasteboardType:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "conformsToType:", v9);

  if ((_DWORD)v7
    && (-[WFContentItem internalRepresentationType](self, "internalRepresentationType"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "conformsToUTType:", *MEMORY[0x24BDF83F8]),
        v10,
        v11))
  {
    -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [WFWebResource alloc];
    objc_msgSend(v13, "mappedData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "originalURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "MIMEType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "wfName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[WFWebResource initWithData:URL:MIMEType:textEncodingName:frameName:](v14, "initWithData:URL:MIMEType:textEncodingName:frameName:", v15, v16, v17, CFSTR("UTF-8"), v18);

    v20 = -[WFWebArchive initWithMainResource:subresources:subframeArchives:]([WFWebArchive alloc], "initWithMainResource:subresources:subframeArchives:", v19, 0, 0);
    -[WFWebArchive data](v20, "data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "wfName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v21, v9, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)generateFileRepresentations:(id)a3 options:(id)a4 forType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  WFWebArchive *v19;
  void *v20;
  WFWebArchive *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  WFRichTextContentItem *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  char v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isEqualToUTType:", *MEMORY[0x24BDF84E0]))
  {
    objc_msgSend(v9, "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("WFCoercionOptionPDFIncludeMargin"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __69__WFRichTextContentItem_generateFileRepresentations_options_forType___block_invoke;
    v29[3] = &unk_24C4DE1F0;
    v31 = v8;
    v29[4] = self;
    v32 = v13;
    v30 = v9;
    -[WFContentItem getObjectRepresentation:forClass:options:](self, "getObjectRepresentation:forClass:options:", v29, objc_opt_class(), v30);

    v14 = v31;
LABEL_8:

    goto LABEL_9;
  }
  if (!objc_msgSend(v10, "conformsToUTType:", *MEMORY[0x24BDF8410]))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __69__WFRichTextContentItem_generateFileRepresentations_options_forType___block_invoke_20;
    v23[3] = &unk_24C4DE240;
    v26 = v8;
    v24 = v10;
    v25 = self;
    -[WFContentItem getObjectRepresentation:forClass:options:](self, "getObjectRepresentation:forClass:options:", v23, objc_opt_class(), v9);

    v14 = v26;
    goto LABEL_8;
  }
  -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToUTType:", *MEMORY[0x24BDF8658]);

  if (!v16)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __69__WFRichTextContentItem_generateFileRepresentations_options_forType___block_invoke_2;
    v27[3] = &unk_24C4DE218;
    v28 = v8;
    -[WFContentItem getObjectRepresentation:forClass:options:](self, "getObjectRepresentation:forClass:options:", v27, objc_opt_class(), v9);
    v14 = v28;
    goto LABEL_8;
  }
  -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [WFWebArchive alloc];
  objc_msgSend(v18, "mappedData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[WFWebArchive initWithData:](v19, "initWithData:", v20);

  -[WFWebArchive containedImageFiles](v21, "containedImageFiles");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))v8 + 2))(v8, v22, 0);

LABEL_9:
}

- (void)getFileRepresentationsForSerialization:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = CFSTR("ContinueLoadingWebContentIfExternalResourcesAreDenied");
  v17[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercionOptions optionsWithDictionary:](WFCoercionOptions, "optionsWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToUTType:", *MEMORY[0x24BDF83F8]))
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeFromPasteboardType:", *MEMORY[0x24BEC1CB8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__WFRichTextContentItem_getFileRepresentationsForSerialization___block_invoke;
  v12[3] = &unk_24C4E0D08;
  v12[4] = self;
  v13 = v8;
  v14 = v6;
  v15 = v4;
  v9 = v6;
  v10 = v8;
  v11 = v4;
  -[WFContentItem getFileRepresentation:forType:options:](self, "getFileRepresentation:forType:options:", v12, v10, v9);

}

- (void)generateAttributedString:(id)a3 fromFile:(id)a4 forClass:(Class)a5 coercionOptions:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  id *v37;
  id *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v10, "wfType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "conformsToUTType:", *MEMORY[0x24BDF83B0]);

  if (!v13)
    goto LABEL_6;
  v14 = objc_alloc(MEMORY[0x24BDD1598]);
  objc_msgSend(v10, "mappedData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithSerializedRepresentation:", v15);

  objc_msgSend(v10, "filename");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8560]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:](WFTemporaryFileManager, "proposedTemporaryFileURLForFilename:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v21 = objc_msgSend(v16, "writeToURL:options:originalContentsURL:error:", v20, 0, 0, &v46);
  v22 = v46;
  if ((v21 & 1) != 0)
  {
    +[WFFileRepresentation fileWithURL:options:](WFFileRepresentation, "fileWithURL:options:", v20, 1);
    v23 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v23;
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v9 + 2))(v9, 0, 0, v22);
  }

  if (v21)
  {
LABEL_6:
    v24 = (void *)objc_opt_class();
    objc_msgSend(v10, "wfType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "attributesDictionaryForType:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "wfType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "conformsToUTType:", *MEMORY[0x24BDF83F8]))
    {

    }
    else
    {
      objc_msgSend(v10, "wfType");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "conformsToUTType:", *MEMORY[0x24BDF8658]);

      if (!v29)
      {
        v34 = objc_msgSend(v10, "representationType");
        v35 = objc_alloc(MEMORY[0x24BDD1458]);
        if (v34)
        {
          objc_msgSend(v10, "fileURL");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0;
          v42 = 0;
          v37 = (id *)&v42;
          v38 = (id *)&v41;
          v39 = objc_msgSend(v35, "initWithURL:options:documentAttributes:error:", v36, v26, &v42, &v41);
        }
        else
        {
          objc_msgSend(v10, "mappedData");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 0;
          v44 = 0;
          v37 = (id *)&v44;
          v38 = (id *)&v43;
          v39 = objc_msgSend(v35, "initWithData:options:documentAttributes:error:", v36, v26, &v44, &v43);
        }
        v31 = (void *)v39;
        v32 = *v37;
        v33 = *v38;

        -[WFContentItem name](self, "name");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, void *, _QWORD))v9 + 2))(v9, v31, v40, 0);

        goto LABEL_14;
      }
    }
    v30 = (void *)objc_opt_class();
    v45 = 0;
    -[WFContentItem name](self, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "loadAttributedStringInWebViewFromHTMLFile:handler:attributedStringOptions:documentAttributes:name:coercionOptions:", v10, v9, v26, &v45, v31, v11);
    v32 = v45;
    v33 = 0;
LABEL_14:

  }
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if ((Class)objc_opt_class() != a5)
  {
    if ((Class)objc_opt_class() == a5)
    {
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_2;
      v50[3] = &unk_24C4DE218;
      v51 = v8;
      -[WFContentItem getObjectRepresentation:forClass:options:](self, "getObjectRepresentation:forClass:options:", v50, objc_opt_class(), v9);
      v20 = v51;
    }
    else
    {
      NSStringFromClass(a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(CFSTR("UIPrintFormatter"), "isEqualToString:", v10);

      if (v11)
      {
        -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToUTType:", *MEMORY[0x24BDF8658]);

        -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v13)
        {
          -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          +[WFWebResource webResourceWithFile:](WFWebResource, "webResourceWithFile:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v48[0] = MEMORY[0x24BDAC760];
          v48[1] = 3221225472;
          v48[2] = __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_4;
          v48[3] = &unk_24C4DFAE8;
          v49 = v8;
          +[WFWebResourceCapturer getPrintFormatterForWebResource:coercionOptions:completionHandler:](WFWebResourceCapturer, "getPrintFormatterForWebResource:coercionOptions:completionHandler:", v17, v9, v48);

LABEL_21:
          goto LABEL_22;
        }
        v21 = objc_msgSend(v14, "isEqualToUTType:", *MEMORY[0x24BDF83F8]);

        if (v21)
        {
          -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v23, "data");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "wf_stringWithData:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "originalURL");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFWebResource webResourceWithHTMLString:baseURL:](WFWebResource, "webResourceWithHTMLString:baseURL:", v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v46[0] = MEMORY[0x24BDAC760];
          v46[1] = 3221225472;
          v46[2] = __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_5;
          v46[3] = &unk_24C4DFAE8;
          v47 = v8;
          +[WFWebResourceCapturer getPrintFormatterForWebResource:coercionOptions:completionHandler:](WFWebResourceCapturer, "getPrintFormatterForWebResource:coercionOptions:completionHandler:", v28, v9, v46);

          goto LABEL_22;
        }
        v44[0] = MEMORY[0x24BDAC760];
        v44[1] = 3221225472;
        v44[2] = __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_6;
        v44[3] = &unk_24C4E2F00;
        v44[4] = self;
        v45 = v8;
        -[WFContentItem getObjectRepresentation:forClass:options:](self, "getObjectRepresentation:forClass:options:", v44, objc_opt_class(), v9);
        v20 = v45;
        goto LABEL_8;
      }
      if ((Class)objc_opt_class() != a5)
      {
        objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v16);
        goto LABEL_21;
      }
      -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToUTType:", *MEMORY[0x24BDF83F8]);

      -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "isEqualToUTType:", *MEMORY[0x24BDF8658]))
      {

LABEL_17:
        -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v34);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          v35 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v16, "data");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "wf_stringWithData:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "originalURL");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFWebResource webResourceWithHTMLString:baseURL:](WFWebResource, "webResourceWithHTMLString:baseURL:", v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          +[WFWebResource webResourceWithFile:](WFWebResource, "webResourceWithFile:", v16);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
        }
        +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = v40;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, _QWORD))v8 + 2))(v8, v41, 0);

        goto LABEL_21;
      }
      -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToUTType:", *MEMORY[0x24BDF8558]) | v30;

      if (v33 == 1)
        goto LABEL_17;
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_8;
      v42[3] = &unk_24C4DE218;
      v43 = v8;
      -[WFContentItem getObjectRepresentation:forClass:options:](self, "getObjectRepresentation:forClass:options:", v42, objc_opt_class(), v9);
      v20 = v43;
    }
LABEL_8:

    goto LABEL_22;
  }
  -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke;
  v52[3] = &unk_24C4DE218;
  v53 = v8;
  -[WFRichTextContentItem generateAttributedString:fromFile:forClass:coercionOptions:](self, "generateAttributedString:fromFile:forClass:coercionOptions:", v52, v19, a5, v9);

LABEL_22:
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t *v9;
  id *v10;
  void *v11;
  id v12;
  uint64_t v13;
  BOOL result;
  void *v15;
  void *v16;
  objc_super v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  -[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_10;
  if (objc_msgSend(v4, "conformsToClass:", objc_opt_class()))
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    LOBYTE(v27) = 0;
    getNSLinkAttributeName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "length");
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __58__WFRichTextContentItem_canGenerateRepresentationForType___block_invoke;
    v23[3] = &unk_24C4DE2B8;
    v23[4] = &v24;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, v23);

    v8 = *((_BYTE *)v25 + 24) != 0;
    v9 = &v24;
LABEL_9:
    _Block_object_dispose(v9, 8);
LABEL_11:

    return v8;
  }
  if (!objc_msgSend(v4, "conformsToClass:", objc_opt_class()))
  {
LABEL_10:
    v17.receiver = self;
    v17.super_class = (Class)WFRichTextContentItem;
    v8 = -[WFGenericFileContentItem canGenerateRepresentationForType:](&v17, sel_canGenerateRepresentationForType_, v4);
    goto LABEL_11;
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v10 = (id *)getNSAttachmentAttributeNameSymbolLoc_ptr;
  v27 = getNSAttachmentAttributeNameSymbolLoc_ptr;
  if (!getNSAttachmentAttributeNameSymbolLoc_ptr)
  {
    v11 = UIFoundationLibrary();
    v10 = (id *)dlsym(v11, "NSAttachmentAttributeName");
    v25[3] = (uint64_t)v10;
    getNSAttachmentAttributeNameSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v24, 8);
  if (v10)
  {
    v12 = *v10;
    v13 = objc_msgSend(v5, "length");
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __58__WFRichTextContentItem_canGenerateRepresentationForType___block_invoke_2;
    v18[3] = &unk_24C4DE2E0;
    v18[4] = &v19;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v13, 0, v18);

    v8 = *((_BYTE *)v20 + 24) != 0;
    v9 = &v19;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSAttributedStringKey getNSAttachmentAttributeName(void)");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("WFRichTextContentItem.m"), 46, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (BOOL)isContent
{
  return 1;
}

- (WFFileType)preferredFileType
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToClass:", objc_opt_class());

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8558]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WFRichTextContentItem;
    -[WFContentItem preferredFileType](&v7, sel_preferredFileType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (WFFileType *)v5;
}

- (void)getPDFFromResource:(id)a3 includeMargin:(BOOL)a4 options:(id)a5 handler:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  WFWebResourceCapturer *v12;
  WFWebResourceCapturer *v13;
  id v14;
  _QWORD v15[4];
  WFWebResourceCapturer *v16;
  id v17;

  v7 = a4;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init(WFWebResourceCapturer);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __74__WFRichTextContentItem_getPDFFromResource_includeMargin_options_handler___block_invoke;
  v15[3] = &unk_24C4E1E38;
  v16 = v12;
  v17 = v9;
  v13 = v12;
  v14 = v9;
  -[WFWebResourceCapturer generatePDFForWebResource:includeMargin:coercionOptions:completionHandler:](v13, "generatePDFForWebResource:includeMargin:coercionOptions:completionHandler:", v11, v7, v10, v15);

}

void __74__WFRichTextContentItem_getPDFFromResource_includeMargin_options_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __58__WFRichTextContentItem_canGenerateRepresentationForType___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

void __58__WFRichTextContentItem_canGenerateRepresentationForType___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  void *v8;
  id v9;

  v7 = (void *)MEMORY[0x24BEC14A0];
  objc_msgSend(a2, "fileType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "typeWithString:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "conformsToUTType:", *MEMORY[0x24BDF8410]))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }

}

void __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  id v7;
  id v8;
  void *v9;
  void (*v10)(uint64_t, _QWORD, id);
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v7 = a4;
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", a2, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v9, v7);

  }
  else
  {
    v10 = *(void (**)(uint64_t, _QWORD, id))(v4 + 16);
    v8 = a4;
    v10(v4, 0, v8);
  }

}

void __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v7 = a2;
  if (v7)
  {
    v3 = (void *)objc_opt_new();
    getNSLinkAttributeName();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "length");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_3;
    v8[3] = &unk_24C4DE290;
    v9 = v7;
    v10 = v3;
    v6 = v3;
    objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 0, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  id v7;
  id v8;
  void *v9;
  void (*v10)(uint64_t, _QWORD, id);
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v7 = a4;
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", a2, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v9, v7);

  }
  else
  {
    v10 = *(void (**)(uint64_t, _QWORD, id))(v4 + 16);
    v8 = a4;
    v10(v4, MEMORY[0x24BDBD1A8], v8);
  }

}

void __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v5, 0);

}

void __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_7;
    block[3] = &unk_24C4E2DD0;
    v7 = v3;
    v5 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    getNSDocumentTypeDocumentAttribute();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v4;
    getNSHTMLTextDocumentType();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "dataFromRange:documentAttributes:error:", 0, objc_msgSend(v3, "length"), v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
    +[WFWebResource webResourceWithHTMLString:baseURL:](WFWebResource, "webResourceWithHTMLString:baseURL:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v12, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_7(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(getUISimpleTextPrintFormatterClass_7489()), "initWithAttributedText:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v6, 0);

}

void __72__WFRichTextContentItem_generateObjectRepresentations_options_forClass___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16);
    v7 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    v9 = v16;
    objc_msgSend(v8, "attributedSubstringFromRange:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(void **)(a1 + 40);
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v9, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addObject:", v15);
  }

}

void __64__WFRichTextContentItem_getFileRepresentationsForSerialization___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __64__WFRichTextContentItem_getFileRepresentationsForSerialization___block_invoke_2;
    v8[3] = &unk_24C4E0D08;
    v12 = *(id *)(a1 + 56);
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 32);
    v9 = v5;
    v10 = v6;
    v11 = v3;
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510], v8[0], 3221225472, __64__WFRichTextContentItem_getFileRepresentationsForSerialization___block_invoke_2, &unk_24C4E0D08);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getFileRepresentation:forType:options:", v8, v7, *(_QWORD *)(a1 + 48));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __64__WFRichTextContentItem_getFileRepresentationsForSerialization___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *MEMORY[0x24BDF8558];
    if ((objc_msgSend(*(id *)(a1 + 32), "conformsToUTType:", *MEMORY[0x24BDF8558]) & 1) != 0)
    {
      v8 = *(_QWORD *)(a1 + 56);
      v17[0] = *(_QWORD *)(a1 + 48);
      v17[1] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

    }
    else
    {
      v10 = *(void **)(a1 + 40);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __64__WFRichTextContentItem_getFileRepresentationsForSerialization___block_invoke_3;
      v12[3] = &unk_24C4E0D08;
      v16 = *(id *)(a1 + 56);
      v13 = *(id *)(a1 + 48);
      v14 = v5;
      v15 = v6;
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "getFileRepresentation:forType:", v12, v11);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __64__WFRichTextContentItem_getFileRepresentationsForSerialization___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[7];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", a1[4], a1[5], a2, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, a1[6]);

}

uint64_t __69__WFRichTextContentItem_generateFileRepresentations_options_forType___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "getPDFFromResource:includeMargin:options:handler:", a2, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __69__WFRichTextContentItem_generateFileRepresentations_options_forType___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "containedImageFiles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v6);

  }
  else
  {
    getWFContentGraphLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[WFRichTextContentItem generateFileRepresentations:options:forType:]_block_invoke_2";
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_20BBAD000, v9, OS_LOG_TYPE_ERROR, "%s Failed to coerce to NSAttributedString with error %@", (uint8_t *)&v10, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __69__WFRichTextContentItem_generateFileRepresentations_options_forType___block_invoke_20(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (v9)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "conformsToUTType:", *MEMORY[0x24BDF8560]) & 1) != 0
      || objc_msgSend(*(id *)(a1 + 32), "conformsToUTType:", *MEMORY[0x24BDF83B0]))
    {
      objc_msgSend(*(id *)(a1 + 40), "generateRTFDRepresentation:fromAttributedString:forType:", *(_QWORD *)(a1 + 48), v9, *(_QWORD *)(a1 + 32));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "generateDataRepresentation:fromAttributedString:forType:", *(_QWORD *)(a1 + 48), v9, *(_QWORD *)(a1 + 32));
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

+ (id)documentTypeForType:(id)a3
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  id result;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  if (!objc_msgSend(v3, "isEqualToUTType:", *MEMORY[0x24BDF8558]))
  {
    if ((objc_msgSend(v3, "isEqualToUTType:", *MEMORY[0x24BDF8560]) & 1) == 0
      && !objc_msgSend(v3, "isEqualToUTType:", *MEMORY[0x24BDF83B0]))
    {
      if (objc_msgSend(v3, "isEqualToUTType:", *MEMORY[0x24BDF83F8]))
      {
        getNSHTMLTextDocumentType();
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v3, "conformsToUTType:", *MEMORY[0x24BDF8510]))
        {
          if (objc_msgSend(v3, "isEqualToUTType:", *MEMORY[0x24BDF8658]))
            v10 = CFSTR("NSWebArchive");
          else
            v10 = 0;
          goto LABEL_13;
        }
        getNSPlainTextDocumentType();
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
LABEL_12:
      v10 = v9;
LABEL_13:

      return v10;
    }
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v4 = (id *)getNSRTFDTextDocumentTypeSymbolLoc_ptr;
    v15 = getNSRTFDTextDocumentTypeSymbolLoc_ptr;
    if (!getNSRTFDTextDocumentTypeSymbolLoc_ptr)
    {
      v8 = UIFoundationLibrary();
      v4 = (id *)dlsym(v8, "NSRTFDTextDocumentType");
      v13[3] = (uint64_t)v4;
      getNSRTFDTextDocumentTypeSymbolLoc_ptr = (uint64_t)v4;
    }
    _Block_object_dispose(&v12, 8);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSAttributedStringDocumentType getNSRTFDTextDocumentType(void)");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("WFRichTextContentItem.m"), 51, CFSTR("%s"), dlerror());
      goto LABEL_22;
    }
LABEL_11:
    v9 = (__CFString *)*v4;
    goto LABEL_12;
  }
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v4 = (id *)getNSRTFTextDocumentTypeSymbolLoc_ptr;
  v15 = getNSRTFTextDocumentTypeSymbolLoc_ptr;
  if (!getNSRTFTextDocumentTypeSymbolLoc_ptr)
  {
    v5 = UIFoundationLibrary();
    v4 = (id *)dlsym(v5, "NSRTFTextDocumentType");
    v13[3] = (uint64_t)v4;
    getNSRTFTextDocumentTypeSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v12, 8);
  if (v4)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSAttributedStringDocumentType getNSRTFTextDocumentType(void)");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("WFRichTextContentItem.m"), 52, CFSTR("%s"), dlerror());
LABEL_22:

  __break(1u);
  return result;
}

+ (id)attributesDictionaryForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  id result;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(a1, "documentTypeForType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getNSPlainTextDocumentType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  v8 = (void *)MEMORY[0x24BDBCE70];
  getNSDocumentTypeDocumentAttribute();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v10 = (_QWORD *)getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr;
  v19 = getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr;
  if (!getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr)
  {
    v11 = UIFoundationLibrary();
    v10 = dlsym(v11, "NSCharacterEncodingDocumentAttribute");
    v17[3] = (uint64_t)v10;
    getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v16, 8);
  if (v10)
  {
    objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v5, v9, v7, *v10, 0, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSAttributedStringDocumentAttributeKey getNSCharacterEncodingDocumentAttribute(void)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("WFRichTextContentItem.m"), 47, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

+ (void)loadAttributedStringInWebViewFromHTMLFile:(id)a3 handler:(id)a4 attributedStringOptions:(id)a5 documentAttributes:(id *)a6 name:(id)a7 coercionOptions:(id)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a7;
  v14 = a8;
  getWFWorkflowExecutionLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "+[WFRichTextContentItem loadAttributedStringInWebViewFromHTMLFile:handler:attributedStringOptions:documentAttr"
          "ibutes:name:coercionOptions:]";
    v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_20BBAD000, v15, OS_LOG_TYPE_DEBUG, "%s Transforming HTML file %@ to NSAttributedString via WKWebView.", buf, 0x16u);
  }

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __139__WFRichTextContentItem_loadAttributedStringInWebViewFromHTMLFile_handler_attributedStringOptions_documentAttributes_name_coercionOptions___block_invoke;
  v20[3] = &unk_24C4DF8A8;
  v21 = v11;
  v22 = v14;
  v23 = v13;
  v24 = v12;
  v16 = v13;
  v17 = v12;
  v18 = v14;
  v19 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], v20);

}

+ (id)htmlHeader
{
  return CFSTR("<!DOCTYPE html>\n<html>\n<head>\n<meta charset=\"utf-8\">\n</head>\n<body>\n");
}

+ (id)htmlFooter
{
  return CFSTR("\n</body>\n</html>\n");
}

+ (id)normalizedHTMLDocumentFromHTML:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (objc_msgSend(a1, "isMissingHTMLHeaderInString:", v4))
  {
    objc_msgSend(a1, "htmlHeader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "htmlFooter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v4;
  }

  return v8;
}

+ (BOOL)isMissingHTMLHeaderInString:(id)a3
{
  void *v3;
  int v4;

  if (a3)
  {
    objc_msgSend(a3, "lowercaseString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsString:", CFSTR("<html")) ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

+ (id)normalizedHTMLDocumentFromHTMLData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "if_stringWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "isMissingHTMLHeaderInString:", v5) & 1) != 0)
  {
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringEncodingForData:encodingOptions:convertedString:usedLossyConversion:", v4, 0, 0, 0);
    v7 = (id)objc_opt_new();
    objc_msgSend(a1, "htmlHeader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataUsingEncoding:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendData:", v9);

    objc_msgSend(v7, "appendData:", v4);
    objc_msgSend(a1, "htmlFooter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataUsingEncoding:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendData:", v11);

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "conformsToUTType:", *MEMORY[0x24BDF8510]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFRichTextContentItem;
    v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;

  WFLocalizedStringWithKey(CFSTR("Text - Default Name"), CFSTR("Text"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentItemStringConversionBehavior coercingToStringWithDescription:](WFContentItemStringConversionBehavior, "coercingToStringWithDescription:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  void *v9;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8558]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8560]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeFromPasteboardType:", *MEMORY[0x24BEC1CB8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8410]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84E0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("UIPrintFormatter"), CFSTR("UIKit"), 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  return WFDeferrableLocalizedStringWithKey(CFSTR("Rich text (singular)"), CFSTR("Rich text"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Rich text (plural)"), CFSTR("Rich text"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Rich Text Items"));
}

+ (int64_t)tableTemplateSubjectType
{
  return 2;
}

void __139__WFRichTextContentItem_loadAttributedStringInWebViewFromHTMLFile_handler_attributedStringOptions_documentAttributes_name_coercionOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  +[WFWebResource webResourceWithFile:](WFWebResource, "webResourceWithFile:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v3 = (void *)getWKWebViewConfigurationClass_softClass;
  v15 = getWKWebViewConfigurationClass_softClass;
  v4 = MEMORY[0x24BDAC760];
  if (!getWKWebViewConfigurationClass_softClass)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __getWKWebViewConfigurationClass_block_invoke;
    v11[3] = &unk_24C4E3118;
    v11[4] = &v12;
    __getWKWebViewConfigurationClass_block_invoke((uint64_t)v11);
    v3 = (void *)v13[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v12, 8);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "_setAllowsJavaScriptMarkup:", 0);
  v7 = *(_QWORD *)(a1 + 40);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __139__WFRichTextContentItem_loadAttributedStringInWebViewFromHTMLFile_handler_attributedStringOptions_documentAttributes_name_coercionOptions___block_invoke_2;
  v8[3] = &unk_24C4E0850;
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  +[WFWKWebViewCapturer loadWebResource:withSize:configuration:coercionOptions:completionHandler:](WFWKWebViewCapturer, "loadWebResource:withSize:configuration:coercionOptions:completionHandler:", v2, v6, v7, v8, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));

}

void __139__WFRichTextContentItem_loadAttributedStringInWebViewFromHTMLFile_handler_attributedStringOptions_documentAttributes_name_coercionOptions___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __139__WFRichTextContentItem_loadAttributedStringInWebViewFromHTMLFile_handler_attributedStringOptions_documentAttributes_name_coercionOptions___block_invoke_3;
    v4[3] = &unk_24C4DE268;
    v6 = *(id *)(a1 + 40);
    v5 = *(id *)(a1 + 32);
    objc_msgSend(a2, "_getContentsAsAttributedStringWithCompletionHandler:", v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __139__WFRichTextContentItem_loadAttributedStringInWebViewFromHTMLFile_handler_attributedStringOptions_documentAttributes_name_coercionOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

@end
