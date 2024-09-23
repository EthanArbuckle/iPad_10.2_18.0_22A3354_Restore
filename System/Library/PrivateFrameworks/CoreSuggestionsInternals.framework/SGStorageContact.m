@implementation SGStorageContact

- (SGStorageContact)init
{
  SGStorageContact *v2;
  uint64_t v3;
  NSMutableSet *profiles;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGStorageContact;
  v2 = -[SGStorageContact init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    profiles = v2->_profiles;
    v2->_profiles = (NSMutableSet *)v3;

  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  SGStorageContact *v4;
  SGStorageContact *v5;
  BOOL v6;

  v4 = (SGStorageContact *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGStorageContact isEqualToStorageContact:](self, "isEqualToStorageContact:", v5);

  return v6;
}

- (BOOL)isEqualToStorageContact:(id)a3
{
  _QWORD *v4;
  int64_t masterEntityId;
  NSMutableSet *v6;
  NSMutableSet *v7;
  char v8;

  v4 = a3;
  masterEntityId = self->_masterEntityId;
  if (masterEntityId == objc_msgSend(v4, "masterEntityId"))
  {
    v6 = self->_profiles;
    v7 = v6;
    if (v6 == (NSMutableSet *)v4[1])
      v8 = 1;
    else
      v8 = -[NSMutableSet isEqual:](v6, "isEqual:");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t masterEntityId;

  masterEntityId = self->_masterEntityId;
  return -[NSMutableSet hash](self->_profiles, "hash") - masterEntityId + 32 * masterEntityId;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGStorageContact name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGStorageContact: %@ - %lu profile(s)>"), v4, -[NSMutableSet count](self->_profiles, "count"));

  return v5;
}

- (void)addProfile:(id)a3
{
  -[NSMutableSet addObject:](self->_profiles, "addObject:", a3);
}

- (id)profiles
{
  return self->_profiles;
}

- (id)allNames
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSMutableSet count](self->_profiles, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_profiles;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "title", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "title");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          normalizeName(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSString)name
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableSet count](self->_profiles, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_profiles;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "title", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "title");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          normalizeName(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  +[SGNames bestName:](SGNames, "bestName:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (BOOL)canMerge:(id)a3
{
  int64_t masterEntityId;

  masterEntityId = self->_masterEntityId;
  return masterEntityId == objc_msgSend(a3, "masterEntityId") && self->_masterEntityId >= 0;
}

- (void)merge:(id)a3
{
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (id *)a3;
  if (!-[SGStorageContact canMerge:](self, "canMerge:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGStorageContact.m"), 149, CFSTR("Merging with a contact that isn't mergable"));

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5[1];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[SGStorageContact addProfile:](self, "addProfile:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)reload
{
  -[SGStorageContact setInternalDetectedDetails:](self, "setInternalDetectedDetails:", 0);
}

- (id)loadAllDetailsFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SGStorageContact internalDetectedDetails](self, "internalDetectedDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableSet count](self->_profiles, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = self->_profiles;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v11), "recordId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "loadAllContactDetailsForRecordId:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObjectsFromArray:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v9);
    }

    +[SGDeduper splitContactDetailsByType:](SGDeduper, "splitContactDetailsByType:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __39__SGStorageContact_loadAllDetailsFrom___block_invoke;
    v26[3] = &unk_1E7DA9B58;
    v27 = v14;
    v15 = v14;
    v16 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3BD5158](v26);
    v5 = (void *)objc_opt_new();
    v16[2](v16, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEmailAddresses:", v17);

    v16[2](v16, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPostalAddresses:", v18);

    v16[2](v16, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPhoneNumbers:", v19);

    v16[2](v16, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSocialProfiles:", v20);

    v16[2](v16, 6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBirthday:", v22);

    v16[2](v16, 5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPhotoPath:", v24);

  }
  return v5;
}

- (id)loadPhoneDetailsFrom:(id)a3
{
  void *v3;
  void *v4;

  -[SGStorageContact loadAllDetailsFrom:](self, "loadAllDetailsFrom:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)loadAddressDetailsFrom:(id)a3
{
  void *v3;
  void *v4;

  -[SGStorageContact loadAllDetailsFrom:](self, "loadAllDetailsFrom:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postalAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)loadEmailAddressDetailsFrom:(id)a3
{
  void *v3;
  void *v4;

  -[SGStorageContact loadAllDetailsFrom:](self, "loadAllDetailsFrom:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)loadBirthdayDetailsFrom:(id)a3
{
  void *v3;
  void *v4;

  -[SGStorageContact loadAllDetailsFrom:](self, "loadAllDetailsFrom:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "birthday");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)convertToContact:(id)a3
{
  return -[SGStorageContact convertToContact:sourceEntity:enrichments:](self, "convertToContact:sourceEntity:enrichments:", a3, 0, 0);
}

- (id)convertToContact:(id)a3 sourceEntity:(id)a4 enrichments:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id obja;
  void *v84;
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
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  v10 = v8;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0D198C8], "originWithType:sourceKey:externalKey:fromForwardedMessage:", 0, 0, 0, 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_opt_new();
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v90;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v90 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
        objc_msgSend(v17, "recordId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = (void *)MEMORY[0x1E0D198C8];
          objc_msgSend(v17, "duplicateKey");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "originForDuplicateKey:entity:parent:store:", v20, v17, v10, v9);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "recordId");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "setObject:forKeyedSubscript:", v21, v22);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
    }
    while (v14);
  }

  objc_msgSend(v10, "recordId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x1E0D198C8];
    objc_msgSend(v10, "duplicateKey");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "originForDuplicateKey:entity:parent:store:", v25, v10, 0, v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setObject:forKeyedSubscript:", v26, v27);

  }
  -[SGStorageContact loadAllDetailsFrom:](self, "loadAllDetailsFrom:", v9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "phoneNumbers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  sgMapAndFilter();
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "postalAddresses");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  sgMapAndFilter();
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "emailAddresses");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  sgMapAndFilter();
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "socialProfiles");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  sgMapAndFilter();
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "birthday");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v75 = (void *)MEMORY[0x1E0D197C8];
    objc_msgSend(v28, "birthday");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "value");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    SGDateComponentsFromNormalizeBirthday(v71);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "birthday");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "label");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "birthday");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "extractionInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "birthday");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "recordId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "dateComponents:label:extractionInfo:withRecordId:", v34, v35, v37, v39);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v76 = 0;
  }
  objc_msgSend(v28, "photoPath");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v28, "photoPath");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "value");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v74 = 0;
  }
  -[SGStorageContact bestProfile](self, "bestProfile");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19920], "recordIdForContactWithRowId:", objc_msgSend(v42, "masterEntityId"));
  v43 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "title");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "objectForKeyedSubscript:", v43);
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v45;
  if (v45)
    v47 = (void *)v45;
  else
    v47 = v81;
  v70 = v42;
  objc_msgSend(v42, "extractionInfo");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGNames sgNameFromString:origin:recordId:extractionInfo:](SGNames, "sgNameFromString:origin:recordId:extractionInfo:", v44, v47, v43, v48);
  v49 = objc_claimAutoreleasedReturnValue();

  v66 = (void *)v49;
  v67 = (void *)v43;
  objc_msgSend(MEMORY[0x1E0D197B0], "contactWithId:name:emailAddresses:phones:postalAddresses:socialProfiles:birthday:photoPath:", v43, v49, v78, v80, v79, v77, v76, v74);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SGStorageContact hasProfileFromInteraction](self, "hasProfileFromInteraction"))
  {
    objc_msgSend(v50, "setSignificance:", 1);
    objc_msgSend(v50, "setSignificanceOrigin:", 1);
  }
  v68 = v50;
  v72 = v28;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  obja = v12;
  v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
  if (v51)
  {
    v52 = v51;
    v53 = 0;
    v54 = *(_QWORD *)v86;
    do
    {
      for (j = 0; j != v52; ++j)
      {
        if (*(_QWORD *)v86 != v54)
          objc_enumerationMutation(obja);
        v56 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
        objc_msgSend(v56, "extractionInfo");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v57, "extractionType") == 64)
        {
          objc_msgSend(v56, "duplicateKey");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v10;
          v60 = v9;
          v61 = objc_msgSend(v58, "entityType") == 4;

          v53 = v53 | v61;
          v9 = v60;
          v10 = v59;
        }
        else
        {

        }
        objc_msgSend(v56, "extractionInfo");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v62, "extractionType") == 64)
        {
          objc_msgSend(v56, "duplicateKey");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "entityType");

          if (v64 == 23)
            v53 = v53 | 2;
          else
            v53 = v53;
        }
        else
        {

        }
      }
      v52 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
    }
    while (v52);
  }
  else
  {
    v53 = 0;
  }

  objc_msgSend(v68, "setUpdatedFields:", v53);
  return v68;
}

