@implementation CNAssistantCommandSearchPerson

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CNContactStore)contactStore
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  CNContactStore *v5;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x24BDBACF8]);
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (void)performWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = (void (**)(id, void *))a3;
  objc_msgSend_validate(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend_perform(self, v8, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v7;
  objc_msgSend_dictionary(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v10);

}

- (id)validate
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  char isEqualToString;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  id v25;
  const char *v26;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  int v34;
  int v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  int v48;
  id v49;
  const char *v50;
  void *v51;
  const char *v52;
  int v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  const char *v60;
  int v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  id v69;
  const char *v70;
  id v71;
  const char *v72;
  void *v73;
  id v74;
  const char *v75;

  objc_msgSend_scope(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE81A08];
  if (objc_msgSend_isEqualToString_(v4, v6, *MEMORY[0x24BE81A08]))
  {

  }
  else
  {
    objc_msgSend_scope(self, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v11, v12, *MEMORY[0x24BE81A10]);

    if ((isEqualToString & 1) == 0)
    {
      v25 = objc_alloc(MEMORY[0x24BE811A8]);
      v19 = (void *)objc_msgSend_initWithReason_(v25, v26, (uint64_t)CFSTR("Expected scope to be local or remote"));
      return v19;
    }
  }
  objc_msgSend_birthday(self, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v17 = objc_alloc(MEMORY[0x24BE811A8]);
    v19 = (void *)objc_msgSend_initWithReason_(v17, v18, (uint64_t)CFSTR("Birthday not supported"));
  }
  else
  {
    objc_msgSend_relationship(self, v15, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v23 = objc_alloc(MEMORY[0x24BE811A8]);
      v19 = (void *)objc_msgSend_initWithReason_(v23, v24, (uint64_t)CFSTR("Relationship not supported"));
    }
    else
    {
      objc_msgSend_me(self, v21, v22);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_name(self, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
        v34 = 2;
      else
        v34 = 1;
      if (v31)
        v35 = v34;
      else
        v35 = v28 != 0;
      objc_msgSend_email(self, v32, v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
        ++v35;
      objc_msgSend_phone(self, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
        ++v35;
      objc_msgSend_company(self, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
        ++v35;
      objc_msgSend_address(self, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
        v48 = v35 + 1;
      else
        v48 = v35;
      if (v48 == 1)
      {
        objc_msgSend_scope(self, v46, v47);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend_isEqualToString_(v51, v52, v5);

        if (v53
          && (objc_msgSend_accountIdentifier(self, v54, v55), (v56 = objc_claimAutoreleasedReturnValue()) != 0)
          && (v57 = (void *)v56,
              objc_msgSend_name(self, v54, v55),
              v58 = (void *)objc_claimAutoreleasedReturnValue(),
              v58,
              v57,
              !v58))
        {
          v71 = objc_alloc(MEMORY[0x24BE811A8]);
          v19 = (void *)objc_msgSend_initWithReason_(v71, v72, (uint64_t)CFSTR("Only support local search with an accountIdentifier for name"));
        }
        else
        {
          objc_msgSend_scope(self, v54, v55);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend_isEqualToString_(v59, v60, *MEMORY[0x24BE81A10]);

          if (v61)
          {
            objc_msgSend_name(self, v62, v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            if (v64 || (objc_msgSend_email(self, v65, v66), (v64 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {

            }
            else
            {
              objc_msgSend_company(self, v67, v68);
              v73 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v73)
              {
                v74 = objc_alloc(MEMORY[0x24BE811A8]);
                v19 = (void *)objc_msgSend_initWithReason_(v74, v75, (uint64_t)CFSTR("Only support remote search for name, email or company"));
                return v19;
              }
            }
          }
          v19 = 0;
        }
      }
      else if (v48)
      {
        v69 = objc_alloc(MEMORY[0x24BE811A8]);
        v19 = (void *)objc_msgSend_initWithReason_(v69, v70, (uint64_t)CFSTR("Only support single parameter searching (me, name, email, phone, company or address)"));
      }
      else
      {
        v49 = objc_alloc(MEMORY[0x24BE811A8]);
        v19 = (void *)objc_msgSend_initWithReason_(v49, v50, (uint64_t)CFSTR("No search parameter specified (me, name, email, phone, company or address)"));
      }
    }
  }
  return v19;
}

- (id)perform
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  const char *v17;
  int isEqualToString;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  int v24;
  const char *v25;
  id v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  id v31;
  const char *v32;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_me(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v4, v5, v6);

  if (v7)
  {
    v36 = 0;
    objc_msgSend_meContact_(self, v8, (uint64_t)&v36);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v36;
    v14 = v11;
    if (v10)
    {
      v37[0] = v10;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v12, (uint64_t)v37, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend_code(v11, v12, v13) == 200)
      {

        v14 = 0;
      }
      v15 = (void *)MEMORY[0x24BDBD1A8];
    }

    if (v14)
      goto LABEL_14;
LABEL_16:
    v31 = objc_alloc(MEMORY[0x24BE810A0]);
    v30 = (void *)objc_msgSend_initWithResults_(v31, v32, (uint64_t)v15);
    goto LABEL_17;
  }
  objc_msgSend_scope(self, v8, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v16, v17, *MEMORY[0x24BE81A08]);

  if (isEqualToString)
  {
    v35 = 0;
    objc_msgSend_searchLocal_(self, v19, (uint64_t)&v35);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v35;
  }
  else
  {
    objc_msgSend_scope(self, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_isEqualToString_(v22, v23, *MEMORY[0x24BE81A10]);

    if (!v24)
    {
      v15 = (void *)MEMORY[0x24BDBD1A8];
      goto LABEL_16;
    }
    v34 = 0;
    objc_msgSend_searchRemote_(self, v25, (uint64_t)&v34);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v34;
  }
  v14 = v21;
  if (!v14)
    goto LABEL_16;
LABEL_14:
  v26 = objc_alloc(MEMORY[0x24BE811A8]);
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v27, (uint64_t)CFSTR("Search error: %@"), v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend_initWithReason_(v26, v29, (uint64_t)v28);

LABEL_17:
  return v30;
}

- (id)meContact:(id *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  void *v11;

  objc_msgSend_contactStore(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptorsForRequiredKeys(MEMORY[0x24BE19118], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__crossPlatformUnifiedMeContactWithKeysToFetch_error_(v4, v8, (uint64_t)v7, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (*a3)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend_personFromContact_(MEMORY[0x24BE19118], v9, (uint64_t)v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)searchByName:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  const char *v32;

  objc_msgSend_name(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend_contactStore(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_descriptorsForRequiredKeys(MEMORY[0x24BE19118], v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDBACA0];
    objc_msgSend_name(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_predicateForContactsMatchingName_options_(v12, v16, (uint64_t)v15, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_unifiedContactsMatchingPredicate_keysToFetch_error_(v8, v18, (uint64_t)v17, v11, a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (*a3)
    {
      v22 = 0;
    }
    else
    {
      v23 = (void *)MEMORY[0x24BDBACA0];
      objc_msgSend_name(self, v19, v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_predicateForContactsWithOrganizationName_(v23, v25, (uint64_t)v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_unifiedContactsMatchingPredicate_keysToFetch_error_(v8, v27, (uint64_t)v26, v11, a3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v28;
      if (*a3)
      {
        v22 = 0;
      }
      else
      {
        objc_msgSend_filterUsingBlock_(v28, v29, (uint64_t)&unk_24D5290F0);
        v31 = objc_claimAutoreleasedReturnValue();

        objc_msgSend_arrayByAddingObjectsFromArray_(v21, v32, v31);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)v31;
      }

    }
  }
  else
  {
    v22 = 0;
  }
  return v22;
}

- (id)searchLocal:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  const char *v82;

  objc_msgSend_name(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend_searchByName_(self, v6, (uint64_t)a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    goto LABEL_9;
  }
  objc_msgSend_email(self, v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v15 = (void *)MEMORY[0x24BDBACA0];
    objc_msgSend_email(self, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_emailAddress(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_predicateForContactsMatchingEmailAddress_(v15, v20, (uint64_t)v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_phone(self, v13, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v24 = (void *)MEMORY[0x24BDBAD88];
      objc_msgSend_phone(self, v22, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_number(v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_phoneNumberWithStringValue_(v24, v29, (uint64_t)v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_predicateForContactsMatchingPhoneNumber_(MEMORY[0x24BDBACA0], v31, (uint64_t)v30);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    objc_msgSend_company(self, v22, v23);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      v44 = (void *)MEMORY[0x24BDBACA0];
      objc_msgSend_company(self, v42, v43);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_predicateForContactsWithOrganizationName_(v44, v45, (uint64_t)v16);
      v46 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_address(self, v42, v43);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_8;
      v16 = (void *)objc_opt_new();
      objc_msgSend_address(self, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_street(v49, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setStreet_(v16, v53, (uint64_t)v52);

      objc_msgSend_address(self, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_city(v56, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCity_(v16, v60, (uint64_t)v59);

      objc_msgSend_address(self, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stateCode(v63, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setState_(v16, v67, (uint64_t)v66);

      objc_msgSend_address(self, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_postalCode(v70, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPostalCode_(v16, v74, (uint64_t)v73);

      objc_msgSend_address(self, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_countryCode(v77, v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setISOCountryCode_(v16, v81, (uint64_t)v80);

      objc_msgSend_predicateForContactsMatchingPostalAddress_(MEMORY[0x24BDBACA0], v82, (uint64_t)v16);
      v46 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v46;
  }

LABEL_8:
  v10 = 0;
LABEL_9:
  if (*a3)
  {
    v32 = 0;
  }
  else
  {
    objc_msgSend_contactStore(self, v8, v9);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend_descriptorsForRequiredKeys(MEMORY[0x24BE19118], v33, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_unifiedContactsMatchingPredicate_keysToFetch_error_(v35, v37, (uint64_t)v11, v36, a3);
      v38 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v38;
    }
    if (v10)
    {
      objc_msgSend_mapUsingBlock_(v10, v33, (uint64_t)&unk_24D529130);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_markMeContactInPeople_usingStore_(MEMORY[0x24BE19118], v39, (uint64_t)v32, v35);
    }
    else
    {
      v32 = 0;
    }

  }
  return v32;
}

- (id)searchRemote:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  id v41;
  const char *v42;
  void *v43;

  objc_msgSend_name(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend_name(self, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v11 = (void *)v8;
    goto LABEL_6;
  }
  objc_msgSend_email(self, v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_email(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_emailAddress(v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_company(self, v13, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend_company(self, v9, v10);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
  }
LABEL_6:
  objc_msgSend_contactStore(self, v9, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountIdentifier(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v24 = (void *)MEMORY[0x24BDBAD18];
    objc_msgSend_accountIdentifier(self, v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_absoluteString(v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_predicateForContainersInAccountWithIdentifier_(v24, v29, (uint64_t)v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_containersMatchingPredicate_error_(v18, v31, (uint64_t)v30, a3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v32;
    if (*a3)
      goto LABEL_12;
    objc_msgSend_mapUsingBlock_(v32, v33, (uint64_t)&unk_24D529170);
    v35 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)v35;
    if (!v11)
    {
LABEL_9:
      v34 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    v30 = 0;
    if (!v11)
      goto LABEL_9;
  }
  objc_msgSend_predicateForContactsMatchingFullTextSearch_containerIdentifiers_groupIdentifiers_(MEMORY[0x24BDBACA0], v22, (uint64_t)v11, v30, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptorsForRequiredKeys(MEMORY[0x24BE19118], v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unifiedContactsMatchingPredicate_keysToFetch_error_(v18, v40, (uint64_t)v36, v39, a3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = *a3;

  if (!v41 && v34)
  {
    objc_msgSend_mapUsingBlock_(v34, v42, (uint64_t)&unk_24D529190);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
LABEL_12:
  v43 = 0;
LABEL_13:

  return v43;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
