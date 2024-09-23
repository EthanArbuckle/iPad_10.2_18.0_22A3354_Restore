@implementation CKDPQuery

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const char *v11;
  NSMutableArray *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  const char *v18;
  NSMutableArray *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  const char *v25;
  char has;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self->_types;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v35, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v35, v41, 16);
    }
    while (v8);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = self->_filters;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v31, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v31, v40, 16);
    }
    while (v15);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = self->_sorts;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v27, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v25, (uint64_t)&v27, v39, 16);
    }
    while (v22);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)addFilters:(id)a3
{
  const char *v4;
  NSMutableArray *filters;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  filters = self->_filters;
  v8 = (char *)v4;
  if (!filters)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_filters;
    self->_filters = v6;

    v4 = v8;
    filters = self->_filters;
  }
  objc_msgSend_addObject_(filters, v4, (uint64_t)v4);

}

- (void)addTypes:(id)a3
{
  const char *v4;
  NSMutableArray *types;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  types = self->_types;
  v8 = (char *)v4;
  if (!types)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_types;
    self->_types = v6;

    v4 = v8;
    types = self->_types;
  }
  objc_msgSend_addObject_(types, v4, (uint64_t)v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_sorts, 0);
  objc_storeStrong((id *)&self->_filters, 0);
}

- (void)clearTypes
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_types, a2, v2);
}

- (unint64_t)typesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_types, a2, v2);
}

- (id)typesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_types, a2, a3);
}

+ (Class)typesType
{
  return (Class)objc_opt_class();
}

- (void)clearFilters
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_filters, a2, v2);
}

- (unint64_t)filtersCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_filters, a2, v2);
}

- (id)filtersAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_filters, a2, a3);
}

+ (Class)filtersType
{
  return (Class)objc_opt_class();
}

- (void)clearSorts
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_sorts, a2, v2);
}

- (void)addSorts:(id)a3
{
  const char *v4;
  NSMutableArray *sorts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  sorts = self->_sorts;
  v8 = (char *)v4;
  if (!sorts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_sorts;
    self->_sorts = v6;

    v4 = v8;
    sorts = self->_sorts;
  }
  objc_msgSend_addObject_(sorts, v4, (uint64_t)v4);

}

- (unint64_t)sortsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_sorts, a2, v2);
}

- (id)sortsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_sorts, a2, a3);
}

+ (Class)sortsType
{
  return (Class)objc_opt_class();
}

- (void)setDistinct:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_distinct = a3;
}

- (void)setHasDistinct:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDistinct
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)queryOperator
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_queryOperator;
  else
    return 1;
}

- (void)setQueryOperator:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_queryOperator = a3;
}

