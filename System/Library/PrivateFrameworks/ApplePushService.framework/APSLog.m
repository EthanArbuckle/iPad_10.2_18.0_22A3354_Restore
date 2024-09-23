@implementation APSLog

+ (OS_os_log)connection
{
  if (connection_onceToken != -1)
    dispatch_once(&connection_onceToken, &__block_literal_global_12);
  return (OS_os_log *)(id)connection___log;
}

+ (OS_os_log)PUSHTRACE
{
  if (PUSHTRACE_onceToken != -1)
    dispatch_once(&PUSHTRACE_onceToken, &__block_literal_global_42);
  return (OS_os_log *)(id)PUSHTRACE___log;
}

+ (OS_os_log)courier
{
  if (courier_onceToken != -1)
    dispatch_once(&courier_onceToken, &__block_literal_global_26);
  return (OS_os_log *)(id)courier___log;
}

+ (OS_os_log)telemetry
{
  if (telemetry_onceToken != -1)
    dispatch_once(&telemetry_onceToken, &__block_literal_global);
  return (OS_os_log *)(id)telemetry___log;
}

+ (OS_os_log)topicManager
{
  if (topicManager_onceToken != -1)
    dispatch_once(&topicManager_onceToken, &__block_literal_global_2);
  return (OS_os_log *)(id)topicManager___log;
}

+ (OS_os_log)connectionServer
{
  if (connectionServer_onceToken != -1)
    dispatch_once(&connectionServer_onceToken, &__block_literal_global_34);
  return (OS_os_log *)(id)connectionServer___log;
}

+ (OS_os_log)protocolParser
{
  if (protocolParser_onceToken != -1)
    dispatch_once(&protocolParser_onceToken, &__block_literal_global_50);
  return (OS_os_log *)(id)protocolParser___log;
}

+ (OS_os_log)courierOversized
{
  if (courierOversized_onceToken != -1)
    dispatch_once(&courierOversized_onceToken, &__block_literal_global_28);
  return (OS_os_log *)(id)courierOversized___log;
}

+ (OS_os_log)main
{
  if (main_onceToken != -1)
    dispatch_once(&main_onceToken, &__block_literal_global_32);
  return (OS_os_log *)(id)main___log;
}

+ (OS_os_log)daemon
{
  if (daemon_onceToken != -1)
    dispatch_once(&daemon_onceToken, &__block_literal_global_6);
  return (OS_os_log *)(id)daemon___log;
}

+ (OS_os_log)pushHistory
{
  if (pushHistory_onceToken != -1)
    dispatch_once(&pushHistory_onceToken, &__block_literal_global_8);
  return (OS_os_log *)(id)pushHistory___log;
}

+ (BOOL)shouldPowerLogEvent:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (shouldPowerLogEvent___pred_PLShouldLogRegisteredEventPowerLog != -1)
    dispatch_once(&shouldPowerLogEvent___pred_PLShouldLogRegisteredEventPowerLog, &__block_literal_global_56);
  if (shouldPowerLogEvent___PLShouldLogRegisteredEvent)
    v4 = shouldPowerLogEvent___PLShouldLogRegisteredEvent(2, v3);
  else
    v4 = 0;

  return v4;
}

void __20__APSLog_connection__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "connection");
  v1 = (void *)connection___log;
  connection___log = (uint64_t)v0;

}

void __19__APSLog_PUSHTRACE__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "PUSHTRACE");
  v1 = (void *)PUSHTRACE___log;
  PUSHTRACE___log = (uint64_t)v0;

}

void __19__APSLog_telemetry__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "telemetry");
  v1 = (void *)telemetry___log;
  telemetry___log = (uint64_t)v0;

}

void __22__APSLog_topicManager__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "topicManager");
  v1 = (void *)topicManager___log;
  topicManager___log = (uint64_t)v0;

}

+ (OS_os_log)topicManagerOversized
{
  if (topicManagerOversized_onceToken != -1)
    dispatch_once(&topicManagerOversized_onceToken, &__block_literal_global_4);
  return (OS_os_log *)(id)topicManagerOversized___log;
}

void __31__APSLog_topicManagerOversized__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "topicManager-oversized");
  v1 = (void *)topicManagerOversized___log;
  topicManagerOversized___log = (uint64_t)v0;

}

void __16__APSLog_daemon__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "daemon");
  v1 = (void *)daemon___log;
  daemon___log = (uint64_t)v0;

}

void __21__APSLog_pushHistory__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "pushHistory");
  v1 = (void *)pushHistory___log;
  pushHistory___log = (uint64_t)v0;

}

+ (OS_os_log)database
{
  if (database_onceToken != -1)
    dispatch_once(&database_onceToken, &__block_literal_global_10);
  return (OS_os_log *)(id)database___log;
}

void __18__APSLog_database__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "database");
  v1 = (void *)database___log;
  database___log = (uint64_t)v0;

}

+ (OS_os_log)xpc
{
  if (xpc_onceToken != -1)
    dispatch_once(&xpc_onceToken, &__block_literal_global_14);
  return (OS_os_log *)(id)xpc___log;
}

void __13__APSLog_xpc__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "xpc");
  v1 = (void *)xpc___log;
  xpc___log = (uint64_t)v0;

}

+ (OS_os_log)certificate
{
  if (certificate_onceToken != -1)
    dispatch_once(&certificate_onceToken, &__block_literal_global_16);
  return (OS_os_log *)(id)certificate___log;
}

void __21__APSLog_certificate__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "certificate");
  v1 = (void *)certificate___log;
  certificate___log = (uint64_t)v0;

}

+ (OS_os_log)networking
{
  if (networking_onceToken != -1)
    dispatch_once(&networking_onceToken, &__block_literal_global_18);
  return (OS_os_log *)(id)networking___log;
}

