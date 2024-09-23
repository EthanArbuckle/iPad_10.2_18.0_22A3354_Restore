@implementation MUIAddressListFormatter

uint64_t __76__MUIAddressListFormatter_stringFromEmailAddressList_preferFullDisplayName___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringValue");
}

uint64_t __76__MUIAddressListFormatter_stringFromEmailAddressList_preferFullDisplayName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringValue");
}

uint64_t __79__MUIAddressListFormatter__addressCommentForAddressList_preferFullDisplayName___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", a2, 0);
}

- (id)_attributedAddressCommentForAddressList:(id)a3 preferFullDisplayName:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v87;
  id v88;
  void *v89;
  MUIAddressListFormatter *v90;
  void *v91;
  id v92;
  id v93;
  _BOOL4 v94;
  void *v95;
  uint64_t v96;
  void *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v94 = a4;
  v108 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MUIAddressListFormatter listFormatter](self, "listFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MUIAddressListFormatter.m"), 166, CFSTR("A valid instance of MFLocalizationListFormatter is needed"));

  }
  -[MUIAddressListFormatter addressBookManager](self, "addressBookManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addressBook");

  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    v90 = self;
    -[MUIAddressListFormatter userProfileProvider](self, "userProfileProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allEmailAddresses");
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v6 = v6;
    v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v102, v107, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v103;
      v19 = 1;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v103 != v18)
            objc_enumerationMutation(v6);
          v21 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
          objc_msgSend(v21, "first");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "emailAddressValue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "simpleAddress");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            v26 = v24;
          }
          else
          {
            objc_msgSend(v22, "stringValue");
            v26 = (id)objc_claimAutoreleasedReturnValue();
          }
          v27 = v26;

          if (v19 & 1 | ((objc_msgSend(v97, "containsObject:", v27) & 1) == 0))
          {
            v28 = (void *)MEMORY[0x1E0D1EF38];
            objc_msgSend(v21, "second");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "pairWithFirst:second:", v22, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "addObject:", v30);

          }
          v19 = 0;
        }
        v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v102, v107, 16);
        v19 = 0;
      }
      while (v17);
    }

    v31 = v95;
    if (objc_msgSend(v95, "count"))
    {
      v32 = v95;

      v6 = v32;
    }
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v95, "lastObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "first");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "emailAddressValue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "simpleAddress");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v36)
      {
        v38 = v36;
      }
      else
      {
        objc_msgSend(v34, "stringValue");
        v38 = (id)objc_claimAutoreleasedReturnValue();
      }
      v79 = v38;

      v61 = v34;
      objc_msgSend(v61, "emailAddressValue");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "displayName");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v81;
      if (v81)
      {
        v83 = v81;
      }
      else
      {
        objc_msgSend(v61, "stringValue");
        v83 = (id)objc_claimAutoreleasedReturnValue();
      }
      v84 = v83;

      MFPreferredCompositeNameForAddressAndDisplayName();
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      v85 = (void *)MEMORY[0x1E0CB3498];
      objc_msgSend(v33, "second");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "ec_emailAttributedStringWithString:andEmailAddress:", v60, v66);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v93 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v92 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v91 = (void *)objc_opt_new();
      v98 = 0u;
      v99 = 0u;
      v100 = 0u;
      v101 = 0u;
      v88 = v6;
      v39 = v6;
      v96 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
      if (v96)
      {
        v40 = *(_QWORD *)v99;
        do
        {
          for (j = 0; j != v96; ++j)
          {
            if (*(_QWORD *)v99 != v40)
              objc_enumerationMutation(v39);
            v42 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
            objc_msgSend(v42, "first", v88);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "second");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v43;
            objc_msgSend(v45, "emailAddressValue");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "simpleAddress");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v47;
            if (v47)
            {
              v49 = v47;
            }
            else
            {
              objc_msgSend(v45, "stringValue");
              v49 = (id)objc_claimAutoreleasedReturnValue();
            }
            v50 = v49;

            v51 = v45;
            objc_msgSend(v51, "emailAddressValue");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "displayName");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = v53;
            if (v53)
            {
              v55 = v53;
            }
            else
            {
              objc_msgSend(v51, "stringValue");
              v55 = (id)objc_claimAutoreleasedReturnValue();
            }
            v56 = v55;

            if (v94)
            {
              v57 = v56;
            }
            else
            {
              MFPreferredAbbreviatedNameForAddressAndDisplayName();
              v57 = (id)objc_claimAutoreleasedReturnValue();
            }
            v58 = v57;
            if (v57)
            {
              objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v57, v44);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "addObject:", v59);

            }
          }
          v96 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
        }
        while (v96);
      }

      v33 = v93;
      v31 = v95;
      v60 = v91;
      v61 = v92;
      if (objc_msgSend(v93, "count") == 1)
      {
        objc_msgSend(v92, "allObjects");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "firstObject");
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v91, "objectForKeyedSubscript:", v63);
        v64 = objc_claimAutoreleasedReturnValue();
        v65 = (void *)v64;
        if (v63 && v64)
        {
          objc_msgSend(v93, "removeAllObjects");
          objc_msgSend(v93, "addObject:", v65);
        }

      }
      -[MUIAddressListFormatter listFormatter](v90, "listFormatter", v88);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "ef_map:", &__block_literal_global_38);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "attributedLocalizedStringFromList:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v89;
    }

  }
  else
  {
    objc_msgSend(v6, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "first");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "emailAddressValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "simpleAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v10, "stringValue");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v69 = v14;

    v70 = v10;
    objc_msgSend(v70, "emailAddressValue");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "displayName");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v72;
    if (v72)
    {
      v74 = v72;
    }
    else
    {
      objc_msgSend(v70, "stringValue");
      v74 = (id)objc_claimAutoreleasedReturnValue();
    }
    v75 = v74;

    MFPreferredCompositeNameForAddressAndDisplayName();
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = (void *)MEMORY[0x1E0CB3498];
    objc_msgSend(v9, "second");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "ec_emailAttributedStringWithString:andEmailAddress:", v76, v78);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v68;
}

