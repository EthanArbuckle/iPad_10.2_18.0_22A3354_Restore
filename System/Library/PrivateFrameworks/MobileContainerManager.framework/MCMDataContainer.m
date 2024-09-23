@implementation MCMDataContainer

+ (int64_t)typeContainerClass
{
  return 0;
}

- (BOOL)wipeAllMyContainerContent:(id *)a3
{
  uint64_t v4;
  id v5;

  -[MCMContainer thisContainer](self, "thisContainer");
  v4 = container_delete_all_container_content();
  if (v4 == 1)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), v4, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (a3 && v5)
    {
      v5 = objc_retainAutorelease(v5);
      *a3 = v5;
    }
  }

  return v4 == 1;
}

@end
