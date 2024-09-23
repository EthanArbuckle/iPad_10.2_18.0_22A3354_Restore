@implementation ATXSlotResolutionParameters

- (ATXSlotResolutionParameters)initWithAction:(id)a3 slots:(id)a4
{
  id v7;
  id v8;
  ATXSlotResolutionParameters *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  NSArray *values;
  void *v39;
  void *v41;
  ATXSlotResolutionParameters *v42;
  id v43;
  id v44;
  NSArray *v45;
  void *v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v56.receiver = self;
  v56.super_class = (Class)ATXSlotResolutionParameters;
  v9 = -[ATXSlotResolutionParameters init](&v56, sel_init);
  if (v9)
  {
    v10 = (void *)MEMORY[0x1A85A4F90]();
    objc_storeStrong((id *)&v9->_action, a3);
    objc_storeStrong((id *)&v9->_slots, a4);
    if (objc_msgSend(v7, "actionType") == 1)
    {
      v9->_hash = objc_msgSend(v7, "hash");
    }
    else
    {
      objc_msgSend(v8, "parameters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v41 = v10;
        v42 = v9;
        v44 = v7;
        v12 = objc_msgSend(v8, "hash");
        -[ATXAction intent](v9->_action, "intent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "atx_nonNilParametersByName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "parameters");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allObjects");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sortedArrayUsingSelector:", sel_compare_);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
        v43 = v8;
        objc_msgSend(v8, "parameters");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        obj = v17;
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v53;
          v45 = v18;
          v46 = v14;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v53 != v22)
                objc_enumerationMutation(obj);
              v24 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
              if (!v19
                || objc_msgSend(v19, "containsObject:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i)))
              {
                v25 = objc_msgSend(v24, "hash");
                objc_msgSend(v14, "objectForKeyedSubscript:", v24);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = v26;
                if (v26)
                {
                  v28 = v26;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0C99E38], "null");
                  v28 = (id)objc_claimAutoreleasedReturnValue();
                }
                v29 = v28;
                v12 = v25 - v12 + 32 * v12;

                -[NSArray addObject:](v18, "addObject:", v29);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v30 = objc_msgSend(v29, "atx_locationHashWithLevel:", 17);
                    v12 = 31 * (31 * v12 + HIDWORD(v30)) + v30;
                  }
                  else
                  {
                    objc_msgSend(v29, "location");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    v32 = objc_msgSend(v31, "atx_locationHashWithLevel:", 17);
                    v12 = 31 * (31 * v12 + HIDWORD(v32)) + v32;

                  }
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v50 = 0u;
                    v51 = 0u;
                    v48 = 0u;
                    v49 = 0u;
                    v33 = v29;
                    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
                    if (v34)
                    {
                      v35 = v34;
                      v36 = *(_QWORD *)v49;
                      do
                      {
                        for (j = 0; j != v35; ++j)
                        {
                          if (*(_QWORD *)v49 != v36)
                            objc_enumerationMutation(v33);
                          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "hash") - v12 + 32 * v12;
                        }
                        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
                      }
                      while (v35);
                    }

                    v18 = v45;
                    v14 = v46;
                  }
                  else
                  {
                    v12 = objc_msgSend(v29, "hash") - v12 + 32 * v12;
                  }
                }

              }
            }
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
          }
          while (v21);
        }

        v9 = v42;
        values = v42->_values;
        v42->_values = v18;
        v42->_hash = v12;

        v8 = v43;
        v7 = v44;
        v10 = v41;
      }
      else
      {
        objc_msgSend(v7, "intent");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v9->_hash = objc_msgSend(v39, "atx_backingStoreDataHash");

      }
    }
    objc_autoreleasePoolPop(v10);
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  ATXSlotResolutionParameters *v4;
  ATXSlotResolutionParameters *v5;
  void *v6;
  ATXSlotSet *slots;
  ATXSlotSet *v8;
  ATXSlotSet *v9;
  ATXSlotSet *v10;
  BOOL v11;
  char v12;
  ATXAction *v13;
  NSArray *v14;
  NSArray *values;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  double v24;
  char v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  NSArray *v31;
  unint64_t v32;

  v4 = (ATXSlotResolutionParameters *)a3;
  if (self == v4)
  {
    v12 = 1;
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    goto LABEL_38;
  }
  v5 = v4;
  if (self->_hash != v5->_hash)
  {
LABEL_7:
    v12 = 0;
    goto LABEL_37;
  }
  -[ATXSlotSet parameters](self->_slots, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v13 = self->_action;
    v14 = (NSArray *)v13;
    if (v13 == v5->_action)
      v12 = 1;
    else
      v12 = -[ATXAction isEqual:](v13, "isEqual:");
    goto LABEL_36;
  }
  slots = self->_slots;
  v8 = v5->_slots;
  if (slots == v8)
  {

  }
  else
  {
    v9 = v8;
    v10 = slots;
    v11 = -[ATXSlotSet isEqual:](v10, "isEqual:", v9);

    if (!v11)
      goto LABEL_7;
  }
  values = v5->_values;
  v14 = self->_values;
  v16 = values;
  if (v14 == v16)
    goto LABEL_32;
  v17 = -[NSArray count](v14, "count");
  if (v17 != -[NSArray count](v16, "count"))
  {
    v12 = 0;
    goto LABEL_35;
  }
  v32 = -[NSArray count](v14, "count");
  if (!v32)
  {
LABEL_32:
    v12 = 1;
    goto LABEL_35;
  }
  v12 = 0;
  v18 = 0;
  v31 = v16;
  while (1)
  {
    -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19;
    v22 = v20;
    if (v21 != v22)
      break;

    v16 = v31;
LABEL_30:
    v12 = ++v18 >= v32;
    if (v32 == v18)
      goto LABEL_35;
  }
  v23 = v22;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_39;
    objc_msgSend(v21, "distanceFromLocation:", v23);
    v25 = v24 < 100.0;
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = objc_msgSend(v21, "isEqual:", v23);
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v21, "location");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "location");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    v25 = 0;
    if (v26 && v27)
    {
      objc_msgSend(v26, "distanceFromLocation:", v27);
      v25 = v29 < 100.0;
    }

LABEL_29:
    v16 = v31;
    if ((v25 & 1) == 0)
      goto LABEL_35;
    goto LABEL_30;
  }
LABEL_39:

  v16 = v31;
LABEL_35:

LABEL_36:
LABEL_37:

LABEL_38:
  return v12 & 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSlotSet parameters](self->_slots, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@>"), v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_slots, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
