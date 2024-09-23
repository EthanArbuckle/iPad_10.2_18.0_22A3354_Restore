@implementation EQKitMathMLMSubsuperscript

- (BOOL)isEmbellishedOperator
{
  return -[EQKitMathMLNode isEmbellishedOperator](self->super.mFirst, "isEmbellishedOperator");
}

- (id)operatorCore
{
  return -[EQKitMathMLNode operatorCore](self->super.mFirst, "operatorCore");
}

- (id)schemataKernel
{
  return self->super.mFirst;
}

- (id)schemataSubscript
{
  return self->super.mSecond;
}

- (id)schemataSuperscript
{
  return self->super.mThird;
}

@end
