@implementation NSString(LocalizedFormat)

- (id)fp_localizedFormatWithKeys:()LocalizedFormat fromDictionary:error:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v18 = a1;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(v7, "fp_valueForKeyPath:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          if (a5)
          {
            FPNotSupportedError();
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_17;
        }
        v14 = v13;
        objc_opt_class();
        v15 = v14;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v14, 0, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            if (a5)
            {
              FPNotSupportedError();
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }

LABEL_17:
            v16 = 0;
            goto LABEL_18;
          }
        }
        objc_msgSend(v8, "addObject:", v15);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
        continue;
      break;
    }
  }

  objc_msgSend(v18, "fp_formatStringWithValues:error:", v8, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v16;
}

- (id)fp_formatStringWithValues:()LocalizedFormat error:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;

  v6 = a3;
  switch(objc_msgSend(v6, "count"))
  {
    case 0:
      v14 = a1;
      goto LABEL_4;
    case 1:
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", a1, CFSTR("%@"), a4, v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 2:
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", a1, CFSTR("%@%@"), a4, v17, v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", a1, CFSTR("%@%@%@"), a4, v17, v19, v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
      goto LABEL_17;
    case 4:
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", a1, CFSTR("%@%@%@%@"), a4, v23, v24, v25, v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    case 5:
      v27 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", a1, CFSTR("%@%@%@%@%@"), a4, v23, v28, v29, v30, v31);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    case 6:
      v32 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 5);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", a1, CFSTR("%@%@%@%@%@%@"), a4, v23, v28, v33, v34, v35, v36);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 7:
      v66 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 5);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 6);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", a1, CFSTR("%@%@%@%@%@%@%@"), a4, v23, v28, v33, v34, v35, v36, v37);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
LABEL_14:

LABEL_15:
      break;
    case 8:
      v67 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v63 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 5);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 6);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 7);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)v63;
      objc_msgSend(v67, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", a1, CFSTR("%@%@%@%@%@%@%@%@"), a4, v63, v60, v38, v39, v40, v41, v42, v43);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
      break;
    case 9:
      v61 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 5);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 6);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 7);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 8);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", a1, CFSTR("%@%@%@%@%@%@%@%@%@"), a4, v58, v68, v64, v44, v45, v46, v47, v48, v49);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 10:
      v65 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 5);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 6);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 7);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 8);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 9);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", a1, CFSTR("%@%@%@%@%@%@%@%@%@%@"), a4, v62, v69, v57, v59, v56, v50, v51, v52, v53, v54);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      FPLoc(CFSTR("TOO_MANY_FORMATS_%@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)a1);
      v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
      v15 = v14;
      break;
  }

  return v15;
}

@end
