@implementation WFVPNParameterState

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  objc_msgSend(v5, "wfSerializedRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  return +[WFVPNConfiguration objectWithWFSerializedRepresentation:](WFVPNConfiguration, "objectWithWFSerializedRepresentation:", a3, a4, a5);
}

@end
