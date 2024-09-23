@implementation DDPersonAction

+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  int Category;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v16;

  v5 = a3;
  if (!a4)
    goto LABEL_11;
  if ((DDResultHasType() & 1) == 0)
  {
    if (DDResultHasType())
    {
      objc_msgSend(MEMORY[0x1E0D1CE68], "resultFromCoreResult:", a4);
      v7 = objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend((id)v7, "getMailValue:label:", &v16, 0);
      v6 = v16;

      LOBYTE(v7) = dd_handleIsChatBot(v6);
      LOBYTE(v6) = v7 ^ 1;
      goto LABEL_17;
    }
    Category = DDResultGetCategory();
    if (Category != 2)
    {
      if (Category == 1)
      {
        v9 = (void *)DDResultCopyExtractedURLWithOptions();
        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
          v10 = objc_claimAutoreleasedReturnValue();

          v5 = (id)v10;
        }

      }
LABEL_11:
      if (v5)
      {
        objc_msgSend(v5, "scheme");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lowercaseString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          DDPersonActionsSupportedSchemes();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsObject:", v12);

          if ((v14 & 1) != 0)
          {
            LODWORD(v6) = !+[DDTextMessageAction isShowMessageURL:](DDTextMessageAction, "isShowMessageURL:", v5);

            goto LABEL_17;
          }
        }

      }
      LOBYTE(v6) = 0;
      goto LABEL_17;
    }
  }
  LOBYTE(v6) = 1;
LABEL_17:

  return (char)v6;
}

