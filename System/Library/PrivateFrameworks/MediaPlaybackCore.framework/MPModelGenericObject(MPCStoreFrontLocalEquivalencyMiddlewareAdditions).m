@implementation MPModelGenericObject(MPCStoreFrontLocalEquivalencyMiddlewareAdditions)

- (id)MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:()MPCStoreFrontLocalEquivalencyMiddlewareAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6428;
  v16 = __Block_byref_object_dispose__6429;
  v17 = a1;
  v5 = (void *)MEMORY[0x24BDDC928];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __130__MPModelGenericObject_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke;
  v9[3] = &unk_24CAB85F0;
  v9[4] = v17;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "performWithoutEnforcement:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

@end
