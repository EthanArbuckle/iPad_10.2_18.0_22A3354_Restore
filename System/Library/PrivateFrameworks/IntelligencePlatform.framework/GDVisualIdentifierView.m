@implementation GDVisualIdentifierView

- (GDVisualIdentifierView)initWithAccessAssertion:(id)a3 database:(id)a4
{
  id v8;
  id v9;
  GDVisualIdentifierView *v10;
  GDVisualIdentifierView *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  GDSQLGraphObjectRetriever *v17;
  _PASSqliteDatabase *db;
  void *v19;
  id *v20;
  GDSQLGraphObjectRetriever *personRetriever;
  GDSQLGraphObjectRetriever *v22;
  _PASSqliteDatabase *v23;
  void *v24;
  id *v25;
  GDSQLGraphObjectRetriever *locationRetriever;
  GDSQLGraphObjectRetriever *v27;
  _PASSqliteDatabase *v28;
  void *v29;
  id *v30;
  GDSQLGraphObjectRetriever *softwareRetriever;
  void *v33;
  const char *v34;
  objc_super v35;

  v8 = a3;
  v9 = a4;
  v35.receiver = self;
  v35.super_class = (Class)GDVisualIdentifierView;
  v10 = -[GDVisualIdentifierView init](&v35, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_accessAssertion, a3);
    objc_storeStrong((id *)&v11->_db, a4);
    objc_msgSend_viewArtifactTableName(v8, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v33, v34, (uint64_t)a2, v11, CFSTR("GDVisualIdentifierView.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tableName"));

    }
    v17 = [GDSQLGraphObjectRetriever alloc];
    db = v11->_db;
    v19 = (void *)objc_opt_class();
    v20 = sub_1AE90DD34((id *)&v17->super.isa, db, v16, CFSTR("SB104"), (void *)2, v19);
    personRetriever = v11->_personRetriever;
    v11->_personRetriever = (GDSQLGraphObjectRetriever *)v20;

    v22 = [GDSQLGraphObjectRetriever alloc];
    v23 = v11->_db;
    v24 = (void *)objc_opt_class();
    v25 = sub_1AE90DD34((id *)&v22->super.isa, v23, v16, CFSTR("SB152"), (void *)3, v24);
    locationRetriever = v11->_locationRetriever;
    v11->_locationRetriever = (GDSQLGraphObjectRetriever *)v25;

    v27 = [GDSQLGraphObjectRetriever alloc];
    v28 = v11->_db;
    v29 = (void *)objc_opt_class();
    v30 = sub_1AE90DD34((id *)&v27->super.isa, v28, v16, CFSTR("SB144"), (void *)0xA, v29);
    softwareRetriever = v11->_softwareRetriever;
    v11->_softwareRetriever = (GDSQLGraphObjectRetriever *)v30;

  }
  return v11;
}

- (void)linkEntitiesForPerson:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  GDSQLGraphObjectRetriever *locationRetriever;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  GDSQLGraphObjectRetriever *softwareRetriever;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  void *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v76 = (void *)objc_opt_new();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v74 = v4;
  objc_msgSend_postalAddressLinks(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v81, v86, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v82 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
        locationRetriever = self->_locationRetriever;
        objc_msgSend_locationEntityIdentifier(v15, v10, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringValue(v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForIdentifier_(locationRetriever, v21, (uint64_t)v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend_label(v15, v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setLabel_(v22, v26, (uint64_t)v25);

          objc_msgSend_addObject_(v76, v27, (uint64_t)v22);
        }

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v81, v86, 16);
    }
    while (v12);
  }

  v30 = (void *)objc_msgSend_copy(v76, v28, v29);
  objc_msgSend_setLocations_(v74, v31, (uint64_t)v30);

  v75 = (void *)objc_opt_new();
  v32 = (void *)objc_opt_new();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  objc_msgSend_softwareLinks(v74, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v77, v85, 16);
  if (v37)
  {
    v40 = v37;
    v41 = *(_QWORD *)v78;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v78 != v41)
          objc_enumerationMutation(v35);
        v43 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
        objc_msgSend_conversationIdentifier(v43, v38, v39);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          objc_msgSend_conversationIdentifier(v43, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v32, v48, (uint64_t)v47);

        }
        softwareRetriever = self->_softwareRetriever;
        objc_msgSend_softwareEntityIdentifier(v43, v45, v46);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringValue(v50, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForIdentifier_(softwareRetriever, v54, (uint64_t)v53);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v55)
        {
          objc_msgSend_bundleIdentifiers(v55, v56, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          if (v58)
          {
            objc_msgSend_bundleIdentifiers(v55, v59, v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObjectsFromArray_(v75, v62, (uint64_t)v61);

          }
        }

      }
      v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v77, v85, 16);
    }
    while (v40);
  }

  objc_msgSend_allObjects(v75, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend_copy(v65, v66, v67);
  objc_msgSend_setBundleIdentifiers_(v74, v69, (uint64_t)v68);

  v72 = (void *)objc_msgSend_copy(v32, v70, v71);
  objc_msgSend_setConversationIdentifiers_(v74, v73, (uint64_t)v72);

}

