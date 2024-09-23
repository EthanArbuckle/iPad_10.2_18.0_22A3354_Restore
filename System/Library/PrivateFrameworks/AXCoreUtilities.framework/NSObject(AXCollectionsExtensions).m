@implementation NSObject(AXCollectionsExtensions)

- (void)_ax_appendPrettyDescriptionToString:()AXCollectionsExtensions indentationString:visitedCollections:
{
  id v8;
  __CFString *v9;
  id v10;
  int v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  uint64_t v37;
  const __CFString *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  __CFString *v46;
  id v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(a1, "conformsToProtocol:", &unk_1EE147468);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _AXAssert(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AccessibilityLibraries/Source/AXCoreUtilities/source/DataStructures/NSObject+AXCollectionsExtensions.m", (void *)0x1B, (uint64_t)"-[NSObject(AXCollectionsExtensions) _ax_appendPrettyDescriptionToString:indentationString:visitedCollections:]", CFSTR("accumulatorString <%@: %p> was supposed to be a mutable string"), v14, v15, v16, (uint64_t)v13);

  }
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _AXAssert(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AccessibilityLibraries/Source/AXCoreUtilities/source/DataStructures/NSObject+AXCollectionsExtensions.m", (void *)0x1C, (uint64_t)"-[NSObject(AXCollectionsExtensions) _ax_appendPrettyDescriptionToString:indentationString:visitedCollections:]", CFSTR("indentationString <%@: %p> was supposed to be a mutable string"), v19, v20, v21, (uint64_t)v18);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _AXAssert(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AccessibilityLibraries/Source/AXCoreUtilities/source/DataStructures/NSObject+AXCollectionsExtensions.m", (void *)0x1D, (uint64_t)"-[NSObject(AXCollectionsExtensions) _ax_appendPrettyDescriptionToString:indentationString:visitedCollections:]", CFSTR("visitedCollections <%@: %p> was supposed to be a mutable set"), v24, v25, v26, (uint64_t)v23);

    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", a1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "containsObject:", v27))
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR("<%@: %p>"), v29, a1);

    }
    else
    {
      objc_msgSend(v10, "addObject:", v27);
      -[__CFString appendString:](v9, "appendString:", CFSTR("    "));
      v49 = 0;
      v50 = &v49;
      v51 = 0x2020000000;
      v52 = 0;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "appendString:", CFSTR("{"));
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __110__NSObject_AXCollectionsExtensions___ax_appendPrettyDescriptionToString_indentationString_visitedCollections___block_invoke;
        v44[3] = &unk_1E28C25B0;
        v48 = &v49;
        v45 = v8;
        v46 = v9;
        v47 = v10;
        objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v44);

        v31 = CFSTR("}");
        v32 = v45;
      }
      else
      {
        objc_msgSend(v8, "appendString:", CFSTR("["));
        v39 = v27;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v32 = a1;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
        if (v33)
        {
          v34 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v41 != v34)
                objc_enumerationMutation(v32);
              v36 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
              if (!*((_BYTE *)v50 + 24))
              {
                *((_BYTE *)v50 + 24) = 1;
                objc_msgSend(v8, "appendString:", CFSTR("\n"));
              }
              objc_msgSend(v8, "appendString:", v9);
              objc_msgSend(v36, "_ax_appendPrettyDescriptionToString:indentationString:visitedCollections:", v8, v9, v10);
              objc_msgSend(v8, "appendString:", CFSTR(",\n"));
            }
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
          }
          while (v33);
        }

        v27 = v39;
        v31 = CFSTR("]");
      }

      v37 = objc_msgSend(CFSTR("    "), "length");
      -[__CFString deleteCharactersInRange:](v9, "deleteCharactersInRange:", -[__CFString length](v9, "length") - v37, v37);
      objc_msgSend(v10, "removeObject:", v27);
      if (*((_BYTE *)v50 + 24))
        v38 = v9;
      else
        v38 = CFSTR(" ");
      objc_msgSend(v8, "appendString:", v38);
      objc_msgSend(v8, "appendString:", v31);
      _Block_object_dispose(&v49, 8);
    }

  }
  else
  {
    objc_msgSend(a1, "ax_prettyDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      objc_msgSend(v8, "appendString:", v30);
    else
      objc_msgSend(v8, "appendFormat:", CFSTR("%@"), 0);

  }
}

- (id)ax_prettyDescription
{
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1EE147468))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E28C88D8);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E28C88D8);
    v4 = (void *)objc_opt_new();
    objc_msgSend(a1, "_ax_appendPrettyDescriptionToString:indentationString:visitedCollections:", v2, v3, v4);

  }
  else
  {
    objc_msgSend(a1, "description");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

@end
