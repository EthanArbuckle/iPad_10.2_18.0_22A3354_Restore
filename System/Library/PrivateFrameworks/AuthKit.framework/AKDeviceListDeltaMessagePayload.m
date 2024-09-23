@implementation AKDeviceListDeltaMessagePayload

- (AKDeviceListDeltaMessagePayload)initWithResponseBody:(id)a3
{
  id v4;
  AKDeviceListDeltaMessagePayload *v5;
  uint64_t v6;
  NSString *altDSID;
  void *v8;
  uint64_t v9;
  NSDate *timestamp;
  uint64_t v11;
  NSString *machineID;
  uint64_t v13;
  NSArray *machineIDs;
  uint64_t v15;
  NSString *serialNumber;
  void *v17;
  void *v18;
  AKDeviceListDeltaMessagePayload *v19;
  objc_super v21;

  v4 = a3;
  if (v4)
  {
    v21.receiver = self;
    v21.super_class = (Class)AKDeviceListDeltaMessagePayload;
    v5 = -[AKDeviceListDeltaMessagePayload init](&v21, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("altDSID"));
      v6 = objc_claimAutoreleasedReturnValue();
      altDSID = v5->_altDSID;
      v5->_altDSID = (NSString *)v6;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ts"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKDeviceListDeltaMessagePayload _timestampFromPayloadValue:](v5, "_timestampFromPayloadValue:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      timestamp = v5->_timestamp;
      v5->_timestamp = (NSDate *)v9;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mid"));
      v11 = objc_claimAutoreleasedReturnValue();
      machineID = v5->_machineID;
      v5->_machineID = (NSString *)v11;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mids"));
      v13 = objc_claimAutoreleasedReturnValue();
      machineIDs = v5->_machineIDs;
      v5->_machineIDs = (NSArray *)v13;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sn"));
      v15 = objc_claimAutoreleasedReturnValue();
      serialNumber = v5->_serialNumber;
      v5->_serialNumber = (NSString *)v15;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("op"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_operation = -[AKDeviceListDeltaMessagePayload _operationFromPayloadValue:](v5, "_operationFromPayloadValue:", v17);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rn"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_removalReason = -[AKDeviceListDeltaMessagePayload _removalReasonFromPayloadValue:](v5, "_removalReasonFromPayloadValue:", v18);

    }
    self = v5;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_timestampFromPayloadValue:(id)a3
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(v4, "dateWithTimeIntervalSince1970:", v5 / 1000.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "AKDeviceListDeltaMessagePayload missing timestamp", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (unint64_t)_operationFromPayloadValue:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    v4 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;

    if (!-[NSObject caseInsensitiveCompare:](v5, "caseInsensitiveCompare:", CFSTR("A")))
    {
      v21 = 1;
      goto LABEL_15;
    }
    if (!-[NSObject caseInsensitiveCompare:](v5, "caseInsensitiveCompare:", CFSTR("D")))
    {
      v21 = 2;
      goto LABEL_15;
    }
    _AKLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AKDeviceListDeltaMessagePayload _operationFromPayloadValue:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);

  }
  else
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AKDeviceListDeltaMessagePayload _operationFromPayloadValue:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v21 = 0;
LABEL_15:

  return v21;
}

- (int64_t)_removalReasonFromPayloadValue:(id)a3
{
  id v3;
  id v4;
  id v5;
  int64_t v6;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    v4 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;

    v6 = objc_msgSend(v5, "integerValue");
  }
  else
  {
    v6 = -1;
  }

  return v6;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (NSString)machineID
{
  return self->_machineID;
}

- (NSArray)machineIDs
{
  return self->_machineIDs;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)removalReason
{
  return self->_removalReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_machineIDs, 0);
  objc_storeStrong((id *)&self->_machineID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

- (void)_operationFromPayloadValue:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "AKDeviceListDeltaMessagePayload unable to process missing operation.", a5, a6, a7, a8, 0);
}

- (void)_operationFromPayloadValue:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "AKDeviceListDeltaMessagePayload unable to process unexpected operation.", a5, a6, a7, a8, 0);
}

@end
