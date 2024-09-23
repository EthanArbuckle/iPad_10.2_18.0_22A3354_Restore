@implementation NSString(CDMJSONSerialization)

- (id)_cdm_JSONDictionary
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v1, 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