- (DDPersonAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  DDPersonAction *v12;
  DDPersonAction *v13;
  uint64_t v14;
  CNContact *contact;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    _DDURLFromResult((uint64_t)a4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  v17.receiver = self;
  v17.super_class = (Class)DDPersonAction;
  v12 = -[DDAction initWithURL:result:context:](&v17, sel_initWithURL_result_context_, v10, a4, v9);
  v13 = v12;
  if (v12)
  {
    if (v12->super.super.super._contact)
    {
      *(&v12->_fromCNContact + 5) = 1;
    }
    else
    {
      -[DDAction associatedResults](v12, "associatedResults");
      DDContactFromResult((uint64_t)a4, v8, v13->super.super.super._associatedVisualResults, &v13->_fromCNContact + 4);
      v14 = objc_claimAutoreleasedReturnValue();
      contact = v13->super.super.super._contact;
      v13->super.super.super._contact = (CNContact *)v14;

    }
  }

  return v13;
}

+ (id)viewControllerProviderClass
{
  return CFSTR("DDRemotePersonViewControllerProvider");
}

- (id)_appendActionsForPhoneNumbers:(id)a3 emailAddresses:(id)a4 class:(Class)a5 filter:(id)a6 scheme:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
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
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  NSURL *v42;
  void *v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  NSURL *v64;
  void *v65;
  id v67;
  void *v68;
  id obj;
  id obja;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  id v77;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v71 = a6;
  v13 = a7;
  if (objc_msgSend(v11, "count"))
  {
    if (!v13)
      goto LABEL_56;
  }
  else
  {
    v14 = objc_msgSend(v12, "count");
    v77 = 0;
    if (!v13 || !v14)
      goto LABEL_57;
  }
  if (!-[objc_class isAvailable](a5, "isAvailable"))
  {
LABEL_56:
    v77 = 0;
    goto LABEL_57;
  }
  v76 = v13;
  v68 = v12;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v77 = (id)objc_claimAutoreleasedReturnValue();
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v67 = v11;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v83, v88, 16);
  v17 = v71;
  if (v16)
  {
    v18 = v16;
    v74 = *(_QWORD *)v84;
    obj = v15;
    do
    {
      v19 = 0;
      v72 = v18;
      do
      {
        if (*(_QWORD *)v84 != v74)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v19);
        objc_msgSend(v20, "value");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[DDAction context](self, "context");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          -[DDAction context](self, "context");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v24, "mutableCopy");

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v20, "label");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v27 = (void *)MEMORY[0x1E0C97338];
          objc_msgSend(v20, "label");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "localizedStringForLabel:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKey:", v29, CFSTR("ContactLabel"));

        }
        objc_msgSend(v25, "setObject:forKey:", v22, CFSTR("ContactValue"));
        if (v22)
        {
          TUUnformattedPhoneNumber();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)v30;
          if (v30)
            v32 = (void *)v30;
          else
            v32 = v22;
          v33 = v32;

        }
        else
        {
          v33 = 0;
        }
        v34 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v76, v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "URLWithString:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17
          && +[DDContactUtils phoneNumber:isEqualToPhoneNumber:](DDContactUtils, "phoneNumber:isEqualToPhoneNumber:", v33, v17))
        {
          v37 = v36;
          -[NSURL scheme](self->super.super.super._url, "scheme");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "lowercaseString");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            -[objc_class matchingScheme](a5, "matchingScheme");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "isEqualToString:", v39);

            if (v41)
            {
              v42 = self->super.super.super._url;

              v37 = v42;
            }
            v15 = obj;
          }
          -[objc_class actionWithURL:result:context:](a5, "actionWithURL:result:context:", v37, 0, v25);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "insertObject:atIndex:", v43, 0);

          v17 = v71;
          v18 = v72;
        }
        else
        {
          -[objc_class actionWithURL:result:context:](a5, "actionWithURL:result:context:", v36, 0, v25);
          v37 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "addObject:", v37);
        }

        ++v19;
      }
      while (v18 != v19);
      v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v83, v88, 16);
    }
    while (v18);
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obja = v68;
  v13 = v76;
  v75 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
  if (v75)
  {
    v73 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v75; ++i)
      {
        if (*(_QWORD *)v80 != v73)
          objc_enumerationMutation(obja);
        v45 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        objc_msgSend(v45, "value");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqualToString:", CFSTR("mailto")) || (dd_handleIsChatBot(v46) & 1) == 0)
        {
          v47 = (void *)MEMORY[0x1E0C99E98];
          v48 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v46, "dd_encodedEmail");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringWithFormat:", CFSTR("%@:%@"), v13, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "URLWithString:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          -[DDAction context](self, "context");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (v52)
          {
            -[DDAction context](self, "context");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = (void *)objc_msgSend(v53, "mutableCopy");

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend(v45, "label");
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          if (v55)
          {
            v56 = (void *)MEMORY[0x1E0C97338];
            objc_msgSend(v45, "label");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "localizedStringForLabel:", v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setObject:forKey:", v58, CFSTR("ContactLabel"));

          }
          objc_msgSend(v54, "setObject:forKey:", v46, CFSTR("ContactValue"));
          if (v17 && objc_msgSend(v46, "isEqualToString:", v17))
          {
            v59 = v51;
            -[NSURL scheme](self->super.super.super._url, "scheme");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "lowercaseString");
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            if (v61)
            {
              -[objc_class matchingScheme](a5, "matchingScheme");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = objc_msgSend(v62, "isEqualToString:", v61);

              if (v63)
              {
                v64 = self->super.super.super._url;

                v59 = v64;
              }
            }
            v17 = v71;
            -[objc_class actionWithURL:result:context:](a5, "actionWithURL:result:context:", v59, -[DDAction result](self, "result"), v54);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "insertObject:atIndex:", v65, 0);

            v13 = v76;
          }
          else
          {
            -[objc_class actionWithURL:result:context:](a5, "actionWithURL:result:context:", v51, 0, v54);
            v59 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "addObject:", v59);
          }

        }
      }
      v75 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
    }
    while (v75);
  }

  v11 = v67;
  v12 = v68;
LABEL_57:

  return v77;
}

