@implementation GDSQLGraphObjectRetriever

- (void)enumerateIdentifiersWithBlock:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _PASSqliteDatabase *db;
  id v8;
  const char *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = (id)objc_msgSend_initWithFormat_(v5, v6, (uint64_t)CFSTR("SELECT subject FROM %@ WHERE predicate = \"PS1\" AND object = :entityClassIdentifierName"), self->_tableName);
  db = self->_db;
  v12 = v4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1AE90DC9C;
  v13[3] = &unk_1E5DD98E8;
  v13[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1AE90DCB4;
  v11[3] = &unk_1E5DD9A18;
  v8 = v4;
  objc_msgSend_prepAndRunQuery_onPrep_onRow_onError_(db, v9, (uint64_t)v10, v13, v11, 0);

}

- (id)objectForIdentifier:(id)a3
{
  id v4;
  GDEntityIdentifier *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  _PASSqliteDatabase *db;
  const char *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  GDSQLGraphObjectRetriever *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1AE90DBB4;
  v31 = sub_1AE90DBC4;
  v32 = 0;
  v5 = [GDEntityIdentifier alloc];
  v7 = (void *)objc_msgSend_initWithString_(v5, v6, (uint64_t)v4);
  if (objc_msgSend_entityClass(v7, v8, v9) == self->_entityClassIdentifier)
  {
    v12 = objc_msgSend_triplesColumnsRequiredForRendering(self->_triplesIteratorRenderer, v10, v11);
    v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
    sub_1AE90D7A8((uint64_t)self, v12 & 0xFFFFFFFE);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    v17 = (void *)objc_msgSend_initWithFormat_(v15, v16, (uint64_t)CFSTR("SELECT %@ FROM %@ WHERE subject = :subject ORDER BY subject, predicate, relationshipId, relationshipPredicate, object"), v14, self->_tableName);
    db = self->_db;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1AE90DBCC;
    v22[3] = &unk_1E5DD9910;
    v25 = &v27;
    v26 = v13;
    v23 = v7;
    v24 = self;
    objc_msgSend_prepQuery_onPrep_onError_(db, v19, (uint64_t)v17, v22, 0);
    v20 = (id)v28[5];

  }
  else
  {
    v20 = 0;
  }

  _Block_object_dispose(&v27, 8);
  return v20;
}

- (void)enumerateObjectsWithBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _PASSqliteDatabase *db;
  id v11;
  const char *v12;
  char *v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;

  v4 = a3;
  v7 = objc_msgSend_triplesColumnsRequiredForRendering(self->_triplesIteratorRenderer, v5, v6);
  v8 = v7 | 1;
  sub_1AE90D7A8((uint64_t)self, v7 | 1);
  v13 = (char *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend_initWithFormat_(objc_alloc(MEMORY[0x1E0CB3940]), v13, (uint64_t)CFSTR("SELECT %@ FROM %@ WHERE subject >= :entityClassIdentifier << :classOffset AND subject < (:entityClassIdentifier + 1) << :classOffset ORDER BY subject, predicate, relationshipId, relationshipPredicate, object"), v13, self->_tableName);
  db = self->_db;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE90D9F0;
  v14[3] = &unk_1E5DD9938;
  v15 = v4;
  v16 = v8;
  v14[4] = self;
  v11 = v4;
  objc_msgSend_prepQuery_onPrep_onError_(db, v12, (uint64_t)v9, v14, 0);

}

- (void)enumerateIdentifiersWithQuery:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  id v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  _PASSqliteDatabase *db;
  id v60;
  id v61;
  const char *v62;
  id v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[5];
  id v67;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (!self)
  {
    v63 = 0;
    goto LABEL_20;
  }
  v9 = (void *)MEMORY[0x1AF45451C]();
  objc_msgSend_objectFTSTerm(v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    v17 = objc_msgSend_initWithFormat_(v15, v16, (uint64_t)CFSTR("SELECT DISTINCT subject FROM %@_object_fts WHERE object MATCH :match"), self->_tableName);
  }
  else
  {
    objc_msgSend_objects(v8, v13, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_count(v20, v21, v22);

    if (v23 == 1)
    {
      v26 = objc_alloc(MEMORY[0x1E0CB3940]);
      v17 = objc_msgSend_initWithFormat_(v26, v27, (uint64_t)CFSTR("SELECT DISTINCT subject FROM %@ WHERE object = :object"), self->_tableName);
    }
    else
    {
      objc_msgSend_objects(v8, v24, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend_count(v28, v29, v30);

      v32 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (v31)
        v17 = objc_msgSend_initWithFormat_(v32, v33, (uint64_t)CFSTR("SELECT DISTINCT subject FROM %@ WHERE object IN _pas_nsarray(:objects)"), self->_tableName);
      else
        v17 = objc_msgSend_initWithFormat_(v32, v33, (uint64_t)CFSTR("SELECT DISTINCT subject FROM %@ WHERE 1"), self->_tableName);
    }
  }
  v63 = (id)v17;
  objc_msgSend_predicates(v8, v18, v19);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_count(v34, v35, v36);

  if (v37 == 1)
  {
    objc_msgSend_stringByAppendingString_(v63, v38, (uint64_t)CFSTR(" AND predicate = :predicate"));
  }
  else
  {
    objc_msgSend_predicates(v8, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend_count(v40, v41, v42);

    if (!v43)
      goto LABEL_14;
    objc_msgSend_stringByAppendingString_(v63, v44, (uint64_t)CFSTR(" AND predicate IN _pas_nsarray(:predicates)"));
  }
  v46 = objc_claimAutoreleasedReturnValue();

  v63 = (id)v46;
LABEL_14:
  objc_msgSend_subjects(v8, v44, v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend_count(v47, v48, v49);

  if (v50 == 1)
  {
    objc_msgSend_stringByAppendingString_(v63, v51, (uint64_t)CFSTR(" AND subject = :subject"));
LABEL_18:
    v58 = objc_claimAutoreleasedReturnValue();

    v63 = (id)v58;
    goto LABEL_19;
  }
  objc_msgSend_subjects(v8, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend_count(v53, v54, v55);

  if (v56)
  {
    objc_msgSend_stringByAppendingString_(v63, v57, (uint64_t)CFSTR(" AND subject IN _pas_nsarray(:subjects)"));
    goto LABEL_18;
  }
LABEL_19:
  objc_autoreleasePoolPop(v9);
LABEL_20:

  db = self->_db;
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = sub_1AE90D3D0;
  v66[3] = &unk_1E5DD99A0;
  v66[4] = self;
  v67 = v8;
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = sub_1AE90D678;
  v64[3] = &unk_1E5DD99C8;
  v64[4] = self;
  v65 = v7;
  v60 = v7;
  v61 = v8;
  objc_msgSend_prepAndRunQuery_onPrep_onRow_onError_(db, v62, (uint64_t)v63, v66, v64, 0);

}

- (void)enumerateObjectsWithQuery:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1AE90D378;
  v9[3] = &unk_1E5DD99F0;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  objc_msgSend_enumerateIdentifiersWithQuery_block_(self, v8, (uint64_t)a3, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityClassIdentifierName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end
