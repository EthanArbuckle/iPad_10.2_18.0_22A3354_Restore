@implementation CKTuple5

- (CKTuple5)initWithObject1:(id)a3 object2:(id)a4 object3:(id)a5 object4:(id)a6 object5:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CKTuple5 *v17;
  const char *v18;
  uint64_t v19;
  CKTuple5 *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)CKTuple5;
  v17 = -[CKTuple5 init](&v30, sel_init);
  v20 = v17;
  if (v17)
  {
    objc_msgSend_setV1_(v17, v18, (uint64_t)v12, v19);
    objc_msgSend_setV2_(v20, v21, (uint64_t)v13, v22);
    objc_msgSend_setV3_(v20, v23, (uint64_t)v14, v24);
    objc_msgSend_setV4_(v20, v25, (uint64_t)v15, v26);
    objc_msgSend_setV5_(v20, v27, (uint64_t)v16, v28);
  }

  return v20;
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
    case 4uLL:
      objc_msgSend_v5(self, a2, a3, v3);
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
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;

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
  objc_msgSend_v5(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v33 ^ objc_msgSend_hash(v37, v38, v39, v40);

  return v41;
}

- (BOOL)isEqual:(id)a3
{
  CKTuple5 *v4;
  CKTuple5 *v5;
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
  int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  char v50;

  v4 = (CKTuple5 *)a3;
  if (self == v4)
  {
    v50 = 1;
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
        goto LABEL_10;
      objc_msgSend_v2(self, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_v2(v5, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CKObjectsAreBothNilOrEqual(v18, v22);

      if (!v23)
        goto LABEL_10;
      objc_msgSend_v3(self, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_v3(v5, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CKObjectsAreBothNilOrEqual(v27, v31);

      if (!v32)
        goto LABEL_10;
      objc_msgSend_v4(self, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_v4(v5, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CKObjectsAreBothNilOrEqual(v36, v40);

      if (v41)
      {
        objc_msgSend_v5(self, v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_v5(v5, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = CKObjectsAreBothNilOrEqual(v45, v49);

      }
      else
      {
LABEL_10:
        v50 = 0;
      }

    }
    else
    {
      v50 = 0;
    }
  }

  return v50;
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
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  int v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  CKException *v76;
  const char *v77;
  id v78;
  void *v79;

  objc_msgSend_v1(self, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_conformsToProtocol_(v5, v6, (uint64_t)&unk_1EDF77860, v7))
    goto LABEL_10;
  objc_msgSend_v2(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_conformsToProtocol_(v11, v12, (uint64_t)&unk_1EDF77860, v13))
  {
LABEL_9:

LABEL_10:
LABEL_11:
    v76 = [CKException alloc];
    v78 = (id)objc_msgSend_initWithCode_format_(v76, v77, 12, (uint64_t)CFSTR("Tuple value does not conform to NSCopying"));
    objc_exception_throw(v78);
  }
  objc_msgSend_v3(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_conformsToProtocol_(v17, v18, (uint64_t)&unk_1EDF77860, v19))
  {
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend_v4(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_conformsToProtocol_(v23, v24, (uint64_t)&unk_1EDF77860, v25))
  {

    goto LABEL_8;
  }
  objc_msgSend_v5(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_conformsToProtocol_(v29, v30, (uint64_t)&unk_1EDF77860, v31);

  if (!v32)
    goto LABEL_11;
  v33 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_v1(self, v34, v35, v36);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend_copy(v79, v37, v38, v39);
  objc_msgSend_v2(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend_copy(v44, v45, v46, v47);
  objc_msgSend_v3(self, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend_copy(v52, v53, v54, v55);
  objc_msgSend_v4(self, v57, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend_copy(v60, v61, v62, v63);
  objc_msgSend_v5(self, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend_copy(v68, v69, v70, v71);
  v74 = (void *)objc_msgSend_initWithObject1_object2_object3_object4_object5_(v33, v73, (uint64_t)v40, (uint64_t)v48, v56, v64, v72);

  return v74;
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

- (id)v5
{
  return self->_v5;
}

- (void)setV5:(id)a3
{
  objc_storeStrong(&self->_v5, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_v5, 0);
  objc_storeStrong(&self->_v4, 0);
  objc_storeStrong(&self->_v3, 0);
  objc_storeStrong(&self->_v2, 0);
  objc_storeStrong(&self->_v1, 0);
}

@end
