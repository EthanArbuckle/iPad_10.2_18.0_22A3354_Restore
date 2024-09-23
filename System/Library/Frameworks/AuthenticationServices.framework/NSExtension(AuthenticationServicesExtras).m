@implementation NSExtension(AuthenticationServicesExtras)

- (void)_as_instantiateViewControllerWithConnectionHandler:()AuthenticationServicesExtras
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __96__NSExtension_AuthenticationServicesExtras___as_instantiateViewControllerWithConnectionHandler___block_invoke;
    v6[3] = &unk_24C9501E0;
    v7 = v4;
    objc_msgSend(a1, "instantiateViewControllerWithInputItems:connectionHandler:", MEMORY[0x24BDBD1A8], v6);

  }
}

- (id)_as_auxiliaryRemoteObjectWithRequestID:()AuthenticationServicesExtras
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  id v9;

  objc_msgSend(a1, "_extensionContextForUUID:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_auxiliaryConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_10;
  objc_msgSend(a1, "extensionPointIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE830C0]);

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v4, "conformsToProtocol:", &unk_254A508C0) & 1) == 0)
    {
LABEL_10:
      v9 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(a1, "extensionPointIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE83088]);

    if (!v8)
      goto LABEL_10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v4, "conformsToProtocol:", &unk_254A41AF0))
      goto LABEL_10;
  }
  v9 = v4;
LABEL_11:

  return v9;
}

@end
