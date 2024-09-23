@implementation GDInteractionEnumeration

- (GDInteractionEnumeration)initWithStore:(id)a3 batchSize:(unint64_t)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  GDInteractionEnumeration *v15;

  v6 = a3;
  v7 = (void *)MEMORY[0x1C3BA7BEC]();
  objc_msgSend_predicateWithValue_(MEMORY[0x1E0CB3880], v8, 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v7);
  v11 = (void *)MEMORY[0x1C3BA7BEC]();
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v12, (uint64_t)CFSTR("startDate"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v11);
  v15 = (GDInteractionEnumeration *)objc_msgSend_initWithStore_predicate_sortDescriptor_batchSize_(self, v14, (uint64_t)v6, (uint64_t)v10, v13, a4);

  return v15;
}

- (GDInteractionEnumeration)initWithStore:(id)a3 predicate:(id)a4 sortDescriptor:(id)a5 batchSize:(unint64_t)a6
{
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  GDInteractionEnumeration *v18;
  GDInteractionEnumeration *v19;
  unint64_t v20;
  void *v22;
  const char *v23;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v17 = a5;
  if (!a6)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)self, CFSTR("GDInteractionStoreShim.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("batchSize > 0"));

  }
  v24.receiver = self;
  v24.super_class = (Class)GDInteractionEnumeration;
  v18 = -[GDInteractionEnumeration init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_store, a3);
    objc_storeStrong((id *)&v19->_predicate, a4);
    objc_storeStrong((id *)&v19->_sortDescriptor, a5);
    v20 = 10;
    if (a6 > 0xA)
      v20 = a6;
    v19->_batchSize = v20;
  }

  return v19;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id *v5;
  unint64_t v7;
  NSPredicate *predicate;
  NSSortDescriptor *sortDescriptor;
  unint64_t batchSize;
  _CDInteractionStore *v11;
  NSPredicate *v12;
  NSSortDescriptor *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  const char *v23;
  uint64_t v24;
  NSArray *v25;
  NSArray *batch;
  NSArray *v27;
  NSArray *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  NSObject *v38;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint8_t v47[128];
  uint8_t buf[16];
  uint64_t v49;

  v5 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  if (a3->var0)
  {
    v7 = a3->var3[0];
  }
  else
  {
    v7 = 0;
    a3->var2 = (unint64_t *)self;
    a3->var3[0] = 0;
    a3->var0 = 1;
  }
  a3->var1 = a4;
  predicate = self->_predicate;
  sortDescriptor = self->_sortDescriptor;
  batchSize = self->_batchSize;
  v11 = self->_store;
  v12 = predicate;
  v13 = sortDescriptor;
  v14 = objc_opt_self();
  v15 = (void *)MEMORY[0x1C3BA7BEC](v14);
  *(_QWORD *)buf = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v16, (uint64_t)buf, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  objc_msgSend_queryInteractionsUsingPredicate_sortDescriptors_limit_offset_error_(v11, v18, (uint64_t)v12, (uint64_t)v17, batchSize, v7, &v46);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v46;

  objc_autoreleasePoolPop(v15);
  v21 = 0;
  if (!v19)
    v21 = objc_retainAutorelease(v20);

  v22 = v21;
  objc_msgSend__pas_mappedArrayWithTransform_(v19, v23, (uint64_t)&unk_1E7A49998, v24);
  v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
  batch = self->_batch;
  self->_batch = v25;

  v27 = self->_batch;
  if (v27)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v28 = v27;
    v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v42, (uint64_t)v47, 16);
    if (v30)
    {
      v32 = v30;
      v33 = 0;
      v34 = *(_QWORD *)v43;
      while (2)
      {
        v35 = 0;
        if (a5 >= v33)
          v36 = a5 - v33;
        else
          v36 = 0;
        do
        {
          if (*(_QWORD *)v43 != v34)
            objc_enumerationMutation(v28);
          if (v36 == v35)
          {
            v37 = v32 - 1;
            if (v36 < v32 - 1)
              v37 = v36;
            v33 += v37;
            goto LABEL_25;
          }
          *v5++ = *(id *)(*((_QWORD *)&v42 + 1) + 8 * v35++);
        }
        while (v32 != v35);
        v33 += v35;
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v42, (uint64_t)v47, 16);
        if (v32)
          continue;
        break;
      }
    }
    else
    {
      v33 = 0;
    }
LABEL_25:

    a3->var3[0] += v33;
  }
  else
  {
    GDDefaultLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v22;
      _os_log_error_impl(&dword_1C0771000, v38, OS_LOG_TYPE_ERROR, "GDInteractionEnumeration: _cdInteractionFromStore error: %@", buf, 0xCu);
    }

    v33 = 0;
  }

  return v33;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptor, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_batch, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
