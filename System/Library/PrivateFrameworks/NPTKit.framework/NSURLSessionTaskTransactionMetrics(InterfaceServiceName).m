@implementation NSURLSessionTaskTransactionMetrics(InterfaceServiceName)

- (__CFString)interfaceServiceName
{
  void *v2;
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  int v7;

  objc_msgSend(a1, "interfaceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BE29F18]);
    objc_msgSend(v3, "activate");
    objc_msgSend(v3, "requestParameters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInterfaceName:", v2);

    objc_msgSend(v3, "networkServiceName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");
    if (!v5)
    {
      objc_msgSend(a1, "interfaceName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "containsString:", CFSTR("pdp_ip"));

      if (v7)
        v5 = CFSTR("Cellular");
      else
        v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