- (void)setHasQueryOperator:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasQueryOperator
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)queryOperatorAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("AND");
  if (a3 == 2)
  {
    v3 = CFSTR("OR");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsQueryOperator:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;

  v3 = a3;
  v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("AND")) & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("OR")))
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPQuery;
  -[CKDPQuery description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  NSMutableArray *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  NSMutableArray *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  NSMutableArray *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  void *v60;
  const char *v61;
  const char *v62;
  char has;
  void *v64;
  const char *v65;
  int queryOperator;
  __CFString *v67;
  const char *v68;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(self->_types, v5, v6))
  {
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v12 = objc_msgSend_count(self->_types, v10, v11);
    v14 = (void *)objc_msgSend_initWithCapacity_(v9, v13, v12);
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v15 = self->_types;
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v78, v84, 16);
    if (v17)
    {
      v20 = v17;
      v21 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v79 != v21)
            objc_enumerationMutation(v15);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v78 + 1) + 8 * i), v18, v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v14, v24, (uint64_t)v23);

        }
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v78, v84, 16);
      }
      while (v20);
    }

    objc_msgSend_setObject_forKey_(v4, v25, (uint64_t)v14, CFSTR("types"));
  }
  if (objc_msgSend_count(self->_filters, v7, v8))
  {
    v28 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v31 = objc_msgSend_count(self->_filters, v29, v30);
    v33 = (void *)objc_msgSend_initWithCapacity_(v28, v32, v31);
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v34 = self->_filters;
    v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v74, v83, 16);
    if (v36)
    {
      v39 = v36;
      v40 = *(_QWORD *)v75;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v75 != v40)
            objc_enumerationMutation(v34);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v74 + 1) + 8 * j), v37, v38);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v33, v43, (uint64_t)v42);

        }
        v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v74, v83, 16);
      }
      while (v39);
    }

    objc_msgSend_setObject_forKey_(v4, v44, (uint64_t)v33, CFSTR("filters"));
  }
  if (objc_msgSend_count(self->_sorts, v26, v27))
  {
    v46 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v49 = objc_msgSend_count(self->_sorts, v47, v48);
    v51 = (void *)objc_msgSend_initWithCapacity_(v46, v50, v49);
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v52 = self->_sorts;
    v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v70, v82, 16);
    if (v54)
    {
      v57 = v54;
      v58 = *(_QWORD *)v71;
      do
      {
        for (k = 0; k != v57; ++k)
        {
          if (*(_QWORD *)v71 != v58)
            objc_enumerationMutation(v52);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v70 + 1) + 8 * k), v55, v56);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v51, v61, (uint64_t)v60);

        }
        v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v55, (uint64_t)&v70, v82, 16);
      }
      while (v57);
    }

    objc_msgSend_setObject_forKey_(v4, v62, (uint64_t)v51, CFSTR("sorts"));
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v45, self->_distinct);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v65, (uint64_t)v64, CFSTR("distinct"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    queryOperator = self->_queryOperator;
    if (queryOperator == 1)
    {
      v67 = CFSTR("AND");
      objc_msgSend_setObject_forKey_(v4, v45, (uint64_t)CFSTR("AND"), CFSTR("queryOperator"));
    }
    else if (queryOperator == 2)
    {
      v67 = CFSTR("OR");
      objc_msgSend_setObject_forKey_(v4, v45, (uint64_t)CFSTR("OR"), CFSTR("queryOperator"));
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v45, (uint64_t)CFSTR("(unknown: %i)"), self->_queryOperator);
      v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v4, v68, (uint64_t)v67, CFSTR("queryOperator"));
    }

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB0F0CC((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  const char *v33;
  char has;
  id v35;

  v35 = a3;
  if (objc_msgSend_typesCount(self, v4, v5))
  {
    objc_msgSend_clearTypes(v35, v6, v7);
    v10 = objc_msgSend_typesCount(self, v8, v9);
    if (v10)
    {
      v11 = v10;
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend_typesAtIndex_(self, v6, i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addTypes_(v35, v14, (uint64_t)v13);

      }
    }
  }
  if (objc_msgSend_filtersCount(self, v6, v7))
  {
    objc_msgSend_clearFilters(v35, v15, v16);
    v19 = objc_msgSend_filtersCount(self, v17, v18);
    if (v19)
    {
      v20 = v19;
      for (j = 0; j != v20; ++j)
      {
        objc_msgSend_filtersAtIndex_(self, v15, j);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addFilters_(v35, v23, (uint64_t)v22);

      }
    }
  }
  if (objc_msgSend_sortsCount(self, v15, v16))
  {
    objc_msgSend_clearSorts(v35, v24, v25);
    v28 = objc_msgSend_sortsCount(self, v26, v27);
    if (v28)
    {
      v30 = v28;
      for (k = 0; k != v30; ++k)
      {
        objc_msgSend_sortsAtIndex_(self, v29, k);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addSorts_(v35, v33, (uint64_t)v32);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)v35 + 40) = self->_distinct;
    *((_BYTE *)v35 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v35 + 4) = self->_queryOperator;
    *((_BYTE *)v35 + 44) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  const char *v19;
  NSMutableArray *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  const char *v28;
  NSMutableArray *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  const char *v37;
  char has;
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
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v11 = self->_types;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v48, v54, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v49 != v16)
          objc_enumerationMutation(v11);
        v18 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v48 + 1) + 8 * i), v14, (uint64_t)a3);
        objc_msgSend_addTypes_((void *)v10, v19, (uint64_t)v18);

      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v48, v54, 16);
    }
    while (v15);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v20 = self->_filters;
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v44, v53, 16);
  if (v22)
  {
    v24 = v22;
    v25 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v45 != v25)
          objc_enumerationMutation(v20);
        v27 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v44 + 1) + 8 * j), v23, (uint64_t)a3);
        objc_msgSend_addFilters_((void *)v10, v28, (uint64_t)v27);

      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v44, v53, 16);
    }
    while (v24);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v29 = self->_sorts;
  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v40, v52, 16);
  if (v31)
  {
    v33 = v31;
    v34 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v41 != v34)
          objc_enumerationMutation(v29);
        v36 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v40 + 1) + 8 * k), v32, (uint64_t)a3, (_QWORD)v40);
        objc_msgSend_addSorts_((void *)v10, v37, (uint64_t)v36);

      }
      v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v40, v52, 16);
    }
    while (v33);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v10 + 40) = self->_distinct;
    *(_BYTE *)(v10 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v10 + 16) = self->_queryOperator;
    *(_BYTE *)(v10 + 44) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSMutableArray *types;
  uint64_t v9;
  NSMutableArray *filters;
  uint64_t v11;
  NSMutableArray *sorts;
  uint64_t v13;
  BOOL v14;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_20;
  types = self->_types;
  v9 = v4[4];
  if ((unint64_t)types | v9)
  {
    if (!objc_msgSend_isEqual_(types, v7, v9))
      goto LABEL_20;
  }
  filters = self->_filters;
  v11 = v4[1];
  if ((unint64_t)filters | v11)
  {
    if (!objc_msgSend_isEqual_(filters, v7, v11))
      goto LABEL_20;
  }
  sorts = self->_sorts;
  v13 = v4[3];
  if ((unint64_t)sorts | v13)
  {
    if (!objc_msgSend_isEqual_(sorts, v7, v13))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) != 0)
    {
      if (self->_distinct)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_20;
        goto LABEL_16;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_16;
    }
