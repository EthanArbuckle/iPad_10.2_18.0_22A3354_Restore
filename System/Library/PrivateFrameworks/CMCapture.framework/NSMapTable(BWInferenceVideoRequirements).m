@implementation NSMapTable(BWInferenceVideoRequirements)

+ (id)bw_strongVideoRequirementToStrongObjectsMapTable
{
  void *v0;
  uint64_t v1;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 0);
  objc_msgSend(v0, "setHashFunction:", satisfiedVideoRequirementHash);
  objc_msgSend(v0, "setIsEqualFunction:", satisfiedVideoRequirementCheck);
  v1 = objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 0);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v0, v1, 0);
}

+ (id)bw_strongVideoRequirementToMapTableWithValueFunctions:()BWInferenceVideoRequirements
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 0);
  objc_msgSend(v4, "setHashFunction:", satisfiedVideoRequirementHash);
  objc_msgSend(v4, "setIsEqualFunction:", satisfiedVideoRequirementCheck);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v4, a3, 0);
}

@end
