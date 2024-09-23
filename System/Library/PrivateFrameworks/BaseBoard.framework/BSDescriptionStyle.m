@implementation BSDescriptionStyle

- (_QWORD)_styleByOverlayingStyle:(CFSetRef *)a1
{
  _QWORD *v2;
  BOOL v4;
  CFSetRef *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;

  v2 = a1;
  if (a1)
  {
    if ((CFSetRef *)a2 == a1)
    {
      v5 = a1;
      goto LABEL_51;
    }
    if (a1[1])
      v4 = *(_QWORD *)(a2 + 8) == 0;
    else
      v4 = 0;
    if (!v4
      && (!a1[2] || *(_QWORD *)(a2 + 16))
      && (!a1[3] || *(_QWORD *)(a2 + 24))
      && (!a1[5] || *(_QWORD *)(a2 + 40))
      && (!a1[4] || *(_QWORD *)(a2 + 32))
      && (!a1[6] || *(_QWORD *)(a2 + 48))
      && a1[7] == *(CFSetRef *)(a2 + 56)
      && (!a1[8] || *(_QWORD *)(a2 + 64))
      && a1[9] == *(CFSetRef *)(a2 + 72)
      && (!a1[10] || *(_QWORD *)(a2 + 80))
      && (!a1[11] || *(_QWORD *)(a2 + 88))
      && BSEqualSets(a1[13], *(const __CFSet **)(a2 + 104)))
    {
      v5 = (CFSetRef *)(id)a2;
LABEL_51:
      v2 = v5;
      return v2;
    }
    v6 = -[BSDescriptionStyle _initWithCopyOf:]([BSDescriptionStyle alloc], (uint64_t)v2);
    v2 = v6;
    if (v6)
    {
      v7 = *(void **)(a2 + 8);
      if (v7)
        v6[1] = v7;
      v8 = *(void **)(a2 + 16);
      if (v8)
        v6[2] = v8;
      v9 = *(void **)(a2 + 24);
      if (v9)
        v6[3] = v9;
      v10 = *(void **)(a2 + 32);
      if (v10)
        v6[4] = v10;
      v11 = *(void **)(a2 + 40);
      if (v11)
        v6[5] = v11;
      v12 = *(void **)(a2 + 88);
      if (v12)
        v6[11] = v12;
      v13 = *(void **)(a2 + 48);
      if (v13)
      {
        v6[6] = v13;
        v6[7] = *(id *)(a2 + 56);
      }
      v14 = *(void **)(a2 + 64);
      if (v14)
      {
        v6[8] = v14;
        v6[9] = *(id *)(a2 + 72);
      }
      v15 = *(void **)(a2 + 80);
      if (v15)
      {
        v6[10] = v15;
        v6[12] = *(id *)(a2 + 96);
      }
      v16 = *(id *)(a2 + 104);
      if (v16)
      {
        v17 = v6[13];
        if (v17 != v16)
        {
          if (v17)
          {
            objc_msgSend(v17, "setByAddingObjectsFromSet:");
            v18 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v18 = objc_msgSend(*(id *)(a2 + 104), "copy");
          }
          v19 = (void *)v2[13];
          v2[13] = v18;

        }
      }
    }
  }
  return v2;
}

- (id)_init
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSDescriptionStyle cannot be subclassed"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__init);
          v5 = (id)objc_claimAutoreleasedReturnValue();
          v6 = (objc_class *)objc_opt_class();
          NSStringFromClass(v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v10 = v5;
          v11 = 2114;
          v12 = v7;
          v13 = 2048;
          v14 = v1;
          v15 = 2114;
          v16 = CFSTR("BSDescriptionStyle.m");
          v17 = 1024;
          v18 = 362;
          v19 = 2114;
          v20 = v4;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
        __break(0);
        JUMPOUT(0x18A203C10);
      }
    }
    v8.receiver = v1;
    v8.super_class = (Class)BSDescriptionStyle;
    return objc_msgSendSuper2(&v8, sel_init);
  }
  return result;
}

+ (id)debugStyle
{
  if (qword_1ECD39A90 != -1)
    dispatch_once(&qword_1ECD39A90, &__block_literal_global_38);
  return (id)qword_1ECD39A88;
}

void __32__BSDescriptionStyle_debugStyle__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[BSDescriptionStyle _init]([BSDescriptionStyle alloc]);
  v1 = (void *)qword_1ECD39A88;
  qword_1ECD39A88 = (uint64_t)v0;

  *(_QWORD *)(qword_1ECD39A88 + 16) = 2;
}

+ (id)succinctStyle
{
  if (qword_1ECD39AA0 != -1)
    dispatch_once(&qword_1ECD39AA0, &__block_literal_global_39);
  return (id)qword_1ECD39A98;
}

