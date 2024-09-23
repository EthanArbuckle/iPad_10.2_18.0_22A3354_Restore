@implementation CALNEKTTLEventTracker

+ (CALNEKTTLEventTracker)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__CALNEKTTLEventTracker_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, block);
  return (CALNEKTTLEventTracker *)(id)sharedInstance_sharedInstance_1;
}

void __39__CALNEKTTLEventTracker_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = v0;

}

- (void)trackDirectionsEngagedForTTLAlertWithTransportType:(unint64_t)a3 etaType:(unint64_t)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6
{
  objc_msgSend(MEMORY[0x24BE14008], "trackDirectionsEngagedForTTLAlertWithTransportType:etaType:hasSuggestedLocation:isOnSharedCalendar:", a3, a4, a5, a6);
}

- (void)trackEventFiredTTLAlertWithAlertType:(unint64_t)a3 transportType:(unint64_t)a4 etaType:(unint64_t)a5 travelState:(unint64_t)a6 hasSuggestedLocation:(BOOL)a7 isOnSharedCalendar:(BOOL)a8
{
  objc_msgSend(MEMORY[0x24BE14008], "trackEventFiredTTLAlertWithAlertType:transportType:etaType:travelState:hasSuggestedLocation:isOnSharedCalendar:", a3, a4, a5, a6, a7, a8);
}

- (void)trackEmailEngagedForTTLAlertWithTransportType:(unint64_t)a3 etaType:(unint64_t)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6
{
  objc_msgSend(MEMORY[0x24BE14008], "trackEmailEngagedForTTLAlertWithTransportType:etaType:hasSuggestedLocation:isOnSharedCalendar:", a3, a4, a5, a6);
}

@end
