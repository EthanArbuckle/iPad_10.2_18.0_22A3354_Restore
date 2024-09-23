@implementation CMOdometer(HealthDaemon)

- (void)hd_beginStreamingFromDatum:()HealthDaemon handler:
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__CMOdometer_HealthDaemon__hd_beginStreamingFromDatum_handler___block_invoke;
  v7[3] = &unk_1E6CF3398;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a1, "startCyclingWorkoutDistanceUpdatesWithHandler:", v7);

}

@end
