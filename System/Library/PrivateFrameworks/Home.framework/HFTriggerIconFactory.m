@implementation HFTriggerIconFactory

+ (id)iconDescriptorForTrigger:(id)a3
{
  return +[HFTriggerIconFactory iconDescriptorForTriggerType:](HFTriggerIconFactory, "iconDescriptorForTriggerType:", objc_msgSend(a3, "hf_triggerType"));
}

+ (id)iconDescriptorForTriggerType:(unint64_t)a3
{
  void *v3;
  HFImageIconDescriptor *v4;

  +[HFTriggerIconFactory _iconIdentifierForTriggerType:](HFTriggerIconFactory, "_iconIdentifierForTriggerType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HFImageIconDescriptor initWithImageIdentifier:]([HFImageIconDescriptor alloc], "initWithImageIdentifier:", v3);

  return v4;
}

+ (id)_iconIdentifierForTriggerType:(unint64_t)a3
{
  if (a3 <= 8)
    a1 = *off_1EA72B390[a3];
  return a1;
}

@end
