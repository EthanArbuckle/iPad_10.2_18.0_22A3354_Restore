@implementation IMOrderedMutableDictionary

- (IMOrderedMutableDictionary)init
{
  IMOrderedMutableDictionary *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dictionary;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *mutableOrderedSet;
  NSArray *orderedItems;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMOrderedMutableDictionary;
  v2 = -[IMOrderedMutableDictionary init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;

    v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    mutableOrderedSet = v2->_mutableOrderedSet;
    v2->_mutableOrderedSet = v5;

    orderedItems = v2->_orderedItems;
    v2->_orderedItems = 0;

  }
  return v2;
}

- (unint64_t)count
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->_mutableOrderedSet, a2, v2, v3);
}

- (void)setOrderedObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSMutableOrderedSet *mutableOrderedSet;
  const char *v15;
  void *v16;
  _BYTE *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void (*v25)(void *);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  NSArray *orderedItems;
  void *v40;
  _BYTE *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  void (*v49)(void *);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;

  v6 = a3;
  v7 = a4;
  v10 = v7;
  if (v6)
  {
    if (v7)
    {
      v11 = objc_msgSend_indexOfObject_(self->_mutableOrderedSet, v8, (uint64_t)v7, v9);
      mutableOrderedSet = self->_mutableOrderedSet;
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend_addObject_(self->_mutableOrderedSet, v12, (uint64_t)v10, v13);
      }
      else
      {
        objc_msgSend_indexSetWithIndex_(MEMORY[0x1E0CB36B8], v12, v11, v13);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend_count(self->_mutableOrderedSet, v34, v35, v36);
        objc_msgSend_moveObjectsAtIndexes_toIndex_(mutableOrderedSet, v38, (uint64_t)v33, v37 - 1);

      }
      objc_msgSend_setObject_forKey_(self->_dictionary, v15, (uint64_t)v6, (uint64_t)v10);
      orderedItems = self->_orderedItems;
      self->_orderedItems = 0;

      goto LABEL_15;
    }
    goto LABEL_11;
  }
  v57 = xmmword_1E2C45FD8;
  v58 = *(_OWORD *)off_1E2C45FE8;
  v59 = 40;
  v16 = (void *)MEMORY[0x1E0CB3940];
  v17 = IMFileLocationTrimFileName(&v57);
  v18 = v59;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v19, (uint64_t)&stru_1E2C46CC8, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v16, v22, (uint64_t)CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), v23, CFSTR("object"), "-[IMOrderedMutableDictionary setOrderedObject:forKey:]", v17, v18, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v25)
    v25(v24);
  else
    _IMWarn(CFSTR("ASSERTION FAILED: %@"), v26, v27, v28, v29, v30, v31, v32, (char)v24);

  if (!v10)
  {
LABEL_11:
    v57 = xmmword_1E2C46000;
    v58 = *(_OWORD *)off_1E2C46010;
    v59 = 41;
    v40 = (void *)MEMORY[0x1E0CB3940];
    v41 = IMFileLocationTrimFileName(&v57);
    v42 = v59;
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v43, (uint64_t)&stru_1E2C46CC8, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v40, v46, (uint64_t)CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), v47, CFSTR("key"), "-[IMOrderedMutableDictionary setOrderedObject:forKey:]", v41, v42, v45);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v49)
      v49(v48);
    else
      _IMWarn(CFSTR("ASSERTION FAILED: %@"), v50, v51, v52, v53, v54, v55, v56, (char)v48);

  }
LABEL_15:

}