id __78__MUIAddressListFormatter_stringFromAddressAddressList_preferFullDisplayName___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = v2;
  objc_msgSend(v3, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __89__MUIAddressListFormatter__attributedAddressCommentForAddressList_preferFullDisplayName___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3498];
  v3 = a2;
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "ec_emailAttributedStringWithString:andEmailAddress:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MUILocalizationListFormatter)listFormatter
{
  return self->_listFormatter;
}

- (MFAddressBookManager)addressBookManager
{
  return self->_addressBookManager;
}

- (EMUserProfileProvider)userProfileProvider
{
  return self->_userProfileProvider;
}

uint64_t __78__MUIAddressListFormatter_stringFromAddressAddressList_preferFullDisplayName___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addressCommentForAddressList:preferFullDisplayName:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __76__MUIAddressListFormatter_stringFromEmailAddressList_preferFullDisplayName___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ef_map:", &__block_literal_global_22);
}

- (id)stringFromAddressAddressList:(id)a3 preferFullDisplayName:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  BOOL v15;

  v4 = a4;
  objc_msgSend(a3, "ef_map:", &__block_literal_global_12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    v8 = !v4;
  else
    v8 = 1;
  if (!v8)
  {
    objc_msgSend(v7, "stringByAppendingString:", CFSTR(", prefersFullDisplayName"));
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  if (v7 && objc_msgSend(v7, "length"))
  {
    -[MUIAddressListFormatter commentCache](self, "commentCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __78__MUIAddressListFormatter_stringFromAddressAddressList_preferFullDisplayName___block_invoke_2;
    v13[3] = &unk_1E99E2508;
    v13[4] = self;
    v14 = v6;
    v15 = v4;
    objc_msgSend(v10, "objectForKey:generator:", v7, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)stringFromEmailAddressList:(id)a3 preferFullDisplayName:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  EFLazyCache *addressCache;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "ef_map:", &__block_literal_global_19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  addressCache = self->_addressCache;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__MUIAddressListFormatter_stringFromEmailAddressList_preferFullDisplayName___block_invoke_2;
  v16[3] = &unk_1E99E2590;
  v17 = v6;
  v10 = v6;
  -[EFLazyCache objectForKey:generator:](addressCache, "objectForKey:generator:", v8, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    -[MUIAddressListFormatter stringFromAddressAddressList:preferFullDisplayName:](self, "stringFromAddressAddressList:preferFullDisplayName:", v11, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (EFLazyCache)commentCache
{
  return self->_commentCache;
}

- (id)_addressCommentForAddressList:(id)a3 preferFullDisplayName:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  objc_msgSend(a3, "ef_map:", &__block_literal_global_30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIAddressListFormatter _attributedAddressCommentForAddressList:preferFullDisplayName:](self, "_attributedAddressCommentForAddressList:preferFullDisplayName:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (MUIAddressListFormatter)initWithUserProfileProvider:(id)a3 addressBookManager:(id)a4
{
  id v8;
  id v9;
  MUIAddressListFormatter *v10;
  MUIAddressListFormatter *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MUIAddressListFormatter.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userProfileProvider"));

  }
  v14.receiver = self;
  v14.super_class = (Class)MUIAddressListFormatter;
  v10 = -[MUIAddressListFormatter init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_userProfileProvider, a3);
    objc_storeStrong((id *)&v11->_addressBookManager, a4);
    -[MUIAddressListFormatter _commonInit](v11, "_commonInit");
    -[MFAddressBookManager addClient:](v11->_addressBookManager, "addClient:", v11);
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MUIAddressListFormatter addressBookManager](self, "addressBookManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeClient:", self);

  v4.receiver = self;
  v4.super_class = (Class)MUIAddressListFormatter;
  -[MUIAddressListFormatter dealloc](&v4, sel_dealloc);
}

- (void)_commonInit
{
  EFLazyCache *v3;
  EFLazyCache *commentCache;
  EFLazyCache *v5;
  EFLazyCache *addressCache;
  EFLazyCache *v7;
  EFLazyCache *attributedAddressCache;
  MUILocalizationListFormatter *v9;
  MUILocalizationListFormatter *listFormatter;

  v3 = (EFLazyCache *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EED8]), "initWithCountLimit:", 100);
  commentCache = self->_commentCache;
  self->_commentCache = v3;

  v5 = (EFLazyCache *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EED8]), "initWithCountLimit:", 100);
  addressCache = self->_addressCache;
  self->_addressCache = v5;

  v7 = (EFLazyCache *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EED8]), "initWithCountLimit:", 100);
  attributedAddressCache = self->_attributedAddressCache;
  self->_attributedAddressCache = v7;

  v9 = objc_alloc_init(MUILocalizationListFormatter);
  listFormatter = self->_listFormatter;
  self->_listFormatter = v9;

}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MUIAddressListFormatter stringFromAddressAddressList:](self, "stringFromAddressAddressList:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)stringFromAddressAddressList:(id)a3
{
  return -[MUIAddressListFormatter stringFromAddressAddressList:preferFullDisplayName:](self, "stringFromAddressAddressList:preferFullDisplayName:", a3, 0);
}

- (id)attributedStringFromEmailAddressList:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  objc_msgSend(a3, "ef_map:", &__block_literal_global_25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MUIAddressListFormatter attributedAddressCache](self, "attributedAddressCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__MUIAddressListFormatter_attributedStringFromEmailAddressList___block_invoke_2;
    v8[3] = &unk_1E99E25F8;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v5, "objectForKey:generator:", v9, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __64__MUIAddressListFormatter_attributedStringFromEmailAddressList___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = v2;
  objc_msgSend(v3, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __64__MUIAddressListFormatter_attributedStringFromEmailAddressList___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_attributedAddressCommentForAddressList:preferFullDisplayName:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_invalidateCache
{
  id v3;

  -[EFLazyCache removeAllObjects](self->_commentCache, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MFAddressListsFormatterDidInvalidateCache"), self);

}

- (void)setCommentCache:(id)a3
{
  objc_storeStrong((id *)&self->_commentCache, a3);
}

- (EFLazyCache)addressCache
{
  return self->_addressCache;
}

- (void)setAddressCache:(id)a3
{
  objc_storeStrong((id *)&self->_addressCache, a3);
}

- (EFLazyCache)attributedAddressCache
{
  return self->_attributedAddressCache;
}

- (void)setAttributedAddressCache:(id)a3
{
  objc_storeStrong((id *)&self->_attributedAddressCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedAddressCache, 0);
  objc_storeStrong((id *)&self->_addressCache, 0);
  objc_storeStrong((id *)&self->_commentCache, 0);
  objc_storeStrong((id *)&self->_listFormatter, 0);
  objc_storeStrong((id *)&self->_addressBookManager, 0);
  objc_storeStrong((id *)&self->_userProfileProvider, 0);
}

@end
