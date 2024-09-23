@implementation SCNTechnique(SCNTechniqueCompositorAdditions)

- (id)passForName:()SCNTechniqueCompositorAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutableArrayValueForKey:", CFSTR("sequence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "indexOfObject:", v4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    _ARLogGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v10;
      v15 = 2048;
      v16 = a1;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1DCC73000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to find index for pass: %{public}@!", (uint8_t *)&v13, 0x20u);

    }
    __assert_rtn("-[SCNTechnique(SCNTechniqueCompositorAdditions) passForName:]", "ARSCNCompositor.mm", 77, "index != NSNotFound");
  }
  objc_msgSend(a1, "passAtIndex:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
