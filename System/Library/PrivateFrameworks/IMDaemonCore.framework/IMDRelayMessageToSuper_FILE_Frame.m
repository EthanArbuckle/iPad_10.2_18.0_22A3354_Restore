@implementation IMDRelayMessageToSuper_FILE_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a4;
  v8 = (void *)IMCopyNormalizedAttributes();
  objc_msgSend(v8, "_stringForKey:", CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "_stringForKey:", CFSTR("width"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_stringForKey:", CFSTR("height"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_stringForKey:", CFSTR("datasize"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_stringForKey:", CFSTR("x-apple-anim-emoji"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_stringForKey:", CFSTR("emoji-image-id"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_stringForKey:", CFSTR("emoji-image-description"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("width"), CFSTR("height"), CFSTR("inline-file"), CFSTR("datasize"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectsForKeys:", v15);

    v28 = v10;
    v24 = objc_msgSend(v10, "integerValue");
    v27 = v11;
    v16 = objc_msgSend(v11, "integerValue");
    v17 = objc_msgSend(v13, "integerValue");
    +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "guidForNewIncomingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:", v19, 0, objc_msgSend(v12, "longLongValue"), 0, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "transferForGUID:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = 0;
    }
    v23 = objc_msgSend(v26, "length");
    if (v23)
    {
      objc_msgSend(v22, "setAdaptiveImageGlyphContentIdentifier:", v26);
      objc_msgSend(v22, "setAdaptiveImageGlyphContentDescription:", v25);
    }
    objc_msgSend(v22, "setUserInfo:", v14);
    objc_msgSend(v29, "appendInlineImageWithGUID:filename:width:height:isAnimoji:isAdaptiveImageGlyph:", v20, v9, v24, v16, v17, v23 != 0);

  }
}

@end
