@implementation EDPBInteractionEventMessageFetched

+ (id)options
{
  if (options_once != -1)
    dispatch_once(&options_once, &__block_literal_global_46);
  return (id)options_sOptions;
}

void __45__EDPBInteractionEventMessageFetched_options__block_invoke()
{
  void *v0;

  v0 = (void *)options_sOptions;
  options_sOptions = (uint64_t)&unk_1E94E5718;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)EDPBInteractionEventMessageFetched;
  -[EDPBInteractionEventMessageFetched description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBInteractionEventMessageFetched dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
}

- (BOOL)readFrom:(id)a3
{
  return EDPBInteractionEventMessageFetchedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

@end
