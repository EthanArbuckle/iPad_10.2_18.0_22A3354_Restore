@implementation CKTuple3

- (CKTuple3)initWithObject1:(id)a3 object2:(id)a4 object3:(id)a5
{
  id v8;
  id v9;
  id v10;
  CKTuple3 *v11;
  const char *v12;
  uint64_t v13;
  CKTuple3 *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CKTuple3;
  v11 = -[CKTuple3 init](&v20, sel_init);
  v14 = v11;
  if (v11)
  {
    objc_msgSend_setV1_(v11, v12, (uint64_t)v8, v13);
    objc_msgSend_setV2_(v14, v15, (uint64_t)v9, v16);
    objc_msgSend_setV3_(v14, v17, (uint64_t)v10, v18);
  }

  return v14;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint64_t v3;
  void *v4;
  CKException *v7;
  const char *v8;
  id v9;

  if (a3 == 2)
  {
    objc_msgSend_v3(self, a2, 2, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    objc_msgSend_v2(self, a2, 1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      v7 = [CKException alloc];
      v9 = (id)objc_msgSend_initWithCode_format_(v7, v8, 12, (uint64_t)CFSTR("Invalid tuple index: %lu"), a3);
      objc_exception_throw(v9);
    }
    objc_msgSend_v1(self, a2, 0, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  objc_msgSend_v1(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_v2(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  objc_msgSend_v3(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  CKTuple3 *v4;
  CKTuple3 *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;

  v4 = (CKTuple3 *)a3;
  if (self == v4)
  {
    v32 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_v1(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_v1(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (v14
        && (objc_msgSend_v2(self, v15, v16, v17),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_v2(v5, v19, v20, v21),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = CKObjectsAreBothNilOrEqual(v18, v22),
            v22,
            v18,
            v23))
      {
        objc_msgSend_v3(self, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_v3(v5, v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = CKObjectsAreBothNilOrEqual(v27, v31);

      }
      else
      {
        v32 = 0;
      }

    }
    else
    {
      v32 = 0;
    }
  }

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  int v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  CKException *v49;
  const char *v50;
  id v51;

  objc_msgSend_v1(self, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_conformsToProtocol_(v5, v6, (uint64_t)&unk_1EDF77860, v7))
    goto LABEL_6;
  objc_msgSend_v2(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_conformsToProtocol_(v11, v12, (uint64_t)&unk_1EDF77860, v13) & 1) == 0)
  {

LABEL_6:
LABEL_7:
    v49 = [CKException alloc];
    v51 = (id)objc_msgSend_initWithCode_format_(v49, v50, 12, (uint64_t)CFSTR("Tuple value does not conform to NSCopying"));
    objc_exception_throw(v51);
  }
  objc_msgSend_v3(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_conformsToProtocol_(v17, v18, (uint64_t)&unk_1EDF77860, v19);

  if (!v20)
    goto LABEL_7;
  v21 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_v1(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend_copy(v25, v26, v27, v28);
  objc_msgSend_v2(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend_copy(v33, v34, v35, v36);
  objc_msgSend_v3(self, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend_copy(v41, v42, v43, v44);
  v47 = (void *)objc_msgSend_initWithObject1_object2_object3_(v21, v46, (uint64_t)v29, (uint64_t)v37, v45);

  return v47;
}

- (id)v1
{
  return self->_v1;
}

- (void)setV1:(id)a3
{
  objc_storeStrong(&self->_v1, a3);
}

- (id)v2
{
  return self->_v2;
}

- (void)setV2:(id)a3
{
  objc_storeStrong(&self->_v2, a3);
}

- (id)v3
{
  return self->_v3;
}

- (void)setV3:(id)a3
{
  objc_storeStrong(&self->_v3, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_v3, 0);
  objc_storeStrong(&self->_v2, 0);
  objc_storeStrong(&self->_v1, 0);
}

@end
