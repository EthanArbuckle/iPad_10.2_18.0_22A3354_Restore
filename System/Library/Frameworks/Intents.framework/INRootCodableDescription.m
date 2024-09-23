@implementation INRootCodableDescription

- (void)_establishReferencedCodableDescriptionsUsingTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[INCodableDescription attributes](self, "attributes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_calculateReferencedCodableDescriptionsFromAttributes:usingTypes:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[INRootCodableDescription _setReferencedCodableDescriptions:](self, "_setReferencedCodableDescriptions:", v7);
}

- (void)_setReferencedCodableDescriptions:(id)a3
{
  NSArray *v4;
  NSArray *referencedCodableDescriptions;
  NSArray *v6;
  NSDictionary *referencedCodableDescriptionsByClassName;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  referencedCodableDescriptions = self->_referencedCodableDescriptions;
  self->_referencedCodableDescriptions = v4;
  v6 = v4;

  referencedCodableDescriptionsByClassName = self->_referencedCodableDescriptionsByClassName;
  self->_referencedCodableDescriptionsByClassName = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (INRootCodableDescription)init
{
  INRootCodableDescription *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INRootCodableDescription;
  result = -[INCodableDescription init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (INRootCodableDescription)initWithCoder:(id)a3
{
  id v4;
  INRootCodableDescription *v5;
  INRootCodableDescription *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INRootCodableDescription;
  v5 = -[INCodableDescription initWithCoder:](&v12, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("referencedCodableDescriptions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[INRootCodableDescription _setReferencedCodableDescriptions:](v6, "_setReferencedCodableDescriptions:", v10);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INRootCodableDescription;
  v4 = a3;
  -[INCodableDescription encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[INRootCodableDescription referencedCodableDescriptions](self, "referencedCodableDescriptions", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("referencedCodableDescriptions"));

}

- (NSArray)referencedCodableDescriptions
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSArray copy](self->_referencedCodableDescriptions, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencedCodableDescriptions, 0);
  objc_storeStrong((id *)&self->_referencedCodableDescriptionsByClassName, 0);
}

- (int64_t)codableDescriptionType
{
  return 2;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  objc_super v17;
  id obj;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__45829;
  v23 = __Block_byref_object_dispose__45830;
  v24 = 0;
  v17.receiver = self;
  v17.super_class = (Class)INRootCodableDescription;
  obj = 0;
  -[INCodableDescription widgetPlistableRepresentationWithParameters:error:](&v17, sel_widgetPlistableRepresentationWithParameters_error_, v6, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v24, obj);
  v8 = (void *)v20[5];
  if (v8)
  {
    v9 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    -[INRootCodableDescription referencedCodableDescriptions](self, "referencedCodableDescriptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __78__INRootCodableDescription_widgetPlistableRepresentationWithParameters_error___block_invoke;
    v14[3] = &unk_1E228D360;
    v15 = v6;
    v16 = &v19;
    objc_msgSend(v10, "if_compactMap:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)v20[5];
    if (v12)
    {
      v9 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v12);
    }
    else
    {
      objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v11, CFSTR("referencedCodableDescriptions"));
      v9 = v7;
    }

  }
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (NSDictionary)_referencedCodableDescriptionsByClassName
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSDictionary *referencedCodableDescriptionsByClassName;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_referencedCodableDescriptionsByClassName)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](self->_referencedCodableDescriptions, "count"));
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_referencedCodableDescriptions;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "className", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", v10, v11);

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    referencedCodableDescriptionsByClassName = self->_referencedCodableDescriptionsByClassName;
    self->_referencedCodableDescriptionsByClassName = v4;

  }
  os_unfair_lock_unlock(p_lock);
  return self->_referencedCodableDescriptionsByClassName;
}

- (void)_reestablishReferencedCodableDescriptionsUsingTypes:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *referencedCodableDescriptions;
  NSDictionary *referencedCodableDescriptionsByClassName;
  id v13;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", self->_referencedCodableDescriptions);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  -[INCodableDescription attributes](self, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_calculateReferencedCodableDescriptionsFromAttributes:usingTypes:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObjectsFromArray:", v9);
  objc_msgSend(v13, "array");
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  referencedCodableDescriptions = self->_referencedCodableDescriptions;
  self->_referencedCodableDescriptions = v10;

  referencedCodableDescriptionsByClassName = self->_referencedCodableDescriptionsByClassName;
  self->_referencedCodableDescriptionsByClassName = 0;

  os_unfair_lock_unlock(p_lock);
}