- (id)personForIdentifier:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  GDSQLGraphObjectRetriever *personRetriever;
  const char *v16;
  _QWORD v18[4];
  id v19;
  GDVisualIdentifierView *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_sendEventForProductionLazyWithEventName_eventPayloadBuilder_(GDAnalytics, v5, (uint64_t)CFSTR("ViewEngine.Serving.Query"), &unk_1E5DD9A80);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1AE911A34;
  v26 = sub_1AE911A44;
  v27 = 0;
  objc_msgSend_objectForIdentifier_(self->_personRetriever, v6, (uint64_t)v4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v23[5];
  v23[5] = v7;

  v9 = (void *)v23[5];
  if (v9)
  {
    v10 = v9;
  }
  else
  {
    v11 = (void *)objc_opt_new();
    v28[0] = v4;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v28, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObjects_(v11, v14, (uint64_t)v13);

    personRetriever = self->_personRetriever;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1AE911A4C;
    v18[3] = &unk_1E5DD9AA8;
    v19 = v4;
    v20 = self;
    v21 = &v22;
    objc_msgSend_enumerateObjectsWithQuery_block_(personRetriever, v16, (uint64_t)v11, v18);
    v10 = (id)v23[5];

  }
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (void)enumeratePeopleWithBlock:(id)a3
{
  id v4;
  const char *v5;
  GDSQLGraphObjectRetriever *personRetriever;
  id v7;
  const char *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend_sendEventForProductionLazyWithEventName_eventPayloadBuilder_(GDAnalytics, v5, (uint64_t)CFSTR("ViewEngine.Serving.Query"), &unk_1E5DD9AC8);
  personRetriever = self->_personRetriever;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1AE9119C8;
  v9[3] = &unk_1E5DD9AF0;
  v9[4] = self;
  v10 = v4;
  v7 = v4;
  objc_msgSend_enumerateObjectsWithBlock_(personRetriever, v8, (uint64_t)v9);

}

- (void)enumeratePeopleMatchingName:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, void *, _BYTE *);
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  void *v26;
  GDSQLGraphObjectRetriever *personRetriever;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  id obj;
  char v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _BYTE *))a4;
  objc_msgSend_sendEventForProductionLazyWithEventName_eventPayloadBuilder_(GDAnalytics, v8, (uint64_t)CFSTR("ViewEngine.Serving.Query"), &unk_1E5DB10C8);
  v9 = (void *)objc_opt_new();
  v45 = v6;
  objc_msgSend_ftsTokenize_(GDFTSTokenize, v10, (uint64_t)v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPredicates_(v9, v12, (uint64_t)&unk_1E5E0CE88);
  v56 = 0u;
  v57 = 0u;
  v55 = 0u;
  v54 = 0u;
  obj = v11;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v54, v59, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v55;
LABEL_3:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v55 != v17)
        objc_enumerationMutation(obj);
      v19 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v18);
      v20 = (void *)MEMORY[0x1AF45451C]();
      v21 = objc_alloc(MEMORY[0x1E0CB3940]);
      v23 = (void *)objc_msgSend_initWithFormat_(v21, v22, (uint64_t)CFSTR("\"%@*\"), v19);
      objc_msgSend_setObjectFTSTerm_(v9, v24, (uint64_t)v23);

      objc_msgSend_setSubjects_(v9, v25, (uint64_t)v16);
      v26 = (void *)objc_opt_new();

      personRetriever = self->_personRetriever;
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = sub_1AE9119B0;
      v52[3] = &unk_1E5DD9B18;
      v16 = v26;
      v53 = v16;
      objc_msgSend_enumerateIdentifiersWithQuery_block_(personRetriever, v28, (uint64_t)v9, v52);
      v31 = objc_msgSend_count(v16, v29, v30);

      objc_autoreleasePoolPop(v20);
      if (!v31)
        break;
      if (v15 == ++v18)
      {
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v54, v59, 16);
        if (v15)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v16 = 0;
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v33 = v16;
  v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v48, v58, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v49 != v37)
          objc_enumerationMutation(v33);
        v39 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        v40 = (void *)MEMORY[0x1AF45451C]();
        objc_msgSend_objectForIdentifier_(self->_personRetriever, v41, v39);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          objc_msgSend_linkEntitiesForPerson_(self, v42, (uint64_t)v43);
          v47 = 0;
          v7[2](v7, v43, &v47);
          if (v47)
          {

            objc_autoreleasePoolPop(v40);
            goto LABEL_22;
          }
        }

        objc_autoreleasePoolPop(v40);
      }
      v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v44, (uint64_t)&v48, v58, 16);
      if (v36)
        continue;
      break;
    }
  }
LABEL_22:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareRetriever, 0);
  objc_storeStrong((id *)&self->_locationRetriever, 0);
  objc_storeStrong((id *)&self->_personRetriever, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_accessAssertion, 0);
}

@end
