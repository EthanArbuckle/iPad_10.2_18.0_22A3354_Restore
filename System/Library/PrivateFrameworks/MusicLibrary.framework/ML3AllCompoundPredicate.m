@implementation ML3AllCompoundPredicate

- (id)compoundOperatorJoiner
{
  return CFSTR(" AND ");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)predicateByFlatteningAllCompoundPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "predicates", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "predicateByFlatteningAllCompoundPredicate:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "predicates");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v13);

        }
        else
        {
          objc_msgSend(v5, "addObject:", v11);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)predicateByMergingContainmentPredicatesAllCompoundPredicate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  BOOL v74;
  void *v75;
  char v76;
  void *v77;
  void *v78;
  id v79;
  unint64_t v80;
  id v81;
  void *v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[4];
  id v89;
  id v90;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  +[ML3AllCompoundPredicate predicateByFlatteningAllCompoundPredicate:](ML3AllCompoundPredicate, "predicateByFlatteningAllCompoundPredicate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v69 = v3;
  objc_msgSend(v3, "predicates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
  v77 = v4;
  if (!v7)
  {
    v76 = 0;
    goto LABEL_54;
  }
  v8 = v7;
  v76 = 0;
  v9 = *(_QWORD *)v93;
  v82 = v6;
  v71 = v5;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v93 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "property");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("media_type"));

        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_42;
          v14 = v11;
          v15 = objc_msgSend(v14, "comparison");
          objc_msgSend(v14, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if ((v15 - 3) < 4 || v15 == 1)
            {
              objc_msgSend(v14, "property");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "objectForKeyedSubscript:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              v80 = (unint64_t)v18;
              if (v18)
                v73 = objc_msgSend(v18, "unsignedLongLongValue");
              else
                v73 = 0x8000000000000000;
              objc_msgSend(v14, "property");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "objectForKeyedSubscript:", v19);
              v20 = objc_claimAutoreleasedReturnValue();

              v21 = (void *)v20;
              if (v20)
                v22 = objc_msgSend((id)v20, "unsignedLongLongValue");
              else
                v22 = 0x7FFFFFFFFFFFFFFFLL;
              v23 = (v80 | v20) != 0;
              if ((v15 - 3) > 1)
              {
                v4 = v77;
                if ((v15 - 5) > 1)
                {
                  if (v15 != 1)
                    goto LABEL_40;
                  v78 = v21;
                  v70 = v22;
                  v33 = objc_msgSend(v16, "unsignedLongLongValue");
                  if (v73 <= v33)
                    v34 = v33;
                  else
                    v34 = v73;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v34);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "property");
                  v74 = v23;
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "setObject:forKeyedSubscript:", v35, v36);

                  v23 = v74;
                  v31 = (void *)MEMORY[0x1E0CB37E8];
                  if (v70 >= v33)
                    v32 = v33;
                  else
                    v32 = v70;
                }
                else
                {
                  v78 = v21;
                  v29 = v22;
                  v30 = objc_msgSend(v16, "unsignedLongLongValue") - (v15 == 5);
                  v31 = (void *)MEMORY[0x1E0CB37E8];
                  if (v29 >= v30)
                    v32 = v30;
                  else
                    v32 = v29;
                }
                objc_msgSend(v31, "numberWithLongLong:", v32);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "property");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "setObject:forKeyedSubscript:", v27, v28);
                goto LABEL_39;
              }
              v78 = v21;
              v24 = objc_msgSend(v16, "unsignedLongLongValue");
              if (v15 == 3)
                v25 = v24 + 1;
              else
                v25 = v24;
              if (v73 <= v25)
                v26 = v25;
              else
                v26 = v73;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "property");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "setObject:forKeyedSubscript:", v27, v28);
              v4 = v77;
LABEL_39:

              objc_msgSend(v4, "addObject:", v14);
              v21 = v78;
LABEL_40:
              v76 |= v23;

              v5 = v71;
            }
            else
            {
              v4 = v77;
            }

            v6 = v82;
LABEL_42:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_48;
            v37 = v11;
            objc_msgSend(v37, "property");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKeyedSubscript:", v38);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v37, "values");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v39;
            if (v16)
            {
              objc_msgSend(v16, "intersectSet:", v39);
              v76 = 1;
            }
            else
            {
              v41 = (void *)objc_msgSend(v39, "mutableCopy");
              objc_msgSend(v37, "property");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v41, v42);

              v4 = v77;
              v6 = v82;
            }

            objc_msgSend(v4, "addObject:", v37);
          }
          else
          {
            v6 = v82;
          }

        }
      }
