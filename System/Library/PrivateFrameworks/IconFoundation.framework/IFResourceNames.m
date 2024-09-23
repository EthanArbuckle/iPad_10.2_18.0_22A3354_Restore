@implementation IFResourceNames

- (IFResourceNames)initWithRootNames:(id)a3
{
  return -[IFResourceNames initWithRootNames:variants:](self, "initWithRootNames:variants:", a3, 0);
}

- (IFResourceNames)initWithRootNames:(id)a3 variants:(id)a4
{
  id v6;
  id v7;
  IFResourceNames *v8;
  IFResourceNames *v9;
  uint64_t v10;
  NSSet *rootNames;
  uint64_t v12;
  NSArray *variants;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IFResourceNames;
  v8 = -[IFResourceNames init](&v15, sel_init);
  v9 = v8;
  if (v6 && v8)
  {
    v10 = objc_msgSend(v6, "copy");
    rootNames = v9->_rootNames;
    v9->_rootNames = (NSSet *)v10;

    v12 = objc_msgSend(v7, "copy");
    variants = v9->_variants;
    v9->_variants = (NSArray *)v12;

  }
  return v9;
}

- (id)extrapolateFullNamesForIOS
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  uint64_t v36;
  void *v37;
  IFResourceNames *v38;
  uint64_t v39;
  id obj;
  void *v41;
  __CFString *v42;
  uint64_t v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v38 = self;
  -[IFResourceNames rootNames](self, "rootNames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0x1E0CB3000uLL;
    v7 = *(_QWORD *)v59;
    v36 = *(_QWORD *)v59;
    v37 = v3;
    do
    {
      v8 = 0;
      v39 = v5;
      do
      {
        if (*(_QWORD *)v59 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v8);
        objc_msgSend(v9, "pathExtension", v36, v37);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v6 + 1280), "characterSetWithCharactersInString:", CFSTR("0123456789"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "invertedSet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[__CFString length](v10, "length")
          && -[__CFString rangeOfCharacterFromSet:](v10, "rangeOfCharacterFromSet:", v12) != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v9, "stringByDeletingPathExtension");
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {

          v13 = v9;
          v10 = CFSTR("png");
        }
        if (v13)
          v14 = v10 == 0;
        else
          v14 = 1;
        if (!v14)
        {
          v15 = (void *)objc_opt_new();
          objc_msgSend(v15, "addObject:", v13);
          if ((objc_msgSend(v13, "hasSuffix:", CFSTR("2x")) & 1) == 0)
          {
            objc_msgSend(v13, "stringByAppendingString:", CFSTR("@2x"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v16);

          }
          v41 = v12;
          v42 = v10;
          v43 = v8;
          if ((objc_msgSend(v13, "hasSuffix:", CFSTR("3x")) & 1) == 0)
          {
            objc_msgSend(v13, "stringByAppendingString:", CFSTR("@3x"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v17);

          }
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          -[IFResourceNames variants](v38, "variants");
          v45 = (id)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
          v44 = v13;
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v55;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v55 != v20)
                  objc_enumerationMutation(v45);
                v22 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
                if ((objc_msgSend(v13, "hasSuffix:", v22) & 1) == 0)
                {
                  v52 = 0u;
                  v53 = 0u;
                  v50 = 0u;
                  v51 = 0u;
                  v23 = (void *)objc_msgSend(v15, "copy");
                  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
                  if (v24)
                  {
                    v25 = v24;
                    v26 = *(_QWORD *)v51;
                    do
                    {
                      for (j = 0; j != v25; ++j)
                      {
                        if (*(_QWORD *)v51 != v26)
                          objc_enumerationMutation(v23);
                        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "stringByAppendingString:", v22);
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v15, "addObject:", v28);

                      }
                      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
                    }
                    while (v25);
                  }

                  v13 = v44;
                }
              }
              v19 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
            }
            while (v19);
          }

          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v29 = v15;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
          v7 = v36;
          v3 = v37;
          v10 = v42;
          v8 = v43;
          v12 = v41;
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v47;
            do
            {
              for (k = 0; k != v31; ++k)
              {
                if (*(_QWORD *)v47 != v32)
                  objc_enumerationMutation(v29);
                objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * k), "stringByAppendingPathExtension:", v42);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                if (v34)
                  objc_msgSend(v37, "addObject:", v34);

              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
            }
            while (v31);
          }

          v6 = 0x1E0CB3000;
          v5 = v39;
          v13 = v44;
        }

        ++v8;
      }
      while (v8 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)extrapolateFullNamesForMacOS
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __CFString *v10;
  id v11;
  BOOL v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[IFResourceNames rootNames](self, "rootNames", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "pathExtension");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (-[__CFString length](v10, "length"))
        {
          objc_msgSend(v9, "stringByDeletingPathExtension");
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {

          v11 = v9;
          v10 = CFSTR("icns");
        }
        if (v10)
          v12 = v11 == 0;
        else
          v12 = 1;
        if (!v12)
        {
          objc_msgSend(v11, "stringByAppendingPathExtension:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v3, "addObject:", v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSSet)rootNames
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)variants
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variants, 0);
  objc_storeStrong((id *)&self->_rootNames, 0);
}

@end
