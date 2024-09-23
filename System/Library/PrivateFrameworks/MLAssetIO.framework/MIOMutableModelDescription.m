@implementation MIOMutableModelDescription

- (void)setShortDescription:(id)a3 forInputFeatureWithName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MIOModelDescription defaultFunctionName](self, "defaultFunctionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOModelDescription _setShortDescription:forInputFeatureWithName:functionName:](self, "_setShortDescription:forInputFeatureWithName:functionName:", v8, v6, v7);

}

- (void)setShortDescription:(id)a3 forOutputFeatureWithName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MIOModelDescription defaultFunctionName](self, "defaultFunctionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOModelDescription _setShortDescription:forOutputFeatureWithName:functionName:](self, "_setShortDescription:forOutputFeatureWithName:functionName:", v8, v6, v7);

}

- (void)setShortDescription:(id)a3 forStateFeatureWithName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MIOModelDescription defaultFunctionName](self, "defaultFunctionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOModelDescription _setShortDescription:forStateFeatureWithName:functionName:](self, "_setShortDescription:forStateFeatureWithName:functionName:", v8, v6, v7);

}

- (void)setShortDescription:(id)a3 forInputFeatureWithName:(id)a4 functionName:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v13;
  v11 = v9;
  v12 = v9;
  if (!v9)
  {
    -[MIOModelDescription defaultFunctionName](self, "defaultFunctionName", v13);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v13;
  }
  -[MIOModelDescription _setShortDescription:forInputFeatureWithName:functionName:](self, "_setShortDescription:forInputFeatureWithName:functionName:", v10, v8, v12);
  if (!v11)

}

- (void)setShortDescription:(id)a3 forOutputFeatureWithName:(id)a4 functionName:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v13;
  v11 = v9;
  v12 = v9;
  if (!v9)
  {
    -[MIOModelDescription defaultFunctionName](self, "defaultFunctionName", v13);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v13;
  }
  -[MIOModelDescription _setShortDescription:forOutputFeatureWithName:functionName:](self, "_setShortDescription:forOutputFeatureWithName:functionName:", v10, v8, v12);
  if (!v11)

}

- (void)setShortDescription:(id)a3 forStateFeatureWithName:(id)a4 functionName:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v13;
  v11 = v9;
  v12 = v9;
  if (!v9)
  {
    -[MIOModelDescription defaultFunctionName](self, "defaultFunctionName", v13);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v13;
  }
  -[MIOModelDescription _setShortDescription:forStateFeatureWithName:functionName:](self, "_setShortDescription:forStateFeatureWithName:functionName:", v10, v8, v12);
  if (!v11)

}

@end
