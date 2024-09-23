@implementation DDCopyAction

- (DDCopyAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  DDCopyAction *v5;
  DDCopyAction *v6;
  uint64_t v7;
  uint64_t v8;
  NSURL *url;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DDCopyAction;
  v5 = -[DDAction initWithURL:result:context:](&v11, sel_initWithURL_result_context_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v7 = (uint64_t)v5->super._result;
    if (v7)
    {
      if (!v6->super._url)
      {
        _DDURLFromResult(v7);
        v8 = objc_claimAutoreleasedReturnValue();
        url = v6->super._url;
        v6->super._url = (NSURL *)v8;

      }
    }
  }
  return v6;
}

+ (BOOL)actionAvailableForContact:(id)a3
{
  void *v3;
  BOOL v4;

  DDDefaultAddressForContact(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)localizedName
{
  int Category;
  int v4;
  void *MatchedString;
  NSURL *url;
  void *v7;
  void *v8;
  _BOOL4 v9;
  NSURL *v10;
  void *v11;
  void *v12;
  char v13;
  int v14;
  CNContact *contact;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  __CFString *v22;
  uint64_t v24;

  if (!self->super._result)
  {
    url = self->super._url;
    if (!url)
    {
      contact = self->super._contact;
      if (contact)
      {
        DDDefaultAddressForContact(contact);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          DDDefaultAddressForContact(self->super._contact);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
LABEL_48:
            v22 = CFSTR("Copy Address");
            goto LABEL_49;
          }
        }
      }
      goto LABEL_38;
    }
    -[NSURL scheme](url, "scheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[NSURL dd_isAnySimpleTelephonyScheme](self->super._url, "dd_isAnySimpleTelephonyScheme");
    v10 = self->super._url;
    if (!v9)
    {
      if (-[NSURL dd_isMaps:](v10, "dd_isMaps:", 1)
        && (DDMapAddressFromURL(self->super._url),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v18,
            v18))
      {
        v13 = 0;
        v4 = 3;
        v14 = 1;
      }
      else
      {
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("mailto")) & 1) != 0)
        {
          v14 = 0;
          v13 = 1;
        }
        else
        {
          if ((objc_msgSend(v8, "isEqualToString:", CFSTR("http")) & 1) == 0)
            objc_msgSend(v8, "isEqualToString:", CFSTR("https"));
          v14 = 0;
          v13 = 0;
        }
        v4 = 1;
      }
      goto LABEL_34;
    }
    v24 = 0;
    -[NSURL dd_phoneNumberFromTelSchemeAndExtractBody:serviceID:suggestions:](v10, "dd_phoneNumberFromTelSchemeAndExtractBody:serviceID:suggestions:", 0, &v24, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v24)
    {
      v13 = 0;
    }
    else
    {
      if (objc_msgSend(v11, "length") && !objc_msgSend(v12, "isEqualToString:", CFSTR("open")))
      {
        v13 = 0;
        v4 = 2;
        goto LABEL_29;
      }
      v13 = objc_msgSend(v12, "containsString:", CFSTR("@"));
    }
    v4 = 1;
LABEL_29:

    v14 = 0;
LABEL_34:

LABEL_35:
    switch(v4)
    {
      case 1:
        if ((v13 & 1) != 0)
          goto LABEL_37;
        goto LABEL_47;
      case 2:
        goto LABEL_43;
      case 3:
        if (!v14)
          goto LABEL_48;
        v22 = CFSTR("Copy Location");
        break;
      case 4:
        v22 = CFSTR("Copy Event");
        break;
      default:
        goto LABEL_38;
    }
    goto LABEL_49;
  }
  Category = DDResultGetCategory();
  if (Category == 2)
    goto LABEL_38;
  v4 = Category;
  if (Category != 1)
  {
    v14 = 0;
    v13 = 0;
    goto LABEL_35;
  }
  if ((DDResultHasType() & 1) != 0)
  {
    MatchedString = (void *)DDResultGetMatchedString();
    if ((dd_handleIsChatBot(MatchedString) & 1) != 0)
    {
LABEL_38:
      if (DDResultHasType())
      {
        v22 = CFSTR("Copy Code");
      }
      else if (DDResultHasType())
      {
        v22 = CFSTR("Copy Flight Code");
      }
      else
      {
        v22 = CFSTR("Copy");
      }
      goto LABEL_49;
    }
LABEL_37:
    v22 = CFSTR("Copy Email");
    goto LABEL_49;
  }
  -[NSURL scheme](self->super._url, "scheme");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lowercaseString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("mailto"));

  if ((v21 & 1) != 0)
    goto LABEL_37;
  if (-[NSURL dd_isAnySimpleTelephonyScheme](self->super._url, "dd_isAnySimpleTelephonyScheme")
    && !+[DDTextMessageAction isShowMessageURL:](DDTextMessageAction, "isShowMessageURL:", self->super._url))
  {
LABEL_43:
    v22 = CFSTR("Copy Phone Number");
  }
  else
  {
LABEL_47:
    v22 = CFSTR("Copy Link");
  }
