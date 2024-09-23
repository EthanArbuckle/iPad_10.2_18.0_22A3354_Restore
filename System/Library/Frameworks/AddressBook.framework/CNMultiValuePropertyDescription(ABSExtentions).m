@implementation CNMultiValuePropertyDescription(ABSExtentions)

- (CFTypeRef)ABSValueFromCNValue:()ABSExtentions
{
  id v4;
  uint64_t TypeOfProperty;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  ABSMultiValue *v10;
  CFTypeRef v11;
  ABPropertyID property;

  v4 = a3;
  property = -1;
  if ((objc_msgSend(a1, "absPropertyID:", &property) & 1) != 0)
  {
    TypeOfProperty = ABPersonGetTypeOfProperty(property);
    v6 = v4;
    objc_msgSend(a1, "ABSMultiValueLabeledValueFromCNLabeledValueTransform");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cn_map:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    v10 = -[ABSMultiValue initWithPropertyType:mutable:values:]([ABSMultiValue alloc], "initWithPropertyType:mutable:values:", TypeOfProperty, 0, v9);
    if (v10)
      v11 = CFAutorelease(v10);
    else
      v11 = 0;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("AddressBookInvalidPropertyIDException"), CFSTR("%@ didn't return a absPropertyID"), a1);
    v11 = (CFTypeRef)*MEMORY[0x24BDBD430];
  }

  return v11;
}

- (id)CNValueFromABSValue:()ABSExtentions
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "CNLabeledValueFromABSMultiValueTranform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_map:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)CNLabeledValueFromABSMultiValueTranform
{
  void *v2;
  void *v3;

  +[ABSConstantsMapping ABToCNLabelConstantsMapping](ABSConstantsMapping, "ABToCNLabelConstantsMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "passThroughMultivalueTransformWithLabelMapping:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ABSMultiValueLabeledValueFromCNLabeledValueTransform
{
  void *v2;
  void *v3;

  +[ABSConstantsMapping CNToABLabelConstantsMapping](ABSConstantsMapping, "CNToABLabelConstantsMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "passThroughMultivalueTransformWithLabelMapping:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)multiValueTransformWithLabelMapping:()ABSExtentions valueTransform:
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __101__CNMultiValuePropertyDescription_ABSExtentions__multiValueTransformWithLabelMapping_valueTransform___block_invoke;
  v11[3] = &unk_24C2F4AC0;
  v12 = v5;
  v13 = v6;
  v7 = v5;
  v8 = v6;
  v9 = (void *)objc_msgSend(v11, "copy");

  return v9;
}

- (id)dictionaryBasedMultiValueTransformWithLabelMapping:()ABSExtentions inputKeys:destinationClass:valueMapping:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;

  v10 = a4;
  v11 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __141__CNMultiValuePropertyDescription_ABSExtentions__dictionaryBasedMultiValueTransformWithLabelMapping_inputKeys_destinationClass_valueMapping___block_invoke;
  v16[3] = &unk_24C2F4AE8;
  v18 = v11;
  v19 = a5;
  v17 = v10;
  v12 = v11;
  v13 = v10;
  objc_msgSend(a1, "multiValueTransformWithLabelMapping:valueTransform:", a3, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (uint64_t)passThroughMultivalueTransformWithLabelMapping:()ABSExtentions
{
  return objc_msgSend(a1, "multiValueTransformWithLabelMapping:valueTransform:", a3, 0);
}

- (uint64_t)isABSLabeledValueValue:()ABSExtentions equalToValue:
{
  if (a3 | a4)
    return objc_msgSend((id)a3, "isEqual:", a4);
  else
    return 1;
}

@end
