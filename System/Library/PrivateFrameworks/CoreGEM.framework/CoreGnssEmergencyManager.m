@implementation CoreGnssEmergencyManager

- (id)initForComm:(id)a3 sendIndicationToRemoteCallback:(id)a4 dispatch_queue_t:(id)a5 GemDeviceType:(int)a6
{
  CoreGnssEmergencyManager *v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  objc_super v14;
  id v15;
  uint8_t buf[4];
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)CoreGnssEmergencyManager;
  v15 = a5;
  v9 = -[CoreGnssEmergencyManager init](&v14, sel_init);
  if (!qword_2542CF618)
    qword_2542CF618 = (uint64_t)os_log_create("com.apple.gpsd", "general");
  if (!qword_2542CF628)
    qword_2542CF628 = (uint64_t)os_log_create("com.apple.gpsd", "Warning");
  if (!qword_2542CF608)
    qword_2542CF608 = (uint64_t)os_log_create("com.apple.gpsd", "device");
  if (!qword_2542CF620)
    qword_2542CF620 = (uint64_t)os_log_create("com.apple.gpsd", "NMEA");
  if (!qword_2542CF610)
    qword_2542CF610 = (uint64_t)os_log_create("com.apple.gpsd", "gem");
  v10 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_2390FD000, v10, OS_LOG_TYPE_DEBUG, "Logging init, check if the level is enabled", buf, 2u);
    v10 = qword_2542CF618;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2390FD000, v10, OS_LOG_TYPE_INFO, "Logging init, check if the level is enabled", buf, 2u);
    v10 = qword_2542CF618;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2390FD000, v10, OS_LOG_TYPE_DEFAULT, "Logging init, check if the level is enabled", buf, 2u);
    v10 = qword_2542CF618;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = sub_2391853DC();
    *(_DWORD *)buf = 134217984;
    v17 = v11;
    _os_log_impl(&dword_2390FD000, v10, OS_LOG_TYPE_DEFAULT, "Record process start time, %.1f", buf, 0xCu);
  }
  v12 = operator new();
  sub_239101798(v12, a3, a4, (uint64_t *)&v15);
  qword_2542CF5E0 = v12;
  sub_239103918(v12, a6);
  return v9;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CoreGnssEmergencyManager;
  -[CoreGnssEmergencyManager dealloc](&v2, sel_dealloc);
}

- (void)handleDeviceIndication:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_2390FD000, v4, OS_LOG_TYPE_DEBUG, "#gem,#interface,handleDeviceIndication", v5, 2u);
  }
  sub_239102494(qword_2542CF5E0, a3);
}

- (void)handleRemoteRequest:(id)a3 machconttimens:(unint64_t)a4
{
  NSObject *v6;
  uint8_t v7[16];

  v6 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_2390FD000, v6, OS_LOG_TYPE_DEBUG, "#gem,#interface,handleRemoteRequest, calling GEM handleRemoteDataRequest", v7, 2u);
  }
  sub_239103048(qword_2542CF5E0, a3, a4);
}

@end
