@implementation CVNLPDecodingLexicons

- (CVNLPDecodingLexicons)initWithLexicons:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  CVNLPDecodingLexicons *v14;

  v4 = a3;
  objc_msgSend_defaultDecodingWeight(CVNLPInformationStream, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultLowerBoundLogProbability(CVNLPInformationStream, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (CVNLPDecodingLexicons *)objc_msgSend_initWithLexicons_decodingWeight_lowerBoundLogProbability_(self, v13, (uint64_t)v4, (uint64_t)v8, v12);

  return v14;
}

- (CVNLPDecodingLexicons)initWithLexicons:(id)a3 decodingWeight:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  CVNLPDecodingLexicons *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend_defaultLowerBoundLogProbability(CVNLPInformationStream, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (CVNLPDecodingLexicons *)objc_msgSend_initWithLexicons_decodingWeight_lowerBoundLogProbability_(self, v12, (uint64_t)v6, (uint64_t)v7, v11);

  return v13;
}

- (CVNLPDecodingLexicons)initWithLexicons:(id)a3 decodingWeight:(id)a4 lowerBoundLogProbability:(id)a5
{
  return (CVNLPDecodingLexicons *)MEMORY[0x1E0DE7D20](self, sel_initWithLexicons_decodingWeight_lowerBoundLogProbability_inputNormalizationFunction_, a3, a4);
}

- (CVNLPDecodingLexicons)initWithLexicons:(id)a3 decodingWeight:(id)a4 lowerBoundLogProbability:(id)a5 inputNormalizationFunction:(void *)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CVNLPDecodingLexicons *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *sortedLexicons;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CVNLPDecodingLexicons;
  v16 = -[CVNLPInformationStream initWithDecodingWeight:lowerBoundLogProbability:](&v23, sel_initWithDecodingWeight_lowerBoundLogProbability_, v11, v12);
  if (v16)
  {
    objc_msgSend_allObjects(v10, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingComparator_(v17, v18, (uint64_t)&unk_1E60CDBA8, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    sortedLexicons = v16->_sortedLexicons;
    v16->_sortedLexicons = (NSArray *)v20;

    v16->_inputNormalizationFunction = a6;
  }

  return v16;
}

- (void)enumerateLexiconsSortedByPriorityWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  NSArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, char *))a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_sortedLexicons;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
      v12 = 0;
      v4[2](v4, v10, &v12);
      if (v12)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v13, (uint64_t)v17, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)lexiconsForPriority:(unint64_t)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  CVNLPDecodingLexicons *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;

  objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], a2, (uint64_t)CFSTR("priority == %lu"), v3, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v6, (uint64_t)self->_sortedLexicons, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredSetUsingPredicate_(v8, v9, (uint64_t)v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [CVNLPDecodingLexicons alloc];
  objc_msgSend_decodingWeight(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend_initWithLexicons_decodingWeight_(v12, v17, (uint64_t)v11, (uint64_t)v16);

  return v18;
}

- (id)packagedLexiconCursorsUsingTextDecodingContext:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  CVNLPLexiconCursors *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *, void *);
  void *v20;
  id v21;
  CVNLPDecodingLexicons *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  __n128 (*v27)(__n128 *, __n128 *);
  void (*v28)(uint64_t);
  void *v29;
  void *__p;
  void *v31;
  uint64_t v32;

  v4 = a3;
  v8 = v4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x4812000000;
  v27 = sub_1B0394E3C;
  v28 = sub_1B0394E60;
  v29 = &unk_1B03B5E12;
  __p = 0;
  v31 = 0;
  v32 = 0;
  if (v4)
  {
    objc_msgSend_activeSubstring(v4, v5, v6, v7);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = sub_1B0394E78;
  v20 = &unk_1E60CE560;
  v9 = v4;
  v21 = v9;
  v22 = self;
  v23 = &v24;
  objc_msgSend_enumerateLexiconsSortedByPriorityWithBlock_(self, v10, (uint64_t)&v17, v11);
  v12 = [CVNLPLexiconCursors alloc];
  v15 = (void *)objc_msgSend_initWithSortedCursors_(v12, v13, (uint64_t)(v25 + 6), v14, v17, v18, v19, v20);

  _Block_object_dispose(&v24, 8);
  if (__p)
  {
    v31 = __p;
    operator delete(__p);
  }

  return v15;
}

- (id)packagedLexiconRootCursors
{
  uint64_t v2;

  return (id)objc_msgSend_packagedLexiconCursorsUsingTextDecodingContext_(self, a2, 0, v2);
}

- (unint64_t)count
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->_sortedLexicons, a2, v2, v3);
}

- (void)inputNormalizationFunction
{
  return self->_inputNormalizationFunction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedLexicons, 0);
}

@end
