@implementation ComponentBackGlass

- (void)populateAttributes:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ComponentBackGlass;
  -[ComponentBase populateAttributes:](&v6, "populateAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBackGlass serialNumber](self, "serialNumber"));
  if (v5)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("serialNumber"));

}

- (BOOL)isPresent
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBackGlass serialNumber](self, "serialNumber"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "length") != 0;
  else
    v4 = 0;

  return v4;
}

- (id)serialNumber
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryName:property:optionalKey:](DAComponentUtil, "getIORegistryName:property:optionalKey:", CFSTR("product"), CFSTR("backglass-serial-number"), 0));
  if (v2)
    v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v2, 4);
  else
    v3 = 0;

  return v3;
}

@end
