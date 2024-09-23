@implementation NSArray

void __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  v3 = a2;
  if (!v3)
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "propertyClass");
    if (objc_msgSend(v4, "isSubclassOfClass:", objc_opt_class()))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v3 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if ((objc_msgSend(v4, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    {
      v3 = &stru_24C4E3948;
    }
    else if ((objc_msgSend(v4, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    {
      v3 = (const __CFString *)&unk_24C50F728;
    }
    else if (objc_msgSend(v4, "isSubclassOfClass:", objc_opt_class()))
    {
      +[WFPhoneNumber phoneNumberWithPhoneNumberString:](WFPhoneNumber, "phoneNumberWithPhoneNumberString:", CFSTR("0"));
      v3 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v4, "isSubclassOfClass:", objc_opt_class()))
    {
      +[WFEmailAddress addressWithEmailAddress:](WFEmailAddress, "addressWithEmailAddress:", &stru_24C4E3948);
      v3 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = (const __CFString *)objc_opt_new();
    }
  }
  v8 = (__CFString *)v3;
  objc_msgSend(*(id *)(a1 + 40), "lock");
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "equivalentHash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, v7);

  objc_msgSend(*(id *)(a1 + 40), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_69(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_6;
  v7[3] = &unk_24C4E3180;
  v4 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "if_mapAsynchronously:completionHandler:", &__block_literal_global_71, v7);

}

void __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "sortedArrayUsingDescriptors:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("object"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

void __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a4;
  objc_msgSend(v5, "property");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "possibleValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_3;
  v11[3] = &unk_24C4E2890;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "getValuesWithCompletionBlock:", v11);

}

void __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x24BDD17C0];
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(a1 + 32), "property");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "equivalentHash"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 32), "ascending");
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_4;
    v28[3] = &unk_24C4E2868;
    v29 = v3;
    objc_msgSend(v4, "sortDescriptorWithKey:ascending:comparator:", v8, v9, v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "comparator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x24BDD17C0];
      v13 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(*(id *)(a1 + 32), "property");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "equivalentHash"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(*(id *)(a1 + 32), "ascending");
      objc_msgSend(*(id *)(a1 + 32), "comparator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sortDescriptorWithKey:ascending:comparator:", v16, v17, v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "property");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "propertyClass");
      v21 = objc_opt_class();

      v22 = (void *)MEMORY[0x24BDD17C0];
      v23 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(*(id *)(a1 + 32), "property");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "equivalentHash"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringValue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(*(id *)(a1 + 32), "ascending");
      if (v20 == v21)
        objc_msgSend(v22, "sortDescriptorWithKey:ascending:selector:", v26, v27, sel_localizedStandardCompare_);
      else
        objc_msgSend(v22, "sortDescriptorWithKey:ascending:", v26, v27);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(void *, id);
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD aBlock[4];
  id v13;

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_5;
  aBlock[3] = &unk_24C4E2840;
  v13 = *(id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v7 = (void (**)(void *, id))_Block_copy(aBlock);
  v7[2](v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "compare:", v9);
  return v10;
}

uint64_t __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", a2);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    v3 = -1;
  else
    v3 = v2;
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
}

@end
