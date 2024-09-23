@implementation CKTuple2

- (void).cxx_destruct
{
  objc_storeStrong(&self->_v2, 0);
  objc_storeStrong(&self->_v1, 0);
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
  unint64_t v17;

  objc_msgSend_v1(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_v2(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  CKTuple2 *v4;
  CKTuple2 *v5;
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
  char v23;

  v4 = (CKTuple2 *)a3;
  if (self == v4)
  {
    v23 = 1;
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

      if (v14)
      {
        objc_msgSend_v2(self, v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_v2(v5, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = CKObjectsAreBothNilOrEqual(v18, v22);

      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

- (id)v2
{
  return self->_v2;
}

- (id)v1
{
  return self->_v1;
}

- (CKTuple2)initWithObject1:(id)a3 object2:(id)a4
{
  id v6;
  id v7;
  CKTuple2 *v8;
  const char *v9;
  uint64_t v10;
  CKTuple2 *v11;
  const char *v12;
  uint64_t v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CKTuple2;
  v8 = -[CKTuple2 init](&v15, sel_init);
  v11 = v8;
  if (v8)
  {
    objc_msgSend_setV1_(v8, v9, (uint64_t)v6, v10);
    objc_msgSend_setV2_(v11, v12, (uint64_t)v7, v13);
  }

  return v11;
}

- (void)setV1:(id)a3
{
  objc_storeStrong(&self->_v1, a3);
}

- (void)setV2:(id)a3
{
  objc_storeStrong(&self->_v2, a3);
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint64_t v3;
  void *v4;
  CKException *v7;
  const char *v8;
  id v9;

  if (a3 == 1)
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
  int v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  CKException *v35;
  const char *v36;
  id v37;

  objc_msgSend_v1(self, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_conformsToProtocol_(v5, v6, (uint64_t)&unk_1EDF77860, v7) & 1) == 0)
  {

LABEL_5:
    v35 = [CKException alloc];
    v37 = (id)objc_msgSend_initWithCode_format_(v35, v36, 12, (uint64_t)CFSTR("Tuple value does not conform to NSCopying"));
    objc_exception_throw(v37);
  }
  objc_msgSend_v2(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_conformsToProtocol_(v11, v12, (uint64_t)&unk_1EDF77860, v13);

  if (!v14)
    goto LABEL_5;
  v15 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_v1(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_copy(v19, v20, v21, v22);
  objc_msgSend_v2(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend_copy(v27, v28, v29, v30);
  v33 = (void *)objc_msgSend_initWithObject1_object2_(v15, v32, (uint64_t)v23, (uint64_t)v31);

  return v33;
}

@end