LABEL_49:
  DDLocalizedString(v22);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)iconName
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  NSURL *url;
  void *v10;
  void *v11;
  void *v13;

  if (self->super._result && DDResultGetCategory() == 1)
  {
    if ((DDResultHasType() & 1) == 0)
    {
      -[NSURL scheme](self->super._url, "scheme");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lowercaseString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("mailto"));

      if ((v5 & 1) == 0 && !-[NSURL dd_isAnySimpleTelephonyScheme](self->super._url, "dd_isAnySimpleTelephonyScheme"))
      {
        -[NSURL scheme](self->super._url, "scheme");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lowercaseString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("upi"));

        if ((v8 & 1) == 0)
          return CFSTR("link");
      }
    }
    return CFSTR("doc.on.doc");
  }
  url = self->super._url;
  if (!url)
    return CFSTR("doc.on.doc");
  -[NSURL scheme](url, "scheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lowercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("http")) & 1) == 0
    && !objc_msgSend(v11, "isEqualToString:", CFSTR("https"))
    || (objc_msgSend(v11, "isEqualToString:", CFSTR("mailto")) & 1) != 0
    || -[NSURL dd_isAnySimpleTelephonyScheme](self->super._url, "dd_isAnySimpleTelephonyScheme"))
  {

    return CFSTR("doc.on.doc");
  }
  if (-[NSURL dd_isMaps:](self->super._url, "dd_isMaps:", 1))
  {
    DDMapAddressFromURL(self->super._url);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      return CFSTR("doc.on.doc");
  }
  else
  {

  }
  return CFSTR("link");
}

- (void)_copyURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int64_t dataOwner;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_16;
  objc_msgSend(v4, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("mailto")))
  {
    objc_msgSend(v5, "dd_emailFromMailtoScheme");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("tel")))
  {
    objc_msgSend(v5, "dd_phoneNumberFromTelScheme");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v5, "dd_isMaps:", 1))
    {
LABEL_9:
      objc_msgSend(v5, "_web_userVisibleString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    DDMapAddressFromURL(v5);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  if (!v8)
    goto LABEL_9;
LABEL_10:
  if (objc_msgSend(v9, "length"))
  {
    v10 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v9, v11, v5, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc(MEMORY[0x1E0CB3498]);
    v33 = *MEMORY[0x1E0CEA0C0];
    v34[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithString:attributes:", v9, v15);

    v17 = objc_msgSend(v16, "length");
    v31 = *MEMORY[0x1E0CEA088];
    v32 = *MEMORY[0x1E0CEA0E8];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataFromRange:documentAttributes:error:", 0, v17, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v19, v20);

    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = (void *)MEMORY[0x1E0C99D20];
    v23 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v5, v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "arrayWithObject:", v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  dataOwner = self->_dataOwner;
  v27 = (void *)MEMORY[0x1E0CEA810];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __25__DDCopyAction__copyURL___block_invoke;
  v29[3] = &unk_1E42580C8;
  v30 = v21;
  v28 = v21;
  objc_msgSend(v27, "_performAsDataOwner:block:", dataOwner, v29);

LABEL_16:
}

void __25__DDCopyAction__copyURL___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setItems:", *(_QWORD *)(a1 + 32));

}

- (void)copyStringOnly:(id)a3
{
  id v4;
  int64_t dataOwner;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  dataOwner = self->_dataOwner;
  v6 = (void *)MEMORY[0x1E0CEA810];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__DDCopyAction_copyStringOnly___block_invoke;
  v8[3] = &unk_1E42580C8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "_performAsDataOwner:block:", dataOwner, v8);

}

void __31__DDCopyAction_copyStringOnly___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v7 = v2;
    v8 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v5);

}

