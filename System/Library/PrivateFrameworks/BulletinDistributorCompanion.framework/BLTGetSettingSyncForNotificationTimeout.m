@implementation BLTGetSettingSyncForNotificationTimeout

double __BLTGetSettingSyncForNotificationTimeout_block_invoke()
{
  double result;

  if (BLTGetPlayLightsAndSirensSendConnectedTimeout_onceToken != -1)
    dispatch_once(&BLTGetPlayLightsAndSirensSendConnectedTimeout_onceToken, &__block_literal_global_69);
  result = (double)__BLTPlayLightsAndSirensSendConnectedTimeout * 0.5;
  *(double *)&BLTGetSettingSyncForNotificationTimeout___BLTGetSettingSyncForNotificationTimeout = result;
  return result;
}

@end
