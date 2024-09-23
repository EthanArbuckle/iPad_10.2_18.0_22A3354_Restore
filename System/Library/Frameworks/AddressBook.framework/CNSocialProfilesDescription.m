@implementation CNSocialProfilesDescription

id __85__CNSocialProfilesDescription_ABSExtentions__CNLabeledValueFromABSMultiValueTranform__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  completedSocialProfileFromSocialProfile(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDBAD38];
  objc_msgSend(v3, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "labeledValueWithLabel:value:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 32);
  +[ABSConstantsMapping ABToCNLabelConstantsMapping](ABSConstantsMapping, "ABToCNLabelConstantsMapping");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("url");
  v17[1] = CFSTR("username");
  v17[2] = CFSTR("identifier");
  v17[3] = CFSTR("service");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  +[ABSConstantsMapping ABToCNPersonSocialProfileConstantsMapping](ABSConstantsMapping, "ABToCNPersonSocialProfileConstantsMapping");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryBasedMultiValueTransformWithLabelMapping:inputKeys:destinationClass:valueMapping:", v10, v11, v12, v13);
  v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, void *))v14)[2](v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