- (id)bestProfile
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  id v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[SGStorageContact name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_profiles;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v20;
    v9 = -INFINITY;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "title", (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v3);

        if (v13)
        {
          v17 = v11;

          v7 = v17;
          goto LABEL_14;
        }
        objc_msgSend(v11, "creationTimestamp");
        if (v14 > v9)
        {
          v15 = v14;
          v16 = v11;

          v7 = v16;
          v9 = v15;
        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_14:

  return v7;
}

- (BOOL)hasProfileFromInteraction
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D197F0], "fromInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_profiles;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "tags", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "containsObject:", v3);

        if ((v9 & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)hasProfileFromTextMessage
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D197F0], "fromTextMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_profiles;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "tags", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "containsObject:", v3);

        if ((v9 & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (int64_t)masterEntityId
{
  return self->_masterEntityId;
}

- (SGRecordId)recordId
{
  return self->_recordId;
}

- (SGContactDetailsHolder)internalDetectedDetails
{
  return (SGContactDetailsHolder *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInternalDetectedDetails:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDetectedDetails, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
}

id __62__SGStorageContact_convertToContact_sourceEntity_enrichments___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  SGSocialProfileDetails *v3;
  void *v4;
  SGSocialProfileDetails *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  id v17;
  void *v18;

  v2 = a2;
  v3 = [SGSocialProfileDetails alloc];
  objc_msgSend(v2, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SGSocialProfileDetails initWithSerialized:](v3, "initWithSerialized:", v4);

  if (v5)
  {
    v17 = objc_alloc(MEMORY[0x1E0D19948]);
    -[SGSocialProfileDetails username](v5, "username");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSocialProfileDetails userIdentifier](v5, "userIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSocialProfileDetails bundleIdentifier](v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSocialProfileDetails displayName](v5, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSocialProfileDetails service](v5, "service");
    v8 = objc_claimAutoreleasedReturnValue();
    -[SGSocialProfileDetails teamIdentifier](v5, "teamIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "extractionInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "recordId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)v8;
    v14 = (void *)objc_msgSend(v17, "initWithUsername:userIdentifier:bundleIdentifier:displayName:service:teamIdentifier:label:extractionInfo:recordId:", v18, v16, v6, v7, v8, v9, v10, v11, v12);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id __62__SGStorageContact_convertToContact_sourceEntity_enrichments___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0D197E0];
  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extractionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "emailAddress:label:extractionInfo:withRecordId:", v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __62__SGStorageContact_convertToContact_sourceEntity_enrichments___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v2 = a2;
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SGPostalAddressParse(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __62__SGStorageContact_convertToContact_sourceEntity_enrichments___block_invoke_3;
  v19[3] = &unk_1E7DA9C00;
  v19[4] = &v20;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v19);
  if (*((_BYTE *)v21 + 24))
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Street"));
  else
    objc_msgSend(v2, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D198E8];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("City"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("State"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ZIP"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Country"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:city:state:postalCode:country:", v5, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D198E0];
  objc_msgSend(v2, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extractionInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postalAddress:components:label:extractionInfo:recordId:", v13, v11, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v20, 8);
  return v17;
}

uint64_t __62__SGStorageContact_convertToContact_sourceEntity_enrichments___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, BOOL *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "length");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result != 0;
  *a4 = result != 0;
  return result;
}

id __62__SGStorageContact_convertToContact_sourceEntity_enrichments___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0D198D8];
  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extractionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "phoneNumber:label:extractionInfo:recordId:", v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __39__SGStorageContact_loadAllDetailsFrom___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[SGDeduper dedupeContactDetails:](SGDeduper, "dedupeContactDetails:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

+ (id)contactFromContactEntity:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  v4[2] = objc_msgSend(v3, "masterEntityId");
  objc_msgSend(MEMORY[0x1E0D19920], "recordIdForContactWithRowId:", objc_msgSend(v3, "masterEntityId"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[3];
  v4[3] = v5;

  objc_msgSend(v4, "addProfile:", v3);
  return v4;
}

+ (id)contactWithMasterEntityId:(int64_t)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_opt_new();
  v4[2] = a3;
  return v4;
}

+ (id)mergeAll:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v10 = v4;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
              if (objc_msgSend(v15, "canMerge:", v9))
              {
                objc_msgSend(v15, "merge:", v9);

                goto LABEL_16;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v12)
              continue;
            break;
          }
        }

        objc_msgSend(v10, "addObject:", v9);
LABEL_16:
        ;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  return v4;
}

@end
