@implementation FBWorkspaceRegistration

+ (id)registrationWithIdentifier:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  v8 = v5;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  v11 = objc_opt_class();
  v12 = v6;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  if (v10)
  {
    v15 = objc_opt_new();
    if (v15)
    {
      v16 = objc_msgSend(v10, "copy");
      v17 = *(void **)(v15 + 16);
      *(_QWORD *)(v15 + 16) = v16;

      *(_BYTE *)(v15 + 8) = objc_msgSend(v14, "bs_BOOLForKey:", CFSTR("AcceptClientScenes"));
    }
  }
  else
  {
    v15 = 0;
  }

  return (id)v15;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, 0);
  v5 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_acceptsClientScenes, CFSTR("acceptsClientScenes"), 1);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)acceptsClientScenes
{
  return self->_acceptsClientScenes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
