@implementation HMDAppleMediaAccessoryDailySetRoomEvent

- (HMDAppleMediaAccessoryDailySetRoomEvent)initWithCurrentRoom:(id)a3 previousRoom:(id)a4
{
  id v7;
  id v8;
  HMDAppleMediaAccessoryDailySetRoomEvent *v9;
  HMDAppleMediaAccessoryDailySetRoomEvent *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAppleMediaAccessoryDailySetRoomEvent;
  v9 = -[HMMLogEvent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_currentRoom, a3);
    objc_storeStrong((id *)&v10->_previousRoom, a4);
  }

  return v10;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.MediaAccessory.DailyRoomLog");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[HMDAppleMediaAccessoryDailySetRoomEvent currentRoom](self, "currentRoom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAppleMediaAccessoryDailySetRoomEvent filterToAllowedRoomName:](HMDAppleMediaAccessoryDailySetRoomEvent, "filterToAllowedRoomName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("CurrentRoom"));

  -[HMDAppleMediaAccessoryDailySetRoomEvent previousRoom](self, "previousRoom");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAppleMediaAccessoryDailySetRoomEvent filterToAllowedRoomName:](HMDAppleMediaAccessoryDailySetRoomEvent, "filterToAllowedRoomName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("PreviousRoom"));

  v8 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v8;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSString)currentRoom
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)previousRoom
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousRoom, 0);
  objc_storeStrong((id *)&self->_currentRoom, 0);
}

+ (id)filterToAllowedRoomName:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v3 = (__CFString *)a3;
  if (filterToAllowedRoomName__onceToken != -1)
    dispatch_once(&filterToAllowedRoomName__onceToken, &__block_literal_global_58226);
  v4 = CFSTR("User Defined");
  if (v3 && objc_msgSend((id)filterToAllowedRoomName__allowedRoomNames, "containsObject:", v3))
    v4 = v3;
  v5 = v4;

  return v5;
}

void __67__HMDAppleMediaAccessoryDailySetRoomEvent_filterToAllowedRoomName___block_invoke()
{
  void *v0;

  v0 = (void *)filterToAllowedRoomName__allowedRoomNames;
  filterToAllowedRoomName__allowedRoomNames = (uint64_t)&unk_24E970D30;

}

@end
