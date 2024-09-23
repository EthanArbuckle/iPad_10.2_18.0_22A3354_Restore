@implementation NSNumber(WFSerializableContent)

- (id)wfSerializedRepresentation
{
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = CFSTR("link.contentkit.number");
  v3[0] = a1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)objectWithWFSerializedRepresentation:()WFSerializableContent
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.number"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
