@implementation EKEventAction

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_0 != -1)
    dispatch_once(&knownIdentityKeysForComparison_onceToken_0, &__block_literal_global_6);
  return (id)knownIdentityKeysForComparison_keys_0;
}

void __47__EKEventAction_knownIdentityKeysForComparison__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B828];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownIdentityKeysForComparison_keys_0;
  knownIdentityKeysForComparison_keys_0 = v0;

}

- (NSString)externalID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B828]);
}

- (void)setExternalID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B828]);
}

- (NSString)externalFolderID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B600]);
}

- (void)setExternalFolderID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B600]);
}

- (NSString)externalScheduleID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B618]);
}

- (void)setExternalScheduleID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B618]);
}

- (NSString)externalModificationTag
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B608]);
}

- (void)setExternalModificationTag:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B608]);
}

- (NSData)externalRepresentation
{
  return (NSData *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B610]);
}

- (void)setExternalRepresentation:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B610]);
}

@end
