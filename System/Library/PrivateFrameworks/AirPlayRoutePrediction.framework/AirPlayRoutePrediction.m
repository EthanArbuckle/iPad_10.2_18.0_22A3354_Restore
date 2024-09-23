objc_class *getBMBiomeSchedulerClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getBMBiomeSchedulerClass_softClass;
  v6 = getBMBiomeSchedulerClass_softClass;
  if (!getBMBiomeSchedulerClass_softClass)
  {
    BiomeStreamsLibraryCore();
    Class = objc_getClass("BMBiomeScheduler");
    v4[3] = (uint64_t)Class;
    getBMBiomeSchedulerClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1DD7948C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getBMStreamsClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getBMStreamsClass_softClass;
  v6 = getBMStreamsClass_softClass;
  if (!getBMStreamsClass_softClass)
  {
    BiomeStreamsLibraryCore();
    Class = objc_getClass("BMStreams");
    v4[3] = (uint64_t)Class;
    getBMStreamsClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1DD79495C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getBMHomeKitClientAccessoryControlStreamClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getBMHomeKitClientAccessoryControlStreamClass_softClass;
  v6 = getBMHomeKitClientAccessoryControlStreamClass_softClass;
  if (!getBMHomeKitClientAccessoryControlStreamClass_softClass)
  {
    BiomeStreamsLibraryCore();
    Class = objc_getClass("BMHomeKitClientAccessoryControlStream");
    v4[3] = (uint64_t)Class;
    getBMHomeKitClientAccessoryControlStreamClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1DD7949F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getBMHomeKitClientActionSetStreamClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getBMHomeKitClientActionSetStreamClass_softClass;
  v6 = getBMHomeKitClientActionSetStreamClass_softClass;
  if (!getBMHomeKitClientActionSetStreamClass_softClass)
  {
    BiomeStreamsLibraryCore();
    Class = objc_getClass("BMHomeKitClientActionSetStream");
    v4[3] = (uint64_t)Class;
    getBMHomeKitClientActionSetStreamClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1DD794A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getBMHomeKitClientMediaAccessoryControlStreamClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getBMHomeKitClientMediaAccessoryControlStreamClass_softClass;
  v6 = getBMHomeKitClientMediaAccessoryControlStreamClass_softClass;
  if (!getBMHomeKitClientMediaAccessoryControlStreamClass_softClass)
  {
    BiomeStreamsLibraryCore();
    Class = objc_getClass("BMHomeKitClientMediaAccessoryControlStream");
    v4[3] = (uint64_t)Class;
    getBMHomeKitClientMediaAccessoryControlStreamClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1DD794B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeDoorbell()
{
  id *HMServiceTypeDoorbellSymbolLoc;

  HMServiceTypeDoorbellSymbolLoc = (id *)getHMServiceTypeDoorbellSymbolLoc();
  if (!HMServiceTypeDoorbellSymbolLoc)
    getHMServiceTypeMicrophone_cold_1();
  return *HMServiceTypeDoorbellSymbolLoc;
}

id getHMServiceTypeMicrophone()
{
  id *HMServiceTypeMicrophoneSymbolLoc;

  HMServiceTypeMicrophoneSymbolLoc = (id *)getHMServiceTypeMicrophoneSymbolLoc();
  if (!HMServiceTypeMicrophoneSymbolLoc)
    getHMServiceTypeMicrophone_cold_1();
  return *HMServiceTypeMicrophoneSymbolLoc;
}

id getHMServiceTypeSpeaker()
{
  id *HMServiceTypeSpeakerSymbolLoc;

  HMServiceTypeSpeakerSymbolLoc = (id *)getHMServiceTypeSpeakerSymbolLoc();
  if (!HMServiceTypeSpeakerSymbolLoc)
    getHMServiceTypeMicrophone_cold_1();
  return *HMServiceTypeSpeakerSymbolLoc;
}

objc_class *getAVSystemControllerClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getAVSystemControllerClass_softClass;
  v6 = getAVSystemControllerClass_softClass;
  if (!getAVSystemControllerClass_softClass)
  {
    MediaExperienceLibraryCore();
    Class = objc_getClass("AVSystemController");
    v4[3] = (uint64_t)Class;
    getAVSystemControllerClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1DD794C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

id getHMServiceTypeTemperatureSensor()
{
  id *HMServiceTypeTemperatureSensorSymbolLoc;

  HMServiceTypeTemperatureSensorSymbolLoc = (id *)getHMServiceTypeTemperatureSensorSymbolLoc();
  if (!HMServiceTypeTemperatureSensorSymbolLoc)
    getHMServiceTypeMicrophone_cold_1();
  return *HMServiceTypeTemperatureSensorSymbolLoc;
}

void *getHMServiceTypeTemperatureSensorSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getHMServiceTypeTemperatureSensorSymbolLoc_ptr;
  v6 = getHMServiceTypeTemperatureSensorSymbolLoc_ptr;
  if (!getHMServiceTypeTemperatureSensorSymbolLoc_ptr)
  {
    v1 = (void *)HomeKitLibrary();
    v0 = dlsym(v1, "HMServiceTypeTemperatureSensor");
    v4[3] = (uint64_t)v0;
    getHMServiceTypeTemperatureSensorSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DD79648C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getHMServiceTypeSpeakerSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getHMServiceTypeSpeakerSymbolLoc_ptr;
  v6 = getHMServiceTypeSpeakerSymbolLoc_ptr;
  if (!getHMServiceTypeSpeakerSymbolLoc_ptr)
  {
    v1 = (void *)HomeKitLibrary();
    v0 = dlsym(v1, "HMServiceTypeSpeaker");
    v4[3] = (uint64_t)v0;
    getHMServiceTypeSpeakerSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DD79651C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeSmokeSensor()
{
  id *HMServiceTypeSmokeSensorSymbolLoc;

  HMServiceTypeSmokeSensorSymbolLoc = (id *)getHMServiceTypeSmokeSensorSymbolLoc();
  if (!HMServiceTypeSmokeSensorSymbolLoc)
    getHMServiceTypeMicrophone_cold_1();
  return *HMServiceTypeSmokeSensorSymbolLoc;
}

void *getHMServiceTypeSmokeSensorSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getHMServiceTypeSmokeSensorSymbolLoc_ptr;
  v6 = getHMServiceTypeSmokeSensorSymbolLoc_ptr;
  if (!getHMServiceTypeSmokeSensorSymbolLoc_ptr)
  {
    v1 = (void *)HomeKitLibrary();
    v0 = dlsym(v1, "HMServiceTypeSmokeSensor");
    v4[3] = (uint64_t)v0;
    getHMServiceTypeSmokeSensorSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DD7965CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeOccupancySensor()
{
  id *HMServiceTypeOccupancySensorSymbolLoc;

  HMServiceTypeOccupancySensorSymbolLoc = (id *)getHMServiceTypeOccupancySensorSymbolLoc();
  if (!HMServiceTypeOccupancySensorSymbolLoc)
    getHMServiceTypeMicrophone_cold_1();
  return *HMServiceTypeOccupancySensorSymbolLoc;
}

void *getHMServiceTypeOccupancySensorSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getHMServiceTypeOccupancySensorSymbolLoc_ptr;
  v6 = getHMServiceTypeOccupancySensorSymbolLoc_ptr;
  if (!getHMServiceTypeOccupancySensorSymbolLoc_ptr)
  {
    v1 = (void *)HomeKitLibrary();
    v0 = dlsym(v1, "HMServiceTypeOccupancySensor");
    v4[3] = (uint64_t)v0;
    getHMServiceTypeOccupancySensorSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DD79667C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeMotionSensor()
{
  id *HMServiceTypeMotionSensorSymbolLoc;

  HMServiceTypeMotionSensorSymbolLoc = (id *)getHMServiceTypeMotionSensorSymbolLoc();
  if (!HMServiceTypeMotionSensorSymbolLoc)
    getHMServiceTypeMicrophone_cold_1();
  return *HMServiceTypeMotionSensorSymbolLoc;
}

void *getHMServiceTypeMotionSensorSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getHMServiceTypeMotionSensorSymbolLoc_ptr;
  v6 = getHMServiceTypeMotionSensorSymbolLoc_ptr;
  if (!getHMServiceTypeMotionSensorSymbolLoc_ptr)
  {
    v1 = (void *)HomeKitLibrary();
    v0 = dlsym(v1, "HMServiceTypeMotionSensor");
    v4[3] = (uint64_t)v0;
    getHMServiceTypeMotionSensorSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DD79672C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getHMServiceTypeMicrophoneSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getHMServiceTypeMicrophoneSymbolLoc_ptr;
  v6 = getHMServiceTypeMicrophoneSymbolLoc_ptr;
  if (!getHMServiceTypeMicrophoneSymbolLoc_ptr)
  {
    v1 = (void *)HomeKitLibrary();
    v0 = dlsym(v1, "HMServiceTypeMicrophone");
    v4[3] = (uint64_t)v0;
    getHMServiceTypeMicrophoneSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DD7967BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeLightSensor()
{
  id *HMServiceTypeLightSensorSymbolLoc;

  HMServiceTypeLightSensorSymbolLoc = (id *)getHMServiceTypeLightSensorSymbolLoc();
  if (!HMServiceTypeLightSensorSymbolLoc)
    getHMServiceTypeMicrophone_cold_1();
  return *HMServiceTypeLightSensorSymbolLoc;
}

void *getHMServiceTypeLightSensorSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getHMServiceTypeLightSensorSymbolLoc_ptr;
  v6 = getHMServiceTypeLightSensorSymbolLoc_ptr;
  if (!getHMServiceTypeLightSensorSymbolLoc_ptr)
  {
    v1 = (void *)HomeKitLibrary();
    v0 = dlsym(v1, "HMServiceTypeLightSensor");
    v4[3] = (uint64_t)v0;
    getHMServiceTypeLightSensorSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DD79686C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeLeakSensor()
{
  id *HMServiceTypeLeakSensorSymbolLoc;

  HMServiceTypeLeakSensorSymbolLoc = (id *)getHMServiceTypeLeakSensorSymbolLoc();
  if (!HMServiceTypeLeakSensorSymbolLoc)
    getHMServiceTypeMicrophone_cold_1();
  return *HMServiceTypeLeakSensorSymbolLoc;
}

void *getHMServiceTypeLeakSensorSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getHMServiceTypeLeakSensorSymbolLoc_ptr;
  v6 = getHMServiceTypeLeakSensorSymbolLoc_ptr;
  if (!getHMServiceTypeLeakSensorSymbolLoc_ptr)
  {
    v1 = (void *)HomeKitLibrary();
    v0 = dlsym(v1, "HMServiceTypeLeakSensor");
    v4[3] = (uint64_t)v0;
    getHMServiceTypeLeakSensorSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DD79691C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeHumiditySensor()
{
  id *HMServiceTypeHumiditySensorSymbolLoc;

  HMServiceTypeHumiditySensorSymbolLoc = (id *)getHMServiceTypeHumiditySensorSymbolLoc();
  if (!HMServiceTypeHumiditySensorSymbolLoc)
    getHMServiceTypeMicrophone_cold_1();
  return *HMServiceTypeHumiditySensorSymbolLoc;
}

void *getHMServiceTypeHumiditySensorSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getHMServiceTypeHumiditySensorSymbolLoc_ptr;
  v6 = getHMServiceTypeHumiditySensorSymbolLoc_ptr;
  if (!getHMServiceTypeHumiditySensorSymbolLoc_ptr)
  {
    v1 = (void *)HomeKitLibrary();
    v0 = dlsym(v1, "HMServiceTypeHumiditySensor");
    v4[3] = (uint64_t)v0;
    getHMServiceTypeHumiditySensorSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DD7969CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getHMServiceTypeDoorbellSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getHMServiceTypeDoorbellSymbolLoc_ptr;
  v6 = getHMServiceTypeDoorbellSymbolLoc_ptr;
  if (!getHMServiceTypeDoorbellSymbolLoc_ptr)
  {
    v1 = (void *)HomeKitLibrary();
    v0 = dlsym(v1, "HMServiceTypeDoorbell");
    v4[3] = (uint64_t)v0;
    getHMServiceTypeDoorbellSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DD796A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t HomeKitLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = HomeKitLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t HomeKitLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = HomeKitLibraryCore_frameworkLibrary;
  v6 = HomeKitLibraryCore_frameworkLibrary;
  if (!HomeKitLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1EA7D49A0;
    v8 = *(_OWORD *)&off_1EA7D49B0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    HomeKitLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DD796B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeContactSensor()
{
  id *HMServiceTypeContactSensorSymbolLoc;

  HMServiceTypeContactSensorSymbolLoc = (id *)getHMServiceTypeContactSensorSymbolLoc();
  if (!HMServiceTypeContactSensorSymbolLoc)
    getHMServiceTypeMicrophone_cold_1();
  return *HMServiceTypeContactSensorSymbolLoc;
}

void *getHMServiceTypeContactSensorSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getHMServiceTypeContactSensorSymbolLoc_ptr;
  v6 = getHMServiceTypeContactSensorSymbolLoc_ptr;
  if (!getHMServiceTypeContactSensorSymbolLoc_ptr)
  {
    v1 = (void *)HomeKitLibrary();
    v0 = dlsym(v1, "HMServiceTypeContactSensor");
    v4[3] = (uint64_t)v0;
    getHMServiceTypeContactSensorSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DD796C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeCarbonMonoxideSensor()
{
  id *HMServiceTypeCarbonMonoxideSensorSymbolLoc;

  HMServiceTypeCarbonMonoxideSensorSymbolLoc = (id *)getHMServiceTypeCarbonMonoxideSensorSymbolLoc();
  if (!HMServiceTypeCarbonMonoxideSensorSymbolLoc)
    getHMServiceTypeMicrophone_cold_1();
  return *HMServiceTypeCarbonMonoxideSensorSymbolLoc;
}

void *getHMServiceTypeCarbonMonoxideSensorSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getHMServiceTypeCarbonMonoxideSensorSymbolLoc_ptr;
  v6 = getHMServiceTypeCarbonMonoxideSensorSymbolLoc_ptr;
  if (!getHMServiceTypeCarbonMonoxideSensorSymbolLoc_ptr)
  {
    v1 = (void *)HomeKitLibrary();
    v0 = dlsym(v1, "HMServiceTypeCarbonMonoxideSensor");
    v4[3] = (uint64_t)v0;
    getHMServiceTypeCarbonMonoxideSensorSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DD796CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeCarbonDioxideSensor()
{
  id *HMServiceTypeCarbonDioxideSensorSymbolLoc;

  HMServiceTypeCarbonDioxideSensorSymbolLoc = (id *)getHMServiceTypeCarbonDioxideSensorSymbolLoc();
  if (!HMServiceTypeCarbonDioxideSensorSymbolLoc)
    getHMServiceTypeMicrophone_cold_1();
  return *HMServiceTypeCarbonDioxideSensorSymbolLoc;
}

void *getHMServiceTypeCarbonDioxideSensorSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getHMServiceTypeCarbonDioxideSensorSymbolLoc_ptr;
  v6 = getHMServiceTypeCarbonDioxideSensorSymbolLoc_ptr;
  if (!getHMServiceTypeCarbonDioxideSensorSymbolLoc_ptr)
  {
    v1 = (void *)HomeKitLibrary();
    v0 = dlsym(v1, "HMServiceTypeCarbonDioxideSensor");
    v4[3] = (uint64_t)v0;
    getHMServiceTypeCarbonDioxideSensorSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DD796D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getHMServiceTypeAirQualitySensor()
{
  id *HMServiceTypeAirQualitySensorSymbolLoc;

  HMServiceTypeAirQualitySensorSymbolLoc = (id *)getHMServiceTypeAirQualitySensorSymbolLoc();
  if (!HMServiceTypeAirQualitySensorSymbolLoc)
    getHMServiceTypeMicrophone_cold_1();
  return *HMServiceTypeAirQualitySensorSymbolLoc;
}

void *getHMServiceTypeAirQualitySensorSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getHMServiceTypeAirQualitySensorSymbolLoc_ptr;
  v6 = getHMServiceTypeAirQualitySensorSymbolLoc_ptr;
  if (!getHMServiceTypeAirQualitySensorSymbolLoc_ptr)
  {
    v1 = (void *)HomeKitLibrary();
    v0 = dlsym(v1, "HMServiceTypeAirQualitySensor");
    v4[3] = (uint64_t)v0;
    getHMServiceTypeAirQualitySensorSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DD796E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id ARPHomeControlLog()
{
  if (ARPHomeControlLog_onceToken != -1)
    dispatch_once(&ARPHomeControlLog_onceToken, &__block_literal_global_3_0);
  return (id)ARPHomeControlLog_log;
}

id ARPLog()
{
  if (ARPLog_onceToken != -1)
    dispatch_once(&ARPLog_onceToken, &__block_literal_global_0);
  return (id)ARPLog_log;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1DD79880C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BiomeStreamsLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = BiomeStreamsLibraryCore_frameworkLibrary;
  v6 = BiomeStreamsLibraryCore_frameworkLibrary;
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1EA7D49C0;
    v8 = *(_OWORD *)&off_1EA7D49D0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    BiomeStreamsLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DD7988EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id ARPFeedbackLog()
{
  if (ARPFeedbackLog_onceToken != -1)
    dispatch_once(&ARPFeedbackLog_onceToken, &__block_literal_global_5_0);
  return (id)ARPFeedbackLog_log;
}

id ARPExtractLongFormVideoOutputDeviceIDs(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v26;
    v20 = v1;
    v18 = *(_QWORD *)v26;
    do
    {
      v5 = 0;
      v19 = v3;
      do
      {
        if (*(_QWORD *)v26 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v1, "objectForKeyedSubscript:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v8 = v7;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v22;
            while (2)
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v22 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v14 = (int)objc_msgSend(v6, "intValue");
                  v15 = objc_msgSend(v13, "intValue");
                  if ((objc_msgSend(MEMORY[0x1E0C8B360], "longFormVideoManagerCanHaveCurrentSessionWithDestinationOfType:subType:", v14, v15) & 1) != 0)
                  {
                    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
                    v16 = (void *)objc_claimAutoreleasedReturnValue();

                    v1 = v20;
                    goto LABEL_22;
                  }
                }
              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              if (v10)
                continue;
              break;
            }
          }

          v3 = v19;
          v1 = v20;
          v4 = v18;
        }
        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v16 = &unk_1EA7D78F8;
    }
    while (v3);
  }
  else
  {
    v16 = &unk_1EA7D78F8;
  }
LABEL_22:

  return v16;
}

void sub_1DD79ADC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD79BD84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD79CFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1DD79DEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a12);
  va_start(va, a12);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v12 - 136), 8);
  _Unwind_Resume(a1);
}

double ARPMicroLocationSimilarity(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  double v30;
  double v31;
  double v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &UUID_NULL);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  v8 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  if (v7)
  {
    v11 = v7;
    v12 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v16;
        objc_msgSend(v15, "doubleValue");
        v19 = v18;
        if ((objc_msgSend(v14, "isEqual:", v5) & 1) == 0)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v15, "doubleValue");
            v22 = v21;
            objc_msgSend(v20, "doubleValue");
            v10 = v10 + v22 * v23;
          }

        }
        v9 = v9 + v17 * v19;

      }
      v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v11);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v24 = v4;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v35;
    v8 = 0.0;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(v24, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), (_QWORD)v34);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "doubleValue");
        v31 = v30;
        objc_msgSend(v29, "doubleValue");
        v8 = v8 + v31 * v32;

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v26);
  }

  return v10 / (sqrt(v9) * sqrt(v8));
}

void sub_1DD7A0670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD7A06DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD7A1714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

const __CFString *ARPFeedbackTypeDescription(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("unknown");
  else
    return *(&off_1EA7D4980 + a1);
}

void ARPDonateFeedbackForPredictionPresented(void *a1, void *a2)
{
  ARPDonateFeedback(0, a1, a2);
}

void ARPDonateFeedback(unint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1DF0DB988]();
  objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ARPDonateFeedbackToKnowledgeStore(a1, v8, v5, v7);

  objc_autoreleasePoolPop(v6);
}

void ARPDonateFeedbackForPredictionSuppressed(void *a1, void *a2)
{
  ARPDonateFeedback(1uLL, a1, a2);
}

void ARPDonateFeedbackForRouteSelection(void *a1, void *a2)
{
  ARPDonateFeedback(2uLL, a1, a2);
}

void ARPDonateFeedbackForRoutingFailure(void *a1, void *a2)
{
  ARPDonateFeedback(3uLL, a1, a2);
}

void ARPDonateFeedbackToKnowledgeStore(unint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint8_t v37[128];
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v28 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ARPFeedbackLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (a1 > 3)
      v11 = CFSTR("unknown");
    else
      v11 = *(&off_1EA7D4980 + a1);
    *(_DWORD *)buf = 138412802;
    v39 = v11;
    v40 = 2112;
    v41 = v28;
    v42 = 2112;
    v43 = v7;
    _os_log_impl(&dword_1DD793000, v10, OS_LOG_TYPE_INFO, "Donating airplay prediction feedback, type: '%@', subtype: %@, outputDeviceIDs: %@", buf, 0x20u);
  }

  if (v7)
  {
    v12 = objc_msgSend(v7, "count");
    if (v28)
    {
      if (v12 && objc_msgSend(v28, "length"))
      {
        v13 = a1;
        v26 = v8;
        v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v14 = v7;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v32 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              if (objc_msgSend(v19, "length"))
              {
                objc_msgSend(MEMORY[0x1E0D15960], "outputDeviceID");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v35[0] = v20;
                v36[0] = v19;
                objc_msgSend(MEMORY[0x1E0D15960], "subtype");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v35[1] = v21;
                v36[1] = v28;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                v23 = (void *)MEMORY[0x1E0D159F8];
                objc_msgSend(MEMORY[0x1E0D15AF8], "airplayPredictionStream");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "eventWithStream:startDate:endDate:categoryIntegerValue:metadata:", v24, v9, v9, v13, v22);
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v27, "addObject:", v25);
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
          }
          while (v16);
        }

        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __ARPDonateFeedbackToKnowledgeStore_block_invoke_2;
        v29[3] = &unk_1EA7D4900;
        v8 = v26;
        v30 = v26;
        objc_msgSend(v30, "saveObjects:tracker:responseQueue:withCompletion:", v27, &__block_literal_global_6, 0, v29);

      }
    }
  }

}

void ARPCollectAndSendAnalyticsEvents(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  unint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t k;
  uint64_t v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  id v183;
  id v184;
  NSObject *v185;
  NSObject *v186;
  id v187;
  void *v188;
  uint64_t v189;
  id v190;
  void *v191;
  void *v192;
  id v193;
  void *v194;
  uint64_t v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  id v203;
  void *v204;
  void *v205;
  void *context;
  void *contexta;
  void *v208;
  uint64_t v209;
  void *v210;
  void *v211;
  id v212;
  uint64_t v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  id obj;
  id obja;
  char *objb;
  void *v221;
  void *v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  id v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  id v236;
  _BYTE v237[128];
  _QWORD v238[2];
  _BYTE v239[128];
  void *v240;
  _QWORD v241[3];
  _QWORD v242[2];
  _QWORD v243[2];
  _QWORD v244[3];
  _QWORD v245[4];
  os_activity_scope_state_s state;
  void *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  _QWORD v251[2];
  _QWORD v252[2];
  id v253[5];

  v253[2] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = _os_activity_create(&dword_1DD793000, "Duet: ARPCollectAndSendAnalyticsEvents", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[1] = 0;
  state.opaque[0] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  if ((AnalyticsIsEventUsed() & 1) != 0)
  {
    v6 = v3;
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0D15AF8], "appUsageStream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v248 = (uint64_t)v8;
    objc_msgSend(MEMORY[0x1E0D15AF8], "nowPlayingStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v249 = (uint64_t)v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v248, 2);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0D15AD0];
    objc_msgSend(v7, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v221 = v7;
    objc_msgSend(v7, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateForEventsWithStartInDateRangeFromAfter:to:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v215 = (void *)v14;
    obj = (id)v10;
    objc_msgSend(MEMORY[0x1E0D15A08], "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v14, v10, 0, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARPFeedback.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(":%d"), 46);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setClientName:", v17);

    objc_msgSend(v15, "setTracker:", &__block_literal_global_171);
    objc_msgSend(v15, "setGroupByProperties:", &unk_1EA7D7928);
    objc_msgSend(v15, "setResultType:", 3);
    v253[0] = 0;
    objc_msgSend(v6, "executeQuery:error:", v15, v253);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v253[0];
    v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v183 = v3;
    v184 = v4;
    if (v19)
    {
      v21 = v18;
      ARPLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ARPCorrelationTask longFormVideoAppBundleIDs].cold.1();
    }
    else
    {
      v212 = v6;
      -[objc_class sharedAVSystemController](getAVSystemControllerClass(), "sharedAVSystemController");
      v22 = objc_claimAutoreleasedReturnValue();
      v232 = 0u;
      v233 = 0u;
      v234 = 0u;
      v235 = 0u;
      v21 = v18;
      objc_msgSend(v18, "valueForKey:", CFSTR("valueString"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v232, &state, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v233;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v233 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v232 + 1) + 8 * i);
            if (-[NSObject hasRouteSharingPolicyLongFormVideo:](v22, "hasRouteSharingPolicyLongFormVideo:", v29))objc_msgSend(v20, "addObject:", v29);
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v232, &state, 16);
        }
        while (v26);
      }

      v6 = v212;
    }

    objc_msgSend(v20, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    ARPFeedbackLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      ARPCollectAndSendAnalyticsEvents_cold_5();

    v193 = v6;
    v32 = v30;
    v33 = v221;
    objc_msgSend(MEMORY[0x1E0D15AF8], "appUsageStream");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v253[0] = v34;
    objc_msgSend(MEMORY[0x1E0D15AF8], "nowPlayingStream");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v253[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v253, 2);
    v213 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D15AD0], "startDateSortDescriptorAscending:", 1);
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0D15AD0];
    objc_msgSend(MEMORY[0x1E0D15AF8], "appUsageStream");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "name");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "predicateForEventsWithStreamName:", v38);
    v39 = objc_claimAutoreleasedReturnValue();

    v40 = (void *)MEMORY[0x1E0D15AD0];
    objc_msgSend(MEMORY[0x1E0D15AF8], "nowPlayingStream");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "name");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "predicateForEventsWithStreamName:", v42);
    v43 = objc_claimAutoreleasedReturnValue();

    v44 = (void *)MEMORY[0x1E0D15AD0];
    objc_msgSend(MEMORY[0x1E0D15AA0], "playing");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "predicateForObjectsWithMetadataKey:andIntegerValue:", v45, 1);
    v46 = objc_claimAutoreleasedReturnValue();

    v47 = (void *)MEMORY[0x1E0CB3528];
    v204 = (void *)v46;
    context = (void *)v43;
    v252[0] = v43;
    v252[1] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v252, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "andPredicateWithSubpredicates:", v48);
    v49 = objc_claimAutoreleasedReturnValue();

    v50 = (void *)MEMORY[0x1E0CB3528];
    v208 = (void *)v39;
    v251[0] = v39;
    v251[1] = v49;
    v202 = (void *)v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v251, 2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "orPredicateWithSubpredicates:", v51);
    v52 = objc_claimAutoreleasedReturnValue();

    v185 = v32;
    objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithStringValueInValues:", v32);
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = (void *)MEMORY[0x1E0D15AD0];
    objc_msgSend(v33, "startDate");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v210 = v33;
    objc_msgSend(v33, "endDate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "predicateForEventsWithStartInDateRangeFromAfter:to:", v55, v56);
    v57 = objc_claimAutoreleasedReturnValue();

    v58 = (void *)MEMORY[0x1E0CB3528];
    v196 = (void *)v57;
    v198 = (void *)v53;
    v248 = v57;
    v249 = v52;
    v200 = (void *)v52;
    v250 = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v248, 3);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "andPredicateWithSubpredicates:", v59);
    v60 = objc_claimAutoreleasedReturnValue();

    v61 = (void *)MEMORY[0x1E0D15A08];
    v62 = (void *)v213;
    v247 = v216;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v247, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v194 = (void *)v60;
    objc_msgSend(v61, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v60, v213, 0, 0, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARPFeedback.m");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "stringByAppendingFormat:", CFSTR(":%d"), 91);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setClientName:", v66);

    objc_msgSend(v64, "setTracker:", &__block_literal_global_175);
    objc_msgSend(v64, "setResultType:", 2);
    v236 = 0;
    v191 = v64;
    objc_msgSend(v193, "executeQuery:error:", v64, &v236);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v188 = v67;
    v190 = v236;
    if (v190)
    {
      ARPLog();
      v68 = objc_claimAutoreleasedReturnValue();
      v4 = v184;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        ARPCollectAndSendAnalyticsEvents_cold_4();

      v69 = 0;
      v23 = v185;
      v70 = v204;
      goto LABEL_41;
    }
    v69 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v232 = 0u;
    v233 = 0u;
    v234 = 0u;
    v235 = 0u;
    obja = v67;
    v71 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v232, &state, 16);
    v222 = v69;
    if (v71)
    {
      v72 = v71;
      v73 = *(_QWORD *)v233;
      do
      {
        for (j = 0; j != v72; ++j)
        {
          if (*(_QWORD *)v233 != v73)
            objc_enumerationMutation(obja);
          v75 = *(void **)(*((_QWORD *)&v232 + 1) + 8 * j);
          v76 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(v75, "startDate");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "dateByAddingTimeInterval:", -30.0);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "endDate");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "dateByAddingTimeInterval:", 30.0);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = (void *)objc_msgSend(v76, "initWithStartDate:endDate:", v78, v80);

          v69 = v222;
          objc_msgSend(v222, "addObject:", v81);

        }
        v72 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v232, &state, 16);
      }
      while (v72);
    }

    if (objc_msgSend(v69, "count"))
    {
      v62 = (void *)v213;
      if (objc_msgSend(v69, "count") != 1)
      {
        v82 = 0;
        do
        {
          v83 = (void *)MEMORY[0x1DF0DB988]();
          objc_msgSend(v69, "objectAtIndexedSubscript:", v82);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "objectAtIndexedSubscript:", v82 + 1);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v84, "intersectsDateInterval:", v85))
          {
            objc_msgSend(v84, "startDate");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "startDate");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "earlierDate:", v87);
            v88 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v84, "endDate");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "endDate");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "laterDate:", v90);
            v91 = (void *)objc_claimAutoreleasedReturnValue();

            v69 = v222;
            v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v88, v91);
            objc_msgSend(v222, "setObject:atIndexedSubscript:", v92, v82);
            objc_msgSend(v222, "removeObjectAtIndex:", v82 + 1);

          }
          else
          {
            ++v82;
          }

          objc_autoreleasePoolPop(v83);
        }
        while (v82 < objc_msgSend(v69, "count") - 1);
        v4 = v184;
        v23 = v185;
        v70 = v204;
        v62 = (void *)v213;
        goto LABEL_41;
      }
      v4 = v184;
      v23 = v185;
    }
    else
    {
      v4 = v184;
      v23 = v185;
      v62 = (void *)v213;
    }
    v70 = v204;
