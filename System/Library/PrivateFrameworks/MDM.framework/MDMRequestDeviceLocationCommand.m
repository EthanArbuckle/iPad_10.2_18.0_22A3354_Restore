@implementation MDMRequestDeviceLocationCommand

+ (id)requestType
{
  return CFSTR("DeviceLocation");
}

+ (unint64_t)requiredAccessRights
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MDMRequestDeviceLocationCommand;
  return (unint64_t)objc_msgSendSuper2(&v3, sel_requiredAccessRights);
}

+ (id)request
{
  return (id)objc_opt_new();
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MDMRequestDeviceLocationCommand;
  return -[RMModelPayloadBase copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  char v7;
  MDMLostDeviceLocationManager *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isManagedLostModeActive");

  if ((v7 & 1) != 0)
  {
    v8 = objc_alloc_init(MDMLostDeviceLocationManager);
    -[MDMRequestBase delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "originator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __77__MDMRequestDeviceLocationCommand_Handler__processRequest_completionHandler___block_invoke;
    v18[3] = &unk_24EB691E8;
    v19 = v5;
    -[MDMLostDeviceLocationManager getCurrentLocationForOriginator:completion:](v8, "getCurrentLocationForOriginator:completion:", v10, v18);

    v11 = v19;
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", v13, 12067, v14, *MEMORY[0x24BE2A588], 0);
    v8 = (MDMLostDeviceLocationManager *)objc_claimAutoreleasedReturnValue();

    v15 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      -[MDMLostDeviceLocationManager DMCVerboseDescription](v8, "DMCVerboseDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v17;
      _os_log_impl(&dword_222CB9000, v16, OS_LOG_TYPE_ERROR, "Could not determine device current location: %{public}@", buf, 0xCu);

    }
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v5 + 2))(v5, v11);
  }

}

void __77__MDMRequestDeviceLocationCommand_Handler__processRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void (*v11)(void);
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v7, 12068, v8, v5, *MEMORY[0x24BE2A588], 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v29, "coordinate");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("Latitude"));

    v14 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v29, "coordinate");
    objc_msgSend(v14, "numberWithDouble:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("Longitude"));

    v17 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v29, "horizontalAccuracy");
    objc_msgSend(v17, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("HorizontalAccuracy"));

    v19 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v29, "verticalAccuracy");
    objc_msgSend(v19, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("VerticalAccuracy"));

    v21 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v29, "altitude");
    objc_msgSend(v21, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, CFSTR("Altitude"));

    v23 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v29, "course");
    objc_msgSend(v23, "numberWithDouble:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, CFSTR("Course"));

    v25 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v29, "speed");
    objc_msgSend(v25, "numberWithDouble:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, CFSTR("Speed"));

    objc_msgSend(v29, "timestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BE2A7D0], "isoDateFormatter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringFromDate:", v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, CFSTR("Timestamp"));

    }
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v11();

}

@end
