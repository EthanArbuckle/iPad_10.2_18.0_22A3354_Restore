@implementation CLSimulationManager

- (CLSimulationManager)init
{
  CLSimulationManager *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSimulationManager;
  result = -[CLSimulationManager init](&v8, sel_init);
  if (result)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->_locationDistance = _Q0;
    result->_locationSpeed = -1.0;
    *(_WORD *)&result->_locationRepeatBehavior = 0;
  }
  return result;
}

- (id)scenariosPath
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  std::string __p;

  v2 = (void *)MEMORY[0x1E0CB3940];
  sub_18F688544(&__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v5 = (void *)objc_msgSend_stringWithUTF8String_(v2, v3, (uint64_t)&__p, v4);
  else
    v5 = (void *)objc_msgSend_stringWithUTF8String_(v2, v3, (uint64_t)__p.__r_.__value_.__l.__data_, v4);
  v8 = (void *)objc_msgSend_stringByAppendingPathComponent_(v5, v6, (uint64_t)CFSTR("SimulationScenarios"), v7);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v8;
}

- (id)availableScenarios
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], a2, v2, v3);
  v9 = objc_msgSend_scenariosPath(self, v6, v7, v8);
  v11 = objc_msgSend_contentsOfDirectoryAtPath_error_(v5, v10, v9, 0);
  if (v11)
  {
    v15 = (void *)v11;
    v16 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], v12, v13, v14);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v29, (uint64_t)v33, 16);
    if (v18)
    {
      v22 = v18;
      v23 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v15);
          v25 = objc_msgSend_stringByDeletingPathExtension(*(void **)(*((_QWORD *)&v29 + 1) + 8 * i), v19, v20, v21);
          objc_msgSend_addObject_(v16, v26, v25, v27);
        }
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v19, (uint64_t)&v29, (uint64_t)v33, 16);
      }
      while (v22);
    }
  }
  else
  {
    NSLog(CFSTR("Couldn't get list of location simulation scenarios"));
    return 0;
  }
  return v16;
}

- (id)localizedNameForScenario:(id)a3
{
  return a3;
}

- (void)selectScenario:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = (void *)objc_msgSend_scenariosPath(self, a2, (uint64_t)a3, v3);
  v9 = objc_msgSend_stringByAppendingPathExtension_(a3, v7, (uint64_t)CFSTR("plist"), v8);
  v12 = objc_msgSend_stringByAppendingPathComponent_(v6, v10, v9, v11);
  v15 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v13, v12, v14);
  MEMORY[0x1E0DE7D20](self, sel_loadScenarioFromURL_, v15, v16);
}

- (void)loadScenarioFromURL:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if ((objc_msgSend_isFileURL(a3, a2, (uint64_t)a3, v3) & 1) != 0)
  {
    v9 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v6, v7, v8);
    v13 = objc_msgSend_path(a3, v10, v11, v12);
    if ((objc_msgSend_fileExistsAtPath_(v9, v14, v13, v15) & 1) != 0)
    {
      v19 = (void *)objc_msgSend_pathExtension(a3, v16, v17, v18);
      if ((objc_msgSend_isEqualToString_(v19, v20, (uint64_t)CFSTR("plist"), v21) & 1) != 0)
      {
        v25 = objc_msgSend_daemonProxy(self, v22, v23, v24);
        MEMORY[0x1E0DE7D20](v25, sel_setSimulationScenario_, a3, v26);
      }
      else
      {
        NSLog(CFSTR("Selected location simulation scenario is not a property list"));
      }
    }
    else
    {
      NSLog(CFSTR("Selected location simulation scenario does not exist"));
    }
  }
  else
  {
    NSLog(CFSTR("Selected location simulation scenario is not a file URL"));
  }
}

- (void)setLocationDeliveryBehavior:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  self->_locationDeliveryBehavior = a3;
  v5 = objc_msgSend_daemonProxy(self, a2, a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_setLocationDeliveryBehavior_, v4, v6);
}

