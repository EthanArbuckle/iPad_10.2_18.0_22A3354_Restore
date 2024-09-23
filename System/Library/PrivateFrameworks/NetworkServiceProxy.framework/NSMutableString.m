@implementation NSMutableString

- (void)appendPrettyObject:(void *)a3 withName:(int)a4 andIndent:(uint64_t)a5 options:
{
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  char isKindOfClass;
  const char *v14;
  const char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  id v25;
  char v26;
  void *v27;
  id v28;
  char v29;
  id v30;
  int v31;
  const char *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  id v45;
  char v46;
  uint64_t v47;
  void *v48;
  id v49;
  char v50;
  id v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  id v65;
  const char *v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  if (a1 && v8 && (a5 & 0xC) != 4)
  {
    objc_opt_class();
    v71 = a1;
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (v10 = v8, objc_opt_class(), v11 = objc_opt_isKindOfClass(), v10, (v11 & 1) != 0))
    {
      v12 = v8;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        v14 = ")}";
      else
        v14 = ")";
      v15 = "{(";
      if ((isKindOfClass & 1) == 0)
        v15 = "(";
      v64 = v9;
      v68 = (4 * a4 + 4);
      objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = %s"), v68, " ", v9, v15);
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v16 = v12;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
      if (v17)
      {
        v18 = v17;
        v66 = v14;
        v62 = v8;
        v19 = (4 * a4 + 8);
        v20 = (a4 + 2);
        v21 = *(_QWORD *)v77;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v77 != v21)
              objc_enumerationMutation(v16);
            v23 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v23, "descriptionWithIndent:options:", v20, a5);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "appendFormat:", CFSTR("\n%*s{%@"), v19, " ", v24);

              objc_msgSend(v71, "appendFormat:", CFSTR("\n%*s},"), v19, " ", v58);
            }
            else
            {
              v25 = v23;
              objc_opt_class();
              if (v25 && (v26 = objc_opt_isKindOfClass(), v25, (a5 & 3) == 3) && (v26 & 1) != 0)
              {
                objc_msgSend(v71, "appendFormat:", CFSTR("\n%*s<%lu-char-str>,"), v19, " ", objc_msgSend(v25, "length"));
              }
              else
              {
                objc_msgSend(v25, "description");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "appendFormat:", CFSTR("\n%*s%@,"), v19, " ", v27);

              }
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
        }
        while (v18);

        a1 = v71;
        objc_msgSend(v71, "appendFormat:", CFSTR("\n%*s"), v68, " ");
        v8 = v62;
        v14 = v66;
      }
      else
      {

      }
      objc_msgSend(a1, "appendFormat:", CFSTR("%s"), v14);

      v9 = v64;
    }
    else
    {
      v28 = v10;
      objc_opt_class();
      v29 = objc_opt_isKindOfClass();

      if ((v29 & 1) == 0)
      {
        v49 = v28;
        objc_opt_class();
        v50 = objc_opt_isKindOfClass();

        if ((v50 & 1) != 0)
        {
          objc_msgSend(v49, "UUIDString");
          v51 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = %@"), (4 * a4 + 4), " ", v9, v51);
        }
        else
        {
          if (isa_nsstring(v49))
          {
            if ((~(_DWORD)a5 & 3) != 0)
              objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = %@"), (4 * a4 + 4), " ", v9, v49);
            else
              objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = <%lu-char-str>"), (4 * a4 + 4), " ", v9, objc_msgSend(v49, "length"));
            goto LABEL_28;
          }
          if (isa_nsdata(v49))
          {
            v52 = (4 * a4 + 4);
            v53 = v49;
            v54 = objc_msgSend(v53, "length");
            objc_msgSend(v53, "description");
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = %u:%@"), v52, " ", v9, v54, v55);
            goto LABEL_28;
          }
          v51 = v49;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v51, "descriptionWithIndent:options:");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = {%@"), (4 * (a4 + 1)), " ", v9, v56);

            objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s}"), (4 * (a4 + 1)), " ", v59, v60);
          }
          else
          {
            objc_msgSend(v51, "description");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = %@"), (4 * a4 + 4), " ", v9, v57);

          }
        }

        goto LABEL_28;
      }
      v30 = v28;
      v31 = 4 * a4;
      v32 = " ";
      objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = {"), (4 * a4 + 4), " ", v9);
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v33 = v30;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
      if (v34)
      {
        v35 = v34;
        v61 = (v31 + 4);
        v63 = v8;
        v65 = v9;
        v69 = (v31 + 8);
        v67 = a4 + 2;
        v36 = *(_QWORD *)v73;
        do
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v73 != v36)
              objc_enumerationMutation(v33);
            v38 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j);
            objc_msgSend(v33, "objectForKeyedSubscript:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v39, "descriptionWithIndent:options:", v67, a5);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = {%@"), v69, v32, v38, v40);

              objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s},"), v69, v32);
            }
            else
            {
              v41 = v33;
              v42 = v36;
              v43 = v35;
              v44 = v32;
              v45 = v39;
              objc_opt_class();
              if (v45 && (v46 = objc_opt_isKindOfClass(), v45, (a5 & 3) == 3) && (v46 & 1) != 0)
              {
                v47 = objc_msgSend(v45, "length");
                v32 = v44;
                a1 = v71;
                objc_msgSend(v71, "appendFormat:", CFSTR("\n%*s%@ = <%lu-char-str>"), v69, v44, v38, v47);
              }
              else
              {
                objc_msgSend(v45, "description");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = v44;
                a1 = v71;
                objc_msgSend(v71, "appendFormat:", CFSTR("\n%*s%@ = %@"), v69, v44, v38, v48);

              }
              v35 = v43;
              v36 = v42;
              v33 = v41;
            }

          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
        }
        while (v35);

        objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s"), v61, v32);
        v8 = v63;
        v9 = v65;
      }
      else
      {

      }
      objc_msgSend(a1, "appendString:", CFSTR("}"));

    }
  }
LABEL_28:

}

- (void)appendPrettyBOOL:(uint64_t)a3 withName:(int)a4 andIndent:(char)a5 options:
{
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;

  if (result && (a5 & 0xC) != 4)
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    return (void *)objc_msgSend(result, "appendFormat:", CFSTR("\n%*s%@ = %@"), (4 * a4 + 4), " ", a3, v7, v5, v6);
  }
  return result;
}

- (void)appendPrettyInt:(uint64_t)a3 withName:(int)a4 andIndent:(char)a5 options:
{
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    if ((a5 & 0xC) != 4)
      return (void *)objc_msgSend(result, "appendFormat:", CFSTR("\n%*s%@ = %lld"), (4 * a4 + 4), " ", a3, a2, v5, v6);
  }
  return result;
}

@end
