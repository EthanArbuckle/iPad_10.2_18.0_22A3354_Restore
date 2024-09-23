@implementation CLSReportItem

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;

  v4 = (void *)objc_opt_class();
  v6 = (void *)objc_msgSend_allocWithZone_(v4, v5, (uint64_t)a3);
  return (id)objc_msgSend_init(v6, v7, v8);
}

- (id)convertToItemCompatibleWithItem:(id)a3
{
  return (id)objc_msgSend_convertToItemCompatibleWithItem_copyIfSameType_(self, a2, (uint64_t)a3, 1);
}

- (id)convertToItemCompatibleWithItem:(id)a3 copyIfSameType:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  CLSReportItem *v11;
  CLSReportItem *v12;
  uint64_t v14;
  const char *v15;
  id v16;

  v4 = a4;
  v6 = a3;
  v7 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v6, v8, v7))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v9, (uint64_t)CFSTR("no compatible conversion found from item: %@ to item: %@"), self, v6);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v15, *MEMORY[0x1E0C99778], v14, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  if (v4)
    v11 = (CLSReportItem *)objc_msgSend_copy(self, v9, v10);
  else
    v11 = self;
  v12 = v11;

  return v12;
}

- (int64_t)compare:(id)a3
{
  return 0;
}

- (id)sum:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;

  v4 = a3;
  v7 = (void *)objc_msgSend_copy(self, v5, v6);
  objc_msgSend_convertToItemCompatibleWithItem_(v4, v8, (uint64_t)self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_add_(v7, v10, (uint64_t)v9);
  return v7;
}

- (void)add:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (id)scalarProduct:(double)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_copy(self, a2, v3);
  objc_msgSend_scalarMultiply_(v5, v6, v7, a3);
  return v5;
}

- (void)scalarMultiply:(double)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

+ (id)sum:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  uint64_t i;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;

  v3 = a3;
  objc_msgSend_firstObject(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend_copy(v6, v7, v8);

  v12 = objc_msgSend_count(v3, v10, v11);
  if (v12 >= 2)
  {
    v16 = v12;
    for (i = 1; i != v16; ++i)
    {
      v18 = (void *)MEMORY[0x1D82573E4]();
      objc_msgSend_objectAtIndexedSubscript_(v3, v19, i);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_add_(v9, v21, (uint64_t)v20);

      objc_autoreleasePoolPop(v18);
    }
    v15 = v9;
  }
  else
  {
    v15 = (id)objc_msgSend_copy(v9, v13, v14);
  }
  v22 = v15;

  return v22;
}

- (id)dictionaryRepresentation
{
  return (id)objc_opt_new();
}

+ (id)multiply:(id)a3 withScalar:(double)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v9 = objc_msgSend_count(v5, v7, v8);
  v11 = (void *)objc_msgSend_initWithCapacity_(v6, v10, v9);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v5;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x1D82573E4](v14);
        v22 = (void *)objc_msgSend_copy(v18, v20, v21, (_QWORD)v27);
        objc_msgSend_scalarMultiply_(v22, v23, v24, a4);

        objc_autoreleasePoolPop(v19);
        ++v17;
      }
      while (v15 != v17);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v25, (uint64_t)&v27, v31, 16);
      v15 = v14;
    }
    while (v14);
  }

  return v11;
}

+ (id)mean:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;

  v3 = a3;
  objc_msgSend_sum_(CLSReportItem, v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(v3, v6, v7);

  if (v8 >= 2)
    objc_msgSend_scalarMultiply_(v5, v9, v10, 1.0 / (double)v8);
  return v5;
}

+ (id)median:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  const char *v13;
  unint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v6 = objc_msgSend_count(v3, v4, v5);
  if (v6 > 1)
  {
    v11 = v6;
    objc_msgSend_sortedArrayUsingSelector_(v3, v7, (uint64_t)sel_compare_);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v11 >> 1;
    if ((v11 & 1) != 0)
    {
      objc_msgSend_objectAtIndexedSubscript_(v12, v13, v11 >> 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(v12, v13, v14 - 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v12, v16, v14 + 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v15;
      v23[1] = v17;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v23, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mean_(CLSReportItem, v20, (uint64_t)v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v10 = v21;

  }
  else
  {
    objc_msgSend_firstObject(v3, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v9;
  }

  return v10;
}

+ (id)midrange:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend_count(v3, v4, v5) > 1)
  {
    objc_msgSend_sortedArrayUsingSelector_(v3, v6, (uint64_t)sel_compare_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_firstObject(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v10, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v13;
    v22[1] = v16;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v17, (uint64_t)v22, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mean_(CLSReportItem, v19, (uint64_t)v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v20;
  }
  else
  {
    objc_msgSend_firstObject(v3, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8;
  }

  return v9;
}

@end
