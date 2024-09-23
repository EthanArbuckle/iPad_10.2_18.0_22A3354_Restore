@implementation CKDAppContainerTuple

- (BOOL)isEqual:(id)a3
{
  CKDAppContainerTuple *v4;
  CKDAppContainerTuple *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  int v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  char v26;

  v4 = (CKDAppContainerTuple *)a3;
  if (self == v4)
  {
    v26 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_applicationID(self, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applicationID(v5, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CKObjectsAreBothNilOrEqual();

      if (v12
        && (objc_msgSend_containerID(self, v13, v14),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_containerID(v5, v16, v17),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = CKObjectsAreBothNilOrEqual(),
            v18,
            v15,
            v19))
      {
        objc_msgSend_personaID(self, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_personaID(v5, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = CKObjectsAreBothNilOrEqual();

      }
      else
      {
        v26 = 0;
      }

    }
    else
    {
      v26 = 0;
    }
  }

  return v26;
}

- (NSString)personaID
{
  return self->_personaID;
}

- (CKDApplicationID)applicationID
{
  return self->_applicationID;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (CKDAppContainerTuple)initWithApplicationID:(id)a3 containerID:(id)a4 personaID:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  CKDAppContainerTuple *v13;
  uint64_t v14;
  CKDApplicationID *applicationID;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CKContainerID *containerID;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *personaID;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CKDAppContainerTuple;
  v13 = -[CKDAppContainerTuple init](&v25, sel_init);
  if (v13)
  {
    v14 = objc_msgSend_copy(v8, v11, v12);
    applicationID = v13->_applicationID;
    v13->_applicationID = (CKDApplicationID *)v14;

    v18 = objc_msgSend_copy(v9, v16, v17);
    containerID = v13->_containerID;
    v13->_containerID = (CKContainerID *)v18;

    v22 = objc_msgSend_copy(v10, v20, v21);
    personaID = v13->_personaID;
    v13->_personaID = (NSString *)v22;

  }
  return v13;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  unint64_t v19;

  objc_msgSend_applicationID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_hash(v4, v5, v6);
  objc_msgSend_containerID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;
  objc_msgSend_personaID(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v13 ^ objc_msgSend_hash(v16, v17, v18);

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_applicationID(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_personaID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v12, (uint64_t)CFSTR("applicationID=\"%@\", containerID=\"%@\", personaID=\"%@\"), v5, v8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAppContainerTuple *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

@end