LABEL_41:
    v93 = (void *)objc_msgSend(v69, "copy");

    if (objc_msgSend(v93, "count"))
    {
      v94 = objc_alloc_init(MEMORY[0x1E0CB3590]);
      -[NSObject setTimeStyle:](v94, "setTimeStyle:", 3);
      -[NSObject setDateStyle:](v94, "setDateStyle:", 1);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        ARPCollectAndSendAnalyticsEvents_cold_3(v93, v94, v31);
      v186 = v94;

      objc_msgSend(MEMORY[0x1E0D15AF8], "nowPlayingStream");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v245[0] = v95;
      objc_msgSend(MEMORY[0x1E0D15AF8], "appUsageStream");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v245[1] = v96;
      objc_msgSend(MEMORY[0x1E0D15AF8], "microLocationVisitStream");
      v182 = v93;
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v245[2] = v97;
      objc_msgSend(MEMORY[0x1E0D15AF8], "airplayPredictionStream");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v245[3] = v98;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v245, 4);
      v181 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D15AD0], "startDateSortDescriptorAscending:", 1);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = (void *)MEMORY[0x1E0D15AD0];
      objc_msgSend(MEMORY[0x1E0D15AF8], "appUsageStream");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "name");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "predicateForEventsWithStreamName:", v101);
      v102 = objc_claimAutoreleasedReturnValue();

      v103 = (void *)MEMORY[0x1E0D15AD0];
      objc_msgSend(MEMORY[0x1E0D15AF8], "nowPlayingStream");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "name");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "predicateForEventsWithStreamName:", v105);
      v106 = objc_claimAutoreleasedReturnValue();

      v107 = (void *)MEMORY[0x1E0D15AD0];
      objc_msgSend(MEMORY[0x1E0D15AA0], "playing");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "predicateForObjectsWithMetadataKey:andIntegerValue:", v108, 1);
      v109 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithMinimumDuration:", 30.0);
      v110 = objc_claimAutoreleasedReturnValue();
      v111 = (void *)MEMORY[0x1E0CB3528];
      v177 = (void *)v109;
      v178 = (void *)v106;
      v244[0] = v106;
      v176 = (void *)v110;
      v244[1] = v110;
      v244[2] = v109;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v244, 3);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "andPredicateWithSubpredicates:", v112);
      v113 = objc_claimAutoreleasedReturnValue();

      v114 = (void *)MEMORY[0x1E0CB3528];
      v179 = (void *)v102;
      v243[0] = v102;
      v175 = (void *)v113;
      v243[1] = v113;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v243, 2);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "orPredicateWithSubpredicates:", v115);
      v116 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithStringValueInValues:", v185);
      v117 = objc_claimAutoreleasedReturnValue();
      v118 = (void *)MEMORY[0x1E0CB3528];
      v173 = (void *)v117;
      v174 = (void *)v116;
      v242[0] = v116;
      v242[1] = v117;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v242, 2);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "andPredicateWithSubpredicates:", v119);
      v120 = objc_claimAutoreleasedReturnValue();

      v121 = (void *)MEMORY[0x1E0D15AD0];
      objc_msgSend(MEMORY[0x1E0D15AF8], "microLocationVisitStream");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "name");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "predicateForEventsWithStreamName:", v123);
      v124 = objc_claimAutoreleasedReturnValue();

      v125 = (void *)MEMORY[0x1E0D15AD0];
      objc_msgSend(MEMORY[0x1E0D15AF8], "airplayPredictionStream");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "name");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "predicateForEventsWithStreamName:", v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      v129 = (void *)MEMORY[0x1E0CB3528];
      v171 = (void *)v124;
      v241[0] = v124;
      v241[1] = v128;
      v172 = (void *)v120;
      v241[2] = v120;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v241, 3);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "orPredicateWithSubpredicates:", v130);
      v192 = (void *)objc_claimAutoreleasedReturnValue();

      v131 = (void *)MEMORY[0x1E0D15A08];
      v240 = v180;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v240, 1);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", 0, v181, 0, 512, v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARPFeedback.m");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "stringByAppendingFormat:", CFSTR(":%d"), 476);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "setClientName:", v135);

      objc_msgSend(v133, "setTracker:", &__block_literal_global_166);
      v230 = 0u;
      v231 = 0u;
      v228 = 0u;
      v229 = 0u;
      v187 = v182;
      v195 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v228, v239, 16);
      if (v195)
      {
        objb = 0;
        v189 = *(_QWORD *)v229;
        do
        {
          v136 = 0;
          do
          {
            if (*(_QWORD *)v229 != v189)
              objc_enumerationMutation(v187);
            v209 = v136;
            v137 = *(void **)(*((_QWORD *)&v228 + 1) + 8 * v136);
            contexta = (void *)MEMORY[0x1DF0DB988]();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              -[NSObject stringFromDateInterval:](v186, "stringFromDateInterval:", v137);
              v170 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(state.opaque[0]) = 138412290;
              *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v170;
              _os_log_debug_impl(&dword_1DD793000, v31, OS_LOG_TYPE_DEBUG, "Collecting analytics events in interval %@", (uint8_t *)&state, 0xCu);

            }
            v138 = (void *)MEMORY[0x1E0D15AD0];
            objc_msgSend(v137, "startDate");
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v137, "endDate");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v138, "predicateForEventsWithStartAndEndInDateRangeFrom:to:", v139, v140);
            v141 = objc_claimAutoreleasedReturnValue();

            v142 = (void *)MEMORY[0x1E0CB3528];
            v205 = (void *)v141;
            v238[0] = v141;
            v238[1] = v192;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v238, 2);
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v142, "andPredicateWithSubpredicates:", v143);
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v133, "setPredicate:", v144);

            v227 = 0;
            objc_msgSend(v193, "executeQuery:error:", v133, &v227);
            v217 = (void *)objc_claimAutoreleasedReturnValue();
            v203 = v227;
            v145 = (void *)MEMORY[0x1E0CB3880];
            objc_msgSend(MEMORY[0x1E0D15AF8], "appUsageStream");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "name");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v145, "predicateWithFormat:", CFSTR("stream.name == %@"), v147);
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v217, "filteredArrayUsingPredicate:", v148);
            v214 = (void *)objc_claimAutoreleasedReturnValue();

            v149 = (void *)MEMORY[0x1E0CB3880];
            objc_msgSend(MEMORY[0x1E0D15AF8], "nowPlayingStream");
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v150, "name");
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "predicateWithFormat:", CFSTR("stream.name == %@"), v151);
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v217, "filteredArrayUsingPredicate:", v152);
            v211 = (void *)objc_claimAutoreleasedReturnValue();

            v153 = (void *)MEMORY[0x1E0CB3880];
            objc_msgSend(MEMORY[0x1E0D15AF8], "microLocationVisitStream");
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v154, "name");
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v153, "predicateWithFormat:", CFSTR("stream.name == %@"), v155);
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v217, "filteredArrayUsingPredicate:", v156);
            v157 = objc_claimAutoreleasedReturnValue();

            v158 = (void *)MEMORY[0x1E0CB3880];
            objc_msgSend(MEMORY[0x1E0D15AF8], "airplayPredictionStream");
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v159, "name");
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v158, "predicateWithFormat:", CFSTR("stream.name == %@"), v160);
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v217, "filteredArrayUsingPredicate:", v161);
            v162 = objc_claimAutoreleasedReturnValue();

            v199 = (void *)v162;
            v201 = (void *)v157;
            +[ARPAnalyticsEvent feedbackEventsFromAppUsageEvents:playingEvents:microLocationEvents:feedbackEvents:](ARPAnalyticsEvent, "feedbackEventsFromAppUsageEvents:playingEvents:microLocationEvents:feedbackEvents:", v214, v211, v157, v162);
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            v223 = 0u;
            v224 = 0u;
            v225 = 0u;
            v226 = 0u;
            v197 = v163;
            objc_msgSend(v163, "valueForKey:", CFSTR("analyticsDictionary"));
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            v165 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v223, v237, 16);
            if (v165)
            {
              v166 = v165;
              v167 = *(_QWORD *)v224;
              do
              {
                for (k = 0; k != v166; ++k)
                {
                  if (*(_QWORD *)v224 != v167)
                    objc_enumerationMutation(v164);
                  v169 = *(_QWORD *)(*((_QWORD *)&v223 + 1) + 8 * k);
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                  {
                    LODWORD(state.opaque[0]) = 138412290;
                    *(uint64_t *)((char *)state.opaque + 4) = v169;
                    _os_log_impl(&dword_1DD793000, v31, OS_LOG_TYPE_INFO, "Sending analytics event: %@", (uint8_t *)&state, 0xCu);
                  }

                  AnalyticsSendEvent();
                }
                objb += v166;
                v166 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v223, v237, 16);
              }
              while (v166);
            }

            objc_autoreleasePoolPop(contexta);
            v136 = v209 + 1;
          }
          while (v209 + 1 != v195);
          v195 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v228, v239, 16);
        }
        while (v195);
      }
      else
      {
        objb = 0;
      }

      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        ARPCollectAndSendAnalyticsEvents_cold_2((uint64_t)objb, v31);

      v4 = v184;
      v23 = v185;
      v93 = v182;
      v31 = v186;
    }
    else if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      ARPCollectAndSendAnalyticsEvents_cold_1(v31);
    }

    v3 = v183;
    goto LABEL_70;
  }
  ARPFeedbackLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_log_impl(&dword_1DD793000, v23, OS_LOG_TYPE_INFO, "Skipping analytics event collection because event is not used", (uint8_t *)&state, 2u);
  }
