@implementation PFModelMap

uint64_t __35___PFModelMap_initWithClientModel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "ancillaryEntityOffset"));
  return objc_msgSend(v4, "compare:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "ancillaryEntityOffset")));
}

uint64_t __43___PFModelMap_ancillaryModelFactoryClasses__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D20]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  _MergedGlobals_82 = result;
  return result;
}

@end
