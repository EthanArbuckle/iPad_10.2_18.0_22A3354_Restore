@implementation CNContactRelationsDescription

uint64_t __87__CNContactRelationsDescription_ABSExtentions__CNLabeledValueFromABSMultiValueTranform__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDBACF0], "contactRelationWithName:", a2);
}

uint64_t __100__CNContactRelationsDescription_ABSExtentions__ABSMultiValueLabeledValueFromCNLabeledValueTransform__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

@end
