@implementation MPModelMovie(MPCStoreFrontLocalEquivalencyMiddlewareAdditions)

- (id)MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:()MPCStoreFrontLocalEquivalencyMiddlewareAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend(a1, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __122__MPModelMovie_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke;
  v14[3] = &unk_24CAB8A40;
  v7 = v4;
  v15 = v7;
  v8 = (void *)objc_msgSend(v5, "copyWithSource:block:", CFSTR("StoreFrontLocalEquivalency"), v14);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __122__MPModelMovie_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_4;
  v12[3] = &unk_24CAB3B18;
  v13 = v7;
  v9 = v7;
  v10 = (void *)objc_msgSend(a1, "copyWithIdentifiers:block:", v8, v12);

  return v10;
}

@end
