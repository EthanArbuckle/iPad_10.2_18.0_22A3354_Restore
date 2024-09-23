@implementation HKRelationshipConceptSelection(HDSQLitePredicate)

- (id)predicateWithProfile:()HDSQLitePredicate
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString **v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[2];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D298A0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setEntityClass:", objc_opt_class());
  objc_msgSend(a1, "selection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithProfile:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPredicate:", v8);
  v9 = objc_msgSend(a1, "direction");
  v10 = HDSimpleGraphDatabaseRelationshipEntityPropertySubjectIdentifier;
  if (v9 != 1)
    v10 = &HDSimpleGraphDatabaseRelationshipEntityPropertyObjectIdentifier;
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDSimpleGraphDatabaseRelationshipEntity, "disambiguatedSQLForProperty:", *v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D29838];
  v21[0] = *MEMORY[0x1E0D29618];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithProperty:comparisonType:subqueryDescriptor:subqueryProperties:", v11, 7, v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "type") == -1)
  {
    v18 = v14;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0D29840];
    HDSimpleGraphDatabaseNodeEntityPredicateForNodesWithRelationshipType(objc_msgSend(a1, "type"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    v20[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateMatchingAllPredicates:", v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

@end