- (void)setLocationDistance:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  self->_locationDistance = a3;
  v5 = objc_msgSend_daemonProxy(self, a2, v3, v4);
  MEMORY[0x1E0DE7D20](v5, sel_setIntermediateLocationDistance_, v6, v7);
}

- (void)setLocationInterval:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  self->_locationInterval = a3;
  v5 = objc_msgSend_daemonProxy(self, a2, v3, v4);
  MEMORY[0x1E0DE7D20](v5, sel_setLocationInterval_, v6, v7);
}

- (void)setLocationSpeed:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  self->_locationSpeed = a3;
  v5 = objc_msgSend_daemonProxy(self, a2, v3, v4);
  MEMORY[0x1E0DE7D20](v5, sel_setLocationTravellingSpeed_, v6, v7);
}

- (void)setLocationRepeatBehavior:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  self->_locationRepeatBehavior = a3;
  v5 = objc_msgSend_daemonProxy(self, a2, a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_setLocationRepeatBehavior_, v4, v6);
}

- (void)clearSimulatedLocations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_daemonProxy(self, a2, v2, v3);
  MEMORY[0x1E0DE7D20](v4, sel_clearSimulatedLocations, v5, v6);
}

- (void)appendSimulatedLocation:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CLLocation *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  _OWORD v21[8];
  _OWORD v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];
  __int128 v28;
  __int128 v29;
  _OWORD v30[2];

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = 0u;
      memset(v30, 0, 28);
      v28 = 0u;
      v26 = 0u;
      memset(v27, 0, sizeof(v27));
      v24 = 0u;
      v25 = 0u;
      v23 = 0u;
      objc_msgSend_clientLocation(a3, v5, v6, v7);
      LODWORD(v28) = 1;
      if (*(double *)((char *)v27 + 12) <= 0.0)
        *(_QWORD *)((char *)v27 + 12) = CFAbsoluteTimeGetCurrent();
      if (*((double *)&v27[1] + 1) == 0.0)
        *((_QWORD *)&v27[1] + 1) = 0xBFF0000000000000;
      if (*(double *)((char *)&v24 + 4) == 0.0)
        *(_QWORD *)((char *)&v24 + 4) = 0x4014000000000000;
      v8 = [CLLocation alloc];
      v21[6] = v28;
      v21[7] = v29;
      v22[0] = v30[0];
      *(_OWORD *)((char *)v22 + 12) = *(_OWORD *)((char *)v30 + 12);
      v21[2] = v25;
      v21[3] = v26;
      v21[4] = v27[0];
      v21[5] = v27[1];
      v21[0] = v23;
      v21[1] = v24;
      v11 = (id)objc_msgSend_initWithClientLocation_(v8, v9, (uint64_t)v21, v10);
      v15 = (void *)objc_msgSend_daemonProxy(self, v12, v13, v14);
      v18 = objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], v16, (uint64_t)v11, v17);
      objc_msgSend_appendSimulatedLocations_(v15, v19, v18, v20);
    }
    else
    {
      NSLog(CFSTR("CLSimulation: Object passed to appendSimulatedLocation is not a CLLocation!"));
    }
  }
}

- (void)startLocationSimulation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_daemonProxy(self, a2, v2, v3);
  MEMORY[0x1E0DE7D20](v4, sel_startLocationSimulation, v5, v6);
}

- (void)stopLocationSimulation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_daemonProxy(self, a2, v2, v3);
  MEMORY[0x1E0DE7D20](v4, sel_stopLocationSimulation, v5, v6);
}

- (void)simulateVisit:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend_daemonProxy(self, a2, (uint64_t)a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_simulateVisit_, a3, v6);
}

- (void)simulateSignificantLocationChange:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend_daemonProxy(self, a2, (uint64_t)a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_simulateSignificantLocationChange_, a3, v6);
}

- (void)getFencesForBundleID:(id)a3 withHandler:(id)a4
{
  uint64_t v6;

  v6 = objc_msgSend_daemonProxy(self, a2, (uint64_t)a3, (uint64_t)a4);
  MEMORY[0x1E0DE7D20](v6, sel_getFencesForBundleID_withReply_, a3, a4);
}

