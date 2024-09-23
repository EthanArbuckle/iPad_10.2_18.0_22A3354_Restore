@implementation ComponentUltraWideBand

- (BOOL)isPresent
{
  return MGGetBoolAnswer(CFSTR("DeviceProximityCapability"), a2);
}

- (void)populateAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ComponentUltraWideBand;
  v4 = a3;
  -[ComponentBase populateAttributes:](&v7, "populateAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentUltraWideBand arrowChipUniqueId](self, "arrowChipUniqueId", v7.receiver, v7.super_class));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("arrowUniqueChipID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentUltraWideBand arrowChipId](self, "arrowChipId"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("arrowChipID"));

}

- (id)arrowChipUniqueId
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)MGCopyAnswer(CFSTR("CPiqZJJPocpjc5C5qe1tiw"), 0);
  v3 = stringOrNull(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)arrowChipId
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)MGCopyAnswer(CFSTR("nhGhVMyvrWYe9U2ltAUImg"), 0);
  v3 = stringOrNull(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

@end
