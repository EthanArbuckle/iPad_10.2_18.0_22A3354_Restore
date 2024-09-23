@implementation _HDClinicalNoteRecordEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("status_coding");
  v8[1] = CFSTR("document_type_coding_collection");
  v8[2] = CFSTR("note_creation_date");
  v8[3] = CFSTR("categories_coding_collections");
  v8[4] = CFSTR("relevant_start_date");
  v8[5] = CFSTR("relevant_end_date");
  v8[6] = CFSTR("authors");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB63C0]), "_init");
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setStatusCoding:", v26);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setDocumentTypeCodingCollection:", v13);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setNoteCreationDate:", v14);
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setCategoriesCodingCollections:", v18);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setRelevantStartDate:", v19);
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setRelevantEndDate:", v20);
    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setAuthors:", v24);
  }

  return v12;
}

@end
