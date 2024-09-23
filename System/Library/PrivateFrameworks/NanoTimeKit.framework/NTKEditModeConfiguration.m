@implementation NTKEditModeConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nilSlotOption, 0);
  objc_storeStrong((id *)&self->_optionsBySlot, 0);
}

- (void)enumerateSlotsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  NTKEditModeConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v16 = 0;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)-[NSMutableDictionary copy](v5->_optionsBySlot, "copy");
  v7 = v6;
  if (v6)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v6, "allKeys", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11), &v16);
        if (v16)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  else
  {
    v4[2](v4, 0, &v16);
  }

  objc_sync_exit(v5);
}

- (void)setEditOption:(id)a3 forSlot:(id)a4
{
  id v7;
  NTKEditModeConfiguration *v8;
  NTKEditOption *nilSlotOption;
  NSMutableDictionary *optionsBySlot;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  nilSlotOption = v8->_nilSlotOption;
  if (!v7)
  {
    optionsBySlot = v8->_optionsBySlot;
    if (!optionsBySlot)
      goto LABEL_10;
    goto LABEL_5;
  }
  if (nilSlotOption)
  {
    optionsBySlot = v8->_optionsBySlot;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_nilSlotOption = %@, _optionsBySlot = %@, requested slot = %@"), nilSlotOption, optionsBySlot, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Cannot have nil and non-nil custom edit mode slots for same edit mode. (%@)"), v11);

    if (v7)
      goto LABEL_6;
LABEL_10:
    objc_storeStrong((id *)&v8->_nilSlotOption, a3);
    goto LABEL_12;
  }
LABEL_6:
  if (!v8->_optionsBySlot)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = v8->_optionsBySlot;
    v8->_optionsBySlot = v12;

  }
  v14 = v8->_optionsBySlot;
  if (v15)
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v15, v7);
  else
    -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:", v7);
LABEL_12:
  objc_sync_exit(v8);

}

- (id)editOptionForSlot:(id)a3
{
  id v4;
  NTKEditModeConfiguration *v5;
  NTKEditOption *v6;
  NTKEditOption *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](v5->_optionsBySlot, "objectForKey:", v4);
    v6 = (NTKEditOption *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v5->_nilSlotOption;
  }
  v7 = v6;
  objc_sync_exit(v5);

  return v7;
}

- (id)dailySnapshotKey
{
  NTKEditModeConfiguration *v2;
  void *v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableDictionary copy](v2->_optionsBySlot, "copy");
  -[NTKEditModeConfiguration _alphabeticalSlots](v2, "_alphabeticalSlots");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = v17;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v20 != v6)
            objc_enumerationMutation(obj);
          objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "dailySnapshotKey");
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = (void *)v9;
          if (v9)
            v11 = (__CFString *)v9;
          else
            v11 = &stru_1E6BDC918;
          v12 = v11;

          -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("(%@)"), v12);
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v5);
    }

  }
  else
  {
    -[NTKEditOption dailySnapshotKey](v2->_nilSlotOption, "dailySnapshotKey");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = &stru_1E6BDC918;
    if (v13)
      v15 = (__CFString *)v13;
    v4 = v15;

  }
  return v4;
}

