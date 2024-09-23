@implementation MOEventExtendedAttributes

- (MOEventExtendedAttributes)initWithLocalIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  MOEventExtendedAttributes *v8;
  uint64_t v9;
  NSString *photoMomentLocalIdentifier;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MOEventExtendedAttributes initWithLocalIdentifier:].cold.1(v6);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventExtendedAtrributes.m"), 216, CFSTR("Invalid parameter not satisfying: localIdentifier (in %s:%d)"), "-[MOEventExtendedAttributes initWithLocalIdentifier:]", 216);

  }
  v12.receiver = self;
  v12.super_class = (Class)MOEventExtendedAttributes;
  v8 = -[MOEventExtendedAttributes init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v5, "copy");
    photoMomentLocalIdentifier = v8->_photoMomentLocalIdentifier;
    v8->_photoMomentLocalIdentifier = (NSString *)v9;

  }
  return v8;
}

+ (id)lowerCaseArrayOfStrings:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "lowercaseString", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (MOEventExtendedAttributes)initWithMoment:(id)a3
{
  id v4;
  void *v5;
  MOEventExtendedAttributes *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *photoMomentInferences;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *photoMomentHolidays;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  MOPublicEvent *v23;
  uint64_t v24;
  NSArray *photoMomentPublicEvents;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  MOPerson *v33;
  MOPerson *v34;
  uint64_t v35;
  NSArray *photoMomentPersons;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("localIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MOEventExtendedAttributes initWithLocalIdentifier:](self, "initWithLocalIdentifier:", v5);
  if (v6)
  {
    v42 = v5;
    objc_msgSend(v4, "objectForKey:", CFSTR("inferences"));
    v7 = objc_claimAutoreleasedReturnValue();
    +[MOEventExtendedAttributes lowerCaseArrayOfStrings:](MOEventExtendedAttributes, "lowerCaseArrayOfStrings:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v7;
    if (v7)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", v8, 1);
      photoMomentInferences = v6->_photoMomentInferences;
      v6->_photoMomentInferences = (NSArray *)v9;

    }
    v40 = (void *)v8;
    objc_msgSend(v4, "objectForKey:", CFSTR("holidays"));
    v11 = objc_claimAutoreleasedReturnValue();
    +[MOEventExtendedAttributes lowerCaseArrayOfStrings:](MOEventExtendedAttributes, "lowerCaseArrayOfStrings:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v11;
    if (v11)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", v12, 1);
      photoMomentHolidays = v6->_photoMomentHolidays;
      v6->_photoMomentHolidays = (NSArray *)v13;

    }
    v38 = (void *)v12;
    objc_msgSend(v4, "objectForKey:", CFSTR("publicEvents"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)objc_opt_new();
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v17 = v15;
      v18 = v15;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v48 != v21)
              objc_enumerationMutation(v18);
            v23 = -[MOPublicEvent initWithEventDictionary:]([MOPublicEvent alloc], "initWithEventDictionary:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
            objc_msgSend(v16, "addObject:", v23);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v20);
      }

      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v16, 1);
      photoMomentPublicEvents = v6->_photoMomentPublicEvents;
      v6->_photoMomentPublicEvents = (NSArray *)v24;

      v15 = v17;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("persons"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = (void *)objc_opt_new();
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v28 = v26;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v44;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v44 != v31)
              objc_enumerationMutation(v28);
            v33 = -[MOPerson initWithPersonDictionary:]([MOPerson alloc], "initWithPersonDictionary:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j));
            v34 = v33;
            if (v33)
            {
              -[MOPerson setSourceEventAccessType:](v33, "setSourceEventAccessType:", 3);
              objc_msgSend(v27, "addObject:", v34);
            }

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        }
        while (v30);
      }

      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v27, 1);
      photoMomentPersons = v6->_photoMomentPersons;
      v6->_photoMomentPersons = (NSArray *)v35;

    }
    v5 = v42;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MOEventExtendedAttributes photoMomentLocalIdentifier](self, "photoMomentLocalIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventExtendedAttributes photoMomentInferences](self, "photoMomentInferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventExtendedAttributes photoMomentHolidays](self, "photoMomentHolidays");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventExtendedAttributes photoMomentPublicEvents](self, "photoMomentPublicEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventExtendedAttributes photoMomentPersons](self, "photoMomentPersons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventExtendedAttributes momentPropertyOfAssets](self, "momentPropertyOfAssets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MOEventExtendedAttributes localIdentifier, %@, photoMomentInferences, %@, photoMomentHolidays, %@, photoMomentPublicEvents, %@, photoMomentPersons, %@, momentPropertyOfAssets, %@>"), v4, v5, v6, v8, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOEventExtendedAttributes)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MOEventExtendedAttributes *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *photoMomentInferences;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *photoMomentHolidays;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *photoMomentPublicEvents;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *photoMomentPersons;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *momentPropertyOfAssets;
  MOEventExtendedAttributes *v32;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photoMomentLocalIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[MOEventExtendedAttributes initWithLocalIdentifier:](self, "initWithLocalIdentifier:", v5);
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0C99E60];
      v8 = objc_opt_class();
      objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("photoMomentInferences"));
      v10 = objc_claimAutoreleasedReturnValue();
      photoMomentInferences = v6->_photoMomentInferences;
      v6->_photoMomentInferences = (NSArray *)v10;

      v12 = (void *)MEMORY[0x1E0C99E60];
      v13 = objc_opt_class();
      objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("photoMomentHolidays"));
      v15 = objc_claimAutoreleasedReturnValue();
      photoMomentHolidays = v6->_photoMomentHolidays;
      v6->_photoMomentHolidays = (NSArray *)v15;

      v17 = (void *)MEMORY[0x1E0C99E60];
      v18 = objc_opt_class();
      objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("photoMomentPublicEvents"));
      v20 = objc_claimAutoreleasedReturnValue();
      photoMomentPublicEvents = v6->_photoMomentPublicEvents;
      v6->_photoMomentPublicEvents = (NSArray *)v20;

      v22 = (void *)MEMORY[0x1E0C99E60];
      v23 = objc_opt_class();
      objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("photoMomentPersons"));
      v25 = objc_claimAutoreleasedReturnValue();
      photoMomentPersons = v6->_photoMomentPersons;
      v6->_photoMomentPersons = (NSArray *)v25;

      v27 = (void *)MEMORY[0x1E0C99E60];
      v28 = objc_opt_class();
      objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("momentPropertyOfAssets"));
      v30 = objc_claimAutoreleasedReturnValue();
      momentPropertyOfAssets = v6->_momentPropertyOfAssets;
      v6->_momentPropertyOfAssets = (NSArray *)v30;

    }
    self = v6;
    v32 = self;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *photoMomentLocalIdentifier;
  id v5;

  photoMomentLocalIdentifier = self->_photoMomentLocalIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", photoMomentLocalIdentifier, CFSTR("photoMomentLocalIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoMomentInferences, CFSTR("photoMomentInferences"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoMomentHolidays, CFSTR("photoMomentHolidays"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoMomentPublicEvents, CFSTR("photoMomentPublicEvents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoMomentPersons, CFSTR("photoMomentPersons"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_momentPropertyOfAssets, CFSTR("momentPropertyOfAssets"));

}

- (unint64_t)hash
{
  return -[NSString hash](self->_photoMomentLocalIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOEventExtendedAttributes *v5;
  MOEventExtendedAttributes *v6;
  MOEventExtendedAttributes *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = (MOEventExtendedAttributes *)a3;
  v6 = v5;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[MOEventExtendedAttributes photoMomentLocalIdentifier](self, "photoMomentLocalIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8
          || (-[MOEventExtendedAttributes photoMomentLocalIdentifier](v7, "photoMomentLocalIdentifier"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[MOEventExtendedAttributes photoMomentLocalIdentifier](self, "photoMomentLocalIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[MOEventExtendedAttributes photoMomentLocalIdentifier](v7, "photoMomentLocalIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v11 = 1;
        }

        goto LABEL_12;
      }
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (NSArray)photoMomentInferences
{
  return self->_photoMomentInferences;
}

- (void)setPhotoMomentInferences:(id)a3
{
  objc_storeStrong((id *)&self->_photoMomentInferences, a3);
}

- (NSString)photoMomentLocalIdentifier
{
  return self->_photoMomentLocalIdentifier;
}

- (void)setPhotoMomentLocalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)photoMomentHolidays
{
  return self->_photoMomentHolidays;
}

- (void)setPhotoMomentHolidays:(id)a3
{
  objc_storeStrong((id *)&self->_photoMomentHolidays, a3);
}

- (NSArray)photoMomentPublicEvents
{
  return self->_photoMomentPublicEvents;
}

- (void)setPhotoMomentPublicEvents:(id)a3
{
  objc_storeStrong((id *)&self->_photoMomentPublicEvents, a3);
}

- (NSArray)photoMomentPersons
{
  return self->_photoMomentPersons;
}

- (void)setPhotoMomentPersons:(id)a3
{
  objc_storeStrong((id *)&self->_photoMomentPersons, a3);
}

- (NSArray)momentPropertyOfAssets
{
  return self->_momentPropertyOfAssets;
}

- (void)setMomentPropertyOfAssets:(id)a3
{
  objc_storeStrong((id *)&self->_momentPropertyOfAssets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentPropertyOfAssets, 0);
  objc_storeStrong((id *)&self->_photoMomentPersons, 0);
  objc_storeStrong((id *)&self->_photoMomentPublicEvents, 0);
  objc_storeStrong((id *)&self->_photoMomentHolidays, 0);
  objc_storeStrong((id *)&self->_photoMomentLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_photoMomentInferences, 0);
}

- (void)initWithLocalIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[MOEventExtendedAttributes initWithLocalIdentifier:]";
  v3 = 1024;
  v4 = 216;
  _os_log_error_impl(&dword_1CAE42000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: localIdentifier (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end