- (BOOL)phoneNumberIsBusiness:(id)a3
{
  id v5;
  NSString *lastBizNumberFetched;
  void *v7;
  BCSBusinessItem *v8;
  BCSBusinessItem *bizItem;
  BCSBusinessItem *v10;
  NSString *v11;
  BOOL v12;

  v5 = a3;
  if (v5)
  {
    lastBizNumberFetched = self->_lastBizNumberFetched;
    if (!lastBizNumberFetched || !-[NSString isEqualToString:](lastBizNumberFetched, "isEqualToString:", v5))
    {
      +[DDDetectionController sharedController](DDDetectionController, "sharedController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_businessItemForNumber:messageable:", v5, &self->_bizItemIsMessageable);
      v8 = (BCSBusinessItem *)objc_claimAutoreleasedReturnValue();
      bizItem = self->_bizItem;
      self->_bizItem = v8;

      objc_storeStrong((id *)&self->_lastBizNumberFetched, a3);
    }
  }
  else
  {
    v10 = self->_bizItem;
    self->_bizItem = 0;

    v11 = self->_lastBizNumberFetched;
    self->_lastBizNumberFetched = 0;

    self->_bizItemIsMessageable = 0;
  }
  v12 = self->_bizItem != 0;

  return v12;
}

- (id)_menuActionsForBusinessWithNumber:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  __DDResult *v9;
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
  __DDResult *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DDPersonAction phoneNumberIsBusiness:](self, "phoneNumberIsBusiness:", v5);

  if (v7)
  {
    -[DDAction url](self, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[DDAction result](self, "result");
    -[DDAction context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DDAction actionWithURL:result:context:](DDCallAction, "actionWithURL:result:context:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setBizItem:", self->_bizItem);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v12);

    if (self->_bizItemIsMessageable && +[DDAction isAvailable](DDTextMessageAction, "isAvailable"))
    {
      v13 = (void *)MEMORY[0x1E0C99E98];
      v14 = (void *)MEMORY[0x1E0CB3940];
      -[BCSBusinessItem bizID](self->_bizItem, "bizID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("sms://open?recipient=%@"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URLWithString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[DDAction context](self, "context");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[DDAction actionWithURL:result:context:](DDTextMessageAction, "actionWithURL:result:context:", v17, 0, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "setBizItem:", self->_bizItem);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v20);

    }
    -[DDAction url](self, "url");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[DDAction result](self, "result");
    -[DDAction context](self, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v25);

    if (*(&self->_fromCNContact + 5))
    {
      -[DDAction context](self, "context");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[DDAction actionWithURL:result:context:](DDShareAction, "actionWithURL:result:context:", 0, 0, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v30[0] = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v28);

      }
    }

  }
  return v6;
}