void __35__BSDescriptionStyle_succinctStyle__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[BSDescriptionStyle _init]([BSDescriptionStyle alloc]);
  v1 = (void *)qword_1ECD39A98;
  qword_1ECD39A98 = (uint64_t)v0;

  *(_QWORD *)(qword_1ECD39A98 + 8) = 2;
}

+ (id)keyValuePairSortedByKeyStyle
{
  if (qword_1ECD39AB0 != -1)
    dispatch_once(&qword_1ECD39AB0, &__block_literal_global_40);
  return (id)qword_1ECD39AA8;
}

void __50__BSDescriptionStyle_keyValuePairSortedByKeyStyle__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[BSDescriptionStyle _init]([BSDescriptionStyle alloc]);
  v1 = (void *)qword_1ECD39AA8;
  qword_1ECD39AA8 = (uint64_t)v0;

  *(_QWORD *)(qword_1ECD39AA8 + 88) = 2;
}

+ (id)styleForEndTruncatingCollectionsOverItemCount:(int64_t)a3
{
  _QWORD *v4;

  v4 = -[BSDescriptionStyle _init]([BSDescriptionStyle alloc]);
  v4[10] = 2;
  v4[12] = a3;
  return v4;
}

- (id)_initWithCopyOf:(void *)a1
{
  id *v3;
  id *v4;

  if (!a1)
    return 0;
  v3 = (id *)-[BSDescriptionStyle _init](a1);
  v4 = v3;
  if (v3)
  {
    v3[1] = *(id *)(a2 + 8);
    v3[2] = *(id *)(a2 + 16);
    v3[3] = *(id *)(a2 + 24);
    v3[4] = *(id *)(a2 + 32);
    v3[5] = *(id *)(a2 + 40);
    v3[10] = *(id *)(a2 + 80);
    v3[6] = *(id *)(a2 + 48);
    v3[7] = *(id *)(a2 + 56);
    v3[8] = *(id *)(a2 + 64);
    v3[9] = *(id *)(a2 + 72);
    v3[12] = *(id *)(a2 + 96);
    v3[11] = *(id *)(a2 + 88);
    objc_storeStrong(v3 + 13, *(id *)(a2 + 104));
  }
  return v4;
}

- (id)styleByOverlayingStyle:(id)a3
{
  return -[BSDescriptionStyle _styleByOverlayingStyle:](&self->super.isa, (uint64_t)a3);
}

+ (id)build:(id)a3
{
  id v4;
  void *v5;

  v4 = -[BSDescriptionStyle _init]([BSMutableDescriptionStyle alloc]);
  (*((void (**)(id, id))a3 + 2))(a3, v4);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (BSDescriptionStyle)init
{
  void *v2;
  void *v3;
  BSDescriptionStyle *result;
  int v5;
  void *v6;
  __int16 v7;
  const __CFString *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate BSDescriptionStyle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BSDescriptionStyle init]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138544130;
    v6 = v3;
    v7 = 2114;
    v8 = CFSTR("BSDescriptionStyle.m");
    v9 = 1024;
    v10 = 351;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v5, 0x26u);

  }
  result = (BSDescriptionStyle *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
  qword_1EDF5BAE8 = (uint64_t)result;
  __break(0);
  return result;
}

+ (BSDescriptionStyle)new
{
  void *v2;
  void *v3;
  BSDescriptionStyle *result;
  int v5;
  void *v6;
  __int16 v7;
  const __CFString *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate BSDescriptionStyle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BSDescriptionStyle new]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138544130;
    v6 = v3;
    v7 = 2114;
    v8 = CFSTR("BSDescriptionStyle.m");
    v9 = 1024;
    v10 = 356;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v5, 0x26u);

  }
  result = (BSDescriptionStyle *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
  qword_1EDF5BAE8 = (uint64_t)result;
  __break(0);
  return result;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  NSSet *clientInformation;
  unint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_verbosity);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_debugging);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_collectionLineBreak);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_proemItemSeparator);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_bodyItemSeparator);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_collectionTruncationStyle);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_nameTruncation);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v15, "hash");
  v34 = v14;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maximumNameLengthBeforeTruncation);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v16, "hash");
  v31 = v12;
  v17 = v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_valueTruncation);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash");
  v20 = v6;
  v21 = v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maximumValueLengthBeforeTruncation);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maximumItemCountForTruncation);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_keyValuePairSorting);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v20 ^ v21 ^ v17 ^ v10 ^ v31 ^ v34 ^ v33 ^ v32 ^ v19 ^ v23 ^ v25 ^ objc_msgSend(v26, "hash");

  clientInformation = self->_clientInformation;
  if (clientInformation)
    v27 ^= -[NSSet hash](clientInformation, "hash");
  v29 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v27 ^ (v27 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v27 ^ (v27 >> 30))) >> 27));
  return v29 ^ (v29 >> 31);
}

