@implementation DMCAuthKitUtilities

+ (id)midWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;

  if (midWithError__onceToken != -1)
    dispatch_once(&midWithError__onceToken, &__block_literal_global_2);
  v9 = 0;
  objc_msgSend((id)midWithError__anisetteProvisioningController, "anisetteDataWithError:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = v5;
  if (v5)
  {
    v7 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v5);
  }
  else
  {
    objc_msgSend(v4, "machineID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __36__DMCAuthKitUtilities_midWithError___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)DMCAKAnisetteProvisioningControllerClass());
  v1 = (void *)midWithError__anisetteProvisioningController;
  midWithError__anisetteProvisioningController = (uint64_t)v0;

}

@end
