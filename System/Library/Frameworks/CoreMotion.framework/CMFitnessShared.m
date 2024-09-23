@implementation CMFitnessShared

+ (BOOL)isDeviceSatellitePaired
{
  Class v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  Class v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t active;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *AllDevicesWithArchivedAltAccountDevicesMatching;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *Object;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = (Class)off_1ECEDEEB0[0]();
  v7 = (void *)objc_msgSend_sharedInstance(v2, v3, v4, v5, v6);
  v8 = (Class)off_1ECEDEEB0[0]();
  active = objc_msgSend_activePairedDeviceSelectorBlock(v8, v9, v10, v11, v12);
  AllDevicesWithArchivedAltAccountDevicesMatching = (void *)objc_msgSend_getAllDevicesWithArchivedAltAccountDevicesMatching_(v7, v14, active, v15, v16);
  Object = (void *)objc_msgSend_firstObject(AllDevicesWithArchivedAltAccountDevicesMatching, v18, v19, v20, v21);
  v23 = off_1ECEDEEB8[0]();
  v27 = (void *)objc_msgSend_valueForProperty_(Object, v24, v23, v25, v26);
  return objc_msgSend_BOOLValue(v27, v28, v29, v30, v31);
}

+ (BOOL)isWorkoutStartReminderEnabledWhenDeviceIsSatellitePaired:(BOOL)a3 isInMoveTimeMode:(BOOL)a4 withCurrentSetting:(id)a5
{
  if (a4)
    return 0;
  if (a5)
    return objc_msgSend_BOOLValue(a5, a2, a3, a4, (uint64_t)a5);
  return !a3;
}

+ (BOOL)isWorkoutEndReminderEnabledWhenDeviceIsInMoveTimeMode:(BOOL)a3 withCurrentSetting:(id)a4
{
  uint64_t v4;

  if (a3)
    return 0;
  if (a4)
    return objc_msgSend_BOOLValue(a4, a2, a3, (uint64_t)a4, v4);
  return 1;
}

+ (BOOL)isWorkoutResumeReminderEnabledWhenDeviceIsInMoveTimeMode:(BOOL)a3 withCurrentSetting:(id)a4
{
  uint64_t v4;

  if (a3)
    return 0;
  if (a4)
    return objc_msgSend_BOOLValue(a4, a2, a3, (uint64_t)a4, v4);
  return 1;
}

@end