- (id)_menuActionsForPersonWithNumber:(id)a3 email:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  __DDResult *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  void *v49;
  void *v50;
  __DDResult *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  __DDResult *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v65;
  void *v66;
  id v67;
  _BOOL4 v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  void *v82;
  uint64_t v83;
  _BYTE v84[128];
  _QWORD v85[3];
  _BYTE v86[128];
  _QWORD v87[3];
  _BYTE v88[128];
  _QWORD v89[3];

  v89[1] = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v65 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v69 = (id)objc_claimAutoreleasedReturnValue();
  if (dd_phoneNumberResultCanBeRdarLink((_BOOL8)-[DDAction result](self, "result")))
  {
    -[DDAction url](self, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D1CE68], "resultFromCoreResult:", -[DDAction result](self, "result"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "url");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "dd_rdarLinkFromTelScheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[DDAction context](self, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[DDAction actionWithURL:result:context:](DDOpenURLAction, "actionWithURL:result:context:", v10, 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v89[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "addObject:", v13);

    }
  }
  v14 = -[NSURL dd_isAnySimpleTelephonyScheme](self->super.super.super._url, "dd_isAnySimpleTelephonyScheme");
  v68 = !v14 && objc_msgSend(v69, "count") != 0;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v87[0] = objc_opt_class();
  v87[1] = objc_opt_class();
  v87[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v79 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        if (objc_msgSend(v20, "isAvailable"))
        {
          -[CNContact phoneNumbers](self->super.super.super._contact, "phoneNumbers");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[DDPersonAction _appendActionsForPhoneNumbers:emailAddresses:class:filter:scheme:](self, "_appendActionsForPhoneNumbers:emailAddresses:class:filter:scheme:", v21, 0, v20, v67, CFSTR("tel"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v22, "count"))
          {
            objc_msgSend(v69, "insertObject:atIndex:", v22, v68);
            v68 = 1;
          }

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
    }
    while (v17);
  }

  -[NSURL scheme](self->super.super.super._url, "scheme");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lowercaseString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[DDAction isAvailable](DDSendMailAction, "isAvailable"))
  {
    -[CNContact emailAddresses](self->super.super.super._contact, "emailAddresses");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDPersonAction _appendActionsForPhoneNumbers:emailAddresses:class:filter:scheme:](self, "_appendActionsForPhoneNumbers:emailAddresses:class:filter:scheme:", 0, v25, objc_opt_class(), v65, CFSTR("mailto"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "count"))
    {
      if (v14 || !objc_msgSend(v24, "isEqualToString:", CFSTR("mailto")))
        objc_msgSend(v69, "addObject:", v26);
      else
        objc_msgSend(v69, "insertObject:atIndex:", v26, 0);
    }

  }
  if (!v14)
    v68 = objc_msgSend(v69, "count") != 0;
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v85[0] = objc_opt_class();
  v85[1] = objc_opt_class();
  v85[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
  v66 = v24;
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v75;
    if (v67)
      v31 = v67;
    else
      v31 = v65;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v75 != v30)
          objc_enumerationMutation(v27);
        v33 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
        if (objc_msgSend(v33, "isAvailable"))
        {
          -[CNContact phoneNumbers](self->super.super.super._contact, "phoneNumbers");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContact emailAddresses](self->super.super.super._contact, "emailAddresses");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[DDPersonAction _appendActionsForPhoneNumbers:emailAddresses:class:filter:scheme:](self, "_appendActionsForPhoneNumbers:emailAddresses:class:filter:scheme:", v34, v35, v33, v31, CFSTR("tel"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v36, "count"))
          {
            if (v66)
            {
              objc_msgSend(v33, "matchingScheme");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "isEqualToString:", v66);

            }
            else
            {
              v38 = 0;
            }
            objc_msgSend(v69, "insertObject:atIndex:", v36, (v38 ^ 1) & v68);
            v68 = 1;
          }

        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
    }
    while (v29);
  }

  if (v67)
  {
    -[DDAction url](self, "url");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[DDAction result](self, "result");
    -[DDAction context](self, "context");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[DDAction actionWithURL:result:context:](DDMoreCallActionsAction, "actionWithURL:result:context:", v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "callProviderActions");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v71;
      do
      {
        for (k = 0; k != v45; ++k)
        {
          if (*(_QWORD *)v71 != v46)
            objc_enumerationMutation(v43);
          v83 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * k);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "addObject:", v48);

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
      }
      while (v45);
    }

  }
  if (!*(&self->_fromCNContact + 4)
    && +[DDAddToAddressBookAction isAvailable](DDAddToAddressBookAction, "isAvailable"))
  {
    v49 = (void *)MEMORY[0x1E0C99DE8];
    -[DDAction url](self, "url");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[DDAction result](self, "result");
    -[DDAction context](self, "context");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[DDAction actionWithURL:result:context:](DDAddToAddressBookAction, "actionWithURL:result:context:", v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "arrayWithObject:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(&self->_fromCNContact + 5))
      objc_msgSend(v69, "insertObject:atIndex:", v54, 0);
    else
      objc_msgSend(v69, "addObject:", v54);

  }
  v55 = (void *)MEMORY[0x1E0C99DE8];
  -[DDAction url](self, "url");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = -[DDAction result](self, "result");
  -[DDAction context](self, "context");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "arrayWithObject:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "addObject:", v60);
  if (*(&self->_fromCNContact + 5))
  {
    -[DDAction context](self, "context");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    +[DDAction actionWithURL:result:context:](DDShareAction, "actionWithURL:result:context:", 0, 0, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      v82 = v62;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "addObject:", v63);

    }
  }

  return v69;
}

