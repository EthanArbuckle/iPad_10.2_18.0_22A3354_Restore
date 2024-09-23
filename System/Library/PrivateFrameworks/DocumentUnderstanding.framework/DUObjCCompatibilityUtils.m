@implementation DUObjCCompatibilityUtils

+ (id)clientForObjCClient:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding8DUClient *v4;
  void *v5;
  _TtC21DocumentUnderstanding8DUClient *v6;

  v3 = a3;
  v4 = [_TtC21DocumentUnderstanding8DUClient alloc];
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[DUClient initWithIdentifier:](v4, "initWithIdentifier:", v5);
  return v6;
}

+ (id)typeForObjCType:(id)a3
{
  __int16 v3;
  void *v4;
  void *v5;
  _TtC21DocumentUnderstanding20DURequestContentType *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_msgSend(a3, "options");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) != 0)
  {
    +[DURequestContentType languageTag](_TtC21DocumentUnderstanding20DURequestContentType, "languageTag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  +[DURequestContentType wikiDataTopic](_TtC21DocumentUnderstanding20DURequestContentType, "wikiDataTopic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  +[DURequestContentType date](_TtC21DocumentUnderstanding20DURequestContentType, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  +[DURequestContentType address](_TtC21DocumentUnderstanding20DURequestContentType, "address");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v11);

  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_7;
LABEL_15:
    +[DURequestContentType phoneNumber](_TtC21DocumentUnderstanding20DURequestContentType, "phoneNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

    if ((v3 & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  +[DURequestContentType link](_TtC21DocumentUnderstanding20DURequestContentType, "link");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v12);

  if ((v3 & 0x20) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v3 & 0x800) != 0)
  {
LABEL_8:
    +[DURequestContentType foundInEvent](_TtC21DocumentUnderstanding20DURequestContentType, "foundInEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
LABEL_9:
  v6 = -[DURequestContentType initWithAbilitiesToUnion:]([_TtC21DocumentUnderstanding20DURequestContentType alloc], "initWithAbilitiesToUnion:", v4);

  return v6;
}

+ (id)strategyForObjCStrategy:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _TtC21DocumentUnderstanding17DURequestStrategy *v6;
  void *v7;
  uint64_t v8;
  _TtC21DocumentUnderstanding17DURequestStrategy *v9;

  v3 = a3;
  objc_msgSend(v3, "contentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DUObjCCompatibilityUtils typeForObjCType:](DUObjCCompatibilityUtils, "typeForObjCType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [_TtC21DocumentUnderstanding17DURequestStrategy alloc];
  objc_msgSend(v3, "modelIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "preprocess");

  v9 = -[DURequestStrategy initWithContentType:preferredModelIdentifier:preprocess:](v6, "initWithContentType:preferredModelIdentifier:preprocess:", v5, v7, v8);
  return v9;
}

+ (id)documentForObjCDocument:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding13DURawDocument *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  _TtC21DocumentUnderstanding10DUDocument *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(_TtC21DocumentUnderstanding13DURawDocument);
  objc_msgSend(v3, "headline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[DURawDocument setHeadline:](v4, "setHeadline:", v6);

  objc_msgSend(v3, "subHeadline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[DURawDocument setSubHeadline:](v4, "setSubHeadline:", v8);

  objc_msgSend(v3, "version");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[DURawDocument setVersion:](v4, "setVersion:", v10);

  objc_msgSend(v3, "creator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[DURawDocument setCreator:](v4, "setCreator:", v12);

  objc_msgSend(v3, "abstract");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[DURawDocument setAbstract:](v4, "setAbstract:", v14);

  objc_msgSend(v3, "comment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[DURawDocument setComment:](v4, "setComment:", v16);

  objc_msgSend(v3, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  -[DURawDocument setText:](v4, "setText:", v18);

  objc_msgSend(v3, "inLanguage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  -[DURawDocument setInLanguage:](v4, "setInLanguage:", v20);

  objc_msgSend(v3, "keywords");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  -[DURawDocument setKeywords:](v4, "setKeywords:", v22);

  objc_msgSend(v3, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  -[DURawDocument setIdentifier:](v4, "setIdentifier:", v24);

  objc_msgSend(v3, "url");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  -[DURawDocument setUrl:](v4, "setUrl:", v26);

  objc_msgSend(v3, "thumbnailUrl");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  -[DURawDocument setThumbnailUrl:](v4, "setThumbnailUrl:", v28);

  objc_msgSend(v3, "significantLink");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  -[DURawDocument setSignificantLink:](v4, "setSignificantLink:", v30);

  objc_msgSend(v3, "dateCreated");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[DURawDocument setDateCreated:](v4, "setDateCreated:", v31);

  objc_msgSend(v3, "dateModified");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[DURawDocument setDateModified:](v4, "setDateModified:", v32);

  objc_msgSend(v3, "documentHTMLData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[DUObjCCompatibilityUtils htmlDataForObjCHTMLData:](DUObjCCompatibilityUtils, "htmlDataForObjCHTMLData:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[DURawDocument setDocumentHTMLData:](v4, "setDocumentHTMLData:", v34);
  objc_msgSend(v3, "documentUIElements");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v37 = v35;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v47;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v47 != v40)
          objc_enumerationMutation(v37);
        +[DUObjCCompatibilityUtils uiElementForObjCUIElement:](DUObjCCompatibilityUtils, "uiElementForObjCUIElement:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v41), (_QWORD)v46);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
          objc_msgSend(v36, "addObject:", v42);

        ++v41;
      }
      while (v39 != v41);
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v39);
  }

  v43 = (void *)objc_msgSend(v36, "copy");
  -[DURawDocument setDocumentUIElements:](v4, "setDocumentUIElements:", v43);

  v44 = -[DUDocument initWithRawDocument:maxLength:]([_TtC21DocumentUnderstanding10DUDocument alloc], "initWithRawDocument:maxLength:", v4, +[DUDocumentGlobals noMaxLength](_TtC21DocumentUnderstanding17DUDocumentGlobals, "noMaxLength"));
  return v44;
}

+ (id)htmlDataForObjCHTMLData:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding18DUDocumentHTMLData *v4;
  _TtC21DocumentUnderstanding19DUDocumentEmailData *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  void *v39;
  void *v40;
  void *v41;

  v3 = a3;
  v4 = objc_alloc_init(_TtC21DocumentUnderstanding18DUDocumentHTMLData);
  v5 = objc_alloc_init(_TtC21DocumentUnderstanding19DUDocumentEmailData);
  objc_msgSend(v3, "htmlString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[DUDocumentHTMLData setHtmlString:](v4, "setHtmlString:", v7);

  objc_msgSend(v3, "documentEmailData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[DUDocumentEmailData setSubject:](v5, "setSubject:", v10);

  objc_msgSend(v3, "documentEmailData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "senderName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  -[DUDocumentEmailData setSenderName:](v5, "setSenderName:", v13);

  objc_msgSend(v3, "documentEmailData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "senderEmail");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[DUDocumentEmailData setSenderEmail:](v5, "setSenderEmail:", v16);

  objc_msgSend(v3, "documentEmailData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "senderDomain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  -[DUDocumentEmailData setSenderDomain:](v5, "setSenderDomain:", v19);

  objc_msgSend(v3, "documentEmailData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "recipientNames");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  -[DUDocumentEmailData setRecipientNames:](v5, "setRecipientNames:", v22);

  objc_msgSend(v3, "documentEmailData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "recipientEmails");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");
  -[DUDocumentEmailData setRecipientEmails:](v5, "setRecipientEmails:", v25);

  objc_msgSend(v3, "documentEmailData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "ccNames");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  -[DUDocumentEmailData setCcNames:](v5, "setCcNames:", v28);

  objc_msgSend(v3, "documentEmailData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "ccEmails");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "copy");
  -[DUDocumentEmailData setCcEmails:](v5, "setCcEmails:", v31);

  objc_msgSend(v3, "documentEmailData");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bccNames");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  -[DUDocumentEmailData setBccNames:](v5, "setBccNames:", v34);

  objc_msgSend(v3, "documentEmailData");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bccEmails");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "copy");
  -[DUDocumentEmailData setBccEmails:](v5, "setBccEmails:", v37);

  objc_msgSend(v3, "documentEmailData");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "dateReceived");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copy");
  -[DUDocumentEmailData setDateReceived:](v5, "setDateReceived:", v40);

  v41 = (void *)-[DUDocumentEmailData copy](v5, "copy");
  -[DUDocumentHTMLData setDocumentEmailData:](v4, "setDocumentEmailData:", v41);

  return v4;
}

+ (id)objCHTMLDataForHTMLData:(id)a3
{
  id v4;
  DUDocumentHTMLDataObjC *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init(DUDocumentHTMLDataObjC);
  objc_msgSend(v4, "documentEmailData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objCEmailDataForEmailData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "htmlString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "copy");
  -[DUDocumentHTMLDataObjC setHtmlString:](v5, "setHtmlString:", v9);

  -[DUDocumentHTMLDataObjC setDocumentEmailData:](v5, "setDocumentEmailData:", v7);
  return v5;
}

+ (id)emailDataForObjCEmailData:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding19DUDocumentEmailData *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = a3;
  v4 = objc_alloc_init(_TtC21DocumentUnderstanding19DUDocumentEmailData);
  objc_msgSend(v3, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[DUDocumentEmailData setSubject:](v4, "setSubject:", v6);

  objc_msgSend(v3, "senderName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[DUDocumentEmailData setSenderName:](v4, "setSenderName:", v8);

  objc_msgSend(v3, "senderEmail");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[DUDocumentEmailData setSenderEmail:](v4, "setSenderEmail:", v10);

  objc_msgSend(v3, "senderDomain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[DUDocumentEmailData setSenderDomain:](v4, "setSenderDomain:", v12);

  objc_msgSend(v3, "recipientNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[DUDocumentEmailData setRecipientNames:](v4, "setRecipientNames:", v14);

  objc_msgSend(v3, "recipientEmails");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[DUDocumentEmailData setRecipientEmails:](v4, "setRecipientEmails:", v16);

  objc_msgSend(v3, "ccNames");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  -[DUDocumentEmailData setCcNames:](v4, "setCcNames:", v18);

  objc_msgSend(v3, "ccEmails");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  -[DUDocumentEmailData setCcEmails:](v4, "setCcEmails:", v20);

  objc_msgSend(v3, "bccNames");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  -[DUDocumentEmailData setBccNames:](v4, "setBccNames:", v22);

  objc_msgSend(v3, "bccEmails");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  -[DUDocumentEmailData setBccEmails:](v4, "setBccEmails:", v24);

  objc_msgSend(v3, "dateReceived");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)objc_msgSend(v25, "copy");
  -[DUDocumentEmailData setDateReceived:](v4, "setDateReceived:", v26);

  return v4;
}

+ (id)objCEmailDataForEmailData:(id)a3
{
  id v3;
  DUDocumentEmailDataObjC *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = a3;
  v4 = objc_alloc_init(DUDocumentEmailDataObjC);
  objc_msgSend(v3, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[DUDocumentEmailDataObjC setSubject:](v4, "setSubject:", v6);

  objc_msgSend(v3, "senderName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[DUDocumentEmailDataObjC setSenderName:](v4, "setSenderName:", v8);

  objc_msgSend(v3, "senderEmail");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[DUDocumentEmailDataObjC setSenderEmail:](v4, "setSenderEmail:", v10);

  objc_msgSend(v3, "senderDomain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[DUDocumentEmailDataObjC setSenderDomain:](v4, "setSenderDomain:", v12);

  objc_msgSend(v3, "recipientNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[DUDocumentEmailDataObjC setRecipientNames:](v4, "setRecipientNames:", v14);

  objc_msgSend(v3, "recipientEmails");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[DUDocumentEmailDataObjC setRecipientEmails:](v4, "setRecipientEmails:", v16);

  objc_msgSend(v3, "ccNames");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  -[DUDocumentEmailDataObjC setCcNames:](v4, "setCcNames:", v18);

  objc_msgSend(v3, "ccEmails");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  -[DUDocumentEmailDataObjC setCcEmails:](v4, "setCcEmails:", v20);

  objc_msgSend(v3, "bccNames");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  -[DUDocumentEmailDataObjC setBccNames:](v4, "setBccNames:", v22);

  objc_msgSend(v3, "bccEmails");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  -[DUDocumentEmailDataObjC setBccEmails:](v4, "setBccEmails:", v24);

  objc_msgSend(v3, "dateReceived");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)objc_msgSend(v25, "copy");
  -[DUDocumentEmailDataObjC setDateReceived:](v4, "setDateReceived:", v26);

  return v4;
}

+ (id)uiElementForObjCUIElement:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding19DUDocumentUIElement *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v4 = objc_alloc_init(_TtC21DocumentUnderstanding19DUDocumentUIElement);
  objc_msgSend(v3, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[DUDocumentUIElement setText:](v4, "setText:", v6);

  objc_msgSend(v3, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[DUDocumentUIElement setVersion:](v4, "setVersion:", v8);

  objc_msgSend(v3, "classDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[DUDocumentUIElement setClassDescriptor:](v4, "setClassDescriptor:", v10);

  objc_msgSend(v3, "fontSize");
  -[DUDocumentUIElement setFontSize:](v4, "setFontSize:");
  objc_msgSend(v3, "superviewClassNames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[DUDocumentUIElement setSuperviewClassNames:](v4, "setSuperviewClassNames:", v12);

  objc_msgSend(v3, "frameInWindow");
  -[DUDocumentUIElement setFrameInWindow:](v4, "setFrameInWindow:");
  objc_msgSend(v3, "absoluteOriginOnScreen");
  -[DUDocumentUIElement setAbsoluteOriginOnScreen:](v4, "setAbsoluteOriginOnScreen:");
  -[DUDocumentUIElement setIsOnScreen:](v4, "setIsOnScreen:", objc_msgSend(v3, "isOnScreen"));
  v13 = objc_msgSend(v3, "isValidForContentExtraction");

  -[DUDocumentUIElement setIsValidForContentExtraction:](v4, "setIsValidForContentExtraction:", v13);
  return v4;
}

+ (id)objCUIElementForUIElement:(id)a3
{
  id v3;
  DUDocumentUIElementObjC *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v4 = objc_alloc_init(DUDocumentUIElementObjC);
  objc_msgSend(v3, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[DUDocumentUIElementObjC setText:](v4, "setText:", v6);

  objc_msgSend(v3, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[DUDocumentUIElementObjC setVersion:](v4, "setVersion:", v8);

  objc_msgSend(v3, "classDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[DUDocumentUIElementObjC setClassDescriptor:](v4, "setClassDescriptor:", v10);

  objc_msgSend(v3, "fontSize");
  -[DUDocumentUIElementObjC setFontSize:](v4, "setFontSize:");
  objc_msgSend(v3, "superviewClassNames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[DUDocumentUIElementObjC setSuperviewClassNames:](v4, "setSuperviewClassNames:", v12);

  objc_msgSend(v3, "frameInWindow");
  -[DUDocumentUIElementObjC setFrameInWindow:](v4, "setFrameInWindow:");
  objc_msgSend(v3, "absoluteOriginOnScreen");
  -[DUDocumentUIElementObjC setAbsoluteOriginOnScreen:](v4, "setAbsoluteOriginOnScreen:");
  -[DUDocumentUIElementObjC setIsOnScreen:](v4, "setIsOnScreen:", objc_msgSend(v3, "isOnScreen"));
  v13 = objc_msgSend(v3, "isValidForContentExtraction");

  -[DUDocumentUIElementObjC setIsValidForContentExtraction:](v4, "setIsValidForContentExtraction:", v13);
  return v4;
}

+ (id)debugInfoForObjCDebugInfo:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding11DUDebugInfo *v4;
  void *v5;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding11DUDebugInfo);
    objc_msgSend(v3, "debugString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[DUDebugInfo setDebugString:](v4, "setDebugString:", v5);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objcDebugInfoForDebugInfo:(id)a3
{
  id v3;
  DUDebugInfoObjC *v4;
  void *v5;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(DUDebugInfoObjC);
    objc_msgSend(v3, "debugString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[DUDebugInfoObjC setDebugString:](v4, "setDebugString:", v5);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)calendarEventForObjCCalendarEvent:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding15DUCalendarEvent *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding15DUCalendarEvent);
    -[DUCalendarEvent setIsAllDay:](v4, "setIsAllDay:", objc_msgSend(v3, "isAllDay"));
    objc_msgSend(v3, "startDateComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[DUCalendarEvent setStartDateComponents:](v4, "setStartDateComponents:", v6);

    objc_msgSend(v3, "startTimezone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    -[DUCalendarEvent setStartTimezone:](v4, "setStartTimezone:", v8);

    objc_msgSend(v3, "endDateComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    -[DUCalendarEvent setEndDateComponents:](v4, "setEndDateComponents:", v10);

    objc_msgSend(v3, "endTimezone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(v11, "copy");
    -[DUCalendarEvent setEndTimezone:](v4, "setEndTimezone:", v12);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)structuredExtractionLabelForObjC:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding27DUStructuredExtractionLabel *v4;
  void *v5;
  double v6;
  double v7;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding27DUStructuredExtractionLabel);
    objc_msgSend(v3, "labelName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredExtractionLabel setLabelName:](v4, "setLabelName:", v5);

    objc_msgSend(v3, "confidenceScore");
    v7 = v6;

    -[DUStructuredExtractionLabel setConfidenceScore:](v4, "setConfidenceScore:", v7);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objCForStructuredExtractionLabel:(id)a3
{
  id v3;
  DUStructuredEntityLabelObjC *v4;
  void *v5;
  double v6;
  double v7;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(DUStructuredEntityLabelObjC);
    objc_msgSend(v3, "labelName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntityLabelObjC setLabelName:](v4, "setLabelName:", v5);

    objc_msgSend(v3, "confidenceScore");
    v7 = v6;

    -[DUStructuredEntityLabelObjC setConfidenceScore:](v4, "setConfidenceScore:", v7);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objCCalendarEventForCalendarEvent:(id)a3
{
  id v3;
  DUCalendarEventObjC *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(DUCalendarEventObjC);
    -[DUCalendarEventObjC setIsAllDay:](v4, "setIsAllDay:", objc_msgSend(v3, "isAllDay"));
    objc_msgSend(v3, "startDateComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[DUCalendarEventObjC setStartDateComponents:](v4, "setStartDateComponents:", v6);

    objc_msgSend(v3, "startTimezone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    -[DUCalendarEventObjC setStartTimezone:](v4, "setStartTimezone:", v8);

    objc_msgSend(v3, "endDateComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    -[DUCalendarEventObjC setEndDateComponents:](v4, "setEndDateComponents:", v10);

    objc_msgSend(v3, "endTimezone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(v11, "copy");
    -[DUCalendarEventObjC setEndTimezone:](v4, "setEndTimezone:", v12);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)displayInfoForObjC:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding13DUDisplayInfo *v4;
  uint64_t v5;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding13DUDisplayInfo);
    objc_msgSend(v3, "frameInWindow");
    -[DUDisplayInfo setFrameInWindow:](v4, "setFrameInWindow:");
    objc_msgSend(v3, "absoluteOriginOnScreen");
    -[DUDisplayInfo setAbsoluteOriginOnScreen:](v4, "setAbsoluteOriginOnScreen:");
    v5 = objc_msgSend(v3, "isOnScreen");

    -[DUDisplayInfo setIsOnScreen:](v4, "setIsOnScreen:", v5);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objCForDisplayInfo:(id)a3
{
  id v3;
  DUDisplayInfoObjC *v4;
  uint64_t v5;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(DUDisplayInfoObjC);
    objc_msgSend(v3, "frameInWindow");
    -[DUDisplayInfoObjC setFrameInWindow:](v4, "setFrameInWindow:");
    objc_msgSend(v3, "absoluteOriginOnScreen");
    -[DUDisplayInfoObjC setAbsoluteOriginOnScreen:](v4, "setAbsoluteOriginOnScreen:");
    v5 = objc_msgSend(v3, "isOnScreen");

    -[DUDisplayInfoObjC setIsOnScreen:](v4, "setIsOnScreen:", v5);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)structuredEntityForObjCStructuredEntity:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding18DUStructuredEntity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding18DUStructuredEntity);
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntity setTitle:](v4, "setTitle:", v5);

    objc_msgSend(v3, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntity setType:](v4, "setType:", v6);

    v7 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v3, "labels", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          +[DUObjCCompatibilityUtils structuredExtractionLabelForObjC:](DUObjCCompatibilityUtils, "structuredExtractionLabelForObjC:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v10);
    }

    -[DUStructuredEntity setLabels:](v4, "setLabels:", v7);
    objc_msgSend(v3, "phoneNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntity setPhoneNumber:](v4, "setPhoneNumber:", v14);

    objc_msgSend(v3, "email");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntity setEmail:](v4, "setEmail:", v15);

    objc_msgSend(v3, "url");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntity setUrl:](v4, "setUrl:", v16);

    objc_msgSend(v3, "addressComponents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntity setAddressComponents:](v4, "setAddressComponents:", v17);

    objc_msgSend(v3, "calendarEvent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils calendarEventForObjCCalendarEvent:](DUObjCCompatibilityUtils, "calendarEventForObjCCalendarEvent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntity setCalendarEvent:](v4, "setCalendarEvent:", v19);

    objc_msgSend(v3, "homeAutomationID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntity setHomeAutomationID:](v4, "setHomeAutomationID:", v20);

    objc_msgSend(v3, "displayInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils displayInfoForObjC:](DUObjCCompatibilityUtils, "displayInfoForObjC:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntity setDisplayInfo:](v4, "setDisplayInfo:", v22);

    objc_msgSend(v3, "responseDebugInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils debugInfoForObjCDebugInfo:](DUObjCCompatibilityUtils, "debugInfoForObjCDebugInfo:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntity setResponseDebugInfo:](v4, "setResponseDebugInfo:", v24);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)objCStructuredEntityForStructuredEntity:(id)a3
{
  id v3;
  DUStructuredEntityObjC *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(DUStructuredEntityObjC);
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntityObjC setTitle:](v4, "setTitle:", v5);

    objc_msgSend(v3, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntityObjC setType:](v4, "setType:", v6);

    v7 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v3, "labels", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          +[DUObjCCompatibilityUtils objCForStructuredExtractionLabel:](DUObjCCompatibilityUtils, "objCForStructuredExtractionLabel:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v10);
    }

    -[DUStructuredEntityObjC setLabels:](v4, "setLabels:", v7);
    objc_msgSend(v3, "phoneNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntityObjC setPhoneNumber:](v4, "setPhoneNumber:", v14);

    objc_msgSend(v3, "email");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntityObjC setEmail:](v4, "setEmail:", v15);

    objc_msgSend(v3, "url");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntityObjC setUrl:](v4, "setUrl:", v16);

    objc_msgSend(v3, "addressComponents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntityObjC setAddressComponents:](v4, "setAddressComponents:", v17);

    objc_msgSend(v3, "calendarEvent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils objCCalendarEventForCalendarEvent:](DUObjCCompatibilityUtils, "objCCalendarEventForCalendarEvent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntityObjC setCalendarEvent:](v4, "setCalendarEvent:", v19);

    objc_msgSend(v3, "homeAutomationID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntityObjC setHomeAutomationID:](v4, "setHomeAutomationID:", v20);

    objc_msgSend(v3, "displayInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils objCForDisplayInfo:](DUObjCCompatibilityUtils, "objCForDisplayInfo:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntityObjC setDisplayInfo:](v4, "setDisplayInfo:", v22);

    objc_msgSend(v3, "responseDebugInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils objcDebugInfoForDebugInfo:](DUObjCCompatibilityUtils, "objcDebugInfoForDebugInfo:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntityObjC setResponseDebugInfo:](v4, "setResponseDebugInfo:", v24);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)globalTopicSetIdentifierForObjCGlobalTopicSetIdentifier:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier *v4;
  uint64_t v5;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier);
    -[DUGlobalTopicSetIdentifier setTopicSetName:](v4, "setTopicSetName:", objc_msgSend(v3, "topicSetName"));
    v5 = objc_msgSend(v3, "topicSetVersion");

    -[DUGlobalTopicSetIdentifier setTopicSetVersion:](v4, "setTopicSetVersion:", v5);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objCGlobalTopicSetIdentifierForGlobalTopicSetIdentifier:(id)a3
{
  id v3;
  DUGlobalTopicSetIdentifierObjC *v4;
  uint64_t v5;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(DUGlobalTopicSetIdentifierObjC);
    -[DUGlobalTopicSetIdentifierObjC setTopicSetName:](v4, "setTopicSetName:", objc_msgSend(v3, "topicSetName"));
    v5 = objc_msgSend(v3, "topicSetVersion");

    -[DUGlobalTopicSetIdentifierObjC setTopicSetVersion:](v4, "setTopicSetVersion:", v5);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)topicResultForObjCTopicResult:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding13DUTopicResult *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding13DUTopicResult);
    objc_msgSend(v3, "topicSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils globalTopicSetIdentifierForObjCGlobalTopicSetIdentifier:](DUObjCCompatibilityUtils, "globalTopicSetIdentifierForObjCGlobalTopicSetIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUTopicResult setTopicSet:](v4, "setTopicSet:", v6);

    objc_msgSend(v3, "topicIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUTopicResult setTopicIdentifier:](v4, "setTopicIdentifier:", v7);

    objc_msgSend(v3, "topicConfidence");
    v9 = v8;

    -[DUTopicResult setTopicConfidence:](v4, "setTopicConfidence:", v9);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objCTopicResultForTopicResult:(id)a3
{
  id v3;
  DUTopicResultObjC *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(DUTopicResultObjC);
    objc_msgSend(v3, "topicSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils objCGlobalTopicSetIdentifierForGlobalTopicSetIdentifier:](DUObjCCompatibilityUtils, "objCGlobalTopicSetIdentifierForGlobalTopicSetIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUTopicResultObjC setTopicSet:](v4, "setTopicSet:", v6);

    objc_msgSend(v3, "topicIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUTopicResultObjC setTopicIdentifier:](v4, "setTopicIdentifier:", v7);

    objc_msgSend(v3, "topicConfidence");
    v9 = v8;

    -[DUTopicResultObjC setTopicConfidence:](v4, "setTopicConfidence:", v9);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)structuredEntityResponseForObjC:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding26DUStructuredEntityResponse *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding26DUStructuredEntityResponse);
    v5 = (void *)objc_opt_new();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v3, "structuredEntities", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          +[DUObjCCompatibilityUtils structuredEntityForObjCStructuredEntity:](DUObjCCompatibilityUtils, "structuredEntityForObjCStructuredEntity:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    -[DUStructuredEntityResponse setStructuredEntities:](v4, "setStructuredEntities:", v5);
    objc_msgSend(v3, "responseDebugInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils debugInfoForObjCDebugInfo:](DUObjCCompatibilityUtils, "debugInfoForObjCDebugInfo:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntityResponse setResponseDebugInfo:](v4, "setResponseDebugInfo:", v13);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)objcForStructuredEntityResponse:(id)a3
{
  id v3;
  DUStructuredEntityResponseObjC *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(DUStructuredEntityResponseObjC);
    v5 = (void *)objc_opt_new();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v3, "structuredEntities", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          +[DUObjCCompatibilityUtils objCStructuredEntityForStructuredEntity:](DUObjCCompatibilityUtils, "objCStructuredEntityForStructuredEntity:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    -[DUStructuredEntityResponseObjC setStructuredEntities:](v4, "setStructuredEntities:", v5);
    objc_msgSend(v3, "responseDebugInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils objcDebugInfoForDebugInfo:](DUObjCCompatibilityUtils, "objcDebugInfoForDebugInfo:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUStructuredEntityResponseObjC setResponseDebugInfo:](v4, "setResponseDebugInfo:", v13);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)topicDetectionResponseForObjC:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding24DUTopicDetectionResponse *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding24DUTopicDetectionResponse);
    v5 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v3, "globalTopics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          +[DUObjCCompatibilityUtils topicResultForObjCTopicResult:](DUObjCCompatibilityUtils, "topicResultForObjCTopicResult:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v3, "personalTopics", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          +[DUObjCCompatibilityUtils topicResultForObjCTopicResult:](DUObjCCompatibilityUtils, "topicResultForObjCTopicResult:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v15);
    }

    -[DUTopicDetectionResponse setGlobalTopics:](v4, "setGlobalTopics:", v5);
    -[DUTopicDetectionResponse setPersonalTopics:](v4, "setPersonalTopics:", v12);
    objc_msgSend(v3, "responseDebugInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils debugInfoForObjCDebugInfo:](DUObjCCompatibilityUtils, "debugInfoForObjCDebugInfo:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUTopicDetectionResponse setResponseDebugInfo:](v4, "setResponseDebugInfo:", v20);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)objcForTopicDetectionResponse:(id)a3
{
  id v3;
  DUTopicDetectionResponseObjC *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(DUTopicDetectionResponseObjC);
    v5 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v3, "globalTopics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          +[DUObjCCompatibilityUtils objCTopicResultForTopicResult:](DUObjCCompatibilityUtils, "objCTopicResultForTopicResult:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v3, "personalTopics", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          +[DUObjCCompatibilityUtils objCTopicResultForTopicResult:](DUObjCCompatibilityUtils, "objCTopicResultForTopicResult:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v15);
    }

    -[DUTopicDetectionResponseObjC setGlobalTopics:](v4, "setGlobalTopics:", v5);
    -[DUTopicDetectionResponseObjC setPersonalTopics:](v4, "setPersonalTopics:", v12);
    objc_msgSend(v3, "responseDebugInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils objcDebugInfoForDebugInfo:](DUObjCCompatibilityUtils, "objcDebugInfoForDebugInfo:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUTopicDetectionResponseObjC setResponseDebugInfo:](v4, "setResponseDebugInfo:", v20);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)languageTaggingResponseForObjC:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding25DULanguageTaggingResponse *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding25DULanguageTaggingResponse);
    objc_msgSend(v3, "languageTags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DULanguageTaggingResponse setLanguageTags:](v4, "setLanguageTags:", v5);

    objc_msgSend(v3, "responseDebugInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[DUObjCCompatibilityUtils debugInfoForObjCDebugInfo:](DUObjCCompatibilityUtils, "debugInfoForObjCDebugInfo:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DULanguageTaggingResponse setResponseDebugInfo:](v4, "setResponseDebugInfo:", v7);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objcForLanguageTaggingResponse:(id)a3
{
  id v3;
  DULanguageTaggingResponseObjC *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(DULanguageTaggingResponseObjC);
    objc_msgSend(v3, "languageTags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DULanguageTaggingResponseObjC setLanguageTags:](v4, "setLanguageTags:", v5);

    objc_msgSend(v3, "responseDebugInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[DUObjCCompatibilityUtils objcDebugInfoForDebugInfo:](DUObjCCompatibilityUtils, "objcDebugInfoForDebugInfo:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DULanguageTaggingResponseObjC setResponseDebugInfo:](v4, "setResponseDebugInfo:", v7);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)categoryResultForObjC:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding16DUCategoryResult *v4;
  void *v5;
  double v6;
  double v7;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding16DUCategoryResult);
    objc_msgSend(v3, "categoryIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUCategoryResult setCategoryIdentifier:](v4, "setCategoryIdentifier:", v5);

    objc_msgSend(v3, "categoryConfidence");
    v7 = v6;

    -[DUCategoryResult setCategoryConfidence:](v4, "setCategoryConfidence:", v7);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objCForCategoryResult:(id)a3
{
  id v3;
  DUCategoryResultObjC *v4;
  void *v5;
  double v6;
  double v7;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(DUCategoryResultObjC);
    objc_msgSend(v3, "categoryIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUCategoryResultObjC setCategoryIdentifier:](v4, "setCategoryIdentifier:", v5);

    objc_msgSend(v3, "categoryConfidence");
    v7 = v6;

    -[DUCategoryResultObjC setCategoryConfidence:](v4, "setCategoryConfidence:", v7);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)foundInEventResultForObjC:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding20DUFoundInEventResult *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[DUFoundInEventResult initWithFoundInEventResult:]([_TtC21DocumentUnderstanding20DUFoundInEventResult alloc], "initWithFoundInEventResult:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)categoryClassificationResponseForObjC:(id)a3
{
  id v3;
  _TtC21DocumentUnderstanding32DUCategoryClassificationResponse *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(_TtC21DocumentUnderstanding32DUCategoryClassificationResponse);
    v5 = (void *)objc_opt_new();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v3, "categories", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          +[DUObjCCompatibilityUtils categoryResultForObjC:](DUObjCCompatibilityUtils, "categoryResultForObjC:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    -[DUCategoryClassificationResponse setCategories:](v4, "setCategories:", v5);
    objc_msgSend(v3, "responseDebugInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils debugInfoForObjCDebugInfo:](DUObjCCompatibilityUtils, "debugInfoForObjCDebugInfo:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUCategoryClassificationResponse setResponseDebugInfo:](v4, "setResponseDebugInfo:", v13);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)objcForCategoryClassificationResponse:(id)a3
{
  id v3;
  DUCategoryClassificationResponseObjC *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(DUCategoryClassificationResponseObjC);
    v5 = (void *)objc_opt_new();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v3, "categories", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          +[DUObjCCompatibilityUtils objCForCategoryResult:](DUObjCCompatibilityUtils, "objCForCategoryResult:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    -[DUCategoryClassificationResponseObjC setCategories:](v4, "setCategories:", v5);
    objc_msgSend(v3, "responseDebugInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils objcDebugInfoForDebugInfo:](DUObjCCompatibilityUtils, "objcDebugInfoForDebugInfo:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUCategoryClassificationResponseObjC setResponseDebugInfo:](v4, "setResponseDebugInfo:", v13);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)objcForFoundInEventResult:(id)a3
{
  id v3;
  DUFoundInEventResultObjC *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[DUFoundInEventResultObjC initWithDUFoundInEventResult:]([DUFoundInEventResultObjC alloc], "initWithDUFoundInEventResult:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)objcForResponse:(id)a3
{
  id v3;
  DUResponseObjC *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(DUResponseObjC);
    objc_msgSend(v3, "topics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils objcForTopicDetectionResponse:](DUObjCCompatibilityUtils, "objcForTopicDetectionResponse:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUResponseObjC setTopics:](v4, "setTopics:", v6);

    objc_msgSend(v3, "structuredEntities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils objcForStructuredEntityResponse:](DUObjCCompatibilityUtils, "objcForStructuredEntityResponse:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUResponseObjC setStructuredEntities:](v4, "setStructuredEntities:", v8);

    objc_msgSend(v3, "languageTags");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils objcForLanguageTaggingResponse:](DUObjCCompatibilityUtils, "objcForLanguageTaggingResponse:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUResponseObjC setLanguageTags:](v4, "setLanguageTags:", v10);

    objc_msgSend(v3, "foundInEventResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils objcForFoundInEventResult:](DUObjCCompatibilityUtils, "objcForFoundInEventResult:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUResponseObjC setFoundInEvent:](v4, "setFoundInEvent:", v12);

    objc_msgSend(v3, "responseDebugInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[DUObjCCompatibilityUtils objcDebugInfoForDebugInfo:](DUObjCCompatibilityUtils, "objcDebugInfoForDebugInfo:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUResponseObjC setResponseDebugInfo:](v4, "setResponseDebugInfo:", v14);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
