@implementation PADAuditDataRepositoryDefault

uint64_t __PADAuditDataRepositoryDefault_block_invoke()
{
  uint64_t result;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  result = os_variant_has_internal_content();
  if ((_DWORD)result)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "persistentDomainForName:", *MEMORY[0x24BDD0D70]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CIDVPAD.persist-capture-data"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!v3)
      v3 = (void *)MEMORY[0x24BDBD1C0];
    v5 = objc_msgSend(v3, "BOOLValue");

    return v5;
  }
  return result;
}

@end