- (BOOL)isEqual:(id)a3
{
  CFSetRef *v5;
  CFSetRef *v6;
  char v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = (CFSetRef *)a3;
  v6 = v5;
  if (v5[1] == (CFSetRef)self->_verbosity
    && v5[2] == (CFSetRef)self->_debugging
    && v5[3] == (CFSetRef)self->_collectionLineBreak
    && v5[4] == (CFSetRef)self->_proemItemSeparator
    && v5[5] == (CFSetRef)self->_bodyItemSeparator
    && v5[10] == (CFSetRef)self->_collectionTruncationStyle
    && v5[12] == (CFSetRef)self->_maximumItemCountForTruncation
    && v5[11] == (CFSetRef)self->_keyValuePairSorting)
  {
    v7 = BSEqualSets(v5[13], (const __CFSet *)self->_clientInformation);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BSDescriptionStyle _initWithCopyOf:]([BSMutableDescriptionStyle alloc], (uint64_t)self);
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__BSDescriptionStyle_appendDescriptionToFormatter___block_invoke;
  v3[3] = &unk_1E1EBE700;
  v3[4] = a3;
  v3[5] = self;
  objc_msgSend(a3, "appendProem:block:", 0, v3);
}

void __51__BSDescriptionStyle_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  void *v2;
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
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;

  v2 = *(void **)(a1 + 32);
  NSStringFromBSDescriptionVerbosity(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("verbosity"));

  v4 = *(void **)(a1 + 32);
  NSStringFromBSDescriptionDebugging(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("debugging"));

  v6 = *(void **)(a1 + 32);
  NSStringFromBSDescriptionCollectionLineBreak(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v7, CFSTR("collectionLineBreak"));

  v8 = *(void **)(a1 + 32);
  NSStringFromBSDescriptionItemSeparator(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:", v9, CFSTR("proemItemSeparator"));

  v10 = *(void **)(a1 + 32);
  NSStringFromBSDescriptionItemSeparator(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendString:withName:", v11, CFSTR("bodyItemSeparator"));

  v12 = *(void **)(a1 + 32);
  NSStringFromBSDescriptionLineTruncation(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendString:withName:", v13, CFSTR("nameTruncationStyle"));

  v14 = *(_QWORD *)(a1 + 40);
  if (*(uint64_t *)(v14 + 56) >= 1)
  {
    v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:");
    v14 = *(_QWORD *)(a1 + 40);
  }
  v16 = *(void **)(a1 + 32);
  NSStringFromBSDescriptionLineTruncation(*(_QWORD *)(v14 + 64));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendString:withName:", v17, CFSTR("objectTruncationStyle"));

  v18 = *(_QWORD *)(a1 + 40);
  if (*(uint64_t *)(v18 + 72) >= 1)
  {
    v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:");
    v18 = *(_QWORD *)(a1 + 40);
  }
  v20 = *(void **)(a1 + 32);
  NSStringFromBSDescriptionCollectionTruncationStyle(*(_QWORD *)(v18 + 80));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendString:withName:", v21, CFSTR("collectionTruncationStyle"));

  v22 = *(_QWORD *)(a1 + 40);
  if (*(uint64_t *)(v22 + 96) >= 1)
  {
    v23 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:");
    v22 = *(_QWORD *)(a1 + 40);
  }
  v24 = *(void **)(a1 + 32);
  NSStringFromBSDescriptionKeyValuePairSorting(*(_QWORD *)(v22 + 88));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "appendString:withName:", v25, CFSTR("keyValuePairSorting"));

  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104);
  if (v26)
    v27 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v26, CFSTR("clientInformation"));
}

- (int64_t)verbosity
{
  return self->_verbosity;
}

- (int64_t)debugging
{
  return self->_debugging;
}

- (int64_t)collectionLineBreak
{
  return self->_collectionLineBreak;
}

- (int64_t)proemItemSeparator
{
  return self->_proemItemSeparator;
}

- (int64_t)bodyItemSeparator
{
  return self->_bodyItemSeparator;
}

- (int64_t)keyValuePairSorting
{
  return self->_keyValuePairSorting;
}

- (int64_t)nameTruncation
{
  return self->_nameTruncation;
}

- (int64_t)maximumNameLengthBeforeTruncation
{
  return self->_maximumNameLengthBeforeTruncation;
}

- (int64_t)valueTruncation
{
  return self->_valueTruncation;
}

- (int64_t)maximumValueLengthBeforeTruncation
{
  return self->_maximumValueLengthBeforeTruncation;
}

- (int64_t)collectionTruncationStyle
{
  return self->_collectionTruncationStyle;
}

- (int64_t)maximumItemCountForTruncation
{
  return self->_maximumItemCountForTruncation;
}

- (NSSet)clientInformation
{
  return self->_clientInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientInformation, 0);
}

@end
