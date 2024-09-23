@implementation _MPMediaSearchStringPredicate

- (_MPMediaSearchStringPredicate)initWithCoder:(id)a3
{
  id v4;
  _MPMediaSearchStringPredicate *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_MPMediaSearchStringPredicate;
  v5 = -[_MPMediaSearchStringPredicate init](&v22, sel_init);
  if (v5)
  {
    if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPSearchString"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPMediaSearchStringPredicate setSearchString:](v5, "setSearchString:", v6);

      v7 = (void *)MEMORY[0x1E0C99E60];
      v8 = objc_opt_class();
      objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("MPProperties"));
      v10 = (id)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_15:

        goto LABEL_16;
      }
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = v10;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        v14 = 1;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            objc_opt_class();
            v14 &= objc_opt_isKindOfClass();
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v12);

        if ((v14 & 1) == 0)
          goto LABEL_15;
      }
      else
      {

      }
    }
    else
    {
      objc_msgSend(v4, "decodeObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPMediaSearchStringPredicate setSearchString:](v5, "setSearchString:", v16);

      objc_msgSend(v4, "decodeObject");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[_MPMediaSearchStringPredicate setProperties:](v5, "setProperties:", v10);
    goto LABEL_15;
  }
LABEL_16:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  char v4;
  NSString *searchString;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "allowsKeyedCoding");
  searchString = self->_searchString;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v6, "encodeObject:forKey:", searchString, CFSTR("MPSearchString"));
    objc_msgSend(v6, "encodeObject:forKey:", self->_properties, CFSTR("MPProperties"));
  }
  else
  {
    objc_msgSend(v6, "encodeObject:", searchString);
    objc_msgSend(v6, "encodeObject:", self->_properties);
  }

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> %@ matches '%@'"), objc_opt_class(), self, self->_properties, self->_searchString);
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  char v5;

  v4 = (id *)a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && objc_msgSend(v4[1], "isEqual:", self->_searchString))
  {
    v5 = objc_msgSend(v4[2], "isEqual:", self->_properties);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_searchString, "hash");
  return -[NSSet hash](self->_properties, "hash") ^ v3;
}

- (_MPMediaSearchStringPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4
{
  id v6;
  _MPMediaSearchStringPredicate *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *searchString;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSSet *properties;
  void *v18;
  objc_super v19;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaQuery.m"), 1945, CFSTR("Cannot decode object of type %@"), objc_opt_class());

  }
  v19.receiver = self;
  v19.super_class = (Class)_MPMediaSearchStringPredicate;
  v7 = -[_MPMediaSearchStringPredicate init](&v19, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "searchStringPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    searchString = v7->_searchString;
    v7->_searchString = (NSString *)v10;

    objc_msgSend(v8, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v8, "properties");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "initWithArray:", v14);
      properties = v7->_properties;
      v7->_properties = (NSSet *)v15;

    }
  }

  return v7;
}

- (id)protobufferEncodableObjectFromLibrary:(id)a3
{
  MPPSearchStringPredicate *v4;
  void *v5;
  void *v6;
  MPPMediaPredicate *v7;

  v4 = objc_alloc_init(MPPSearchStringPredicate);
  -[MPPSearchStringPredicate setSearchString:](v4, "setSearchString:", self->_searchString);
  -[NSSet allObjects](self->_properties, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  -[MPPSearchStringPredicate setProperties:](v4, "setProperties:", v6);

  v7 = objc_alloc_init(MPPMediaPredicate);
  -[MPPMediaPredicate setType:](v7, "setType:", 5);
  -[MPPMediaPredicate setSearchStringPredicate:](v7, "setSearchStringPredicate:", v4);

  return v7;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

+ (id)predicateWithSearchString:(id)a3 forProperties:(id)a4
{
  id v7;
  id v8;
  _MPMediaSearchStringPredicate *v9;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPMediaQuery.m"), 1883, &stru_1E3163D10);

  }
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPMediaQuery.m"), 1884, &stru_1E3163D10);

  }
  v9 = objc_alloc_init(_MPMediaSearchStringPredicate);
  -[_MPMediaSearchStringPredicate setSearchString:](v9, "setSearchString:", v7);
  -[_MPMediaSearchStringPredicate setProperties:](v9, "setProperties:", v8);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_ML3PredicateForEntityClass:(Class)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _MPMediaSearchStringPredicate *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[_MPMediaSearchStringPredicate properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        -[objc_class spotlightPropertyForMPMediaEntityProperty:](a3, "spotlightPropertyForMPMediaEntityProperty:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v27 = self;
          objc_msgSend(v6, "removeAllObjects");

          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v17 = v7;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v29 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
                -[objc_class propertyForMPMediaEntityProperty:](a3, "propertyForMPMediaEntityProperty:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (v23)
                {
                  objc_msgSend(v6, "addObject:", v23);
                }
                else
                {
                  v24 = os_log_create("com.apple.amp.mediaplayer", "Library");
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v37 = v22;
                    _os_log_impl(&dword_193B9B000, v24, OS_LOG_TYPE_ERROR, "Cannot filter search string by %@", buf, 0xCu);
                  }

                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
            }
            while (v19);
          }

          v25 = (void *)MEMORY[0x1E0D512A8];
          -[_MPMediaSearchStringPredicate searchString](v27, "searchString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "predicateWithConcatenatedProperties:searchString:", v6, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
        v13 = (void *)v12;
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      if (v9)
        continue;
      break;
    }
  }

  v14 = (void *)MEMORY[0x1E0D512B0];
  -[_MPMediaSearchStringPredicate searchString](self, "searchString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateWithProperties:searchString:", v6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v16;
}

- (id)ML3PredicateForTrack
{
  return -[_MPMediaSearchStringPredicate _ML3PredicateForEntityClass:](self, "_ML3PredicateForEntityClass:", objc_opt_class());
}

- (id)ML3PredicateForContainer
{
  return -[_MPMediaSearchStringPredicate _ML3PredicateForEntityClass:](self, "_ML3PredicateForEntityClass:", objc_opt_class());
}

@end
