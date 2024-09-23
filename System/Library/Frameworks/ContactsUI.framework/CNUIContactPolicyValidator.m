@implementation CNUIContactPolicyValidator

+ (id)contactFromContact:(id)a3 conformingToPolicy:(id)a4 options:(unint64_t)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0C97258], "contactFromContact:conformingToPolicy:options:valueToStringTransform:", a3, a4, a5, &__block_literal_global_37782);
}

id __76__CNUIContactPolicyValidator_contactFromContact_conformingToPolicy_options___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v28;
  id v29;
  id obj;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CNUILocalizedStringForPropertyWithFormatKey(CFSTR("LOWERCASE_LABEL"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v6;
  if (objc_msgSend(v6, "isMultiValue"))
  {
    v29 = v7;
    v11 = v7;
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@:"), v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "appendString:", v12);

    }
    v28 = v10;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v11;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v34;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v16);
          objc_msgSend(v31, "key");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNCardPropertyGroup groupForProperty:contact:store:policy:linkedPolicies:](CNCardPropertyGroup, "groupForProperty:contact:store:policy:linkedPolicies:", v18, v8, 0, 0, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:group:contact:](CNPropertyGroupItem, "propertyGroupItemWithLabeledValue:group:contact:", v17, v19, v8);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v20, "displayLabel");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "displayValue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", CFSTR("\n%@: %@"), v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "appendString:", v24);
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v14);
    }

    v10 = v28;
    v7 = v29;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v7;
      if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@: %@"), v10, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "appendString:", v26);

      }
    }
  }

  return v32;
}

@end
