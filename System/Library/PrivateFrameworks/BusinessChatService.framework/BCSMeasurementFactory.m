@implementation BCSMeasurementFactory

- (id)configCacheHitMeasurementForConfigType:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeFlagSignposter signposterForBCSType:]((uint64_t)BCSRealTimeFlagSignposter, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[BCSFlagMeasurement newFlagMeasurement:withHandlers:](BCSFlagMeasurement, "newFlagMeasurement:withHandlers:", 0, v4);

  return v5;
}

- (id)shardCacheHitMeasurementForShardIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeFlagSignposter signposterForShardIdentifier:]((uint64_t)BCSRealTimeFlagSignposter, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[BCSFlagMeasurement newFlagMeasurement:withHandlers:](BCSFlagMeasurement, "newFlagMeasurement:withHandlers:", 1, v4);

  return v5;
}

- (id)itemCacheHitMeasurementForItemIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeFlagSignposter signposterForItemIdentifier:]((uint64_t)BCSRealTimeFlagSignposter, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[BCSFlagMeasurement newFlagMeasurement:withHandlers:](BCSFlagMeasurement, "newFlagMeasurement:withHandlers:", 2, v4);

  return v5;
}

- (id)configCloudKitFetchTimingMeasurementForType:(int64_t)a3 identifier:(unint64_t)a4
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForBCSType:signpostIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 0, v5);

  return v6;
}

- (id)shardCloudKitFetchTimingMeasurementForType:(int64_t)a3 identifier:(unint64_t)a4
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForBCSType:signpostIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 1, v5);

  return v6;
}

- (id)itemCloudKitFetchTimingMeasurementForType:(int64_t)a3 identifier:(unint64_t)a4
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForBCSType:signpostIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 2, v5);

  return v6;
}

- (id)megashardCloudKitFetchTimingMeasurementForType:(int64_t)a3 identifier:(unint64_t)a4
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForBCSType:signpostIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 3, v5);

  return v6;
}

- (id)configCloudKitFetchAndDecodeTimingMeasurementForType:(int64_t)a3 identifier:(unint64_t)a4
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForBCSType:signpostIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 4, v5);

  return v6;
}

- (id)shardCloudKitFetchAndDecodeTimingMeasurementForType:(int64_t)a3 identifier:(unint64_t)a4
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForBCSType:signpostIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 5, v5);

  return v6;
}

- (id)itemCloudKitFetchAndDecodeTimingMeasurementForType:(int64_t)a3 identifier:(unint64_t)a4
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForBCSType:signpostIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 6, v5);

  return v6;
}

- (id)megashardCloudKitFetchAndDecodeTimingMeasurementForType:(int64_t)a3 identifier:(unint64_t)a4
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForBCSType:signpostIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 7, v5);

  return v6;
}

- (id)configResolutionTimingMeasurementForConfigType:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForBCSType:]((uint64_t)BCSRealTimeTimingSignposter, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 8, v4);

  return v5;
}

- (id)shardResolutionTimingMeasurementForShardIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForShardIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 9, v4);

  return v5;
}

- (id)itemResolutionTimingMeasurementForItemIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForItemIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 10, v4);

  return v5;
}

- (id)itemFetchTimingMeasurementForItemIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForItemIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 11, v4);

  return v5;
}

- (id)businessLinkChoppedFetchTimingMeasurementForItemIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForItemIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 12, v4);

  return v5;
}

- (id)businessLinkFetchByHashTimingMeasurementForItemIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForItemIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 13, v4);

  return v5;
}

- (id)itemIsRegisteredTimingMeasurementForItemIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForItemIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 14, v4);

  return v5;
}

- (id)businessCallerFetchTimingMeasurementForItemIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForItemIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 15, v4);

  return v5;
}

- (id)businessEmailFetchTimingMeasurementForItemIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForItemIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 17, v4);

  return v5;
}

- (id)blastDoorTimingMeasurementForItemIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForItemIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 19, v4);

  return v5;
}

- (id)pirFetchTimingMeasurementForItemIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[BCSRealTimeTimingSignposter signposterForItemIdentifier:]((uint64_t)BCSRealTimeTimingSignposter, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[BCSTimingMeasurement newTimingMeasurement:withHandlers:](BCSTimingMeasurement, "newTimingMeasurement:withHandlers:", 18, v4);

  return v5;
}

@end
