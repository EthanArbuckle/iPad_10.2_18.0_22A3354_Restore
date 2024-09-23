@implementation HKInteractiveChartOverlaySleepViewController(HKSleepStageDayAxisDelegate)

- (void)sleepDaySummaryForDate:()HKSleepStageDayAxisDelegate .cold.1(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_7_1(&dword_1D7813000, a4, a3, "[%{public}@] Returning summary for date %{public}@", (uint8_t *)a3);

}

- (void)sleepDaySummaryForDate:()HKSleepStageDayAxisDelegate .cold.2(void *a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];

  v4 = OUTLINED_FUNCTION_4(a1);
  v5 = (id)OUTLINED_FUNCTION_2_4();
  objc_msgSend(a3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_4_2(&dword_1D7813000, v4, v7, "[%{public}@] Cannot determine summary with series: %{public}@", v8);

  OUTLINED_FUNCTION_0_2();
}

- (void)sleepDaySummaryForDate:()HKSleepStageDayAxisDelegate .cold.3(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  v1 = OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_2_4();
  v3 = OUTLINED_FUNCTION_3(v2);
  OUTLINED_FUNCTION_3_6(&dword_1D7813000, v1, v4, "[%{public}@] Display type not interactive", v5);

  OUTLINED_FUNCTION_1();
}

- (void)sleepDaySummaryForDate:()HKSleepStageDayAxisDelegate .cold.4(void *a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];

  v4 = OUTLINED_FUNCTION_4(a1);
  v5 = (id)OUTLINED_FUNCTION_2_4();
  objc_msgSend(a3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_7_1(&dword_1D7813000, v4, v7, "[%{public}@] Finding sleep day summary for date %{public}@", v8);

  OUTLINED_FUNCTION_0_2();
}

@end