void __20__APSLog_networking__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "networking");
  v1 = (void *)networking___log;
  networking___log = (uint64_t)v0;

}

+ (OS_os_log)nonce
{
  if (nonce_onceToken != -1)
    dispatch_once(&nonce_onceToken, &__block_literal_global_20);
  return (OS_os_log *)(id)nonce___log;
}

void __15__APSLog_nonce__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "nonce");
  v1 = (void *)nonce___log;
  nonce___log = (uint64_t)v0;

}

+ (OS_os_log)alert
{
  if (alert_onceToken != -1)
    dispatch_once(&alert_onceToken, &__block_literal_global_22);
  return (OS_os_log *)(id)alert___log;
}

void __15__APSLog_alert__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "alert");
  v1 = (void *)alert___log;
  alert___log = (uint64_t)v0;

}

+ (OS_os_log)stream
{
  if (stream_onceToken != -1)
    dispatch_once(&stream_onceToken, &__block_literal_global_24);
  return (OS_os_log *)(id)stream___log;
}

void __16__APSLog_stream__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "stream");
  v1 = (void *)stream___log;
  stream___log = (uint64_t)v0;

}

void __17__APSLog_courier__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "courier");
  v1 = (void *)courier___log;
  courier___log = (uint64_t)v0;

}

void __26__APSLog_courierOversized__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "courier-oversized");
  v1 = (void *)courierOversized___log;
  courierOversized___log = (uint64_t)v0;

}

+ (OS_os_log)preference
{
  if (preference_onceToken != -1)
    dispatch_once(&preference_onceToken, &__block_literal_global_30);
  return (OS_os_log *)(id)preference___log;
}

void __20__APSLog_preference__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "preference");
  v1 = (void *)preference___log;
  preference___log = (uint64_t)v0;

}

void __14__APSLog_main__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "main");
  v1 = (void *)main___log;
  main___log = (uint64_t)v0;

}

void __26__APSLog_connectionServer__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "connectionServer");
  v1 = (void *)connectionServer___log;
  connectionServer___log = (uint64_t)v0;

}

+ (OS_os_log)taskManager
{
  if (taskManager_onceToken != -1)
    dispatch_once(&taskManager_onceToken, &__block_literal_global_36);
  return (OS_os_log *)(id)taskManager___log;
}

void __21__APSLog_taskManager__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "taskManager");
  v1 = (void *)taskManager___log;
  taskManager___log = (uint64_t)v0;

}

+ (OS_os_log)ttlCollection
{
  if (ttlCollection_onceToken != -1)
    dispatch_once(&ttlCollection_onceToken, &__block_literal_global_38);
  return (OS_os_log *)(id)ttlCollection___log;
}

void __23__APSLog_ttlCollection__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "ttlCollection");
  v1 = (void *)ttlCollection___log;
  ttlCollection___log = (uint64_t)v0;

}

+ (OS_os_log)pubSub
{
  if (pubSub_onceToken != -1)
    dispatch_once(&pubSub_onceToken, &__block_literal_global_40);
  return (OS_os_log *)(id)pubSub___log;
}

void __16__APSLog_pubSub__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "pubSub");
  v1 = (void *)pubSub___log;
  pubSub___log = (uint64_t)v0;

}

+ (OS_os_log)simulator
{
  if (simulator_onceToken != -1)
    dispatch_once(&simulator_onceToken, &__block_literal_global_44);
  return (OS_os_log *)(id)simulator___log;
}

void __19__APSLog_simulator__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "simulator");
  v1 = (void *)simulator___log;
  simulator___log = (uint64_t)v0;

}

+ (OS_os_log)activityTracking
{
  if (activityTracking_onceToken != -1)
    dispatch_once(&activityTracking_onceToken, &__block_literal_global_46);
  return (OS_os_log *)(id)activityTracking___log;
}

void __26__APSLog_activityTracking__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "activityTracking");
  v1 = (void *)activityTracking___log;
  activityTracking___log = (uint64_t)v0;

}

+ (OS_os_log)proxy
{
  if (proxy_onceToken != -1)
    dispatch_once(&proxy_onceToken, &__block_literal_global_48);
  return (OS_os_log *)(id)proxy___log;
}

void __15__APSLog_proxy__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "proxy");
  v1 = (void *)proxy___log;
  proxy___log = (uint64_t)v0;

}

void __24__APSLog_protocolParser__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "protocolParser");
  v1 = (void *)protocolParser___log;
  protocolParser___log = (uint64_t)v0;

}

+ (OS_os_log)protocolParserDetailed
{
  if (protocolParserDetailed_onceToken != -1)
    dispatch_once(&protocolParserDetailed_onceToken, &__block_literal_global_52);
  return (OS_os_log *)(id)protocolParserDetailed___log;
}

void __32__APSLog_protocolParserDetailed__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "protocolParserDetail");
  v1 = (void *)protocolParserDetailed___log;
  protocolParserDetailed___log = (uint64_t)v0;

}

+ (OS_os_log)power
{
  if (power_onceToken != -1)
    dispatch_once(&power_onceToken, &__block_literal_global_54);
  return (OS_os_log *)(id)power___log;
}

void __15__APSLog_power__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apsd", "power");
  v1 = (void *)power___log;
  power___log = (uint64_t)v0;

}

uint64_t (*__30__APSLog_shouldPowerLogEvent___block_invoke())(_QWORD, _QWORD)
{
  uint64_t (*result)(_QWORD, _QWORD);

  result = (uint64_t (*)(_QWORD, _QWORD))CUTWeakLinkSymbol();
  shouldPowerLogEvent___PLShouldLogRegisteredEvent = result;
  return result;
}

@end
