@implementation CKRoughlyEquivalentPropertiesBuilder

- (CKRoughlyEquivalentPropertiesBuilder)init
{
  CKRoughlyEquivalentPropertiesBuilder *v2;
  uint64_t v3;
  NSMutableDictionary *dictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKRoughlyEquivalentPropertiesBuilder;
  v2 = -[CKRoughlyEquivalentPropertiesBuilder init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    dictionary = v2->_dictionary;
    v2->_dictionary = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (CKRoughlyEquivalentProperties)properties
{
  CKRoughlyEquivalentProperties *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  v3 = [CKRoughlyEquivalentProperties alloc];
  objc_msgSend_dictionary(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithDictionary_(v3, v8, (uint64_t)v7, v9);

  return (CKRoughlyEquivalentProperties *)v10;
}

- (void)addPlistObjects:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  const char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v6)
  {
    v9 = v6;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v4);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v4, v7, v12, v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addPlistObject_forKey_(self, v14, (uint64_t)v13, v12);

      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v15, (uint64_t)v19, 16);
    }
    while (v9);
  }

}

- (void)addPlistObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend_dictionary(self, v8, v9, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v11, (uint64_t)v7, (uint64_t)v6);

}

- (void)addComplexObject:(id)a3 forKey:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;

  v6 = a4;
  objc_msgSend_equivalencyProperties(a3, v7, v8, v9);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(v19, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v17, v18, (uint64_t)v13, (uint64_t)v6);

}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v20 = a3;
  v10 = a4;
  if (v20)
  {
    if ((objc_msgSend_conformsToProtocol_(v20, v7, (uint64_t)&unk_1EDF78A38, v9) & 1) != 0
      || (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend_addComplexObject_forKey_(self, v11, (uint64_t)v20, (uint64_t)v10);
    }
    else if (objc_msgSend_conformsToProtocol_(v20, v11, (uint64_t)&unk_1EDF76AE8, v12)
           && objc_msgSend_conformsToProtocol_(v20, v15, (uint64_t)&unk_1EDF777A8, v17))
    {
      objc_msgSend_addPlistObject_forKey_(self, v15, (uint64_t)v20, (uint64_t)v10);
    }
    else
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, (uint64_t)self, CFSTR("CKRoughlyEquivalent.m"), 96, CFSTR("Invalid object type written to CKRoughlyEquivalentProperties: %@ %@"), v10, v20);

    }
  }
  else
  {
    objc_msgSend_dictionary(self, v7, v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v13, v14, 0, (uint64_t)v10);

  }
}

- (NSMutableDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
