@implementation BSMutableDescriptionStyle

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BSDescriptionStyle _initWithCopyOf:]([BSDescriptionStyle alloc], (uint64_t)self);
}

- (void)setVerbosity:(int64_t)a3
{
  self->super._verbosity = a3;
}

- (void)setDebugging:(int64_t)a3
{
  self->super._debugging = a3;
}

- (void)setCollectionLineBreak:(int64_t)a3
{
  self->super._collectionLineBreak = a3;
}

- (void)setProemItemSeparator:(int64_t)a3
{
  self->super._proemItemSeparator = a3;
}

- (void)setBodyItemSeparator:(int64_t)a3
{
  self->super._bodyItemSeparator = a3;
}

- (void)setKeyValuePairSorting:(int64_t)a3
{
  self->super._keyValuePairSorting = a3;
}

- (void)setNameTruncation:(int64_t)a3
{
  self->super._nameTruncation = a3;
}

- (void)setValueTruncation:(int64_t)a3
{
  self->super._valueTruncation = a3;
}

- (void)setMaximumNameLengthBeforeTruncation:(int64_t)a3
{
  self->super._maximumNameLengthBeforeTruncation = a3;
}

- (void)setMaximumValueLengthBeforeTruncation:(int64_t)a3
{
  self->super._maximumValueLengthBeforeTruncation = a3;
}

- (void)setCollectionTruncationStyle:(int64_t)a3
{
  self->super._collectionTruncationStyle = a3;
}

- (void)setMaximumItemCountForTruncation:(int64_t)a3
{
  self->super._maximumItemCountForTruncation = a3;
}

- (void)setClientInformation:(id)a3
{
  NSSet *v4;
  NSSet *clientInformation;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  clientInformation = self->super._clientInformation;
  self->super._clientInformation = v4;

}

@end