- (id)orderedObjectForKey:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _BYTE *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void (*v16)(void *);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _OWORD v26[2];
  uint64_t v27;

  v6 = a3;
  if (!v6)
  {
    v26[0] = xmmword_1E2C46028;
    v26[1] = *(_OWORD *)off_1E2C46038;
    v27 = 56;
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = IMFileLocationTrimFileName(v26);
    v9 = v27;
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v10, (uint64_t)&stru_1E2C46CC8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v7, v13, (uint64_t)CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), v14, CFSTR("key"), "-[IMOrderedMutableDictionary orderedObjectForKey:]", v8, v9, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v16)
      v16(v15);
    else
      _IMWarn(CFSTR("ASSERTION FAILED: %@"), v17, v18, v19, v20, v21, v22, v23, (char)v15);

  }
  objc_msgSend_objectForKey_(self->_dictionary, v4, (uint64_t)v6, v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)removeOrderedObjectForKey:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  NSArray *orderedItems;
  void *v10;
  _BYTE *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void (*v19)(void *);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD v27[2];
  uint64_t v28;

  v6 = a3;
  if (v6)
  {
    objc_msgSend_removeObject_(self->_mutableOrderedSet, v4, (uint64_t)v6, v5);
    objc_msgSend_removeObjectForKey_(self->_dictionary, v7, (uint64_t)v6, v8);
    orderedItems = self->_orderedItems;
    self->_orderedItems = 0;

  }
  else
  {
    v27[0] = xmmword_1E2C46050;
    v27[1] = *(_OWORD *)off_1E2C46060;
    v28 = 61;
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = IMFileLocationTrimFileName(v27);
    v12 = v28;
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v13, (uint64_t)&stru_1E2C46CC8, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v10, v16, (uint64_t)CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), v17, CFSTR("key"), "-[IMOrderedMutableDictionary removeOrderedObjectForKey:]", v11, v12, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v19)
      v19(v18);
    else
      _IMWarn(CFSTR("ASSERTION FAILED: %@"), v20, v21, v22, v23, v24, v25, v26, (char)v18);

  }
}

- (id)orderedObjects
{
  uint64_t v2;
  uint64_t v3;
  NSArray *orderedItems;
  void *v6;
  const char *v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *v10;
  _QWORD v12[5];

  orderedItems = self->_orderedItems;
  if (!orderedItems)
  {
    objc_msgSend_array(self->_mutableOrderedSet, a2, v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1906A5FC8;
    v12[3] = &unk_1E2C46080;
    v12[4] = self;
    objc_msgSend___imArrayByApplyingBlock_(v6, v7, (uint64_t)v12, v8);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_orderedItems;
    self->_orderedItems = v9;

    orderedItems = self->_orderedItems;
  }
  return orderedItems;
}

- (BOOL)containsOrderedObject:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  _BYTE *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void (*v17)(void *);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  char v28;
  _OWORD v30[2];
  uint64_t v31;

  v7 = a3;
  if (!v7)
  {
    v30[0] = xmmword_1E2C460A0;
    v30[1] = *(_OWORD *)off_1E2C460B0;
    v31 = 79;
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = IMFileLocationTrimFileName(v30);
    v10 = v31;
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)&stru_1E2C46CC8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v8, v14, (uint64_t)CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), v15, CFSTR("anObject"), "-[IMOrderedMutableDictionary containsOrderedObject:]", v9, v10, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v17)
      v17(v16);
    else
      _IMWarn(CFSTR("ASSERTION FAILED: %@"), v18, v19, v20, v21, v22, v23, v24, (char)v16);

  }
  objc_msgSend_allValues(self->_dictionary, v4, v5, v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_containsObject_(v25, v26, (uint64_t)v7, v27);

  return v28;
}

- (BOOL)containsKey:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _BYTE *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void (*v16)(void *);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  _OWORD v26[2];
  uint64_t v27;

  v6 = a3;
  if (!v6)
  {
    v26[0] = xmmword_1E2C460C8;
    v26[1] = *(_OWORD *)off_1E2C460D8;
    v27 = 84;
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = IMFileLocationTrimFileName(v26);
    v9 = v27;
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v10, (uint64_t)&stru_1E2C46CC8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v7, v13, (uint64_t)CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), v14, CFSTR("key"), "-[IMOrderedMutableDictionary containsKey:]", v8, v9, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v16)
      v16(v15);
    else
      _IMWarn(CFSTR("ASSERTION FAILED: %@"), v17, v18, v19, v20, v21, v22, v23, (char)v15);

  }
  v24 = objc_msgSend_containsObject_(self->_mutableOrderedSet, v4, (uint64_t)v6, v5);

  return v24;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  const char *v9;
  unint64_t v10;

  objc_msgSend_orderedObjects(self, a2, (uint64_t)a3, (uint64_t)a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)a3, (uint64_t)a4, a5);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedItems, 0);
  objc_storeStrong((id *)&self->_mutableOrderedSet, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