LABEL_20:
    v14 = 0;
    goto LABEL_21;
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
    goto LABEL_20;
LABEL_16:
  v14 = (*((_BYTE *)v4 + 44) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_queryOperator != *((_DWORD *)v4 + 4))
      goto LABEL_20;
    v14 = 1;
  }
LABEL_21:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = objc_msgSend_hash(self->_types, a2, v2);
  v7 = objc_msgSend_hash(self->_filters, v5, v6);
  v10 = objc_msgSend_hash(self->_sorts, v8, v9);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v11 = 2654435761 * self->_distinct;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    return v7 ^ v4 ^ v10 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v12 = 2654435761 * self->_queryOperator;
  return v7 ^ v4 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = *((id *)v4 + 4);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v35, v41, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v5);
        objc_msgSend_addTypes_(self, v8, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v35, v41, 16);
    }
    while (v9);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = *((id *)v4 + 1);
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v31, v40, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v12);
        objc_msgSend_addFilters_(self, v15, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v31, v40, 16);
    }
    while (v16);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = *((id *)v4 + 3);
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v27, v39, 16);
  if (v21)
  {
    v23 = v21;
    v24 = *(_QWORD *)v28;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(v19);
        objc_msgSend_addSorts_(self, v22, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * k), (_QWORD)v27);
      }
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v27, v39, 16);
    }
    while (v23);
  }

  v26 = *((_BYTE *)v4 + 44);
  if ((v26 & 2) != 0)
  {
    self->_distinct = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 2u;
    v26 = *((_BYTE *)v4 + 44);
  }
  if ((v26 & 1) != 0)
  {
    self->_queryOperator = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSMutableArray)types
{
  return self->_types;
}

- (void)setTypes:(id)a3
{
  objc_storeStrong((id *)&self->_types, a3);
}

- (NSMutableArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
  objc_storeStrong((id *)&self->_filters, a3);
}

- (NSMutableArray)sorts
{
  return self->_sorts;
}

- (void)setSorts:(id)a3
{
  objc_storeStrong((id *)&self->_sorts, a3);
}

- (BOOL)distinct
{
  return self->_distinct;
}

@end
