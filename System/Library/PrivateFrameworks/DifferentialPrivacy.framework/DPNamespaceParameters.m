@implementation DPNamespaceParameters

void __45___DPNamespaceParameters_parametersFromFile___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("override.namespaceparameters"), CFSTR("plist"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  +[_DPPListHelper loadPropertyListFromPath:overridePath:usingBlock:](_DPPListHelper, "loadPropertyListFromPath:overridePath:usingBlock:", *(_QWORD *)(a1 + 32), v5, &__block_literal_global_1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)parametersFromFile__allParameters;
  parametersFromFile__allParameters = v3;

}

id __45___DPNamespaceParameters_parametersFromFile___block_invoke_2()
{
  return +[_DPNamespaceParameters namespaceParametersFromDictionary:](_DPNamespaceParameters, "namespaceParametersFromDictionary:");
}

@end
