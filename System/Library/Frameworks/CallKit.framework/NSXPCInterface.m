@implementation NSXPCInterface

void __87__NSXPCInterface_CXCallDirectoryManagerSupport___cx_callDirectoryManagerAllowedClasses__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cx_allowedClasses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObjectsFromArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_cx_callDirectoryManagerAllowedClasses_allowedClasses;
  _cx_callDirectoryManagerAllowedClasses_allowedClasses = v3;

}

void __63__NSXPCInterface_CXProviderSupport___cx_providerAllowedClasses__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cx_allowedClasses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObjectsFromArray:", v2, v5, v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_cx_providerAllowedClasses_providerAllowedClasses;
  _cx_providerAllowedClasses_providerAllowedClasses = v3;

}

void __75__NSXPCInterface_CXCallControllerSupport___cx_callControllerAllowedClasses__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cx_allowedClasses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObjectsFromArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_cx_callControllerAllowedClasses_providerAllowedClasses;
  _cx_callControllerAllowedClasses_providerAllowedClasses = v3;

}

void __81__NSXPCInterface_CXVoicemailProviderSupport___cx_voicemailProviderAllowedClasses__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cx_allowedClasses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObjectsFromArray:", v2, v5, v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_cx_voicemailProviderAllowedClasses_voicemailProviderAllowedClasses;
  _cx_voicemailProviderAllowedClasses_voicemailProviderAllowedClasses = v3;

}

void __85__NSXPCInterface_CXVoicemailControllerSupport___cx_voicemailControllerAllowedClasses__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cx_allowedClasses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObjectsFromArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_cx_voicemailControllerAllowedClasses_voicemailControllerAllowedClasses;
  _cx_voicemailControllerAllowedClasses_voicemailControllerAllowedClasses = v3;

}

void __89__NSXPCInterface_CXCallDirectoryProviderSupport___cx_callDirectoryProviderAllowedClasses__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cx_allowedClasses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObjectsFromArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_cx_callDirectoryProviderAllowedClasses_allowedClasses;
  _cx_callDirectoryProviderAllowedClasses_allowedClasses = v3;

}

@end
