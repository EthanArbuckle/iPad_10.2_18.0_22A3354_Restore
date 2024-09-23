@implementation BKSHIDEventDiscreteDispatchingPredicate

- (NSSet)senderDescriptors
{
  return self->_senderDescriptors;
}

- (BOOL)specifiesDescriptor:(id)a3
{
  id v4;
  uint64_t v5;
  NSSet *v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSSet containsObject:](self->_descriptors, "containsObject:", v4))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = self->_fuzzyDescriptors;
    v5 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "describes:", v4, (_QWORD)v10) & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        v5 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v5;
}

- (BKSHIDEventDiscreteDispatchingPredicate)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventDiscreteDispatchingPredicate *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventDiscreteDispatchingPredicate *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BKSHIDEventDiscreteDispatchingPredicate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BKSHIDEventDiscreteDispatchingPredicate.m");
    v17 = 1024;
    v18 = 38;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventDiscreteDispatchingPredicate *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithSourceDescriptors:(id)a3 descriptors:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  BKSHIDEventDiscreteDispatchingPredicate *v11;
  uint64_t v12;
  NSSet *senderDescriptors;
  void *v14;
  void *v15;
  NSSet *v16;
  NSSet *descriptors;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSSet *v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  NSSet *fuzzyDescriptors;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  BKSHIDEventDiscreteDispatchingPredicate *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_opt_class();
  if (v9 != objc_opt_class())
  {
    v10 = objc_opt_class();
    if (v10 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDEventDiscreteDispatchingPredicate cannot be subclassed"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v38 = v28;
        v39 = 2114;
        v40 = v30;
        v41 = 2048;
        v42 = self;
        v43 = 2114;
        v44 = CFSTR("BKSHIDEventDiscreteDispatchingPredicate.m");
        v45 = 1024;
        v46 = 43;
        v47 = 2114;
        v48 = v27;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A137F2CLL);
    }
  }
  v35.receiver = self;
  v35.super_class = (Class)BKSHIDEventDiscreteDispatchingPredicate;
  v11 = -[BKSHIDEventDiscreteDispatchingPredicate init](&v35, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v7, "copy");
    senderDescriptors = v11->_senderDescriptors;
    v11->_senderDescriptors = (NSSet *)v12;

    v14 = (void *)objc_msgSend(v8, "copy");
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v16 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    descriptors = v11->_descriptors;
    v11->_descriptors = v16;

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v18);
          v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v24, "requiresFuzzyMatching", (_QWORD)v31))
          {
            if (!v21)
              v21 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
            -[NSSet addObject:](v21, "addObject:", v24);
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v20);
    }
    else
    {
      v21 = 0;
    }

    fuzzyDescriptors = v11->_fuzzyDescriptors;
    v11->_fuzzyDescriptors = v21;

  }
  return v11;
}

- (NSSet)displays
{
  return (NSSet *)-[NSSet bs_map:](self->_senderDescriptors, "bs_map:", &__block_literal_global_7593);
}

- (BOOL)containsDescriptor:(id)a3
{
  return -[NSSet containsObject:](self->_descriptors, "containsObject:", a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSHIDEventDiscreteDispatchingPredicate _initWithSourceDescriptors:descriptors:](+[BKSMutableHIDEventDiscreteDispatchingPredicate allocWithZone:](BKSMutableHIDEventDiscreteDispatchingPredicate, "allocWithZone:", a3), "_initWithSourceDescriptors:descriptors:", self->_senderDescriptors, self->_descriptors);
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *senderDescriptors;
  id v5;

  senderDescriptors = self->_senderDescriptors;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", senderDescriptors, CFSTR("senderDescriptors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_descriptors, CFSTR("descriptors"));

}

