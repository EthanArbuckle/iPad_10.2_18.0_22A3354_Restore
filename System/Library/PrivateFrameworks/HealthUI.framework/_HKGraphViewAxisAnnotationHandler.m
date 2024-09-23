@implementation _HKGraphViewAxisAnnotationHandler

- (_HKGraphViewAxisAnnotationHandler)init
{
  _HKGraphViewAxisAnnotationHandler *v2;
  _HKGraphViewAxisAnnotationHandler *v3;
  NSMapTable *seriesToAnnotations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKGraphViewAxisAnnotationHandler;
  v2 = -[_HKGraphViewAxisAnnotationHandler init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    seriesToAnnotations = v2->_seriesToAnnotations;
    v2->_seriesToAnnotations = 0;

    v3->_clearedPreviousAnnotations = 0;
  }
  return v3;
}

- (void)startAnnotationSequence
{
  NSMapTable *seriesToAnnotations;
  NSMapTable *v4;

  seriesToAnnotations = self->_seriesToAnnotations;
  if (seriesToAnnotations)
  {
    -[_HKGraphViewAxisAnnotationHandler clearAxisAnnotations](self, "clearAxisAnnotations");
    v4 = self->_seriesToAnnotations;
    LOBYTE(seriesToAnnotations) = 1;
  }
  else
  {
    v4 = 0;
  }
  self->_clearedPreviousAnnotations = (char)seriesToAnnotations;
  self->_seriesToAnnotations = 0;

}

- (void)addAxisAnnotation:(id)a3 forSeries:(id)a4 modelCoordinate:(id)a5
{
  id v8;
  id v9;
  NSMapTable *seriesToAnnotations;
  NSMapTable *v11;
  NSMapTable *v12;
  id v13;
  _HKGraphViewAnnotationEntry *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  seriesToAnnotations = self->_seriesToAnnotations;
  if (!seriesToAnnotations)
  {
    v11 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 5);
    v12 = self->_seriesToAnnotations;
    self->_seriesToAnnotations = v11;

    seriesToAnnotations = self->_seriesToAnnotations;
  }
  -[NSMapTable objectForKey:](seriesToAnnotations, "objectForKey:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMapTable setObject:forKey:](self->_seriesToAnnotations, "setObject:forKey:", v13, v8);
  }
  v14 = objc_alloc_init(_HKGraphViewAnnotationEntry);
  -[_HKGraphViewAnnotationEntry setAnnotation:](v14, "setAnnotation:", v15);
  -[_HKGraphViewAnnotationEntry setModelCoordinate:](v14, "setModelCoordinate:", v9);
  objc_msgSend(v13, "addObject:", v14);

}

- (int64_t)applyAnnotationForSeries:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t j;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  void *v27;
  void *v28;
  void *v29;
  int64_t v30;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_seriesToAnnotations)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v32 = v4;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v50 != v8)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "yAxis");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v5, "containsObject:", v10) & 1) == 0)
            objc_msgSend(v5, "addObject:", v10);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v7);
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v33 = v5;
    v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v35)
    {
      v34 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v46 != v34)
            objc_enumerationMutation(v33);
          v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v14 = obj;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v42;
            do
            {
              for (k = 0; k != v16; ++k)
              {
                if (*(_QWORD *)v42 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
                objc_msgSend(v19, "yAxis");
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                if (v20 == v12)
                {
                  -[NSMapTable objectForKey:](self->_seriesToAnnotations, "objectForKey:", v19);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "addObjectsFromArray:", v21);

                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
            }
            while (v16);
          }

          objc_msgSend(v12, "clearAnnotations");
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v22 = v13;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v38;
            do
            {
              for (m = 0; m != v24; ++m)
              {
                if (*(_QWORD *)v38 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * m);
                objc_msgSend(v27, "annotation");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "modelCoordinate");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "addAxisAnnotation:modelCoordinate:", v28, v29);

              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
            }
            while (v24);
          }

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      }
      while (v35);
    }

    v30 = 1;
    v4 = v32;
  }
  else
  {
    v30 = 2 * self->_clearedPreviousAnnotations;
  }

  return v30;
}

- (void)_forceClearAxisAnnotations
{
  NSMapTable *seriesToAnnotations;
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  seriesToAnnotations = self->_seriesToAnnotations;
  if (seriesToAnnotations)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = seriesToAnnotations;
    v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "yAxis", (_QWORD)v9);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "clearAnnotations");

          ++v7;
        }
        while (v5 != v7);
        v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (NSMapTable)seriesToAnnotations
{
  return self->_seriesToAnnotations;
}

- (void)setSeriesToAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_seriesToAnnotations, a3);
}

- (BOOL)clearedPreviousAnnotations
{
  return self->_clearedPreviousAnnotations;
}

- (void)setClearedPreviousAnnotations:(BOOL)a3
{
  self->_clearedPreviousAnnotations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesToAnnotations, 0);
}

@end
