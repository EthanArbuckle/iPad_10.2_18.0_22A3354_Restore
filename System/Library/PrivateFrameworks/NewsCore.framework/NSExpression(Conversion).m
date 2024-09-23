@implementation NSExpression(Conversion)

+ (id)expressionWithFCCKPRecordFieldValue:()Conversion translator:
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3540];
  -[FCCKProtocolTranslator objectRepresentationFromFieldValue:](a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expressionForConstantValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
