@implementation UIDocumentPickerDescriptor

intptr_t __41___UIDocumentPickerDescriptor_allPickers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __41___UIDocumentPickerDescriptor_allPickers__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "indexOfObject:", v8);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "indexOfObject:", v11);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL && v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = objc_msgSend(v5, "compare:", v6);
  }
  else
  {
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      v14 = 1;
    else
      v14 = -1;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = -1;
      if (v9 >= v12)
        v15 = 1;
      if (v9 == v12)
        v15 = 0;
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        v14 = v15;
    }
  }

  return v14;
}

uint64_t __63___UIDocumentPickerDescriptor_allPickersForMode_documentTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pickerEnabledForMode:documentTypes:reason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __64___UIDocumentPickerDescriptor_filteredPickersForPickers_filter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enabled");
}

uint64_t __64___UIDocumentPickerDescriptor_filteredPickersForPickers_filter___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF8110]);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "extension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("UIDocumentPickerVisibilityUserManageable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v5 = objc_msgSend(v8, "BOOLValue");
    else
      v5 = 1;

  }
  return v5;
}

uint64_t __56___UIDocumentPickerDescriptor_descriptorWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __49___UIDocumentPickerDescriptor_cloudEnabledStatus__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__ubiquityIdentityTokenDidChange_, *MEMORY[0x24BDD1380], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__ubiquityIdentityTokenDidChange_, *MEMORY[0x24BDF75D0], 0);

  return objc_msgSend(*(id *)(a1 + 32), "__updateCloudEnabledStatus");
}

void __61___UIDocumentPickerDescriptor__extensionValueOfClass_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "extension");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Extension %@ has malformed value for key %@"), v2, *(_QWORD *)(a1 + 40));

}

@end
