@implementation MDPerson

- (MDPerson)initWithDisplayName:(id)a3 handle:(id)a4 handleIdentifier:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  MDPerson *v14;
  MDPerson *v15;
  id v16;
  id v17;
  MDPerson *v18;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v20 = v8;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = a5;
    v12 = a3;
    objc_msgSend(v10, "arrayWithObjects:count:", &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CSPerson initWithDisplayName:handles:handleIdentifier:](self, "initWithDisplayName:handles:handleIdentifier:", v12, v13, v11, v20, v21);

    v15 = v14;
  }
  else
  {
    v16 = a5;
    v17 = a3;
    v18 = -[CSPerson initWithDisplayName:handles:handleIdentifier:](self, "initWithDisplayName:handles:handleIdentifier:", v17, 0, v16);

    v15 = v18;
  }

  return v15;
}

- (NSString)handle
{
  void *v2;
  void *v3;

  -[CSPerson handles](self, "handles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
