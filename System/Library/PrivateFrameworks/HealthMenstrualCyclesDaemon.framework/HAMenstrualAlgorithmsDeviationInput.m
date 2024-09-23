@implementation HAMenstrualAlgorithmsDeviationInput

uint64_t __119__HAMenstrualAlgorithmsDeviationInput_HKMenstrualCycles__hdmc_deviationInputWithProfile_enabledSetExplicitly_calendar___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "completionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __109__HAMenstrualAlgorithmsDeviationInput_HKMenstrualCycles___dayIndexAfterLastDeviationOfType_profile_calendar___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

@end
