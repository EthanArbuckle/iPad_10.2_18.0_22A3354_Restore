@implementation WFCNLabeledPhoneNumbersFromWFPhoneNumbers

id __WFCNLabeledPhoneNumbersFromWFPhoneNumbers_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id CNLabeledValueClass_12491;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = a2;
  CNLabeledValueClass_12491 = getCNLabeledValueClass_12491();
  objc_msgSend(v2, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v5 = (void *)getCNPhoneNumberClass_softClass_12520;
  v15 = getCNPhoneNumberClass_softClass_12520;
  if (!getCNPhoneNumberClass_softClass_12520)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __getCNPhoneNumberClass_block_invoke_12521;
    v11[3] = &unk_24C4E3118;
    v11[4] = &v12;
    __getCNPhoneNumberClass_block_invoke_12521((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v2, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "phoneNumberWithStringValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CNLabeledValueClass_12491, "labeledValueWithLabel:value:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
