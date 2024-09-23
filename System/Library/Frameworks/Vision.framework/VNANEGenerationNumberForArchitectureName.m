@implementation VNANEGenerationNumberForArchitectureName

void __VNANEGenerationNumberForArchitectureName_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v9 = -1;
  v2 = (void *)MEMORY[0x1E0CB3900];
  VNANEArchitectureName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scannerWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCharactersToBeSkipped:", v5);

  if (objc_msgSend(v4, "scanInteger:", &v9) && (objc_msgSend(v4, "isAtEnd") & 1) != 0)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v7 = objc_msgSend(v6, "initWithInteger:", v9);
    v8 = (void *)VNANEGenerationNumberForArchitectureName::aneGenerationNumber;
    VNANEGenerationNumberForArchitectureName::aneGenerationNumber = v7;

  }
  else if (*(_QWORD *)(a1 + 32))
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("ANE generation cannot be determined"));
    **(_QWORD **)(a1 + 32) = (id)objc_claimAutoreleasedReturnValue();
  }

}

@end