- (id)description
{
  NTKEditModeConfiguration *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableDictionary copy](v2->_optionsBySlot, "copy");
  -[NTKEditModeConfiguration _alphabeticalSlots](v2, "_alphabeticalSlots");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "description");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            if ((unint64_t)objc_msgSend(v5, "length") >= 2)
              objc_msgSend(v5, "appendString:", CFSTR(", "));
            objc_msgSend(v5, "appendString:", v11);
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    objc_msgSend(v5, "appendString:", CFSTR(")"));
  }
  else
  {
    -[NTKEditOption description](v2->_nilSlotOption, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_alphabeticalSlots
{
  NTKEditModeConfiguration *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary allKeys](v2->_optionsBySlot, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NTKEditModeConfiguration *v4;
  NSMutableDictionary *optionsBySlot;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  optionsBySlot = v4->_optionsBySlot;
  if (optionsBySlot)
    objc_msgSend(v6, "encodeObject:forKey:", optionsBySlot, CFSTR("optionsBySlot"));
  else
    objc_msgSend(v6, "encodeObject:forKey:", v4->_nilSlotOption, CFSTR("nilSlotOption"));
  objc_sync_exit(v4);

}

- (NTKEditModeConfiguration)initWithCoder:(id)a3
{
  id v4;
  NTKEditModeConfiguration *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *optionsBySlot;
  uint64_t v15;

  v4 = a3;
  v5 = -[NTKEditModeConfiguration init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("optionsBySlot"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      NTKValidateDictionary(v10, v11, v12);
      if (!objc_msgSend(v10, "count"))
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("_EditModeConfiguration archive contains empty options-by-slot dictionary. Dictionary should be nil or non-empty."));
      v13 = objc_msgSend(v10, "mutableCopy");
      optionsBySlot = v5->_optionsBySlot;
      v5->_optionsBySlot = (NSMutableDictionary *)v13;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nilSlotOption"));
      v15 = objc_claimAutoreleasedReturnValue();
      optionsBySlot = v5->_nilSlotOption;
      v5->_nilSlotOption = (NTKEditOption *)v15;
    }

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  char v5;

  v4 = (void **)a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && NTKEqualObjects(self->_optionsBySlot, v4[1]))
  {
    v5 = NTKEqualObjects(self->_nilSlotOption, v4[2]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSMutableDictionary hash](self->_optionsBySlot, "hash");
  return -[NTKEditOption hash](self->_nilSlotOption, "hash") + v3;
}

- (id)JSONObjectRepresentation
{
  return -[NTKEditModeConfiguration JSONObjectRepresentationForFace:](self, "JSONObjectRepresentationForFace:", 0);
}

- (id)JSONObjectRepresentationForFace:(id)a3
{
  id v4;
  NTKEditModeConfiguration *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)-[NSMutableDictionary copy](v5->_optionsBySlot, "copy");
  objc_sync_exit(v5);

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__NTKEditModeConfiguration_JSONObjectRepresentationForFace___block_invoke;
    v11[3] = &unk_1E6BD6448;
    v12 = v7;
    v13 = v4;
    v8 = v7;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);
    v14 = CFSTR("slots");
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NTKEditOption JSONObjectRepresentationForFace:](v5->_nilSlotOption, "JSONObjectRepresentationForFace:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __60__NTKEditModeConfiguration_JSONObjectRepresentationForFace___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(a3, "JSONObjectRepresentationForFace:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (NTKEditModeConfiguration)initWithJSONObjectRepresentation:(id)a3 editOptionClass:(Class)a4 forDevice:(id)a5
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__NTKEditModeConfiguration_initWithJSONObjectRepresentation_editOptionClass_forDevice___block_invoke;
  v6[3] = &__block_descriptor_40_e47___NTKEditOption_24__0__NSString_8__CLKDevice_16lu32l8;
  v6[4] = a4;
  return -[NTKEditModeConfiguration initWithJSONObjectRepresentation:device:editOptionFactory:](self, "initWithJSONObjectRepresentation:device:editOptionFactory:", a3, a5, v6);
}

id __87__NTKEditModeConfiguration_initWithJSONObjectRepresentation_editOptionClass_forDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = *(objc_class **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_msgSend([v4 alloc], "initWithJSONObjectRepresentation:forDevice:", v6, v5);

  return v7;
}

- (NTKEditModeConfiguration)initWithJSONObjectRepresentation:(id)a3 device:(id)a4 editOptionFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  NTKEditModeConfiguration *v11;
  uint64_t v12;
  void *nilSlotOption;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  NTKEditModeConfiguration *v18;
  id v19;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NTKEditModeConfiguration;
  v11 = -[NTKEditModeConfiguration init](&v20, sel_init);
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("slots")), (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      nilSlotOption = (void *)v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("value for '%@' must be a dictionary - invalid value: %@"), CFSTR("slots"), nilSlotOption);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __86__NTKEditModeConfiguration_initWithJSONObjectRepresentation_device_editOptionFactory___block_invoke;
      v16[3] = &unk_1E6BD9150;
      v19 = v10;
      v17 = v9;
      v18 = v11;
      objc_msgSend(nilSlotOption, "enumerateKeysAndObjectsUsingBlock:", v16);

    }
    else
    {
      (*((void (**)(id, id, id))v10 + 2))(v10, v8, v9);
      v14 = objc_claimAutoreleasedReturnValue();
      nilSlotOption = v11->_nilSlotOption;
      v11->_nilSlotOption = (NTKEditOption *)v14;
    }

  }
  return v11;
}

void __86__NTKEditModeConfiguration_initWithJSONObjectRepresentation_device_editOptionFactory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("key in '%@' dictionary must be a string - invalid value: %@"), CFSTR("slots"), v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setEditOption:forSlot:", v6, v7);

}

@end
