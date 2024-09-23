@implementation HMMMMessageDestination

- (HMMMMessageDestination)initWithIDSIdentifier:(id)a3 idsTokenURI:(id)a4
{
  id v7;
  id v8;
  HMMMMessageDestination *v9;
  HMMMMessageDestination *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMMMessageDestination;
  v9 = -[HMMMMessageDestination init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_idsIdentifier, a3);
    objc_storeStrong((id *)&v10->_idsTokenURI, a4);
  }

  return v10;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMMMessageDestination idsIdentifier](self, "idsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("IDS Identifier"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMMMessageDestination idsTokenURI](self, "idsTokenURI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("IDS Token"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (NSString)idsTokenURI
{
  return self->_idsTokenURI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsTokenURI, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

@end