LABEL_70:

}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t BiomeStreamsLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = BiomeStreamsLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

objc_class *getBMHomeKitClientAccessoryControlEventClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getBMHomeKitClientAccessoryControlEventClass_softClass;
  v6 = getBMHomeKitClientAccessoryControlEventClass_softClass;
  if (!getBMHomeKitClientAccessoryControlEventClass_softClass)
  {
    BiomeStreamsLibraryCore();
    Class = objc_getClass("BMHomeKitClientAccessoryControlEvent");
    v4[3] = (uint64_t)Class;
    getBMHomeKitClientAccessoryControlEventClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1DD7A4834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getBMHomeKitClientActionSetEventClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getBMHomeKitClientActionSetEventClass_softClass;
  v6 = getBMHomeKitClientActionSetEventClass_softClass;
  if (!getBMHomeKitClientActionSetEventClass_softClass)
  {
    BiomeStreamsLibraryCore();
    Class = objc_getClass("BMHomeKitClientActionSetEvent");
    v4[3] = (uint64_t)Class;
    getBMHomeKitClientActionSetEventClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1DD7A48C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getBMHomeKitClientMediaAccessoryControlEventClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getBMHomeKitClientMediaAccessoryControlEventClass_softClass;
  v6 = getBMHomeKitClientMediaAccessoryControlEventClass_softClass;
  if (!getBMHomeKitClientMediaAccessoryControlEventClass_softClass)
  {
    BiomeStreamsLibraryCore();
    Class = objc_getClass("BMHomeKitClientMediaAccessoryControlEvent");
    v4[3] = (uint64_t)Class;
    getBMHomeKitClientMediaAccessoryControlEventClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1DD7A495C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

objc_class *getBMDKEventStreamClass()
{
  Class Class;
  objc_class *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  Class = (Class)getBMDKEventStreamClass_softClass;
  v6 = getBMDKEventStreamClass_softClass;
  if (!getBMDKEventStreamClass_softClass)
  {
    BiomeStreamsLibraryCore();
    Class = objc_getClass("BMDKEventStream");
    v4[3] = (uint64_t)Class;
    getBMDKEventStreamClass_softClass = (uint64_t)Class;
  }
  v1 = Class;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1DD7A49F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t MediaExperienceLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = MediaExperienceLibraryCore_frameworkLibrary;
  v6 = MediaExperienceLibraryCore_frameworkLibrary;
  if (!MediaExperienceLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1EA7D49E0;
    v8 = *(_OWORD *)&off_1EA7D49F0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    MediaExperienceLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1DD7A4AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t MediaExperienceLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = MediaExperienceLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void ARPCollectAndSendAnalyticsEvents_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD793000, log, OS_LOG_TYPE_DEBUG, "No intervals for potential airplay route prediction analytics events", v1, 2u);
}

void ARPCollectAndSendAnalyticsEvents_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_1DD793000, a2, v4, "Finished sending %@ analytics events", v5);

}

void ARPCollectAndSendAnalyticsEvents_cold_3(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "stringFromDate:toDate:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 138412546;
  v13 = v6;
  v14 = 2112;
  v15 = v11;
  _os_log_debug_impl(&dword_1DD793000, a3, OS_LOG_TYPE_DEBUG, "Collecting analytics events from %@ date intervals spanning %@", (uint8_t *)&v12, 0x16u);

}

void ARPCollectAndSendAnalyticsEvents_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD793000, v0, v1, "Error fetching long form video date intervals from knowledge store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ARPCollectAndSendAnalyticsEvents_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_1DD793000, v0, v1, "Collecting analytics events from long form video bundleIDs: %@", v2);
  OUTLINED_FUNCTION_1();
}

void getHMServiceTypeMicrophone_cold_1()
{
  dlerror();
  abort_report_np();
  AnalyticsIsEventUsed();
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x1E0D15408]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1E0C837A8](*(_QWORD *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1E0C85790](*(_QWORD *)&a1);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x1E0C85DB0](activity, criteria);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

