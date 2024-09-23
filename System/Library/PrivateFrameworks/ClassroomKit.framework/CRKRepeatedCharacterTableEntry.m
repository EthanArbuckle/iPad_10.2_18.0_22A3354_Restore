@implementation CRKRepeatedCharacterTableEntry

- (CRKRepeatedCharacterTableEntry)initWithCharacter:(char)a3
{
  CRKRepeatedCharacterTableEntry *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRKRepeatedCharacterTableEntry;
  result = -[CRKRepeatedCharacterTableEntry init](&v5, sel_init);
  if (result)
    result->mCharacter = a3;
  return result;
}

- (id)rawStringValue
{
  return &stru_24D9CB490;
}

- (id)stringValueWithLength:(unint64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), self->mCharacter);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&stru_24D9CB490, "stringByPaddingToLength:withString:startingAtIndex:", a3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
