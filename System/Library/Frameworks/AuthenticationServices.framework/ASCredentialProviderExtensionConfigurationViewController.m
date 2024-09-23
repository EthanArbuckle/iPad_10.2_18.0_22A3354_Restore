@implementation ASCredentialProviderExtensionConfigurationViewController

uint64_t __86___ASCredentialProviderExtensionConfigurationViewController_beginConfiguringExtension__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prepareInterfaceForExtensionConfiguration");
}

uint64_t __127___ASCredentialProviderExtensionConfigurationViewController_prepareToCompleteExtensionConfigurationRequestWithHost_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithSuccess:completion:", 1, *(_QWORD *)(a1 + 40));
}

@end
