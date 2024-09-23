@implementation SSHBHIDDeviceManager

- (SSHBHIDDeviceManager)init
{
  SSHBHIDDeviceManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *usageSubscribers;
  NSMutableDictionary *v5;
  NSMutableDictionary *usageDeviceMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *deviceUsageMap;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSHBHIDDeviceManager;
  v2 = -[SSHBHIDDeviceManager init](&v10, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    usageSubscribers = v2->_usageSubscribers;
    v2->_usageSubscribers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    usageDeviceMap = v2->_usageDeviceMap;
    v2->_usageDeviceMap = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deviceUsageMap = v2->_deviceUsageMap;
    v2->_deviceUsageMap = v7;

  }
  return v2;
}

- (void)addSubscriber:(id)a3 forUsage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDDeviceManager usageSubscribers](self, "usageSubscribers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "hash")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

  if (!v9)
  {
    v10 = objc_alloc_init((Class)NSMutableSet);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDDeviceManager usageSubscribers](self, "usageSubscribers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "hash")));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDDeviceManager usageSubscribers](self, "usageSubscribers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "hash")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));
  objc_msgSend(v15, "addObject:", v6);

}

- (void)removeSubscriber:(id)a3 forUsage:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[SSHBHIDDeviceManager usageSubscribers](self, "usageSubscribers"));
  v8 = objc_msgSend(v6, "hash");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v9));
  objc_msgSend(v10, "removeObject:", v7);

}

- (void)addDevice:(__IOHIDDevice *)a3 forUsage:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDDeviceManager usageDeviceMap](self, "usageDeviceMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "hash")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));

  if (!v8)
  {
    v9 = objc_alloc_init((Class)NSMutableSet);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDDeviceManager usageDeviceMap](self, "usageDeviceMap"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "hash")));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDDeviceManager usageDeviceMap](self, "usageDeviceMap"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "hash")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v13));
  objc_msgSend(v14, "addObject:", a3);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", a3));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDDeviceManager deviceUsageMap](self, "deviceUsageMap"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v15);

}

- (void)removeDevice:(__IOHIDDevice *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDDeviceManager deviceUsageMap](self, "deviceUsageMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v13));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDDeviceManager deviceUsageMap](self, "deviceUsageMap"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v13));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDDeviceManager deviceUsageMap](self, "deviceUsageMap"));
    objc_msgSend(v9, "removeObjectForKey:", v13);

    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDDeviceManager deviceUsageMap](self, "deviceUsageMap"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "hash")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));
      objc_msgSend(v12, "removeObject:", a3);

    }
  }

}

- (id)subscribersFromUsage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDDeviceManager usageSubscribers](self, "usageSubscribers"));
  v6 = objc_msgSend(v4, "hash");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));

  return v8;
}

- (id)subscribersFromDevice:(__IOHIDDevice *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDDeviceManager usageFromDevice:](self, "usageFromDevice:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDDeviceManager usageSubscribers](self, "usageSubscribers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "hash")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  return v7;
}

- (id)usageFromDevice:(__IOHIDDevice *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDDeviceManager deviceUsageMap](self, "deviceUsageMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)devicesFromUsage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDDeviceManager usageDeviceMap](self, "usageDeviceMap"));
  v6 = objc_msgSend(v4, "hash");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));

  return v8;
}

- (NSMutableDictionary)usageSubscribers
{
  return self->_usageSubscribers;
}

- (void)setUsageSubscribers:(id)a3
{
  objc_storeStrong((id *)&self->_usageSubscribers, a3);
}

- (NSMutableDictionary)usageDeviceMap
{
  return self->_usageDeviceMap;
}

- (void)setUsageDeviceMap:(id)a3
{
  objc_storeStrong((id *)&self->_usageDeviceMap, a3);
}

- (NSMutableDictionary)deviceUsageMap
{
  return self->_deviceUsageMap;
}

- (void)setDeviceUsageMap:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUsageMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUsageMap, 0);
  objc_storeStrong((id *)&self->_usageDeviceMap, 0);
  objc_storeStrong((id *)&self->_usageSubscribers, 0);
}

@end