LABEL_48:
      ++v10;
    }
    while (v8 != v10);
    v43 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
    v8 = v43;
  }
  while (v43);
LABEL_54:

  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __87__ML3AllCompoundPredicate_predicateByMergingContainmentPredicatesAllCompoundPredicate___block_invoke;
  v88[3] = &unk_1E5B61A88;
  v83 = v75;
  v89 = v83;
  v79 = v72;
  v90 = v79;
  v91 = v5;
  v81 = v91;
  objc_msgSend(v91, "enumerateKeysAndObjectsUsingBlock:", v88);
  if ((v76 & 1) == 0)
  {
    v67 = v69;
    v66 = v69;
    goto LABEL_86;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  objc_msgSend(v69, "predicates");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
  if (!v46)
    goto LABEL_84;
  v47 = v46;
  v48 = *(_QWORD *)v85;
  while (2)
  {
    v49 = 0;
    while (2)
    {
      if (*(_QWORD *)v85 != v48)
        objc_enumerationMutation(v45);
      v50 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v49);
      if (objc_msgSend(v4, "containsObject:", v50)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v50, "property");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "objectForKeyedSubscript:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v52;
        if (v52)
          v54 = objc_msgSend(v52, "unsignedLongLongValue");
        else
          v54 = 0x8000000000000000;
        objc_msgSend(v79, "objectForKeyedSubscript:", v51);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v55;
        if (v55)
          v57 = objc_msgSend(v55, "unsignedLongLongValue");
        else
          v57 = 0x7FFFFFFFFFFFFFFFLL;
        if (v54 > v57)
        {
          +[ML3TruthPredicate falsePredicate](ML3TruthPredicate, "falsePredicate");
          v58 = objc_claimAutoreleasedReturnValue();
          goto LABEL_78;
        }
        if (v57 == v54)
        {
          v59 = v51;
          v60 = v56;
          v61 = 1;
LABEL_77:
          +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", v59, v60, v61);
          v58 = objc_claimAutoreleasedReturnValue();
LABEL_78:
          v63 = (void *)v58;
          objc_msgSend(v44, "addObject:", v58);

        }
        else
        {
          if (v54 != 0x8000000000000000)
          {
            +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", v51, v53, 4);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "addObject:", v62);

          }
          if (v57 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v59 = v51;
            v60 = v56;
            v61 = 6;
            goto LABEL_77;
          }
        }
        objc_msgSend(v81, "objectForKeyedSubscript:", v51);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v64, "count"))
        {
          +[ML3ContainmentPredicate predicateWithProperty:values:](ML3ContainmentPredicate, "predicateWithProperty:values:", v51, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObject:", v65);

        }
        objc_msgSend(v83, "removeObjectForKey:", v51);
        objc_msgSend(v79, "removeObjectForKey:", v51);
        objc_msgSend(v81, "removeObjectForKey:", v51);

        v4 = v77;
      }
      else
      {
        objc_msgSend(v44, "addObject:", v50);
      }
      if (v47 != ++v49)
        continue;
      break;
    }
    v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
    if (v47)
      continue;
    break;
  }
LABEL_84:

  +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v44);
  v66 = (id)objc_claimAutoreleasedReturnValue();

  v67 = v69;
LABEL_86:

  return v66;
}

void __87__ML3AllCompoundPredicate_predicateByMergingContainmentPredicatesAllCompoundPredicate___block_invoke(id *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[6];

  v10 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v10);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "objectForKeyedSubscript:", v10);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 | v4)
  {
    if (v3)
    {
      v6 = objc_msgSend((id)v3, "unsignedLongLongValue");
      if (v5)
      {
LABEL_4:
        v7 = objc_msgSend(v5, "unsignedLongLongValue");
LABEL_7:
        objc_msgSend(a1[6], "objectForKeyedSubscript:", v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __87__ML3AllCompoundPredicate_predicateByMergingContainmentPredicatesAllCompoundPredicate___block_invoke_2;
        v11[3] = &__block_descriptor_48_e22_B24__0__NSNumber_8_B16l;
        v11[4] = v6;
        v11[5] = v7;
        objc_msgSend(v8, "objectsPassingTest:", v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v9, v10);

        goto LABEL_8;
      }
    }
    else
    {
      v6 = 0x8000000000000000;
      if (v4)
        goto LABEL_4;
    }
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_7;
  }
LABEL_8:

}

BOOL __87__ML3AllCompoundPredicate_predicateByMergingContainmentPredicatesAllCompoundPredicate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "unsignedLongLongValue");
  return v3 >= *(_QWORD *)(a1 + 32) && v3 <= *(_QWORD *)(a1 + 40);
}

@end
