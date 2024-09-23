@implementation CRKConcreteNetworkPrimitives

- (id)wifiNetworkPathMonitor
{
  return (id)objc_msgSend((id)objc_opt_class(), "makePathMonitorForInterfaceType:", 1);
}

- (id)ethernetNetworkPathMonitor
{
  return (id)objc_msgSend((id)objc_opt_class(), "makePathMonitorForInterfaceType:", 3);
}

+ (id)makePathMonitorForInterfaceType:(int)a3
{
  nw_path_monitor_t v3;
  CRKConcreteNetworkPathMonitor *v4;

  v3 = nw_path_monitor_create_with_type((nw_interface_type_t)a3);
  if (v3)
    v4 = -[CRKConcreteNetworkPathMonitor initWithUnderlyingPathMonitor:]([CRKConcreteNetworkPathMonitor alloc], "initWithUnderlyingPathMonitor:", v3);
  else
    v4 = 0;

  return v4;
}

@end
