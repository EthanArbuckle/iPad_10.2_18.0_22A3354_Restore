@implementation DADeviceWatchProxy

- (DADeviceWatchProxy)initWithNanoDevice:(id)a3
{
  id v5;
  DADeviceWatchProxy *v6;
  DADeviceWatchProxy *v7;
  void *v8;
  DADeviceState *v9;
  void *v10;
  DADeviceState *v11;
  DADeviceState *state;
  DADeviceConnectionWatchProxy *v13;
  DADeviceConnectionWatchProxy *connection;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DADeviceWatchProxy;
  v6 = -[DADeviceWatchProxy init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_nrDevice, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy _deviceAttributes](v7, "_deviceAttributes"));
    v9 = [DADeviceState alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy _serialNumber](v7, "_serialNumber"));
    v11 = -[DADeviceState initWithSerialNumber:attributes:](v9, "initWithSerialNumber:attributes:", v10, v8);
    state = v7->_state;
    v7->_state = v11;

    v13 = -[DADeviceConnectionWatchProxy initWithState:nanoDevice:]([DADeviceConnectionWatchProxy alloc], "initWithState:nanoDevice:", v7->_state, v7->_nrDevice);
    connection = v7->_connection;
    v7->_connection = v13;

    -[DADeviceConnectionIDSProxy setDelegate:](v7->_connection, "setDelegate:", v7);
  }

  return v7;
}

- (BOOL)isLocal
{
  return 0;
}

- (void)connect
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy connection](self, "connection"));
  objc_msgSend(v2, "connect");

}

- (void)start
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy connection](self, "connection"));
  objc_msgSend(v2, "start");

}

- (void)idle
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy connection](self, "connection"));
  objc_msgSend(v2, "idle");

}

- (void)end
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E1D4;
  block[3] = &unk_100132838;
  block[4] = self;
  dispatch_async(v4, block);

}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy state](self, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serialNumber"));
  v4 = objc_msgSend(v3, "hash");

  return (unint64_t)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___DADevice))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy state](self, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serialNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "state"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serialNumber"));
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy state](self, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@; %p: %@>"),
                   v5,
                   self,
                   v7));

  return (NSString *)v8;
}

- (id)_deviceAttributes
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[9];
  _QWORD v27[9];

  v26[0] = CFSTR("productClass");
  v3 = objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy _productClass](self, "_productClass"));
  v4 = (void *)v3;
  if (!v3)
    v3 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v22 = (void *)v3;
  v27[0] = v3;
  v26[1] = CFSTR("IMEI");
  v5 = objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy _IMEI](self, "_IMEI"));
  v6 = (void *)v5;
  if (!v5)
    v5 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v21 = (void *)v5;
  v27[1] = v5;
  v26[2] = CFSTR("marketingName");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy _marketingName](self, "_marketingName"));
  v27[2] = v24;
  v26[3] = CFSTR("enclosure");
  v7 = objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy _enclosure](self, "_enclosure"));
  v8 = (void *)v7;
  if (!v7)
    v7 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v20 = (void *)v7;
  v27[3] = v7;
  v26[4] = CFSTR("size");
  v9 = objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy _caseSize](self, "_caseSize"));
  v10 = (void *)v9;
  if (!v9)
    v9 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19 = (void *)v9;
  v27[4] = v9;
  v26[5] = CFSTR("deviceType");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy _deviceType](self, "_deviceType"));
  v12 = v11;
  if (!v11)
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v25 = v4;
  v27[5] = v12;
  v26[6] = CFSTR("deviceClass");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy _deviceClass](self, "_deviceClass"));
  v27[6] = v13;
  v26[7] = CFSTR("deviceEnclosureColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy _deviceEnclosureColor](self, "_deviceEnclosureColor"));
  v15 = v14;
  if (!v14)
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v27[7] = v15;
  v26[8] = CFSTR("deviceColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy _deviceColor](self, "_deviceColor"));
  v17 = v16;
  if (!v16)
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v27[8] = v17;
  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 9));
  if (!v16)

  if (!v14)
  if (!v11)

  if (!v10)
  if (!v8)

  if (!v6)
  if (!v25)

  return v23;
}

