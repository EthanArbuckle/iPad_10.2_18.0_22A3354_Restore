@implementation NSMutableString

- (void)appendPrettyObject:(uint64_t)a3 withName:(int)a4 andIndent:(uint64_t)a5 options:(unint64_t)a6 depth:
{
  uint64_t v11;
  id v12;

  if (a1)
  {
    v11 = (4 * a4 + 4);
    v12 = a2;
    objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s%@ = "), v11, " ", a3);
    -[NSMutableString appendPrettyObject:withIndent:options:depth:](a1, v12, a4, a5, a6);

  }
}

- (void)appendPrettyObject:(int)a3 withIndent:(uint64_t)a4 options:(unint64_t)a5 depth:
{
  id v8;
  int v9;
  const char *v10;
  const char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t i;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  const char *v39;
  int v40;
  id v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v41 = a2;
  objc_opt_self();
  if (a5 > 4)
    goto LABEL_39;
  if ((isa_nsarray(v41) & 1) != 0 || isa_nsset(v41))
  {
    v8 = v41;
    v9 = isa_nsset(v8);
    v10 = "(";
    if (v9)
    {
      v10 = "{(";
      v11 = ")}";
    }
    else
    {
      v11 = ")";
    }
    objc_msgSend(a1, "appendFormat:", CFSTR("%s"), v10);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v13)
    {
      v14 = v13;
      v39 = v11;
      v15 = (a3 + 1);
      v16 = 4 * a3;
      v17 = *(_QWORD *)v44;
      v38 = v16;
      v18 = (v16 + 8);
      v19 = a5 + 1;
      do
      {
        v20 = v12;
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v44 != v17)
            objc_enumerationMutation(v20);
          v22 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s"), v18, " ");
          -[NSMutableString appendPrettyObject:withIndent:options:depth:](a1, v22, v15, a4, v19);
          objc_msgSend(a1, "appendFormat:", CFSTR(","));
        }
        v12 = v20;
        v14 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v14);

      objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s"), (v38 + 4), " ");
      v11 = v39;
    }
    else
    {

    }
    objc_msgSend(a1, "appendFormat:", CFSTR("%s"), v11);

    goto LABEL_36;
  }
  if (!isa_nsdictionary(v41))
  {
LABEL_39:
    if (isa_nsstring(v41))
    {
      v33 = v41;
      v34 = v33;
      if ((~(_DWORD)a4 & 3) != 0)
        objc_msgSend(a1, "appendFormat:", CFSTR("%@"), v33);
      else
        objc_msgSend(a1, "appendFormat:", CFSTR("<%lu-char-str>"), objc_msgSend(v33, "length"));

    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v35 = a3 + 1;
      objc_msgSend(v41, "descriptionWithIndent:options:", (a3 + 1), a4);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "appendFormat:", CFSTR("{%@"), v36);

      objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s}"), (4 * v35), " ");
    }
    else
    {
      objc_msgSend(v41, "description");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "appendFormat:", CFSTR("%@"), v37);

    }
    goto LABEL_36;
  }
  v23 = v41;
  objc_msgSend(a1, "appendFormat:", CFSTR("{"));
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v24 = v23;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v44;
    v40 = a3;
    v28 = (a3 + 1);
    v29 = a5 + 1;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v44 != v27)
          objc_enumerationMutation(v24);
        v31 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
        objc_msgSend(v24, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableString appendPrettyObject:withName:andIndent:options:depth:](a1, v32, v31, v28, a4, v29);
        objc_msgSend(a1, "appendFormat:", CFSTR(","));

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v26);

    objc_msgSend(a1, "appendFormat:", CFSTR("\n%*s"), (4 * v40 + 4), " ");
  }
  else
  {

  }
  objc_msgSend(a1, "appendString:", CFSTR("}"));

LABEL_36:
}

@end
