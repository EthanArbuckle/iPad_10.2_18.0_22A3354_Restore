@implementation CAPackage(HI)

- (void)transitionToStateWithName:()HI
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "rootLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "transitionToStateWithName:onLayer:", v4, v5);

}

- (void)transitionToStateWithName:()HI onLayer:
{
  id v6;
  void *v7;
  double v8;
  id v9;

  v6 = a4;
  objc_msgSend(v6, "stateWithName:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_stateController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1.0;
  objc_msgSend(v7, "setState:ofLayer:transitionSpeed:", v9, v6, v8);

}

- (id)availableStates
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "rootLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "availableStatesOnLayer:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)availableStatesOnLayer:()HI
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "states");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__CAPackage_HI__availableStatesOnLayer___block_invoke;
  v9[3] = &unk_24FD1A980;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

- (id)_stateController
{
  void *v2;
  id v3;
  void *v4;

  objc_getAssociatedObject(a1, sel__stateController);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDE5788]);
    objc_msgSend(a1, "rootLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v3, "initWithLayer:", v4);

    objc_setAssociatedObject(a1, sel__stateController, v2, (void *)1);
  }
  return v2;
}

@end
