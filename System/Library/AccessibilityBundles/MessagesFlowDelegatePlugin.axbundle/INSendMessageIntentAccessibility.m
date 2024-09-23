@implementation INSendMessageIntentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("INSendMessageIntent");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setRecipients:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id v18;
  void *v19;
  id obj;
  uint64_t v21;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = (void *)objc_msgSend(v4, "mutableCopy");
  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend(v5, "isClarityBoardEnabled");

  if (v6)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v18 = v4;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v7)
    {
      v8 = v7;
      v21 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v10, "siriMatches", v18);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "count"))
          {
            v25 = 0u;
            v26 = 0u;
            v23 = 0u;
            v24 = 0u;
            v12 = v11;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v24;
              while (2)
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v24 != v15)
                    objc_enumerationMutation(v12);
                  objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "contactIdentifier");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v17, "length")
                    && -[INSendMessageIntentAccessibility _axIsRecipientSelectedInClarity:](self, "_axIsRecipientSelectedInClarity:", v17))
                  {

                    goto LABEL_19;
                  }

                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
                if (v14)
                  continue;
                break;
              }
            }

            objc_msgSend(v19, "removeObject:", v10);
          }
LABEL_19:

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v8);
    }

    v4 = v18;
  }
  v22.receiver = self;
  v22.super_class = (Class)INSendMessageIntentAccessibility;
  -[INSendMessageIntentAccessibility setRecipients:](&v22, sel_setRecipients_, v19, v18);

}

- (BOOL)_axIsRecipientSelectedInClarity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBAD20], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "contactProperty", (_QWORD)v14);
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v10, "contact");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v10) = objc_msgSend(v12, "isEqualToString:", v3);
        if ((v10 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

@end