- (void)simulateFenceWithBundleID:(id)a3 andFenceID:(id)a4 eventType:(unsigned __int8)a5 atLocation:(id)a6
{
  uint64_t v8;

  v8 = objc_msgSend_daemonProxy(self, a2, (uint64_t)a3, (uint64_t)a4);
  MEMORY[0x1E0DE7D20](v8, sel_simulateFenceWithBundleID_andFenceID_eventType_atLocation_, a3, a4);
}

- (void)simulateBeaconWithProximityUUID:(id)a3 major:(int64_t)a4 minor:(int64_t)a5 eventType:(unsigned __int8)a6
{
  uint64_t v8;

  v8 = objc_msgSend_daemonProxy(self, a2, (uint64_t)a3, a4);
  MEMORY[0x1E0DE7D20](v8, sel_simulateBeaconWithProximityUUID_major_minor_eventType_, a3, a4);
}

- (void)clearSimulatedCells
{
  NSObject *v2;
  char *v3;
  uint8_t buf[1640];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
  v2 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v2, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
    v3 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLSimulationManager clearSimulatedCells]", "CoreLocation: %s\n", v3);
    if (v3 != (char *)buf)
      free(v3);
  }
}

- (void)setSimulatedCell:(id)a3
{
  NSObject *v3;
  char *v4;
  uint8_t buf[1640];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
  v3 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLSimulationManager setSimulatedCell:]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf)
      free(v4);
  }
}

- (void)startCellSimulation
{
  NSObject *v2;
  char *v3;
  uint8_t buf[1640];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
  v2 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v2, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
    v3 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLSimulationManager startCellSimulation]", "CoreLocation: %s\n", v3);
    if (v3 != (char *)buf)
      free(v3);
  }
}

- (void)stopCellSimulation
{
  NSObject *v2;
  char *v3;
  uint8_t buf[1640];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
  v2 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v2, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
    v3 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLSimulationManager stopCellSimulation]", "CoreLocation: %s\n", v3);
    if (v3 != (char *)buf)
      free(v3);
  }
}

- (void)setSimulatedCellRegistrationStatus:(BOOL)a3
{
  NSObject *v3;
  char *v4;
  uint8_t buf[1640];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
  v3 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLSimulationManager setSimulatedCellRegistrationStatus:]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf)
      free(v4);
  }
}

- (void)setWifiScanResults:(id)a3
{
  NSObject *v3;
  char *v4;
  uint8_t buf[1640];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
  v3 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLSimulationManager setWifiScanResults:]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf)
      free(v4);
  }
}

- (void)startWifiSimulation
{
  NSObject *v2;
  char *v3;
  uint8_t buf[1640];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
  v2 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v2, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
    v3 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLSimulationManager startWifiSimulation]", "CoreLocation: %s\n", v3);
    if (v3 != (char *)buf)
      free(v3);
  }
}

- (void)stopWifiSimulation
{
  NSObject *v2;
  char *v3;
  uint8_t buf[1640];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
  v2 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v2, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
    v3 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLSimulationManager stopWifiSimulation]", "CoreLocation: %s\n", v3);
    if (v3 != (char *)buf)
      free(v3);
  }
}

- (void)setSimulatedWifiPower:(BOOL)a3
{
  NSObject *v3;
  char *v4;
  uint8_t buf[1640];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
  v3 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLSimulationManager setSimulatedWifiPower:]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf)
      free(v4);
  }
}

- (void)flush
{
  NSObject *v2;
  char *v3;
  uint8_t buf[1640];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
  v2 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v2, OS_LOG_TYPE_ERROR, "this SPI is obsolete and will be removed in the future", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2992140);
    v3 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLSimulationManager flush]", "CoreLocation: %s\n", v3);
    if (v3 != (char *)buf)
      free(v3);
  }
}

