@implementation WFCNLabeledPostalAddressesFromWFPostalAddresses

id __WFCNLabeledPostalAddressesFromWFPostalAddresses_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id CNLabeledValueClass_12491;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  CNLabeledValueClass_12491 = getCNLabeledValueClass_12491();
  objc_msgSend(v2, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postalAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CNLabeledValueClass_12491, "labeledValueWithLabel:value:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
