@implementation CKDMMCSItemGroup

+ (id)tupleForItem:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_contentBaseURL(v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend_contentBaseURL(v3, v6, v7);
  else
    objc_msgSend_null(MEMORY[0x1E0C99E38], v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v9;
  objc_msgSend_owner(v3, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend_owner(v3, v12, v13);
  else
    objc_msgSend_null(MEMORY[0x1E0C99E38], v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v15;
  objc_msgSend_requestor(v3, v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend_requestor(v3, v18, v19);
  else
    objc_msgSend_null(MEMORY[0x1E0C99E38], v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v21;
  objc_msgSend_downloadPreauthorization(v3, v22, v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    objc_msgSend_downloadPreauthorization(v3, v24, v25);
  else
    objc_msgSend_null(MEMORY[0x1E0C99E38], v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v27;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v28, (uint64_t)v31, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (CKDMMCSItemGroup)initWithTuple:(id)a3
{
  id v5;
  CKDMMCSItemGroup *v6;
  CKDMMCSItemGroup *v7;
  uint64_t v8;
  NSMutableArray *items;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKDMMCSItemGroup;
  v6 = -[CKDMMCSItemGroup init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tuple, a3);
    v8 = objc_opt_new();
    items = v7->_items;
    v7->_items = (NSMutableArray *)v8;

  }
  return v7;
}

- (id)CKPropertiesDescription
{
  unint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  char isEqualToString;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  const char *v69;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  void *v80;

  v3 = 0x1E0C99000uLL;
  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentBaseURL(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10 = (void *)v7;
    objc_msgSend_contentBaseURL(self, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_null(MEMORY[0x1E0C99E38], v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 != v14)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_contentBaseURL(self, v8, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v15, v17, (uint64_t)CFSTR("contentBaseURL=%@"), v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v4, v19, (uint64_t)v18);

    }
  }
  objc_msgSend_owner(self, v8, v9);
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v23 = (void *)v20;
    objc_msgSend_owner(self, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_null(MEMORY[0x1E0C99E38], v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24 != v27)
    {
      v28 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_owner(self, v21, v22);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v28, v30, (uint64_t)CFSTR("owner=%@"), v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v4, v32, (uint64_t)v31);

    }
  }
  objc_msgSend_requestor(self, v21, v22);
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v36 = (void *)v33;
    objc_msgSend_requestor(self, v34, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_null(MEMORY[0x1E0C99E38], v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v40)
    {

    }
    else
    {
      v43 = (void *)v40;
      objc_msgSend_owner(self, v41, v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_requestor(self, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_owner(self, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v47, v51, (uint64_t)v50);

        v3 = 0x1E0C99000;
        if ((isEqualToString & 1) != 0)
          goto LABEL_16;
      }
      else
      {

      }
      v54 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_requestor(self, v34, v53);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v54, v55, (uint64_t)CFSTR("requestor=%@"), v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v4, v56, (uint64_t)v37);
    }

  }
LABEL_16:
  objc_msgSend_arrayWithCapacity_(*(void **)(v3 + 3560), v34, 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_complete(self, v58, v59))
    objc_msgSend_addObject_(v57, v60, (uint64_t)CFSTR("complete"));
  objc_msgSend_downloadPreauthorization(self, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
    objc_msgSend_addObject_(v57, v63, (uint64_t)CFSTR("use-download-preauth"));
  if (objc_msgSend_count(v57, v63, v64))
  {
    v67 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_componentsJoinedByString_(v57, v65, (uint64_t)CFSTR("|"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v67, v69, (uint64_t)CFSTR("flags=%@"), v68);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v71, (uint64_t)v70);

  }
  objc_msgSend_error(self, v65, v66);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    v75 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_error(self, v73, v74);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v75, v77, (uint64_t)CFSTR("error=%@"), v76);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v79, (uint64_t)v78);

  }
  objc_msgSend_componentsJoinedByString_(v4, v73, (uint64_t)CFSTR(", "));
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  return v80;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDMMCSItemGroup *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (NSURL)contentBaseURL
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_tuple(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (NSString)owner
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_tuple(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)requestor
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_tuple(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v3, v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (CKAssetDownloadPreauthorization)downloadPreauthorization
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  char isEqual;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;

  objc_msgSend_null(MEMORY[0x1E0C99E38], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tuple(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v7, v8, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v4, v10, (uint64_t)v9);

  if ((isEqual & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend_tuple(self, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v15, v16, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (CKAssetDownloadPreauthorization *)v14;
}

- (void)addItem:(id)a3
{
  objc_msgSend_addObject_(self->_items, a2, (uint64_t)a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSArray)items
{
  return &self->_items->super;
}

- (MMCSOperationMetric)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (NSData)authPutRequest
{
  return self->_authPutRequest;
}

- (void)setAuthPutRequest:(id)a3
{
  objc_storeStrong((id *)&self->_authPutRequest, a3);
}

- (NSData)cloneContext
{
  return self->_cloneContext;
}

- (void)setCloneContext:(id)a3
{
  objc_storeStrong((id *)&self->_cloneContext, a3);
}

- (NSArray)tuple
{
  return self->_tuple;
}

- (void)setTuple:(id)a3
{
  objc_storeStrong((id *)&self->_tuple, a3);
}

- (BOOL)complete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuple, 0);
  objc_storeStrong((id *)&self->_cloneContext, 0);
  objc_storeStrong((id *)&self->_authPutRequest, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
