@implementation NSCompoundPredicate(EmailFoundationAdditions)

- (uint64_t)ef_matchesEverything
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  objc_msgSend(a1, "subpredicates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "compoundPredicateType");
  if (v3)
  {
    if (v3 == 1)
    {
      LOBYTE(v1) = objc_msgSend(v2, "count") == 0;
    }
    else if (v3 == 2)
    {
      LOBYTE(v1) = objc_msgSend(v2, "ef_any:", &__block_literal_global_19);
    }
  }
  else if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v1) = objc_msgSend(v4, "ef_matchesNothing");

  }
  else
  {
    LOBYTE(v1) = 0;
  }

  return v1 & 1;
}

- (uint64_t)ef_matchesNothing
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  objc_msgSend(a1, "subpredicates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "compoundPredicateType");
  if (v3)
  {
    if (v3 == 1)
    {
      LOBYTE(v1) = objc_msgSend(v2, "ef_any:", &__block_literal_global_121);
    }
    else if (v3 == 2)
    {
      LOBYTE(v1) = objc_msgSend(v2, "count") == 0;
    }
  }
  else if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v1) = objc_msgSend(v4, "ef_matchesEverything");

  }
  else
  {
    LOBYTE(v1) = 0;
  }

  return v1 & 1;
}

- (id)ef_simplifiedPredicate
{
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v2 = (id)objc_msgSend(a1, "compoundPredicateType");
  objc_msgSend(a1, "subpredicates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v2)
  {
    if (objc_msgSend(v3, "count") != 1)
      goto LABEL_34;
    objc_msgSend(v4, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "ef_matchesEverything"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "ef_matchNothingPredicate");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    if (objc_msgSend(v5, "ef_matchesNothing"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "ef_matchEverythingPredicate");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v5;
      if (!objc_msgSend(v17, "compoundPredicateType"))
      {
        objc_msgSend(v17, "subpredicates");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v19 == 1)
        {
          objc_msgSend(v17, "subpredicates");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "ef_simplifiedPredicate");
          v2 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_39;
        }
      }

    }
    objc_msgSend(v5, "ef_simplifiedPredicate");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 == v17)
    {

      goto LABEL_34;
    }
    objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v17);
    v2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:

    goto LABEL_18;
  }
  if (objc_msgSend(v3, "count") != 1)
  {
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__3;
    v46 = __Block_byref_object_dispose__3;
    v47 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__3;
    v40 = __Block_byref_object_dispose__3;
    v41 = 0;
    v7 = v4;
    v8 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __71__NSCompoundPredicate_EmailFoundationAdditions__ef_simplifiedPredicate__block_invoke;
    v31[3] = &unk_1E62A6700;
    v34 = &v36;
    v35 = v2;
    v33 = &v42;
    v9 = v7;
    v32 = v9;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v31);
    v10 = (void *)v43[5];
    if (v10)
    {
      v11 = v10;
LABEL_9:
      v2 = v11;
LABEL_10:
      v12 = 1;
      v4 = v9;
      goto LABEL_33;
    }
    v13 = (void *)v37[5];
    v14 = v9;
    if (v13)
    {
      v15 = objc_msgSend(v13, "count");
      if (!v15)
      {
        if (v2 == (id)1)
          objc_msgSend(MEMORY[0x1E0CB3880], "ef_matchEverythingPredicate");
        else
          objc_msgSend(MEMORY[0x1E0CB3880], "ef_matchNothingPredicate");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      if (v15 == 1)
      {
        objc_msgSend((id)v37[5], "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "ef_simplifiedPredicate");
        v2 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
      v14 = (id)v37[5];

      v22 = (void *)v37[5];
      v37[5] = 0;

    }
    v27[0] = v8;
    v27[1] = 3221225472;
    v27[2] = __71__NSCompoundPredicate_EmailFoundationAdditions__ef_simplifiedPredicate__block_invoke_2;
    v27[3] = &unk_1E62A6728;
    v29 = &v36;
    v30 = v2;
    v4 = v14;
    v28 = v4;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v27);
    v23 = (void *)v37[5];
    if (v23)
    {
      v2 = v23;

      v4 = v2;
    }
    if (v4 == v9)
    {
      v12 = 0;
    }
    else
    {
      v24 = objc_alloc(MEMORY[0x1E0CB3528]);
      v25 = objc_msgSend(a1, "compoundPredicateType");
      v2 = (id)objc_msgSend(v24, "initWithType:subpredicates:", v25, v37[5]);
      v12 = 1;
    }

LABEL_33:
    _Block_object_dispose(&v36, 8);

    _Block_object_dispose(&v42, 8);
    if (v12)
      goto LABEL_35;
LABEL_34:
    v2 = a1;
    goto LABEL_35;
  }
  objc_msgSend(v4, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_simplifiedPredicate");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_17:
  v2 = (id)v6;
LABEL_18:

LABEL_35:
  return v2;
}

- (id)ef_publicDescription
{
  unint64_t v2;
  __CFString *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  id v16;
  _QWORD v17[4];
  id v18;
  __CFString *v19;
  uint64_t v20;

  v2 = objc_msgSend(a1, "compoundPredicateType");
  if (v2 > 2)
    v3 = 0;
  else
    v3 = off_1E62A6770[v2];
  objc_msgSend(a1, "subpredicates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = objc_msgSend(a1, "compoundPredicateType");
  if (!v5)
  {
    if (v6 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "ef_matchEverythingPredicate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ef_publicDescription");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't have a NOT predicate with no subpredicate."), 0);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v16);
      }
      objc_msgSend(MEMORY[0x1E0CB3880], "ef_matchNothingPredicate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ef_publicDescription");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_13;
  }
  if (v5 != 1)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __69__NSCompoundPredicate_EmailFoundationAdditions__ef_publicDescription__block_invoke;
    v17[3] = &unk_1E62A6698;
    v10 = v9;
    v19 = v3;
    v20 = v5;
    v18 = v10;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v17);
    v11 = v19;
    v7 = v10;

    v12 = v18;
    v13 = v7;
LABEL_15:

    goto LABEL_16;
  }
  if (!v6)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v4, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_ef_parenthesizedPublicDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@ %@"), v3, v12);
    goto LABEL_15;
  }
  objc_msgSend(v4, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ef_publicDescription");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v13 = (void *)v8;
LABEL_16:

  return v13;
}

- (uint64_t)ef_containsKeyPath:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "subpredicates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__NSCompoundPredicate_EmailFoundationAdditions__ef_containsKeyPath___block_invoke;
  v9[3] = &unk_1E62A6750;
  v6 = v4;
  v10 = v6;
  v7 = objc_msgSend(v5, "ef_any:", v9);

  return v7;
}

- (uint64_t)ef_containsSubpredicate:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "subpredicates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__NSCompoundPredicate_EmailFoundationAdditions__ef_containsSubpredicate___block_invoke;
  v9[3] = &unk_1E62A6750;
  v6 = v4;
  v10 = v6;
  v7 = objc_msgSend(v5, "ef_any:", v9);

  return v7;
}

@end
