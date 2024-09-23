@implementation SingleCommunicationLimitSpecifiers

void __93___SingleCommunicationLimitSpecifiers_updateForCommunicationLimit_maximumCommunicationLimit___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "specifierForCommunicationLimit:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)(a1 + 40) >= a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v5, *MEMORY[0x1E0D80808]);

}

@end
