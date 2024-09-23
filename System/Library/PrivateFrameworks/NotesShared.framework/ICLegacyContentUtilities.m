@implementation ICLegacyContentUtilities

+ (id)contentStringFromWebArchive:(id)a3
{
  void *v3;
  __CFString *v4;
  CFStringEncoding v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "mainResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textEncodingName");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = CFStringConvertIANACharSetNameToEncoding(v4);
  v6 = CFStringConvertEncodingToNSStringEncoding(v5);
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v3, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithData:encoding:", v8, v6);

  if (!v9)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "content", "+[ICLegacyContentUtilities contentStringFromWebArchive:]", 1, 0, CFSTR("Failed to convert content"));

  return v9;
}

+ (id)suggestedFilenameForURL:(id)a3 mimeType:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "_web_suggestedFilenameWithMIMEType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)generateContentID
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("@mobilenotes.apple.com"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)createAttachmentWithContentID:(id)a3 mimeType:(id)a4 data:(id)a5 filename:(id)a6 inContext:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  id v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v13 && objc_msgSend(v11, "length"))
  {
    if (v15)
    {
      objc_opt_class();
      ICCheckedDynamicCast();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "newlyAddedAttachment");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v17, "setContentID:", v11);
    objc_msgSend(v17, "setMimeType:", v12);
    objc_msgSend(v17, "setFilename:", v14);
    v22 = 0;
    v18 = objc_msgSend(v17, "persistAttachmentData:error:", v13, &v22);
    v19 = v22;
    v20 = v19;
    if ((v18 & 1) == 0)
      NSLog(CFSTR("Couldn't persist attachment for id: %@, error: %@"), v11, v19);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)createAttachmentFromWebResource:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("cid"));

  if (v10)
  {
    objc_msgSend(v6, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resourceSpecifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "generateContentID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "MIMEType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "suggestedFilenameForURL:mimeType:", v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createAttachmentWithContentID:mimeType:data:filename:inContext:", v12, v13, v16, v15, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)newNoteBasedOnModernNote:(id)a3 inFolder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_opt_class();
  v10 = (void *)objc_msgSend(v8, "newNoteInContext:", v7);

  ICCheckedDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setIsPlainText:", 0);
  objc_msgSend(v9, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v12);

  objc_msgSend(v9, "creationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCreationDate:", v13);

  objc_msgSend(v9, "modificationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setModificationDate:", v14);
  return v11;
}

@end
