@implementation NSMutableString(NEPrettyPrint)

- (void)appendPrettyObject:()NEPrettyPrint withName:indent:showFullContent:
{
  id v9;
  id v10;
  id v11;
  char isKindOfClass;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  char v26;
  id v27;
  const char *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  id v41;
  char v42;
  void *v43;
  id v44;
  char v45;
  id v46;
  id v47;
  char v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  unsigned int v57;
  uint64_t v58;
  id obj;
  unint64_t obja;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (v9)
  {
    v11 = v9;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v56 = v9;
      v13 = v11;
      v55 = v10;
      v58 = (4 * a5 + 4);
      objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = ("), v58, " ", v10);
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      obj = v13;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
      if (v14)
      {
        v15 = v14;
        v16 = (4 * a5 + 8);
        v17 = (a5 + 2);
        v18 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v67 != v18)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v22 = (void *)objc_msgSend(v21, "descriptionWithIndent:showFullContent:", v17, a6);
              objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s{%@"), v16, " ", v22);

              objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s},"), v16, " ", v51);
            }
            else
            {
              v23 = v21;
              objc_opt_class();
              v24 = objc_opt_isKindOfClass();

              if ((v24 & 1) == 0 || (a6 & 1) != 0)
              {
                objc_msgSend(v23, "description");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@,"), v16, " ", v20);

              }
              else
              {
                objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s<%lu-char-str>,"), v16, " ", objc_msgSend(v23, "length"));
              }
            }
          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
        }
        while (v15);
      }

      objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s)"), v58, " ");
LABEL_37:
      v10 = v55;
      v9 = v56;
      goto LABEL_38;
    }
    v25 = v11;
    objc_opt_class();
    v26 = objc_opt_isKindOfClass();

    if ((v26 & 1) != 0)
    {
      v56 = v9;
      v27 = v25;
      v54 = (4 * a5 + 4);
      v55 = v10;
      v28 = " ";
      objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = {"), v54, " ", v10);
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v29 = v27;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      if (v30)
      {
        v31 = v30;
        obja = (4 * a5 + 8);
        v57 = a5 + 2;
        v32 = *(_QWORD *)v63;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v63 != v32)
              objc_enumerationMutation(v29);
            v35 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
            objc_msgSend(v29, "objectForKeyedSubscript:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v34 = (void *)objc_msgSend(v36, "descriptionWithIndent:showFullContent:", v57, a6);
              objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = {%@"), obja, v28, v35, v34);

              objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s},"), obja, v28);
            }
            else
            {
              v37 = v29;
              v38 = v32;
              v39 = v31;
              v40 = v28;
              v41 = v36;
              objc_opt_class();
              v42 = objc_opt_isKindOfClass();

              if ((v42 & 1) == 0 || (a6 & 1) != 0)
              {
                objc_msgSend(v41, "description");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v40;
                objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = %@"), obja, v40, v35, v43);

              }
              else
              {
                v28 = v40;
                objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = <%lu-char-str>"), obja, v40, v35, objc_msgSend(v41, "length"));
              }
              v31 = v39;
              v32 = v38;
              v29 = v37;
            }

          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
        }
        while (v31);
      }

      objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s}"), v54, v28);
      goto LABEL_37;
    }
    v44 = v25;
    objc_opt_class();
    v45 = objc_opt_isKindOfClass();

    if ((v45 & 1) != 0)
    {
      objc_msgSend(v44, "UUIDString");
      v46 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = %@"), (4 * a5 + 4), " ", v10, v46);
LABEL_35:

      goto LABEL_38;
    }
    v47 = v44;
    objc_opt_class();
    v48 = objc_opt_isKindOfClass();

    if ((v48 & 1) == 0)
    {
      v46 = v47;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v49 = (void *)objc_msgSend(v46, "descriptionWithIndent:showFullContent:");
        objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = {%@"), (4 * (a5 + 1)), " ", v10, v49);

        objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s}"), (4 * (a5 + 1)), " ", v52, v53);
      }
      else
      {
        objc_msgSend(v46, "description");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = %@"), (4 * a5 + 4), " ", v10, v50);

      }
      goto LABEL_35;
    }
    if ((a6 & 1) != 0)
      objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = %@"), (4 * a5 + 4), " ", v10, v47);
    else
      objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = <%lu-char-str>"), (4 * a5 + 4), " ", v10, objc_msgSend(v47, "length"));
  }
LABEL_38:

}

- (uint64_t)appendPrettyInt:()NEPrettyPrint withName:indent:
{
  return objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = %d"), (4 * a5 + 4), " ", a4, a3);
}

- (uint64_t)appendPrettyBOOL:()NEPrettyPrint withName:indent:
{
  const __CFString *v5;

  v5 = CFSTR("NO");
  if (a3)
    v5 = CFSTR("YES");
  return objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = %@"), (4 * a5 + 4), " ", a4, v5);
}

@end
