@implementation NSPredicate(Conversion)

+ (id)predicateWithSortedFCCKPQueryFilters:()Conversion translator:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  int v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v53[2];
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v7 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithFCCKPQueryFilters:translator:", v9, v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v5, "count") - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithFCCKPQueryFilters:translator:", v12, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (v13)
      {
        v14 = (void *)MEMORY[0x1E0CB3528];
        v53[0] = v10;
        v53[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
        goto LABEL_37;
      }
      v28 = v10;
    }
    else
    {
      v28 = v13;
    }
    v16 = v28;
    goto LABEL_15;
  }
  objc_msgSend(v5, "lastObject");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((*(_BYTE *)(v17 + 28) & 1) != 0)
    {
      v19 = 0;
      v20 = 0;
      v21 = 0;
      switch(*(_DWORD *)(v17 + 24))
      {
        case 1:
        case 2:
        case 5:
        case 6:
        case 7:
        case 8:
          break;
        case 3:
          v29 = (void *)MEMORY[0x1E0CB3880];
          v30 = *(id *)(v17 + 8);
          objc_msgSend(v30, "name");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = *(id *)(v18 + 16);
          -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "predicateWithFormat:", CFSTR("%K IN %@"), v31, v33);
          goto LABEL_30;
        case 4:
          v34 = (void *)MEMORY[0x1E0CB3528];
          v35 = (void *)MEMORY[0x1E0CB3880];
          v30 = *(id *)(v17 + 8);
          objc_msgSend(v30, "name");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = *(id *)(v18 + 16);
          -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "predicateWithFormat:", CFSTR("%K IN %@"), v36, v38);
          goto LABEL_33;
        case 9:
          goto LABEL_36;
        case 0xA:
          v39 = (void *)MEMORY[0x1E0CB3880];
          v30 = *(id *)(v17 + 16);
          -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "predicateWithFormat:", CFSTR("ALL tokenize(%@, 'cdl') IN allTokens"), v31);
          goto LABEL_20;
        case 0xB:
          v40 = (void *)MEMORY[0x1E0CB3880];
          v30 = *(id *)(v17 + 16);
          -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "predicateWithFormat:", CFSTR("ANY tokenize(%@, 'cdl') IN allTokens"), v31);
LABEL_20:
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        case 0xC:
          v41 = (void *)MEMORY[0x1E0CB3880];
          v30 = *(id *)(v17 + 8);
          objc_msgSend(v30, "name");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = *(id *)(v18 + 16);
          -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "predicateWithFormat:", CFSTR("%K CONTAINS %@"), v31, v33);
          goto LABEL_30;
        case 0xD:
          v34 = (void *)MEMORY[0x1E0CB3528];
          v42 = (void *)MEMORY[0x1E0CB3880];
          v30 = *(id *)(v17 + 8);
          objc_msgSend(v30, "name");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = *(id *)(v18 + 16);
          -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "predicateWithFormat:", CFSTR("%K CONTAINS %@"), v36, v38);
          goto LABEL_33;
        case 0xE:
          v43 = (void *)MEMORY[0x1E0CB3880];
          v30 = *(id *)(v17 + 16);
          -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = *(id *)(v18 + 8);
          objc_msgSend(v32, "name");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "predicateWithFormat:", CFSTR("ANY %@ IN %K"), v31, v33);
          goto LABEL_30;
        case 0xF:
          v34 = (void *)MEMORY[0x1E0CB3528];
          v44 = (void *)MEMORY[0x1E0CB3880];
          v30 = *(id *)(v17 + 16);
          -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v30);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = *(id *)(v18 + 8);
          objc_msgSend(v37, "name");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "predicateWithFormat:", CFSTR("ANY %@ IN %K"), v36, v38);
          goto LABEL_33;
        case 0x10:
          v45 = (void *)MEMORY[0x1E0CB3880];
          v30 = *(id *)(v17 + 8);
          objc_msgSend(v30, "name");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = *(id *)(v18 + 16);
          -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "predicateWithFormat:", CFSTR("%K BEGINSWITH %@"), v31, v33);
          goto LABEL_30;
        case 0x11:
          v34 = (void *)MEMORY[0x1E0CB3528];
          v46 = (void *)MEMORY[0x1E0CB3880];
          v30 = *(id *)(v17 + 8);
          objc_msgSend(v30, "name");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = *(id *)(v18 + 16);
          -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "predicateWithFormat:", CFSTR("%K BEGINSWITH %@"), v36, v38);
          goto LABEL_33;
        case 0x12:
          v47 = (void *)MEMORY[0x1E0CB3880];
          v30 = *(id *)(v17 + 8);
          objc_msgSend(v30, "name");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = *(id *)(v18 + 16);
          -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "predicateWithFormat:", CFSTR("ANY %K BEGINSWITH %@"), v31, v33);
          goto LABEL_30;
        case 0x13:
          v34 = (void *)MEMORY[0x1E0CB3528];
          v48 = (void *)MEMORY[0x1E0CB3880];
          v30 = *(id *)(v17 + 8);
          objc_msgSend(v30, "name");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = *(id *)(v18 + 16);
          -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "predicateWithFormat:", CFSTR("ANY %K BEGINSWITH %@"), v36, v38);
          goto LABEL_33;
        case 0x14:
          v49 = (void *)MEMORY[0x1E0CB3880];
          v30 = *(id *)(v17 + 16);
          -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = *(id *)(v18 + 8);
          objc_msgSend(v32, "name");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "predicateWithFormat:", CFSTR("ALL %@ IN %K"), v31, v33);
LABEL_30:
          v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_31:
          goto LABEL_34;
        case 0x15:
          v34 = (void *)MEMORY[0x1E0CB3528];
          v50 = (void *)MEMORY[0x1E0CB3880];
          v30 = *(id *)(v17 + 16);
          -[FCCKProtocolTranslator objectRepresentationFromFieldValue:]((uint64_t)v6, v30);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = *(id *)(v18 + 8);
          objc_msgSend(v37, "name");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "predicateWithFormat:", CFSTR("ALL %@ IN %K"), v36, v38);
LABEL_33:
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "notPredicateWithSubpredicate:", v51);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_34:
          goto LABEL_35;
        default:
          v20 = 0;
          v21 = 0;
          goto LABEL_36;
      }
    }
    v22 = (void *)MEMORY[0x1E0CB35D0];
    v23 = *(id *)(v17 + 8);
    objc_msgSend(v23, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "expressionForKeyPath:", v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0CB35D0];
    v26 = *(id *)(v18 + 16);
    objc_msgSend(v25, "expressionWithFCCKPRecordFieldValue:translator:", v26, v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if ((*(_BYTE *)(v18 + 28) & 1) != 0)
      v27 = *(_DWORD *)(v18 + 24);
    else
      v27 = 1;
    objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v20, v21, 0, CKNSPredicateOperatorTypeForFCCKPQueryFilterType(v27), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
LABEL_35:
    v20 = 0;
    v21 = 0;
  }
LABEL_36:
  v10 = v19;

  v16 = v10;
LABEL_37:

  return v16;
}

+ (id)predicateWithFCCKPQueryFilters:()Conversion translator:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_139);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithSortedFCCKPQueryFilters:translator:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)FCCKPQueryFiltersWithTranslator:()Conversion error:
{
  void *v6;
  objc_class *v7;
  void *v8;

  NSClassFromString(CFSTR("NSTruePredicate"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return MEMORY[0x1E0C9AA60];
  if (a4)
  {
    v6 = (void *)MEMORY[0x1E0C94EA8];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithCode:format:", 1017, CFSTR("Unexpected predicate type: %@"), v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

@end