- (BKSHIDEventDiscreteDispatchingPredicate)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void **v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void **v28;
  uint64_t *v29;
  void *v30;
  void *v31;
  BKSHIDEventDiscreteDispatchingPredicate *v32;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class() || (v6 = objc_opt_class(), v6 == objc_opt_class()))
  {
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("senderDescriptors"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v9, "bs_containsObjectPassingTest:", &__block_literal_global_17_7579))
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = *MEMORY[0x1E0CB28A8];
        v42 = *MEMORY[0x1E0CB2D68];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDiscreteDispatchingPredicate: senderDescriptors contains non-BKSHIDEventSenderDescriptor elements : %@"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v10;
        v17 = (void *)MEMORY[0x1E0C99D80];
        v18 = (void **)v43;
        v19 = &v42;
LABEL_9:
        objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 4866, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "failWithError:", v21);

LABEL_15:
        goto LABEL_16;
      }
    }
    else if (v9)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB28A8];
      v40 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDiscreteDispatchingPredicate: senderDescriptors not of class NSSet : %@"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v10;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = &v41;
      v19 = &v40;
      goto LABEL_9;
    }
    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("descriptors"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!objc_msgSend(v10, "bs_containsObjectPassingTest:", &__block_literal_global_25_7584))
      {
        self = (BKSHIDEventDiscreteDispatchingPredicate *)-[BKSHIDEventDiscreteDispatchingPredicate _initWithSourceDescriptors:descriptors:](self, "_initWithSourceDescriptors:descriptors:", v9, v10);
        v32 = self;
        goto LABEL_17;
      }
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB28A8];
      v38 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDiscreteDispatchingPredicate: descriptors contains non-BKSHIDEventDescriptor elements : %@"), v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v20;
      v27 = (void *)MEMORY[0x1E0C99D80];
      v28 = &v39;
      v29 = &v38;
    }
    else
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB28A8];
      v36 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDiscreteDispatchingPredicate: descriptors not of class NSSet : %@"), v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v20;
      v27 = (void *)MEMORY[0x1E0C99D80];
      v28 = &v37;
      v29 = &v36;
    }
    objc_msgSend(v27, "dictionaryWithObjects:forKeys:count:", v28, v29, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 4866, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v31);

    goto LABEL_15;
  }
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB28A8];
  v34 = *MEMORY[0x1E0CB2D68];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDiscreteDispatchingPredicate: subclasses are not allowed : %@"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 4866, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failWithError:", v11);

LABEL_16:
  v32 = 0;
LABEL_17:

  return v32;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSSet hash](self->_senderDescriptors, "hash");
  return v3 ^ -[NSSet hash](self->_descriptors, "hash") ^ 0x1A0E1;
}

- (BOOL)isEqual:(id)a3
{
  BKSHIDEventDiscreteDispatchingPredicate *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = (BKSHIDEventDiscreteDispatchingPredicate *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if ((v5 == objc_opt_class() || (v6 = objc_opt_class(), v6 == objc_opt_class())) && BSEqualObjects())
      v7 = BSEqualObjects();
    else
      v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  NSSet *senderDescriptors;
  void *v6;
  id v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v4 = a3;
  senderDescriptors = self->_senderDescriptors;
  v12 = v4;
  if (!senderDescriptors)
  {
    v8 = CFSTR("(match all)");
    v9 = v4;
LABEL_6:
    v10 = (id)objc_msgSend(v9, "appendObject:withName:", v8, CFSTR("senders"));
    goto LABEL_7;
  }
  if (!-[NSSet count](senderDescriptors, "count"))
  {
    v8 = CFSTR("(match none)");
    v9 = v12;
    goto LABEL_6;
  }
  -[NSSet allObjects](self->_senderDescriptors, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v12, "appendObject:withName:", v6, CFSTR("senders"));

LABEL_7:
  v11 = (id)objc_msgSend(v12, "appendObject:withName:", self->_descriptors, CFSTR("events"));

}

- (NSSet)descriptors
{
  return self->_descriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fuzzyDescriptors, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_senderDescriptors, 0);
}

BOOL __57__BKSHIDEventDiscreteDispatchingPredicate_initWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

BOOL __57__BKSHIDEventDiscreteDispatchingPredicate_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

id __51__BKSHIDEventDiscreteDispatchingPredicate_displays__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a2, "associatedDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[BKSHIDEventDisplay nullDisplay](BKSHIDEventDisplay, "nullDisplay");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
