@implementation NSExtension

void __67__NSExtension_ExtensionKitAdditions__extensionRepresentedBy_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a2, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[EXConcreteExtension _initWithPKPlugin:]([EXConcreteExtension alloc], "_initWithPKPlugin:", v7);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else
  {
    _EXLegacyLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_190C25000, v11, OS_LOG_TYPE_DEFAULT, "Errors encountered while discovering extensions: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

@end