id __78__INRootCodableDescription_widgetPlistableRepresentationWithParameters_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id obj;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "codableDescriptionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v4, "widgetPlistableRepresentationWithParameters:error:", v7, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    objc_msgSend(v5, "addObject:", v9);
    v10 = v5;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  return v11;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v44.receiver = a1;
  v44.super_class = (Class)&OBJC_METACLASS___INRootCodableDescription;
  v45 = 0;
  objc_msgSendSuper2(&v44, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v45);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v45;
  if (v8)
  {
    v9 = v8;
    if (a4)
    {
      v9 = objc_retainAutorelease(v8);
      v10 = 0;
      *a4 = v9;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v30 = a1;
    v31 = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v6;
    objc_msgSend(v6, "intents_safeObjectForKey:ofType:", CFSTR("referencedCodableDescriptions"), objc_opt_class());
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v41;
      v34 = v11;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v41 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v16, "count") != 2)
            goto LABEL_21;
          v17 = v16;
          objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 1;
          objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (v21 = INCodableDescriptionClassFromType(objc_msgSend(v18, "integerValue"))) != 0)
            {
              v39 = 0;
              objc_msgSend(v21, "makeFromWidgetPlistableRepresentation:error:", v20, &v39);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v39;
              if (v23)
              {
                v9 = v23;
                if (a4)
                  *a4 = objc_retainAutorelease(v23);

                v10 = 0;
                v25 = v33;
                v11 = v34;
                v28 = v34;
                v7 = v31;
                v6 = v32;
                goto LABEL_31;
              }
              if (v22)
              {
                objc_msgSend(v33, "addObject:", v22);
                v19 = 0;
              }
              else
              {
                v19 = 1;
              }

            }
            else
            {
              v19 = 1;
            }
          }

          v11 = v34;
          if (v19)
          {
LABEL_21:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wrong types found for relationship codable description"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            INIntentError(8001, v24, 0);
            v9 = (id)objc_claimAutoreleasedReturnValue();

            if (v9)
            {
              if (a4)
              {
                v9 = objc_retainAutorelease(v9);
                v10 = 0;
                *a4 = v9;
              }
              else
              {
                v10 = 0;
              }
              v28 = v11;
              v7 = v31;
              v25 = v33;
              goto LABEL_30;
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        if (v13)
          continue;
        break;
      }
    }

    v7 = v31;
    v25 = v33;
    objc_msgSend(v31, "_setReferencedCodableDescriptions:", v33);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "attributes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __72__INRootCodableDescription_makeFromWidgetPlistableRepresentation_error___block_invoke;
    v35[3] = &unk_1E228D388;
    v38 = v30;
    v36 = v33;
    v37 = v26;
    v28 = v26;
    objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v35);

    v10 = v31;
    v9 = 0;
LABEL_30:
    v6 = v32;
LABEL_31:

  }
  return v10;
}

+ (void)recursivelyAssignCodableDescriptionsFor:(id)a3 referencedCodableDescriptions:(id)a4 visitedCodableDescriptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __125__INRootCodableDescription_recursivelyAssignCodableDescriptionsFor_referencedCodableDescriptions_visitedCodableDescriptions___block_invoke;
  v14[3] = &unk_1E228D3D8;
  v15 = v8;
  v16 = v10;
  v17 = v9;
  v18 = a1;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __125__INRootCodableDescription_recursivelyAssignCodableDescriptionsFor_referencedCodableDescriptions_visitedCodableDescriptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id obj;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  obj = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectTypeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "typeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 168), obj);
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", obj);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if ((v7 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", MEMORY[0x1E0C9AAB0], obj);
      objc_msgSend(obj, "attributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __125__INRootCodableDescription_recursivelyAssignCodableDescriptionsFor_referencedCodableDescriptions_visitedCodableDescriptions___block_invoke_2;
      v14[3] = &unk_1E228D3B0;
      v10 = obj;
      v12 = *(void **)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 56);
      v15 = v10;
      v18 = v11;
      v16 = v12;
      v17 = *(id *)(a1 + 40);
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);

    }
  }

}

void __125__INRootCodableDescription_recursivelyAssignCodableDescriptionsFor_referencedCodableDescriptions_visitedCodableDescriptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id *v6;

  v6 = a2;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectTypeName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "typeName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v3, "isEqualToString:", v4);

      if (v5)
        objc_storeWeak(v6 + 21, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 56), "recursivelyAssignCodableDescriptionsFor:referencedCodableDescriptions:visitedCodableDescriptions:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
  }

}

void __72__INRootCodableDescription_makeFromWidgetPlistableRepresentation_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 48), "recursivelyAssignCodableDescriptionsFor:referencedCodableDescriptions:visitedCodableDescriptions:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

@end