- (CLSimulationXPCServerInterface)daemonProxy
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  CLSimulationXPCServerInterface *v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v54[5];
  uint8_t buf[8];
  _BYTE v56[32];
  CLSimulationManager *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B0 != -1)
    dispatch_once(&qword_1EE1720B0, &unk_1E298D930);
  v3 = qword_1EE172090;
  if (os_log_type_enabled((os_log_t)qword_1EE172090, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v56 = 2082;
    *(_QWORD *)&v56[2] = "";
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"getDaemonProxy called\"}", buf, 0x12u);
  }
  if (!objc_msgSend_connection(self, v4, v5, v6))
  {
    if (qword_1EE1720B0 != -1)
      dispatch_once(&qword_1EE1720B0, &unk_1E298D930);
    v10 = qword_1EE172090;
    if (os_log_type_enabled((os_log_t)qword_1EE172090, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v56 = 2082;
      *(_QWORD *)&v56[2] = "";
      _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"no existing connection, trying to get one\"}", buf, 0x12u);
    }
    v11 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v13 = (id)objc_msgSend_initWithMachServiceName_options_(v11, v12, (uint64_t)CFSTR("com.apple.locationd.simulation"), 4096);
    objc_msgSend_setConnection_(self, v14, (uint64_t)v13, v15);
    v19 = (void *)objc_msgSend_connection(self, v16, v17, v18);
    v22 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v20, (uint64_t)&unk_1EE1900C8, v21);
    objc_msgSend_setRemoteObjectInterface_(v19, v23, v22, v24);
    v28 = (void *)objc_msgSend_connection(self, v25, v26, v27);
    objc_msgSend_setInterruptionHandler_(v28, v29, (uint64_t)&unk_1E29907D0, v30);
    *(_QWORD *)buf = 0;
    *(_QWORD *)v56 = buf;
    *(_QWORD *)&v56[8] = 0x3052000000;
    *(_QWORD *)&v56[16] = sub_18F5CD81C;
    *(_QWORD *)&v56[24] = sub_18F5CD798;
    v57 = self;
    v34 = (void *)objc_msgSend_connection(self, v31, v32, v33);
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = sub_18F6B5710;
    v54[3] = &unk_1E2990FD8;
    v54[4] = buf;
    objc_msgSend_setInvalidationHandler_(v34, v35, (uint64_t)v54, v36);
    v40 = (void *)objc_msgSend_connection(self, v37, v38, v39);
    objc_msgSend_resume(v40, v41, v42, v43);
    _Block_object_dispose(buf, 8);
  }
  v44 = (void *)objc_msgSend_connection(self, v7, v8, v9);
  v47 = (CLSimulationXPCServerInterface *)objc_msgSend_remoteObjectProxyWithErrorHandler_(v44, v45, (uint64_t)&unk_1E2992120, v46);
  if (qword_1EE1720B0 != -1)
    dispatch_once(&qword_1EE1720B0, &unk_1E298D930);
  v48 = qword_1EE172090;
  if (os_log_type_enabled((os_log_t)qword_1EE172090, OS_LOG_TYPE_DEFAULT))
  {
    v52 = objc_msgSend_connection(self, v49, v50, v51);
    *(_DWORD *)buf = 68289538;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v56 = 2082;
    *(_QWORD *)&v56[2] = "";
    *(_WORD *)&v56[10] = 2114;
    *(_QWORD *)&v56[12] = v47;
    *(_WORD *)&v56[20] = 2114;
    *(_QWORD *)&v56[22] = v52;
    _os_log_impl(&dword_18F5B3000, v48, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Do we have a proxy?\", \"proxy\":%{public, location:escape_only}@, \"connection\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  return v47;
}

- (unsigned)locationDeliveryBehavior
{
  return self->_locationDeliveryBehavior;
}

- (double)locationDistance
{
  return self->_locationDistance;
}

- (double)locationInterval
{
  return self->_locationInterval;
}

- (double)locationSpeed
{
  return self->_locationSpeed;
}

- (unsigned)locationRepeatBehavior
{
  return self->_locationRepeatBehavior;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
