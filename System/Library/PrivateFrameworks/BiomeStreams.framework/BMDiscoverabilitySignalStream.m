@implementation BMDiscoverabilitySignalStream

- (id)source
{
  BMCoreDuetDiscoverabilitySignalsSource *v3;
  void *v4;
  BMCoreDuetDiscoverabilitySignalsSource *v5;

  v3 = [BMCoreDuetDiscoverabilitySignalsSource alloc];
  -[BMDiscoverabilitySignalStream identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMSource initWithIdentifier:](v3, "initWithIdentifier:", v4);

  return v5;
}

- (NSString)identifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01D40], "libraryPathForStreamIdentifier:", CFSTR("DiscoverabilitySignal"));
}

@end
