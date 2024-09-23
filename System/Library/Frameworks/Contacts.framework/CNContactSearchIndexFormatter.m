@implementation CNContactSearchIndexFormatter

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactSearchIndexFormatter stringFromContact:](self, "stringFromContact:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)stringFromContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[CN allContactProperties](CN, "allContactProperties", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "stringForIndexingForContact:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v5, "appendString:", v11);
          objc_msgSend(v5, "appendString:", CFSTR(" "));
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[CNContactSearchIndexFormatter auxiliaryIndexStringForContact:](self, "auxiliaryIndexStringForContact:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v5, "appendString:", v12);

  return v5;
}

- (id)auxiliaryIndexStringForContact:(id)a3
{
  void *v3;
  void *v4;

  -[CNContactSearchIndexFormatter nameExpansionsForContact:](self, "nameExpansionsForContact:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)nameExpansionsForContact:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  int v22;
  unsigned int v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v7 = a3;
  objc_msgSend(v7, "familyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "familyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CNStringContainsKoreanCharacters();

    if ((v10 & 1) != 0)
      goto LABEL_11;
  }
  objc_msgSend(v7, "givenName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v7, "givenName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CNStringContainsKoreanCharacters();

    if ((v13 & 1) != 0)
      goto LABEL_11;
  }
  objc_msgSend(v7, "middleName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v7, "middleName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CNStringContainsKoreanCharacters();

    if ((v16 & 1) != 0)
      goto LABEL_11;
  }
  objc_msgSend(v7, "nameSuffix");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v7, "nameSuffix");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = CNStringContainsKoreanCharacters();

    if ((v19 & 1) != 0)
      goto LABEL_11;
  }
  objc_msgSend(v7, "namePrefix");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v7, "namePrefix");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = CNStringContainsKoreanCharacters();

    if (v22)
    {
LABEL_11:
      v23 = 0;
      v20 = 0;
      while (1)
      {
        if (v23 <= 0x10 && ((1 << v23) & 0x10116) != 0)
          goto LABEL_14;
        if ((v23 & 1) != 0)
        {
          objc_msgSend(v7, "namePrefix");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v6)
          {
LABEL_31:

            goto LABEL_14;
          }
        }
        if ((v23 & 2) != 0)
        {
          objc_msgSend(v7, "givenName");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v5)
          {
            if ((v23 & 1) != 0)
              goto LABEL_31;
            goto LABEL_14;
          }
        }
        if ((v23 & 4) != 0)
        {
          objc_msgSend(v7, "middleName");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v3)
          {
            v24 = 1;
LABEL_35:

            goto LABEL_36;
          }
        }
        if ((v23 & 8) == 0)
          break;
        objc_msgSend(v7, "familyName");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          if ((v23 & 0x10) == 0)
          {
            v24 = 0;
LABEL_29:

            goto LABEL_34;
          }
LABEL_28:
          objc_msgSend(v7, "nameSuffix");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v25 == 0;

          if ((v23 & 8) == 0)
            goto LABEL_34;
          goto LABEL_29;
        }
        v24 = 1;
LABEL_34:
        if ((v23 & 4) != 0)
          goto LABEL_35;
LABEL_36:
        if ((v23 & 2) != 0)
        {

          if ((v23 & 1) == 0)
          {
LABEL_38:
            if (!v24)
              goto LABEL_42;
            goto LABEL_14;
          }
        }
        else if ((v23 & 1) == 0)
        {
          goto LABEL_38;
        }

        if (!v24)
        {
LABEL_42:
          if (v20)
          {
            if ((v23 & 1) == 0)
              goto LABEL_44;
LABEL_51:
            objc_msgSend(v7, "namePrefix");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "appendString:", v27);

            if ((v23 & 8) != 0)
              goto LABEL_52;
LABEL_45:
            if ((v23 & 4) == 0)
              goto LABEL_46;
LABEL_53:
            objc_msgSend(v7, "middleName");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "appendString:", v29);

            if ((v23 & 2) != 0)
              goto LABEL_54;
LABEL_47:
            if ((v23 & 0x10) != 0)
              goto LABEL_48;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37A0], "string");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v23 & 1) != 0)
              goto LABEL_51;
LABEL_44:
            if ((v23 & 8) == 0)
              goto LABEL_45;
LABEL_52:
            objc_msgSend(v7, "familyName");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "appendString:", v28);

            if ((v23 & 4) != 0)
              goto LABEL_53;
LABEL_46:
            if ((v23 & 2) == 0)
              goto LABEL_47;
LABEL_54:
            objc_msgSend(v7, "givenName");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "appendString:", v30);

            if ((v23 & 0x10) != 0)
            {
LABEL_48:
              objc_msgSend(v7, "nameSuffix");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "appendString:", v26);

            }
          }
          objc_msgSend(v20, "appendString:", CFSTR(" "));
        }
LABEL_14:
        if (++v23 == 32)
          goto LABEL_57;
      }
      if ((v23 & 0x10) == 0)
      {
        v24 = 0;
        goto LABEL_34;
      }
      goto LABEL_28;
    }
    v20 = 0;
  }
LABEL_57:

  return v20;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  NSLog(CFSTR("Parsing a string into a contact is not supported."), a2, a3, a4, a5);
  return 0;
}

@end
