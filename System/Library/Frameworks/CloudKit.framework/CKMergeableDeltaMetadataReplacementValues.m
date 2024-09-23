@implementation CKMergeableDeltaMetadataReplacementValues

- (CKMergeableDeltaMetadataReplacementValues)init
{
  CKMergeableDeltaMetadataReplacementValues *v2;
  uint64_t v3;
  NSDictionary *replacementDeltaMetadatas;
  uint64_t v5;
  NSSet *removableDeltaMetadatas;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKMergeableDeltaMetadataReplacementValues;
  v2 = -[CKMergeableDeltaMetadataReplacementValues init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    replacementDeltaMetadatas = v2->_replacementDeltaMetadatas;
    v2->_replacementDeltaMetadatas = (NSDictionary *)v3;

    v5 = objc_opt_new();
    removableDeltaMetadatas = v2->_removableDeltaMetadatas;
    v2->_removableDeltaMetadatas = (NSSet *)v5;

  }
  return v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;

  v3 = (void *)objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v6, (uint64_t)CFSTR("<%@ %p;"), v7, v5, self);

  objc_msgSend_replacementDeltaMetadatas(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_count(v11, v12, v13, v14);

  if (v15)
  {
    objc_msgSend_replacementDeltaMetadatas(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v3, v20, (uint64_t)CFSTR(" replacementDeltaMetadatas=%@"), v21, v19);

  }
  objc_msgSend_removableDeltaMetadatas(self, v16, v17, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_count(v22, v23, v24, v25);

  if (v26)
  {
    objc_msgSend_removableDeltaMetadatas(self, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v3, v31, (uint64_t)CFSTR(", removableDeltaMetadatas=%@"), v32, v30);

  }
  objc_msgSend_updatedNextDeltaMetadata(self, v27, v28, v29);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend_updatedNextDeltaMetadata(self, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v3, v38, (uint64_t)CFSTR(", updatedNextDeltaMetadata=%@"), v39, v37);

  }
  objc_msgSend_appendFormat_(v3, v34, (uint64_t)CFSTR(">"), v36);
  return v3;
}

- (NSDictionary)replacementDeltaMetadatas
{
  return self->_replacementDeltaMetadatas;
}

- (void)setReplacementDeltaMetadatas:(id)a3
{
  objc_storeStrong((id *)&self->_replacementDeltaMetadatas, a3);
}

- (NSSet)removableDeltaMetadatas
{
  return self->_removableDeltaMetadatas;
}

- (void)setRemovableDeltaMetadatas:(id)a3
{
  objc_storeStrong((id *)&self->_removableDeltaMetadatas, a3);
}

- (CKMergeableDeltaMetadata)updatedNextDeltaMetadata
{
  return self->_updatedNextDeltaMetadata;
}

- (void)setUpdatedNextDeltaMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_updatedNextDeltaMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedNextDeltaMetadata, 0);
  objc_storeStrong((id *)&self->_removableDeltaMetadatas, 0);
  objc_storeStrong((id *)&self->_replacementDeltaMetadatas, 0);
}

@end
