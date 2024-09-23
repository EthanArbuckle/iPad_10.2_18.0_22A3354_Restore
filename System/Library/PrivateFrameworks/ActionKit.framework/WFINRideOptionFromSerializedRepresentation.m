@implementation WFINRideOptionFromSerializedRepresentation

id __WFINRideOptionFromSerializedRepresentation_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSRange v12;
  void *v13;

  v2 = a2;
  v3 = objc_opt_class();
  WFEnforceClass(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PartySizeRangeString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  WFEnforceClass(v5, v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SizeDescription"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  WFEnforceClass(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v11 = objc_alloc(MEMORY[0x24BDDA018]);
    v12 = NSRangeFromString(v7);
    v13 = (void *)objc_msgSend(v11, "initWithPartySizeRange:sizeDescription:priceRange:", v12.location, v12.length, v10, 0);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
