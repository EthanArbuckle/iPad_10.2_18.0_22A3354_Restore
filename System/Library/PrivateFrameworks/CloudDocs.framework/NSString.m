@implementation NSString

void __67__NSString_BRPathAdditions__br_supportDirForPersona_dataSeparated___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)br_supportDirForPersona_dataSeparated__pathByPersonaID;
  br_supportDirForPersona_dataSeparated__pathByPersonaID = v0;

}

uint64_t __55__NSString_BRPathAdditions__br_personaGroupDirForFPFS___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", a2, a3);
}

uint64_t __69__NSString_BRPathAdditions___br_containerPathForDataSeparatedPersona__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", a2, a3);
}

void __46__NSString_BRPathAdditions__br_currentHomeDir__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)br_currentHomeDir_pathByPersonaID;
  br_currentHomeDir_pathByPersonaID = v0;

}

@end