- (id)menuActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[DDAction url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!*(&self->_fromCNContact + 5))
    {
      v9 = 0;
      goto LABEL_10;
    }
    DDPersonActionsSupportedSchemes();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    v7 = 0;
    goto LABEL_7;
  }
  DDPersonActionsSupportedSchemes();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dd_phoneNumberFromValidSchemes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dd_emailFromValidSchemes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dd_userFriendlyEmail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_7:
    v8 = 0;
LABEL_8:
    -[DDPersonAction _menuActionsForPersonWithNumber:email:](self, "_menuActionsForPersonWithNumber:email:", v5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  -[DDPersonAction _menuActionsForBusinessWithNumber:](self, "_menuActionsForBusinessWithNumber:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!objc_msgSend(v8, "count"))
    goto LABEL_8;
LABEL_9:

LABEL_10:
  return v9;
}

- (CGSize)suggestedContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 414.0;
  v3 = 100.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)prefersActionMenuStyle
{
  return 1;
}

- (id)menuHeaderViewController
{
  double v2;
  UIViewController *menuHeaderViewController;
  UIViewController *v5;
  UIViewController *v6;

  menuHeaderViewController = self->_menuHeaderViewController;
  if (!menuHeaderViewController)
  {
    gotLoadHelper_x8__OBJC_CLASS___BCError(v2);
    objc_opt_class();
    -[BCSBusinessItem makeBrandedHeaderViewController](self->_bizItem, "makeBrandedHeaderViewController");
    v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    v6 = self->_menuHeaderViewController;
    self->_menuHeaderViewController = v5;

    menuHeaderViewController = self->_menuHeaderViewController;
  }
  return menuHeaderViewController;
}

- (BOOL)menuHasHeaderView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[DDAction url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    DDPersonActionsSupportedSchemes();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dd_phoneNumberFromValidSchemes:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (-[DDPersonAction phoneNumberIsBusiness:](self, "phoneNumberIsBusiness:", v5)
    && self->_bizItem
    && self->_bizItemIsMessageable)
  {
    if (dd_isDeviceLocked())
    {
      -[DDPersonAction menuHeaderViewController](self, "menuHeaderViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "_canShowWhileLocked");

    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)menuHeaderView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[DDAction url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    DDPersonActionsSupportedSchemes();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dd_phoneNumberFromValidSchemes:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (!-[DDPersonAction phoneNumberIsBusiness:](self, "phoneNumberIsBusiness:", v5))
    goto LABEL_11;
  if (!self->_bizItem)
    goto LABEL_11;
  if (!self->_bizItemIsMessageable)
    goto LABEL_11;
  if (dd_isDeviceLocked())
  {
    -[DDPersonAction menuHeaderViewController](self, "menuHeaderViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_canShowWhileLocked");

    if (!v7)
      goto LABEL_11;
  }
  -[DDPersonAction menuHeaderViewController](self, "menuHeaderViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "addSubview:", v9);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 3, 0, v9, 3, 1.0, -16.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 4, 0, v9, 4, 1.0, 16.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 1, 0, v9, 1, 1.0, -16.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 2, 0, v9, 2, 1.0, 16.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

  }
  else
  {
LABEL_11:
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuHeaderViewController, 0);
  objc_storeStrong((id *)&self->_lastBizNumberFetched, 0);
  objc_storeStrong((id *)&self->_bizItem, 0);
}

@end
