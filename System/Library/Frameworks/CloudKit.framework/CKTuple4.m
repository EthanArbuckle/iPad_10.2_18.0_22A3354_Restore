@implementation CKTuple4

- (CKTuple4)initWithObject1:(id)a3 object2:(id)a4 object3:(id)a5 object4:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CKTuple4 *v14;
  const char *v15;
  uint64_t v16;
  CKTuple4 *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CKTuple4;
  v14 = -[CKTuple4 init](&v25, sel_init);
  v17 = v14;
  if (v14)
  {
    objc_msgSend_setV1_(v14, v15, (uint64_t)v10, v16);
    objc_msgSend_setV2_(v17, v18, (uint64_t)v11, v19);
    objc_msgSend_setV3_(v17, v20, (uint64_t)v12, v21);
    objc_msgSend_setV4_(v17, v22, (uint64_t)v13, v23);
  }

  return v17;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint64_t v3;
  void *v4;
  CKException *v7;
  const char *v8;
  id v9;

  switch(a3)
  {
    case 0uLL:
      objc_msgSend_v1(self, a2, a3, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      objc_msgSend_v2(self, a2, a3, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      objc_msgSend_v3(self, a2, a3, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      objc_msgSend_v4(self, a2, a3, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = [CKException alloc];
      v9 = (id)objc_msgSend_initWithCode_format_(v7, v8, 12, (uint64_t)CFSTR("Invalid tuple index: %lu"), a3);
      objc_exception_throw(v9);
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
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;

  objc_msgSend_v1(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_v2(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  objc_msgSend_v3(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_hash(v21, v22, v23, v24);
  objc_msgSend_v4(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v17 ^ v25 ^ objc_msgSend_hash(v29, v30, v31, v32);

  return v33;
}

- (BOOL)isEqual:(id)a3
{
  CKTuple4 *v4;
  CKTuple4 *v5;
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
  int v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  char v41;

  v4 = (CKTuple4 *)a3;
  if (self == v4)
  {
    v41 = 1;
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

      if (!v14)
        goto LABEL_9;
      objc_msgSend_v2(self, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_v2(v5, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CKObjectsAreBothNilOrEqual(v18, v22);

      if (!v23)
        goto LABEL_9;
      objc_msgSend_v3(self, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_v3(v5, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CKObjectsAreBothNilOrEqual(v27, v31);

      if (v32)
      {
        objc_msgSend_v4(self, v33, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_v4(v5, v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = CKObjectsAreBothNilOrEqual(v36, v40);

      }
      else
      {
LABEL_9:
        v41 = 0;
      }

    }
    else
    {
      v41 = 0;
    }
  }

  return v41;
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
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  int v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  void *v61;
  CKException *v63;
  const char *v64;
  id v65;

  objc_msgSend_v1(self, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_conformsToProtocol_(v5, v6, (uint64_t)&unk_1EDF77860, v7))
    goto LABEL_8;
  objc_msgSend_v2(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_conformsToProtocol_(v11, v12, (uint64_t)&unk_1EDF77860, v13))
  {
LABEL_7:

LABEL_8:
LABEL_9:
    v63 = [CKException alloc];
    v65 = (id)objc_msgSend_initWithCode_format_(v63, v64, 12, (uint64_t)CFSTR("Tuple value does not conform to NSCopying"));
    objc_exception_throw(v65);
  }
  objc_msgSend_v3(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_conformsToProtocol_(v17, v18, (uint64_t)&unk_1EDF77860, v19) & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend_v4(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_conformsToProtocol_(v23, v24, (uint64_t)&unk_1EDF77860, v25);

  if (!v26)
    goto LABEL_9;
  v27 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_v1(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend_copy(v31, v32, v33, v34);
  objc_msgSend_v2(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend_copy(v39, v40, v41, v42);
  objc_msgSend_v3(self, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend_copy(v47, v48, v49, v50);
  objc_msgSend_v4(self, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend_copy(v55, v56, v57, v58);
  v61 = (void *)objc_msgSend_initWithObject1_object2_object3_object4_(v27, v60, (uint64_t)v35, (uint64_t)v43, v51, v59);

  return v61;
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

- (id)v4
{
  return self->_v4;
}

- (void)setV4:(id)a3
{
  objc_storeStrong(&self->_v4, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_v4, 0);
  objc_storeStrong(&self->_v3, 0);
  objc_storeStrong(&self->_v2, 0);
  objc_storeStrong(&self->_v1, 0);
}

@end
