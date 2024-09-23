@implementation ECAngleBracketIDHash

- (ECAngleBracketIDHash)initWithAngleBracketID:(id)a3
{
  void *v4;
  ECAngleBracketIDHash *v5;
  objc_super v7;

  objc_msgSend(a3, "ec_messageIDSubstring");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)ECAngleBracketIDHash;
  v5 = -[EFStringHash initWithString:](&v7, sel_initWithString_, v4);

  return v5;
}

@end
