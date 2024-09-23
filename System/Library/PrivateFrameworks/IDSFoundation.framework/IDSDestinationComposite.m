@implementation IDSDestinationComposite

- (IDSDestinationComposite)initWithDestinations:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  IDSDestinationComposite *v7;
  double v8;
  uint64_t v9;
  NSArray *destinations;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDSDestinationComposite;
  v7 = -[IDSDestinationComposite init](&v12, sel_init);
  if (v7)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v8);
    destinations = v7->_destinations;
    v7->_destinations = (NSArray *)v9;

  }
  return v7;
}

- (IDSDestinationComposite)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  IDSDestinationComposite *v21;

  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend_setWithObject_(v4, v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_classesForStrictUnarchiving(IDSDestination, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v9, v14, (uint64_t)v13, v15);

  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v16, (uint64_t)v9, v17, CFSTR("kIDSCompositeDestinationDestinations"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (IDSDestinationComposite *)objc_msgSend_initWithDestinations_(self, v19, (uint64_t)v18, v20);
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend_destinations(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v10, v9, CFSTR("kIDSCompositeDestinationDestinations"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)destinationURIs
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  double v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend_destinations(self, v4, v5, 0.0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v26, v8, v30, 16);
  if (v9)
  {
    v13 = v9;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v6);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend_destinationURIs(v16, v10, v11, v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend_count(v17, v18, v19, v20);

        if (v21)
        {
          objc_msgSend_destinationURIs(v16, v10, v11, v12);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionSet_(v3, v23, (uint64_t)v22, v24);

        }
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v10, (uint64_t)&v26, v12, v30, 16);
    }
    while (v13);
  }

  return v3;
}

- (id)destinationLightweightStatus
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  const char *v19;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend_destinations(self, v4, v5, 0.0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v22, v8, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend_destinationLightweightStatus(v14, v15, v16, v17);
          v18 = objc_claimAutoreleasedReturnValue();

          objc_msgSend_addEntriesFromDictionary_(v3, v19, v18, v20);
          v11 = (void *)v18;
        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v15, (uint64_t)&v22, v17, v26, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_destinations(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("<%@: %p destinations: %@>"), v10, v4, self, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSArray)destinations
{
  return self->_destinations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinations, 0);
}

@end
