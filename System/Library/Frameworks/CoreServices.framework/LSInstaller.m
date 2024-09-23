@implementation LSInstaller

void __67___LSInstaller_performShimmedInstallOfArtifact_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "shimmed install returned error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(_QWORD, BOOL, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3 == 0, v3);
}

uint64_t __86___LSInstaller_performShimmedUninstallOfApplicationWithIdentifier_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0, a2);
}

@end
