@implementation INSendMessageIntent(_CDInteractionAdditions)

- (uint64_t)cd_interactionMechanism
{
  return 4;
}

- (id)cd_groupName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "speakableGroupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "spokenPhrase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)cd_derivedIntentIdentifier
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "notificationThreadIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2
    || (v3 = (void *)v2,
        objc_msgSend(a1, "notificationThreadIdentifier"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v4,
        v3,
        !v5))
  {
    objc_msgSend(a1, "conversationIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(a1, "conversationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11)
      {
        NSStringFromSelector(sel_conversationIdentifier);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "conversationIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
    }
    objc_msgSend(a1, "speakableGroupName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "spokenPhrase");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(a1, "speakableGroupName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "spokenPhrase");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "length");

      if (v19)
      {
        NSStringFromSelector(sel_speakableGroupName);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "speakableGroupName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "spokenPhrase");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        _CDNormalizeString(v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

        goto LABEL_41;
      }
    }
    else
    {

    }
    objc_msgSend(a1, "recipients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(a1, "recipients");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v21, "count");

      if (v13)
      {
        NSStringFromSelector(sel_recipients);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "recipients");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v41 = objc_msgSend(&unk_1E272C028, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (v41)
        {
          v39 = v6;
          v40 = *(_QWORD *)v47;
LABEL_16:
          v22 = 0;
          while (1)
          {
            if (*(_QWORD *)v47 != v40)
              objc_enumerationMutation(&unk_1E272C028);
            v23 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v22);
            v42 = 0u;
            v43 = 0u;
            v44 = 0u;
            v45 = 0u;
            objc_msgSend(v12, "valueForKey:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v43;
LABEL_21:
              v28 = 0;
              while (1)
              {
                if (*(_QWORD *)v43 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v28);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v29, "length"))
                  break;
                _CDNormalizeString(v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "addObject:", v30);

                if (v26 == ++v28)
                {
                  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
                  if (v26)
                    goto LABEL_21;
                  break;
                }
              }
            }

            v31 = objc_msgSend(v20, "count");
            if (v31 == objc_msgSend(v12, "count"))
              break;
            objc_msgSend(v20, "removeAllObjects");
            if (++v22 == v41)
            {
              v41 = objc_msgSend(&unk_1E272C028, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
              if (v41)
                goto LABEL_16;
              goto LABEL_38;
            }
          }
          v32 = v23;
          if (v32)
          {
            v33 = v32;
            objc_msgSend(v20, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v34, "componentsJoinedByString:", CFSTR("-"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "stringWithFormat:", CFSTR("%@:%@"), v33, v36);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_39;
          }
LABEL_38:
          v13 = 0;
LABEL_39:
          v6 = v39;
        }
        else
        {
          v13 = 0;
        }
        goto LABEL_40;
      }
      v6 = 0;
    }
    else
    {
      v13 = 0;
    }
    v37 = 0;
    goto LABEL_44;
  }
  NSStringFromSelector(sel_notificationThreadIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notificationThreadIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v12 = v7;
  _CDNormalizeString(v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_41:

  v37 = 0;
  if (v13 && v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)"), v6, v13);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_44:

  return v37;
}

@end
