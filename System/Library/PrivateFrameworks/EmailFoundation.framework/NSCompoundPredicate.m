@implementation NSCompoundPredicate

void __69__NSCompoundPredicate_EmailFoundationAdditions__ef_publicDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v8 = v5;
  objc_msgSend(v5, "_ef_parenthesizedPublicDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  if (*(_QWORD *)(a1 + 48) - 1 != a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" "));
    objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" "));
  }

}

void __71__NSCompoundPredicate_EmailFoundationAdditions__ef_simplifiedPredicate__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  if (objc_msgSend(v15, "ef_matchesEverything"))
  {
    if (*(_QWORD *)(a1 + 56) != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "ef_matchEverythingPredicate");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      *a4 = 1;
      goto LABEL_12;
    }
LABEL_8:
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "ef_prefix:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "mutableCopy");
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
    goto LABEL_12;
  }
  if (objc_msgSend(v15, "ef_matchesNothing"))
  {
    if (*(_QWORD *)(a1 + 56) == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "ef_matchNothingPredicate");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v14)
    objc_msgSend(v14, "addObject:", v15);
LABEL_12:

}

uint64_t __66__NSCompoundPredicate_EmailFoundationAdditions__ef_matchesNothing__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_matchesNothing");
}

uint64_t __69__NSCompoundPredicate_EmailFoundationAdditions__ef_matchesEverything__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_matchesEverything");
}

void __71__NSCompoundPredicate_EmailFoundationAdditions__ef_simplifiedPredicate__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v16, "compoundPredicateType") == *(_QWORD *)(a1 + 48))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "ef_prefix:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "mutableCopy");
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
    objc_msgSend(v16, "subpredicates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ef_mapSelector:", sel_ef_simplifiedPredicate);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", v10);
  }
  else
  {
    objc_msgSend(v16, "ef_simplifiedPredicate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 != v16 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "ef_prefix:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "mutableCopy");
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

    }
    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v15)
      objc_msgSend(v15, "addObject:", v10);
  }

}

uint64_t __68__NSCompoundPredicate_EmailFoundationAdditions__ef_containsKeyPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_containsKeyPath:", *(_QWORD *)(a1 + 32));
}

uint64_t __73__NSCompoundPredicate_EmailFoundationAdditions__ef_containsSubpredicate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_containsSubpredicate:", *(_QWORD *)(a1 + 32));
}

@end