- (void)performFromView:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  const void *v7;
  NSURL *url;
  void *v9;
  id v10;
  void *v11;
  NSURL *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CNContact *contact;
  void *v19;
  void *v20;
  int Category;
  int v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;

  if (self->_query)
  {
    objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard", a3);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setString:", self->_query);

    return;
  }
  self->_dataOwner = objc_msgSend(a3, "_dataOwnerForCopy");
  -[NSURL scheme](self->super._url, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  DDUIRecordOtherActionInSheetForResultIfNeeded((uint64_t)self->super._result);
  if (-[NSURL dd_isAnySimpleTelephonyScheme](self->super._url, "dd_isAnySimpleTelephonyScheme"))
  {
    v34 = 0;
    if (self->super._result)
      DDResultCopyPhoneValue();
    url = self->super._url;
    v33 = 0;
    -[NSURL dd_phoneNumberFromTelSchemeAndExtractBody:serviceID:suggestions:](url, "dd_phoneNumberFromTelSchemeAndExtractBody:serviceID:suggestions:", 0, &v33, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v33;
    if (v10 || !objc_msgSend(v9, "length") || (objc_msgSend(v9, "isEqualToString:", CFSTR("open")) & 1) != 0)
      -[DDCopyAction _copyURL:](self, "_copyURL:", self->super._url);
    else
      -[DDCopyAction copyStringOnly:](self, "copyStringOnly:", v9);

    goto LABEL_19;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("upi")))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("mailto")))
    {
      v34 = 0;
      if (self->super._result)
        DDResultCopyMailValue();
      goto LABEL_27;
    }
    if (-[NSURL dd_isMaps:](self->super._url, "dd_isMaps:", 1))
    {
      if (!self->super._result || DDResultGetCategory() != 3)
        goto LABEL_27;
      goto LABEL_23;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("http")) & 1) != 0
      || objc_msgSend(v5, "isEqualToString:", CFSTR("https")))
    {
      goto LABEL_27;
    }
    if (self->super._result)
    {
      v13 = DDResultCopyAuthCode();
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = v14;
      }
      else
      {
        Category = DDResultGetCategory();
        if (Category == 3)
        {
LABEL_23:
          objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
          v10 = (id)objc_claimAutoreleasedReturnValue();
          DDResultGetMatchedString();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setString:", v11);
LABEL_24:

LABEL_19:
          goto LABEL_29;
        }
        v22 = Category;
        if ((Category & 0xFFFFFFFE) != 4)
        {
          if (Category == 1)
          {
            _DDURLFromResult((uint64_t)self->super._result);
            v10 = (id)objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setURL:", v10);
            }
            else
            {
              DDResultGetMatchedString();
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setString:", v11);

            }
            goto LABEL_24;
          }
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            -[DDCopyAction performFromView:].cold.2(v22);
        }
        DDResultGetMatchedString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v15;
        v17 = v16;
      }
      objc_msgSend(v15, "setString:", v17);
    }
    else
    {
      contact = self->super._contact;
      if (!contact
        || (DDDefaultAddressForContact(contact),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v19,
            !v19))
      {
        v12 = self->super._url;
        if (!v12)
        {
          v23 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v23)
            -[DDCopyAction performFromView:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
          goto LABEL_29;
        }
        goto LABEL_28;
      }
      DDDefaultAddressForContact(self->super._contact);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
LABEL_35:

        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v16, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setString:", v20);

    }
    goto LABEL_35;
  }
  if (!self->super._result || (v6 = DDResultCopyUPIIdentifierValue()) == 0)
  {
LABEL_27:
    v12 = self->super._url;
LABEL_28:
    -[DDCopyAction _copyURL:](self, "_copyURL:", v12);
    goto LABEL_29;
  }
  v7 = (const void *)v6;
  -[DDCopyAction copyStringOnly:](self, "copyStringOnly:", v6);
  CFRelease(v7);
LABEL_29:

}

- (BOOL)canBePerformedWhenDeviceIsLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
}

- (DDCopyAction)initWithQueryString:(id)a3 range:(_NSRange)a4 context:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  NSString *v10;
  NSString *query;
  DDCopyAction *v12;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  objc_msgSend(a3, "substringWithRange:", location, length);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  query = self->_query;
  self->_query = v10;

  v12 = -[DDCopyAction initWithURL:result:context:](self, "initWithURL:result:context:", 0, 0, v9);
  return v12;
}

- (void)performFromView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "No result, and no known scheme", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)performFromView:(int)a1 .cold.2(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_debug_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Unknown category %x", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_1_0();
}

@end
