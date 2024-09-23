@implementation MutualExclusivityEnforcementRequirementsForFeatureIdentifier

uint64_t ___MutualExclusivityEnforcementRequirementsForFeatureIdentifier_block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", *MEMORY[0x1E0CB4F78]) ^ 1;

  return v1;
}

@end
