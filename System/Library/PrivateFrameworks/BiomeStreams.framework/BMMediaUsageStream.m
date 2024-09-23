@implementation BMMediaUsageStream

- (NSString)identifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01D40], "libraryPathForStreamIdentifier:", CFSTR("MediaUsage"));
}

- (id)source
{
  BMCoreDuetMediaUsageSource *v3;
  void *v4;
  BMCoreDuetMediaUsageSource *v5;

  v3 = [BMCoreDuetMediaUsageSource alloc];
  -[BMMediaUsageStream identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMCoreDuetMediaUsageSource initWithIdentifier:](v3, "initWithIdentifier:", v4);

  return v5;
}

@end
