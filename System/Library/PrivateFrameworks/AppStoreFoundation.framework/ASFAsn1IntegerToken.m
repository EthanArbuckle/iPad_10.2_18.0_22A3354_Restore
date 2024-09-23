@implementation ASFAsn1IntegerToken

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("INT Token. Value:%lld (%llx)"), self->mValue, self->mValue);
}

@end
