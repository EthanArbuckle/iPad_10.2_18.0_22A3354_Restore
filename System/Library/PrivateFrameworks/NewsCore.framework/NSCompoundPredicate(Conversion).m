@implementation NSCompoundPredicate(Conversion)

- (id)FCCKPQueryFiltersWithTranslator:()Conversion error:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(a1, "compoundPredicateType") != 1)
  {
    if (objc_msgSend(a1, "compoundPredicateType"))
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Unexpected expression: %@"), a1);
        v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      goto LABEL_41;
    }
    objc_msgSend(a1, "subpredicates");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v19, "compoundPredicateType"))
    {
      objc_msgSend(v19, "FCCKPQueryFiltersWithTranslator:error:", v6, a4);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Expected comparison subpredicate: %@"), a1);
LABEL_37:
        v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_40;
      }
LABEL_38:
      v17 = 0;
      goto LABEL_40;
    }
    objc_msgSend(v19, "FCCKPQueryFiltersWithTranslator:error:", v6, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v20 || objc_msgSend(v20, "count") != 1)
    {
      v17 = 0;
LABEL_34:

      if (v17)
      {
LABEL_40:

        goto LABEL_41;
      }
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Invalid NOT predicate: %@"), a1);
        goto LABEL_37;
      }
      goto LABEL_38;
    }
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v22)
    {
      if ((*(_BYTE *)(v22 + 28) & 1) != 0)
      {
        v17 = 0;
        switch(*(_DWORD *)(v22 + 24))
        {
          case 2:
            v24 = 1;
            goto LABEL_27;
          case 3:
            v24 = 4;
            goto LABEL_27;
          case 4:
            v24 = 3;
            goto LABEL_27;
          case 5:
            v24 = 8;
            goto LABEL_27;
          case 6:
            v24 = 7;
            goto LABEL_27;
          case 7:
            v24 = 6;
            goto LABEL_27;
          case 8:
            v24 = 5;
            goto LABEL_27;
          case 9:
          case 0xA:
          case 0xB:
            goto LABEL_29;
          case 0xC:
            v24 = 13;
            goto LABEL_27;
          case 0xD:
            v24 = 12;
            goto LABEL_27;
          case 0xE:
            v24 = 15;
            goto LABEL_27;
          case 0xF:
            v24 = 14;
            goto LABEL_27;
          case 0x10:
            v24 = 17;
            goto LABEL_27;
          case 0x11:
            v24 = 16;
            goto LABEL_27;
          case 0x12:
            v24 = 19;
            goto LABEL_27;
          case 0x13:
            v24 = 18;
            goto LABEL_27;
          case 0x14:
            v24 = 21;
            goto LABEL_27;
          case 0x15:
            v24 = 20;
            goto LABEL_27;
          default:
            goto LABEL_26;
        }
        goto LABEL_29;
      }
LABEL_26:
      v24 = 2;
LABEL_27:
      *(_BYTE *)(v22 + 28) |= 1u;
      *(_DWORD *)(v22 + 24) = v24;
    }
    v32[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

    goto LABEL_34;
  }
  v7 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(a1, "subpredicates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v28;
    while (2)
    {
      v13 = 0;
      v14 = v11;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
        v26 = v14;
        objc_msgSend(v15, "FCCKPQueryFiltersWithTranslator:error:", v6, &v26);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v26;

        objc_msgSend(v7, "addObjectsFromArray:", v16);
        if (a4 && v11)
        {
          v11 = objc_retainAutorelease(v11);
          *a4 = v11;

          v17 = 0;
          goto LABEL_18;
        }
        ++v13;
        v14 = v11;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }

  v17 = v7;
LABEL_18:

LABEL_41:
  return v17;
}

@end
