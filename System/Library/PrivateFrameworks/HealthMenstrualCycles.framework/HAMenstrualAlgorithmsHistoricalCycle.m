@implementation HAMenstrualAlgorithmsHistoricalCycle

uint64_t __244__HAMenstrualAlgorithmsHistoricalCycle_HKMenstrualCycles__hkmc_cycleWithLastDayIndex_includeFertileWindow_overridePredictionPrimarySource_overrideOvulationConfirmationFailure_overrideDailyEligibleWristTemperatureCount_useWristTemperatureInput___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = objc_msgSend(a2, "intValue") - 1;
  if (v3 > 7u)
    v4 = 2;
  else
    v4 = qword_218AC7D28[(char)v3];
  return objc_msgSend(v2, "numberWithInteger:", v4);
}

@end
