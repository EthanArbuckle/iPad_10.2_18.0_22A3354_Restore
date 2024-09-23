@implementation HKCorrelationType

- (HKCorrelationType)initWithIdentifier:(id)a3
{
  id v4;
  HKCorrelationType *v5;

  v4 = a3;
  +[HKObjectType correlationTypeForIdentifier:](HKObjectType, "correlationTypeForIdentifier:", v4);
  v5 = (HKCorrelationType *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid %@ identifier \"%@\"), objc_opt_class(), v4);

  return v5;
}

@end
