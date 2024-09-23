@implementation BLSHRequestLiveUpdatingAttributeHandler

+ (id)attributeClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)attributeBaseClass
{
  return (Class)objc_opt_class();
}

- (void)activateForSceneEnvironment:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

uint64_t __71__BLSHRequestLiveUpdatingAttributeHandler_activateForSceneEnvironment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLiveUpdating:", 1);
}

- (void)deactivateForSceneEnvironment:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

uint64_t __73__BLSHRequestLiveUpdatingAttributeHandler_deactivateForSceneEnvironment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLiveUpdating:", 0);
}

@end