- (id)_enclosure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy nrDevice](self, "nrDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForProperty:", NRDevicePropertyDeviceHousingColor));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy nrDevice](self, "nrDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForProperty:", NRDevicePropertyDmin));

  if (v4)
  {
    v7 = (unint64_t)objc_msgSend(v4, "unsignedIntegerValue") - 1;
    if (v7 < 0x20 && ((0x8E223CFF >> v7) & 1) != 0)
    {
      v13 = off_100132D98[v7];
      goto LABEL_17;
    }
    v8 = DiagnosticLogHandleForCategory(10);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000EA8B4(v4, v9);
  }
  else
  {
    v10 = DiagnosticLogHandleForCategory(10);
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000EA888();
  }

  if (v6)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", &off_10013F028));
    v12 = v11;
    if (v11)
    {
      v13 = 0;
      switch((unint64_t)-[NSObject unsignedIntegerValue](v11, "unsignedIntegerValue"))
      {
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
          v13 = CFSTR("ALUMINUM");
          break;
        case 5uLL:
        case 7uLL:
          v13 = CFSTR("STAINLESS_STEEL");
          break;
        case 8uLL:
          v13 = CFSTR("YELLOW_GOLD");
          break;
        case 9uLL:
          v13 = CFSTR("ROSE_GOLD");
          break;
        default:
          goto LABEL_19;
      }
    }
    else
    {
      v14 = DiagnosticLogHandleForCategory(10);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1000EA85C();

      v13 = 0;
    }
    goto LABEL_19;
  }
  v13 = 0;
LABEL_17:
  v16 = DiagnosticLogHandleForCategory(10);
  v12 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_1000EA830();
LABEL_19:

  return (id)v13;
}

- (id)_caseSize
{
  void *v2;
  void *v3;
  unsigned int v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy nrDevice](self, "nrDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertyProductType));

  if (v3)
  {
    v4 = NRDeviceSizeForProductType(v3);
    v5 = v4;
    if (v4 >= 8)
    {
      v9 = DiagnosticLogHandleForCategory(10);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        sub_1000EA968(v5, v10);

      v6 = CFSTR("42_CASE");
    }
    else
    {
      v6 = off_100132E98[(__int16)v4];
    }
  }
  else
  {
    v7 = DiagnosticLogHandleForCategory(10);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000EA93C();

    v6 = 0;
  }

  return (id)v6;
}

- (id)_serialNumber
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy nrDevice](self, "nrDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertySerialNumber));

  return v3;
}

- (id)_productClass
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy nrDevice](self, "nrDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertyLocalizedModel));

  return v3;
}

- (id)_marketingName
{
  return CFSTR("Apple Watch");
}

- (id)_IMEI
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy nrDevice](self, "nrDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertyIMEI));

  if (objc_msgSend(v3, "isEqual:", CFSTR("Unknown")))
  {

    v3 = 0;
  }
  return v3;
}

- (id)_deviceClass
{
  return CFSTR("Watch");
}

- (id)_deviceType
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy nrDevice](self, "nrDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertyProductType));

  return v3;
}

- (id)_deviceColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy nrDevice](self, "nrDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertyColor));

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("unknown")) & 1) != 0)
    v4 = 0;
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("#"), &stru_10013CDC8));

  return v4;
}

- (id)_deviceEnclosureColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceWatchProxy nrDevice](self, "nrDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertyEnclosureColor));

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("unknown")) & 1) != 0)
    v4 = 0;
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("#"), &stru_10013CDC8));

  return v4;
}

- (DADeviceDelegate)delegate
{
  return (DADeviceDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (DADeviceConnectionWatchProxy)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NRDevice)nrDevice
{
  return self->_nrDevice;
}

- (void)setNrDevice:(id)a3
{
  objc_storeStrong((id *)&self->_nrDevice, a3);
}

- (DADeviceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_nrDevice, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
