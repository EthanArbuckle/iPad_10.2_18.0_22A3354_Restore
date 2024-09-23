@implementation ComponentMLB

- (BOOL)isPresent
{
  void *v2;
  BOOL valid;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentMLB serialNumber](self, "serialNumber"));
  valid = isValidSerialNumber(v2);

  return valid;
}

- (void)populateAttributes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ComponentMLB serialNumber](self, "serialNumber"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("serialNumber"));

}

- (id)serialNumber
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)MGCopyAnswer(CFSTR("MLBSerialNumber"), 0);
  v3 = stringOrNull(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

@end
