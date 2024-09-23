@implementation GKInternalRepresentation

+ (id)internalRepresentation
{
  return objc_alloc_init((Class)a1);
}

+ (id)secureCodedJsonTypes
{
  if (secureCodedJsonTypes_onceToken != -1)
    dispatch_once(&secureCodedJsonTypes_onceToken, &__block_literal_global_8);
  return (id)secureCodedJsonTypes_result;
}

void __48__GKInternalRepresentation_secureCodedJsonTypes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)secureCodedJsonTypes_result;
  secureCodedJsonTypes_result = v2;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKInternalRepresentation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  GKInternalRepresentation *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GKInternalRepresentation;
  v14 = -[GKInternalRepresentation init](&v20, sel_init);
  if (v14)
  {
    objc_msgSend((id)objc_opt_class(), "secureCodedPropertyKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (!v6)
      goto LABEL_16;
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v10, v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, v10);
        else
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v12)
            goto LABEL_14;
          -[GKInternalRepresentation setValue:forKey:](v14, "setValue:forKey:", v12, v10);
        }

LABEL_14:
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (!v7)
      {
LABEL_16:

        break;
      }
    }
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)objc_opt_class(), "codedPropertyKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[GKInternalRepresentation valueForKey:](self, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "encodeObject:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend((id)objc_opt_class(), "codedPropertyKeys", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (!v6)
      goto LABEL_13;
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[GKInternalRepresentation valueForKey:](self, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v11)
            continue;
          objc_msgSend(v4, "setValue:forKey:", v11, v10);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (!v7)
      {
LABEL_13:

        return v4;
      }
    }
  }
  return v4;
}

+ (id)codedPropertyKeys
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "secureCodedPropertyKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)secureCodedPropertyKeys
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)descriptionSubstitutionMap
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  const __CFString *v54;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  int64_t v62;
  id v63;
  uint64_t v64;
  GKInternalRepresentation *v65;
  void *v66;
  id obj;
  int64_t v68;
  void *v69;
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
  _gkTabStringForTabLevel(a3);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)v5;
  objc_msgSend(v6, "appendFormat:", CFSTR("%@<%@ %p> {\n"), v5, v8, self);

  -[GKInternalRepresentation descriptionSubstitutionMap](self, "descriptionSubstitutionMap");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "codedPropertyKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_10_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
  v63 = v11;
  if (v12)
  {
    v13 = v12;
    v62 = a3 + 1;
    v68 = a3 + 2;
    v14 = *(_QWORD *)v79;
    v64 = *(_QWORD *)v79;
    v65 = self;
    do
    {
      v15 = 0;
      v60 = v13;
      do
      {
        if (*(_QWORD *)v79 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * v15);
        -[GKInternalRepresentation valueForKey:](self, "valueForKey:", v16);
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          objc_msgSend(v66, "objectForKeyedSubscript:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = v19;
            objc_msgSend(v20, "count");
            if (objc_msgSend(v20, "count") == 1)
            {
              objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "valueForKeyPath:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              v18 = v22;
              objc_msgSend(v22, "_gkDescriptionWithChildren:", v62);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "stringByTrimmingCharactersInSet:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "appendFormat:", CFSTR("%@    %@.%@ : %@"), v69, v16, v26, v25);

              v13 = v60;
              v27 = v20;
              v14 = v64;
              self = v65;
            }
            else
            {
              v58 = v19;
              v59 = v15;
              v33 = v18;
              objc_msgSend(v6, "appendFormat:", CFSTR("    %@%@ : <%@:%p> {\n"), v69, v16, objc_opt_class(), v18);
              v76 = 0u;
              v77 = 0u;
              v74 = 0u;
              v75 = 0u;
              obj = v20;
              v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
              if (v34)
              {
                v35 = v34;
                v36 = *(_QWORD *)v75;
                do
                {
                  for (i = 0; i != v35; ++i)
                  {
                    v38 = v6;
                    if (*(_QWORD *)v75 != v36)
                      objc_enumerationMutation(obj);
                    v39 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i);
                    objc_msgSend(v33, "valueForKeyPath:", v39);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "_gkDescriptionWithChildren:", v68);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "stringByTrimmingCharactersInSet:", v42);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();

                    v6 = v38;
                    objc_msgSend(v38, "appendFormat:", CFSTR("%@        %@ : %@"), v69, v39, v43);

                  }
                  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
                }
                while (v35);
              }
              v27 = obj;

              objc_msgSend(v6, "appendFormat:", CFSTR("    %@}\n"), v69);
              v11 = v63;
              v14 = v64;
              self = v65;
              v15 = v59;
              v13 = v60;
              v19 = v58;
              v18 = v33;
            }
          }
          else
          {
            v28 = v15;
            if (v19)
            {
              objc_msgSend(v18, "valueForKeyPath:", v19);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v29, "_gkDescriptionWithChildren:", v62);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "stringByTrimmingCharactersInSet:", v31);
              v32 = objc_claimAutoreleasedReturnValue();

              v56 = v16;
              v27 = (void *)v32;
              objc_msgSend(v6, "appendFormat:", CFSTR("%@    %@.%@ : %@"), v69, v56, v19, v32);
              v18 = v29;
            }
            else
            {
              objc_msgSend(v18, "_gkDescriptionWithChildren:", v62);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "stringByTrimmingCharactersInSet:", v45);
              v46 = objc_claimAutoreleasedReturnValue();

              v57 = v16;
              v27 = (void *)v46;
              objc_msgSend(v6, "appendFormat:", CFSTR("%@    %@ : %@"), v69, v57, v46);
            }
            v15 = v28;
            v11 = v63;
            v14 = v64;
            self = v65;
          }

        }
        else
        {
          objc_msgSend(v61, "addObject:", v16);
        }
        ++v15;
      }
      while (v15 != v13);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
    }
    while (v13);
  }

  v47 = v61;
  if (objc_msgSend(v61, "count"))
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("%@    "), v69);
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v48 = v61;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
    if (v49)
    {
      v50 = v49;
      v51 = 0;
      v52 = *(_QWORD *)v71;
      do
      {
        for (j = 0; j != v50; ++j)
        {
          if (*(_QWORD *)v71 != v52)
            objc_enumerationMutation(v48);
          if (v51 + j <= 0)
            v54 = CFSTR("%@");
          else
            v54 = CFSTR(", %@");
          objc_msgSend(v6, "appendFormat:", v54, *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j));
        }
        v51 += v50;
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
      }
      while (v50);
    }

    objc_msgSend(v6, "appendString:", CFSTR(" : (null)\n"));
    v47 = v61;
    v11 = v63;
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("%@}\n"), v69);

  return v6;
}

uint64_t __55__GKInternalRepresentation__gkDescriptionWithChildren___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)description
{
  return -[GKInternalRepresentation _gkDescriptionWithChildren:](self, "_gkDescriptionWithChildren:", 0);
}

- (id)serverRepresentation
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (void)mergePropertiesFrom:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = objc_opt_class();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ is not a %@"), v6, objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ ([self isKindOfClass:[other class]])\n[%s (%s:%d)]"), v7, "-[GKInternalRepresentation mergePropertiesFrom:]", objc_msgSend(v9, "UTF8String"), 191);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v10);
  }
  objc_msgSend((id)objc_opt_class(), "codedPropertyKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v4, "valueForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          -[GKInternalRepresentation setValue:forKey:](self, "setValue:forKey:", v17, v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

}

@end
