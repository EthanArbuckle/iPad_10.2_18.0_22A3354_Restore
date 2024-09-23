@implementation CKNicknameUpdate

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CKNicknameUpdate handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CKNicknameUpdate updateType](self, "updateType");
  -[CKNicknameUpdate nickname](self, "nickname");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNicknameUpdate contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Update for ID %@ is %lu nickname %@ contact %@"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  int v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CKNicknameUpdate handle](self, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      -[CKNicknameUpdate handle](self, "handle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(v5, "handle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v11 == 0;

      }
    }

    -[CKNicknameUpdate nickname](self, "nickname");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nickname");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    -[CKNicknameUpdate contact](self, "contact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqualToString:", v18) & 1) != 0)
    {
      v19 = 1;
    }
    else
    {
      v26 = v14;
      v20 = v8;
      -[CKNicknameUpdate contact](self, "contact");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v19 = 0;
      }
      else
      {
        objc_msgSend(v5, "contact");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v22 == 0;

      }
      v8 = v20;
      v14 = v26;
    }

    v23 = -[CKNicknameUpdate updateType](self, "updateType");
    v24 = objc_msgSend(v5, "updateType");
    v9 = (v8 & v14) == 1 && v23 == v24 && v19;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)listTitleText
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  void *v20;

  -[CKNicknameUpdate contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKNicknameUpdate contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NEW_CONTACT_INFORMATION"), &stru_1E276D870, CFSTR("ChatKit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    objc_msgSend(v10, "stringWithFormat:", v12, v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceLayoutDirection");

    if (v17 == 1)
      v18 = CFSTR("\u200F");
    else
      v18 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v6 = -[CKNicknameUpdate updateType](self, "updateType");
  v7 = -[CKNicknameUpdate updateType](self, "updateType");
  if ((v6 & 2) != 0 && (v7 & 4) != 0)
  {
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("THIS_PERSON_SHARED_A_NEW_PHOTO_AND_NAME"), &stru_1E276D870, CFSTR("ChatKit"));
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v13 = (void *)v9;

    goto LABEL_17;
  }
  if ((v6 & 2) != 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
    v15 = CFSTR("%@_SHARED_A_NEW_NAME");
LABEL_11:
    objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_1E276D870, CFSTR("ChatKit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v4;
    goto LABEL_12;
  }
  if ((v7 & 4) != 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
    v15 = CFSTR("%@_SHARED_A_NEW_PHOTO");
    goto LABEL_11;
  }
  v13 = 0;
LABEL_17:

  return v13;
}

- (id)listSubtitleText
{
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
  void *v13;
  uint64_t v14;
  __CFString *v15;

  v3 = (void *)MEMORY[0x1E0C97218];
  -[CKNicknameUpdate contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromContact:style:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKNicknameUpdate contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ((-[CKNicknameUpdate updateType](self, "updateType") & 2) != 0)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("NAME_CHANGED_FROM_%@_TO_%@"), &stru_1E276D870, CFSTR("ChatKit"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKNicknameUpdate _updatedName](self, "_updatedName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v10, v5, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "userInterfaceLayoutDirection");

      if (v14 == 1)
        v15 = CFSTR("\u200F");
      else
        v15 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    -[CKNicknameUpdate _updatedName](self, "_updatedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)condensedSubtitleText
{
  char v3;
  char v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v3 = -[CKNicknameUpdate updateType](self, "updateType");
  v4 = -[CKNicknameUpdate updateType](self, "updateType");
  if ((v3 & 2) != 0 && (v4 & 4) != 0)
  {
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("NEW_CONTACT_INFORMATION");
    v8 = CFSTR("ChatKit");
LABEL_10:
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E276D870, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  if ((v3 & 2) != 0)
  {
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("NEW_CONTACT_NAME");
LABEL_9:
    v8 = CFSTR("ChatKitPepper");
    goto LABEL_10;
  }
  if ((v4 & 4) != 0)
  {
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("NEW_CONTACT_PHOTO");
    goto LABEL_9;
  }
  v9 = 0;
  return v9;
}

- (id)contactWithUpdatedInformation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C97360]);
  -[CKNicknameUpdate nickname](self, "nickname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGivenName:", v5);

  -[CKNicknameUpdate nickname](self, "nickname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFamilyName:", v7);

  -[CKNicknameUpdate nickname](self, "nickname");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "avatar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v3, "setImageData:", v10);

  return v3;
}

- (id)_updatedName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C97218];
  -[CKNicknameUpdate contactWithUpdatedInformation](self, "contactWithUpdatedInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromContact:style:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (IMHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (IMNickname)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
  objc_storeStrong((id *)&self->_nickname, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (unint64_t)updateType
{
  return self->_updateType;
}

- (void)setUpdateType:(unint64_t)a3
{
  self->_updateType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
