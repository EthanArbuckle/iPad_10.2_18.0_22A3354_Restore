@implementation CNUIContactStoreLinkedContactSaveExecutor

- (id)executeSaveWithConfiguration:(id)a3 saveDelegate:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CNUIContactSaveResult *v15;
  uint8_t buf[4];
  CNUIContactStoreLinkedContactSaveExecutor *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  CNUILogContactCard();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v18 = self;
    _os_log_impl(&dword_18AC56000, v6, OS_LOG_TYPE_DEFAULT, "[CNUIContactStoreLinkedContactSaveExecutor] %{public}p will execute save…", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutableContact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editingLinkedContacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "ignoresParentalRestrictions");
  v13 = objc_msgSend(v5, "saveWasAuthorized");

  -[CNUIContactStoreLinkedContactSaveExecutor saveLinkedContactChanges:mutableContact:contactStore:editingLinkedContacts:ignoresParentalRestrictions:saveWasAuthorized:issuedSaveRequestIdentifiers:](self, "saveLinkedContactChanges:mutableContact:contactStore:editingLinkedContacts:ignoresParentalRestrictions:saveWasAuthorized:issuedSaveRequestIdentifiers:", v8, v9, v10, v11, v12, v13, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[CNUIContactSaveResult initWithSuccess:contact:identifiersOfIssuedSaveRequests:]([CNUIContactSaveResult alloc], "initWithSuccess:contact:identifiersOfIssuedSaveRequests:", v14 != 0, v14, v7);
  return v15;
}

- (id)saveLinkedContactChanges:(id)a3 mutableContact:(id)a4 contactStore:(id)a5 editingLinkedContacts:(id)a6 ignoresParentalRestrictions:(BOOL)a7 saveWasAuthorized:(BOOL)a8 issuedSaveRequestIdentifiers:(id)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  char v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  void *v66;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v9 = a8;
  v10 = a7;
  v97 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a9;
  v19 = v18;
  if (v17)
  {
    v72 = v16;
    v73 = v18;
    objc_msgSend(v14, "mainStoreLinkedContacts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v14, "mainStoreLinkedContacts");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setWithArray:", v22);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v75 = 0;
    }
    objc_msgSend(v14, "linkedContacts");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v72;
    v71 = v14;
    if (v24)
    {
      v25 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v14, "linkedContacts");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setWithArray:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v75, "count"))
        objc_msgSend(v27, "minusSet:", v75);
    }
    else
    {
      v27 = 0;
    }
    v19 = v73;
    v28 = v17;
    v74 = v28;
    if (objc_msgSend(v27, "count"))
    {
      objc_msgSend(v27, "allObjects");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "arrayByAddingObjectsFromArray:", v29);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v70 = v27;
    v30 = objc_alloc_init(MEMORY[0x1E0C973D0]);
    objc_msgSend(v30, "setIgnoresGuardianRestrictions:", v10 | v9);
    objc_msgSend(v30, "saveRequestIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addObject:", v31);

    v32 = objc_msgSend(v75, "count");
    v33 = objc_msgSend(v28, "count");
    if (v32 <= 1 && v33 < 2)
    {
      v23 = 0;
      v14 = v71;
LABEL_57:

      goto LABEL_58;
    }
    v68 = v17;
    if (v32 < 2 || v33 > 1)
    {
      if (v32 > 1 || v33 < 2)
      {
        objc_msgSend(v71, "mainStoreLinkedContacts", v17, v27);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v28, "isEqualToArray:", v51);

        if ((v52 & 1) != 0)
        {
          v23 = 0;
          v14 = v71;
          v17 = v68;
          goto LABEL_57;
        }
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v53 = v28;
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
        v55 = v75;
        if (v54)
        {
          v56 = v54;
          v57 = *(_QWORD *)v82;
          do
          {
            for (i = 0; i != v56; ++i)
            {
              if (*(_QWORD *)v82 != v57)
                objc_enumerationMutation(v53);
              v59 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
              if ((objc_msgSend(v55, "containsObject:", v59) & 1) == 0)
              {
                v60 = (void *)objc_msgSend(v59, "mutableCopy");
                objc_msgSend(v30, "linkContact:toContact:", v15, v60);

                v55 = v75;
              }
              objc_msgSend(v55, "removeObject:", v59);
            }
            v56 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
          }
          while (v56);
        }

        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v61 = v55;
        v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
        v14 = v71;
        if (v62)
        {
          v63 = v62;
          v64 = *(_QWORD *)v78;
          do
          {
            for (j = 0; j != v63; ++j)
            {
              if (*(_QWORD *)v78 != v64)
                objc_enumerationMutation(v61);
              v66 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * j), "mutableCopy");
              objc_msgSend(v30, "unlinkContact:", v66);

            }
            v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
          }
          while (v63);
        }

        objc_msgSend(MEMORY[0x1E0C97200], "unifyContacts:", v74);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v41 = v28;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v86;
          do
          {
            for (k = 0; k != v43; ++k)
            {
              if (*(_QWORD *)v86 != v44)
                objc_enumerationMutation(v41);
              v46 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * k);
              objc_msgSend(v15, "identifier", v68, v70);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "identifier");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = objc_msgSend(v47, "isEqualToString:", v48);

              if ((v49 & 1) == 0)
              {
                v50 = (void *)objc_msgSend(v46, "mutableCopy");
                objc_msgSend(v30, "linkContact:toContact:", v15, v50);

              }
            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
          }
          while (v43);
        }

        objc_msgSend(MEMORY[0x1E0C97200], "unifyContacts:", v74);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v71;
        v16 = v72;
      }
    }
    else
    {
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v34 = v75;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v90;
        do
        {
          for (m = 0; m != v36; ++m)
          {
            if (*(_QWORD *)v90 != v37)
              objc_enumerationMutation(v34);
            v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * m), "mutableCopy", v68, v70);
            objc_msgSend(v30, "unlinkContact:", v39);

          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
        }
        while (v36);
      }

      objc_msgSend(v28, "firstObject");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v71;
    }
    v23 = (void *)objc_msgSend(v40, "mutableCopy", v68);

    v76 = 0;
    objc_msgSend(v16, "executeSaveRequest:error:", v30, &v76);
    v17 = v69;
    v19 = v73;
    goto LABEL_57;
  }
  v23 = 0;
LABEL_58:

  return v23;
}

@end
