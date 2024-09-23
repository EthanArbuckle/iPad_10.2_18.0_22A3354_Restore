@implementation DNDSMutableBackingStoreDictionaryContext

- (void)setDestination:(unint64_t)a3
{
  self->super._destination = a3;
}

- (void)setPartitionType:(unint64_t)a3
{
  self->super._partitionType = a3;
}

- (void)setHealingSource:(id)a3
{
  objc_storeStrong((id *)&self->super._underlyingHealingSource, a3);
}

- (void)setArrayHealingSource:(id)a3
{
  objc_storeStrong((id *)&self->super._underlyingHealingSource, a3);
}

- (void)setRedactSensitiveData:(BOOL)a3
{
  self->super._redactSensitiveData = a3;
}

- (void)setContactProvider:(id)a3
{
  objc_storeStrong((id *)&self->super._contactProvider, a3);
}

- (void)setApplicationIdentifierMapper:(id)a3
{
  objc_storeStrong((id *)&self->super._applicationIdentifierMapper, a3);
}

- (void)setCurrentRecord:(id)a3
{
  objc_storeStrong((id *)&self->super._currentRecord, a3);
}

@end
