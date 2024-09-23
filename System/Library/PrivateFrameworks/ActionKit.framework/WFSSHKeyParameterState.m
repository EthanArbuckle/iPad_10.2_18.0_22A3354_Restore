@implementation WFSSHKeyParameterState

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFSSHKeyParameterState;
  return -[WFSSHKeyParameterState isEqual:](&v4, sel_isEqual_, a3);
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFSSHKeyParameterState;
  return -[WFSSHKeyParameterState hash](&v3, sel_hash);
}

- (NSArray)containedVariables
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (WFSSHKeyParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  WFSSHKeyParameterState *v6;

  v6 = (WFSSHKeyParameterState *)objc_alloc_init((Class)objc_opt_class());

  return v6;
}

- (WFPropertyListObject)serializedRepresentation
{
  return (WFPropertyListObject *)MEMORY[0x24BDBD1B8];
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end
