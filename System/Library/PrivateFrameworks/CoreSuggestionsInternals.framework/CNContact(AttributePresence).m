@implementation CNContact(AttributePresence)

- (uint64_t)hasPhoneNumber:()AttributePresence
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(a1, "isKeyAvailable:", *MEMORY[0x1E0C967C0]))
    goto LABEL_13;
  objc_msgSend(a1, "phoneNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    goto LABEL_16;
  if (!objc_msgSend(v4, "length"))
  {
LABEL_13:
    v6 = 0;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "phoneNumbers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isLikePhoneNumber:", v7);

        if ((v12 & 1) != 0)
        {
          v6 = 1;
          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_15:

LABEL_16:
  return v6;
}

- (uint64_t)hasEmailAddress:()AttributePresence
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(a1, "isKeyAvailable:", *MEMORY[0x1E0C966A8]))
  {
    v6 = 0;
    goto LABEL_14;
  }
  objc_msgSend(a1, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
LABEL_14:
    v7 = v4;
    goto LABEL_18;
  }
  SGNormalizeEmailAddress();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(a1, "emailAddresses", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          SGNormalizeEmailAddress();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v7, "isEqualToString:", v14);

          if ((v15 & 1) != 0)
          {
            v6 = 1;
            goto LABEL_16;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_16:

  }
  else
  {
    v6 = 0;
  }
LABEL_18:

  return v6;
}

- (uint64_t)hasPostalAddress:()AttributePresence
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "isKeyAvailable:", *MEMORY[0x1E0C967F0]) && objc_msgSend(v4, "length"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(a1, "postalAddresses", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      v9 = 1;
LABEL_5:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SGNormalizeCNAddress(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = SGPostalAddressesMatchWithParsed(v4, v12, 0, 0, 0, 0, 1);

        if ((v13 & 1) != 0)
          break;
        if (v7 == ++v10)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v7)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
