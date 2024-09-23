@implementation _MNLPRPlateCharacter

- (id)valueMappings
{
  if (a1)
  {
    objc_msgSend(a1[1], "array");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)isOfType:(void *)a3 alphabetics:(void *)a4 numerics:
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if (a2 == 1)
    {
      a1 = 1;
    }
    else
    {
      if (a2 == 2)
      {
        v9 = *(void **)(a1 + 32);
        v10 = v7;
      }
      else
      {
        if (a2 != 3)
        {
          a1 = 0;
          goto LABEL_10;
        }
        v9 = *(void **)(a1 + 32);
        v10 = v8;
      }
      a1 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v10) == 0;
    }
  }
LABEL_10:

  return a1;
}

- (id)_validReplacements:(uint64_t)a1
{
  void *v3;
  id *v4;
  id v5;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  __CFString *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __CFString *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (id *)(a1 + 16);
  v3 = *(void **)(a1 + 16);
  if (v3)
  {
    v5 = v3;
    return v5;
  }
  if (*(_BYTE *)(a1 + 24))
  {
    if (!objc_msgSend(*(id *)(a1 + 8), "count"))
    {
      v57[0] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    objc_msgSend(*(id *)(a1 + 8), "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v9 = objc_msgSend(*(id *)(a1 + 40), "count");
  v10 = *(void **)(a1 + 40);
  if (v9 != 1)
  {
    if ((unint64_t)objc_msgSend(v10, "count") < 2)
    {
      _mnLPRWrappedError(a2, -104, 0, CFSTR("For character \"%@\"), v18, v19, v20, v21, *(_QWORD *)(a1 + 32));
      objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 2191, 0, CFSTR("NoRulesApplyToCharacter"));
      v8 = 0;
      goto LABEL_17;
    }
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", &unk_1E620F038);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", &unk_1E620F050);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", &unk_1E620F068);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 && v24)
    {
      _mnLPRWrappedError(a2, -102, 0, CFSTR("Invalid fill for character \"%@\"), v25, v26, v27, v28, *(_QWORD *)(a1 + 32));
      v29 = (void *)MEMORY[0x1E0D263E8];
      v30 = CFSTR("InvalidFillRules");
    }
    else
    {
      if (v24)
        v37 = 3;
      else
        v37 = 1;
      if (v23)
        v38 = 2;
      else
        v38 = v37;
      v39 = *(void **)(a1 + 40);
      if (v23 || v24 || v22)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v38);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", v44);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "mnlpr_componentsSeparatedByGlyph");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
          goto LABEL_10;
        v49 = off_1E61D2F48[v38 - 1];
        _mnLPRWrappedError(a2, -101, 0, CFSTR("Unsplittable fill %@ \"%@\"), v45, v46, v47, v48, (uint64_t)v49);

LABEL_24:
        objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 2191, 0, CFSTR("UnableSplitString"));

        return 0;
      }
      objc_msgSend(*(id *)(a1 + 40), "allKeys");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "firstObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "intValue");

      if ((v42 - 1) >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v42);
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v43 = off_1E61D2F48[(int)v42 - 1];
      }
      v50 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v42);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKeyedSubscript:", v51);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      _mnLPRWrappedError(a2, -103, 0, CFSTR("Unknown fill %@ \"%@\"), v52, v53, v54, v55, (uint64_t)v43);

      v29 = (void *)MEMORY[0x1E0D263E8];
      v30 = CFSTR("UnknownFillType");
    }
    objc_msgSend(v29, "captureUserAction:target:value:", 2191, 0, v30);
    return 0;
  }
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "mnlpr_componentsSeparatedByGlyph");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    _mnLPRWrappedError(a2, -101, 0, CFSTR("Unsplittable fill \"%@\"), v14, v15, v16, v17, (uint64_t)v12);
    goto LABEL_24;
  }
LABEL_10:
  v8 = (void *)v13;

LABEL_17:
  if (!objc_msgSend(v8, "count"))
  {
LABEL_21:
    v31 = *v4;

    return v31;
  }
  if ((objc_msgSend(v8, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) != 0
    || (unint64_t)objc_msgSend(v8, "count") >= 0xA)
  {
    objc_storeStrong(v4, v8);
    goto LABEL_21;
  }
  v32 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "count");
  _mnLPRWrappedError(a2, -107, 0, CFSTR("Self missing in fill for character \"%@\" with only %d valid replacements"), v33, v34, v35, v36, v32);
  objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 2191, 0, CFSTR("MappingDoesNotIncludeSelf"));

  return 0;
}

- (uint64_t)validReplacementCount:(uint64_t)result
{
  void *v2;
  uint64_t v3;

  if (result)
  {
    -[_MNLPRPlateCharacter _validReplacements:](result, a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");

    return v3;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_isPickupChar)
    v7 = "YES";
  else
    v7 = "NO";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> \"%@\" { pickup: %s"), v5, self, self->_glyph, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSMutableDictionary count](self->_fillTypes, "count"))
  {
    v21 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_fillTypes, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = self->_fillTypes;
    v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "intValue");
          if ((v15 - 1) >= 3)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = off_1E61D2F48[(int)v15 - 1];
          }
          objc_msgSend(v9, "addObject:", v16);

        }
        v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v21;
    objc_msgSend(v21, "appendFormat:", CFSTR(" fills: [%@]"), v17);

  }
  if (-[NSMutableOrderedSet count](self->_valueMappings, "count"))
  {
    -[NSMutableOrderedSet array](self->_valueMappings, "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(" mappings: [%@]"), v19);

  }
  objc_msgSend(v8, "appendString:", CFSTR("}"));
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillTypes, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_validReplacementChars, 0);
  objc_storeStrong((id *)&self->_valueMappings, 0);
}

@end
