@implementation FSMimicPopulator

- (BOOL)populateSimpleSelector:(SEL)a3 error:(id *)a4
{
  void *v8;
  void *v9;
  FSMimic *v10;
  FSNode *v11;
  FSMimic *v12;
  void *v13;
  FSMimic *v14;
  void *v15;
  FSMimic *v16;
  void *v17;
  FSNode *node;
  FSMimic *mimic;
  FSNode *v20;
  FSMimic *v21;
  id v22;
  void *v23;
  FSNode *v24;
  FSMimic *v25;
  void *v26;
  double v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  if (-[FSMimic hasObjectValueForSelector:](self->_mimic, "hasObjectValueForSelector:"))
  {
LABEL_2:
    LOBYTE(a4) = 1;
  }
  else
  {
    switch(categorizeSelector((objc_selector *)a3))
    {
      case 0:
        node = self->_node;
        mimic = self->_mimic;
        v20 = node;
        v21 = mimic;
        v22 = objc_msgSend(v20, a3);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[FSMimic setObjectValue:forSelector:](v21, "setObjectValue:forSelector:", v23, a3);

        goto LABEL_2;
      case 1:
        v24 = self->_node;
        v25 = self->_mimic;
        objc_msgSend(v24, a3, a4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(a4) = v26 != 0;
        if (v26)
          -[FSMimic setObjectValue:forSelector:](v25, "setObjectValue:forSelector:", v26, a3);

        return (char)a4;
      case 2:
        v10 = self->_mimic;
        v11 = self->_node;
        v12 = v10;
        LODWORD(v27) = 0;
        LODWORD(a4) = objc_msgSend(v11, a3, &v27, a4);
        if ((_DWORD)a4)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(v27));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[FSMimic setObjectValue:forSelector:](v12, "setObjectValue:forSelector:", v13, a3);

        }
        goto LABEL_16;
      case 3:
        v14 = self->_mimic;
        v11 = self->_node;
        v12 = v14;
        v27 = 0.0;
        LODWORD(a4) = objc_msgSend(v11, a3, &v27, a4);
        if ((_DWORD)a4)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&v27);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[FSMimic setObjectValue:forSelector:](v12, "setObjectValue:forSelector:", v15, a3);

        }
        goto LABEL_16;
      case 4:
        v16 = self->_mimic;
        v11 = self->_node;
        v12 = v16;
        v27 = 0.0;
        LODWORD(a4) = objc_msgSend(v11, a3, &v27, a4);
        if ((_DWORD)a4)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[FSMimic setObjectValue:forSelector:](v12, "setObjectValue:forSelector:", v17, a3);

        }
LABEL_16:

        return (char)a4;
      case 5:
      case 6:
        if (!a4)
          return (char)a4;
        v28 = *MEMORY[0x1E0CB2938];
        NSStringFromSelector(a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[FSMimicPopulator populateSimpleSelector:error:]", 487, v9);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
        LOBYTE(a4) = 0;
        break;
      default:
        goto LABEL_7;
    }
  }
  return (char)a4;
}

- (FSMimic)mimic
{
  return self->_mimic;
}

- (BOOL)populateHFSTypeAndCreatorWithError:(id *)a3
{
  _BOOL4 v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  id v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  v5 = -[FSNode getHFSType:creator:error:](self->_node, "getHFSType:creator:error:", (char *)&v13 + 4, &v13, &v12);
  v6 = v12;
  v7 = v6;
  if (v5)
  {
    -[FSMimic setHFSType:creator:](self->_mimic, "setHFSType:creator:", HIDWORD(v13), v13);
LABEL_3:
    v8 = 1;
    goto LABEL_10;
  }
  objc_msgSend(v6, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0CB2F90]))
  {
    v10 = objc_msgSend(v7, "code");

    if (v10 == -10813)
    {
      -[FSMimic setHFSTypesUnavailable](self->_mimic, "setHFSTypesUnavailable");
      goto LABEL_3;
    }
  }
  else
  {

  }
  v8 = 0;
  if (a3)
    *a3 = objc_retainAutorelease(v7);
LABEL_10:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mimic, 0);
  objc_storeStrong((id *)&self->_node, 0);
}

- (FSMimicPopulator)initWithNode:(id)a3
{
  id v5;
  FSMimicPopulator *v6;
  FSMimicPopulator *v7;
  FSMimic *v8;
  void *v9;
  uint64_t v10;
  FSMimic *mimic;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FSMimicPopulator;
  v6 = -[FSMimicPopulator init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_node, a3);
    v8 = [FSMimic alloc];
    objc_msgSend(v5, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FSMimic initWithURL:](v8, "initWithURL:", v9);
    mimic = v7->_mimic;
    v7->_mimic = (FSMimic *)v10;

  }
  return v7;
}

- (BOOL)populateValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v13;

  v6 = a3;
  v13 = 0;
  if (-[FSMimic hasResourceValueForKey:](self->_mimic, "hasResourceValueForKey:", v6))
  {
    v7 = 0;
    v8 = 1;
  }
  else
  {
    v9 = -[FSNode getResourceValue:forKey:options:error:](self->_node, "getResourceValue:forKey:options:error:", &v13, v6, 3, a4);
    v7 = v13;
    if (v9)
    {
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v13;
        v13 = (void *)v10;

        v7 = v13;
      }
      -[FSMimic setResourceValue:forKey:](self->_mimic, "setResourceValue:forKey:", v7, v6);
      v8 = 1;
      v7 = v13;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)populateHasChildNodeWithRelativePath:(id)a3
{
  id v4;

  v4 = a3;
  if (-[FSNode childNodeWithRelativePathExists:](self->_node, "childNodeWithRelativePathExists:"))
    -[FSMimic noteExtantChildNodeWithRelativePath:](self->_mimic, "noteExtantChildNodeWithRelativePath:", v4);

}

@end
