@implementation DSDeviceContext

- (DSDeviceContext)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DSDeviceContext *v7;
  _BOOL4 v8;
  NSObject *v9;
  const char *v10;
  const char *string;
  uint64_t v12;
  NSString *identifier;
  void *v14;
  NSString *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t uint64;
  unsigned __int8 v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  unsigned __int8 v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  DSDeviceContext *v32;
  id v33;
  NSObject *v35;
  const char *v36;
  objc_super v37;
  uint8_t buf[4];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)DSDeviceContext;
  v7 = -[DSDeviceContext init](&v37, sel_init);
  if (!v7)
  {
    DSLogObjectForCategory_DSDeviceContext();
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v36 = "Allocation failed";
    goto LABEL_54;
  }
  if (MEMORY[0x219A18A58](v6) != MEMORY[0x24BDACFA0])
  {
    DSLogObjectForCategory_DSDeviceContext();
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v36 = "init with invalid dictionary";
    goto LABEL_54;
  }
  v8 = xpc_dictionary_get_BOOL(v6, "kDSDevCtxIsMe");
  if (onceTokenDSDeviceContext != -1)
    dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
  v9 = logObjDSDeviceContext;
  if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
  {
    v10 = "NO";
    if (v8)
      v10 = "YES";
    *(_DWORD *)buf = 136315138;
    v39 = (uint64_t)v10;
    _os_log_impl(&dword_217E3C000, v9, OS_LOG_TYPE_DEFAULT, "Is self device: %s", buf, 0xCu);
  }
  v7->_isMe = v8;
  string = xpc_dictionary_get_string(v6, "kDSDevCtxDevID");
  if (string)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", string);
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v12;

    if (onceTokenDSDeviceContext != -1)
      dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
    v14 = (void *)logObjDSDeviceContext;
    if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v7->_identifier;
      v16 = v14;
      v17 = -[NSString UTF8String](v15, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v39 = v17;
      _os_log_impl(&dword_217E3C000, v16, OS_LOG_TYPE_DEFAULT, "Identifier : %s", buf, 0xCu);

    }
  }
  uint64 = xpc_dictionary_get_uint64(v6, "kDSCoordStatus");
  if (uint64 >= 0x100)
  {
    DSLogObjectForCategory_DSDeviceContext();
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v36 = "Error decoding coordination status";
    goto LABEL_54;
  }
  v19 = uint64;
  if (onceTokenDSDeviceContext != -1)
    dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
  v20 = logObjDSDeviceContext;
  if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
  {
    if (v19 > 5u)
      v21 = "?";
    else
      v21 = off_24D910DC8[(char)v19];
    *(_DWORD *)buf = 136315138;
    v39 = (uint64_t)v21;
    _os_log_impl(&dword_217E3C000, v20, OS_LOG_TYPE_DEFAULT, "Coordination status %s", buf, 0xCu);
  }
  v7->_coordinationStatus = v19;
  v22 = xpc_dictionary_get_uint64(v6, "kDSVehicleState");
  if (v22 >= 0x100)
  {
    DSLogObjectForCategory_DSDeviceContext();
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v36 = "Error decoding vehicle state";
    goto LABEL_54;
  }
  v23 = v22;
  if (onceTokenDSDeviceContext != -1)
    dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
  v24 = logObjDSDeviceContext;
  if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
  {
    if (v23 > 2u)
      v25 = "?";
    else
      v25 = off_24D910DB0[(char)v23];
    *(_DWORD *)buf = 136315138;
    v39 = (uint64_t)v25;
    _os_log_impl(&dword_217E3C000, v24, OS_LOG_TYPE_DEFAULT, "Vehicle state %s", buf, 0xCu);
  }
  v7->_vehicleState = v23;
  v26 = xpc_dictionary_get_uint64(v6, "kDSVehicleConfidence");
  if (v26 >= 0x100)
  {
    DSLogObjectForCategory_DSDeviceContext();
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v36 = "Error decoding coordination status";
    goto LABEL_54;
  }
  v27 = v26;
  if (onceTokenDSDeviceContext != -1)
    dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
  v28 = logObjDSDeviceContext;
  if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v39 = v27;
    _os_log_impl(&dword_217E3C000, v28, OS_LOG_TYPE_DEFAULT, "Vehicle confidence: %llu", buf, 0xCu);
  }
  v7->_vehicleConfidence = v27;
  v29 = xpc_dictionary_get_uint64(v6, "kDSTiebreaker");
  if (v29 >= 0x100)
  {
    DSLogObjectForCategory_DSDeviceContext();
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v36 = "Error decoding coordination status";
LABEL_54:
    _os_log_impl(&dword_217E3C000, v35, OS_LOG_TYPE_ERROR, v36, buf, 2u);
LABEL_55:

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 1, 0);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v33 = objc_retainAutorelease(v33);
      v32 = 0;
      *a4 = v33;
    }
    else
    {
      v32 = 0;
    }
    goto LABEL_41;
  }
  v30 = v29;
  if (onceTokenDSDeviceContext != -1)
    dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
  v31 = logObjDSDeviceContext;
  if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v39 = v30;
    _os_log_impl(&dword_217E3C000, v31, OS_LOG_TYPE_DEFAULT, "Tie breaker: %llu", buf, 0xCu);
  }
  v7->_tiebreaker = v30;
  v32 = v7;
  v33 = 0;
LABEL_41:

  return v32;
}

- (void)encodeSelf:(id)a3
{
  id v4;
  NSString *identifier;
  void *v6;
  xpc_object_t xdict;

  v4 = a3;
  xdict = v4;
  if (self->_isMe)
    xpc_dictionary_set_BOOL(v4, "kDSDevCtxIsMe", 1);
  identifier = self->_identifier;
  if (identifier)
    xpc_dictionary_set_string(xdict, "kDSDevCtxDevID", -[NSString UTF8String](identifier, "UTF8String"));
  if (self->_vehicleState)
    xpc_dictionary_set_uint64(xdict, "kDSVehicleState", self->_vehicleState);
  v6 = xdict;
  if (self->_vehicleConfidence)
  {
    xpc_dictionary_set_uint64(xdict, "kDSVehicleConfidence", self->_vehicleConfidence);
    v6 = xdict;
  }
  if (self->_coordinationStatus)
  {
    xpc_dictionary_set_uint64(xdict, "kDSCoordStatus", self->_coordinationStatus);
    v6 = xdict;
  }
  if (self->_tiebreaker)
  {
    xpc_dictionary_set_uint64(xdict, "kDSTiebreaker", self->_tiebreaker);
    v6 = xdict;
  }

}

- (DSDeviceContext)initWithCBDevice:(id)a3 error:(id *)a4
{
  id v7;
  DSDeviceContext *v8;
  DSDeviceContext *v9;
  uint64_t v10;
  NSString *identifier;
  int v12;
  char v13;
  int v14;
  unsigned __int8 v15;
  int v16;
  char v17;
  DSDeviceContext *v18;
  id v19;
  NSObject *v21;
  uint8_t v22[16];
  objc_super v23;

  v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DSDeviceContext;
  v8 = -[DSDeviceContext init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_isMe = 0;
    objc_msgSend(v7, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    v12 = objc_msgSend(v7, "dsInfoVehicleState");
    if (v12 == 2)
      v13 = 2;
    else
      v13 = v12 == 1;
    v9->_vehicleState = v13;
    v14 = objc_msgSend(v7, "dsInfoVehicleConfidence");
    v15 = 0;
    if (v14 > 10)
    {
      if (v14 != 11 && v14 != 15)
        goto LABEL_12;
    }
    else if (v14 != 4 && v14 != 7)
    {
      goto LABEL_12;
    }
    v15 = v14;
LABEL_12:
    v9->_vehicleConfidence = v15;
    v16 = objc_msgSend(v7, "dsActionFlags");
    v17 = 0;
    switch(v16)
    {
      case 1:
        v17 = 1;
        break;
      case 2:
        v17 = 3;
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        break;
      case 4:
        v17 = 2;
        break;
      case 8:
        v17 = 4;
        break;
      default:
        if (v16 == 16)
          v17 = 5;
        break;
    }
    v9->_coordinationStatus = v17;
    v9->_tiebreaker = objc_msgSend(v7, "dsActionTieBreaker");
    if ((objc_msgSend(v7, "discoveryFlags") & 0x800000000000000) != 0)
    {
      v9->_discoveryFlag |= 2uLL;
      v9->_dsInfoIsAlreadyFound = 1;
    }
    if ((objc_msgSend(v7, "discoveryFlags") & 0x1000000000000000) != 0)
    {
      v9->_discoveryFlag |= 4uLL;
      v9->_dsActionIsAlreadyFound = 1;
    }
    objc_storeStrong((id *)&v9->_bleDevice, a3);
    v18 = v9;
    v19 = 0;
    goto LABEL_24;
  }
  DSLogObjectForCategory_DSDeviceContext();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_217E3C000, v21, OS_LOG_TYPE_ERROR, "Allocation failed", v22, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DSErrorDomain"), 1, 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v19 = objc_retainAutorelease(v19);
    *a4 = v19;
  }
LABEL_24:

  return v9;
}

- (void)updateWithCBDevice:(id)a3
{
  CBDevice *v5;
  CBDevice *v6;
  unint64_t *p_changedFlag;
  uint64_t v8;
  int v9;
  int v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  unint64_t vehicleState;
  const char *v16;
  char *v17;
  int v18;
  int v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  unsigned int vehicleConfidence;
  const char *v25;
  const char *v26;
  unint64_t *p_discoveryFlag;
  uint64_t v28;
  int v29;
  int v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  unint64_t coordinationStatus;
  const char *v36;
  char *v37;
  int v38;
  int v39;
  void *v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  int tiebreaker;
  int v45;
  uint64_t v46;
  __int16 v47;
  _BYTE v48[10];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = (CBDevice *)a3;
  v6 = v5;
  self->_changedFlag = 0;
  p_changedFlag = &self->_changedFlag;
  if (!v5 || self->_bleDevice == v5)
    goto LABEL_84;
  if ((-[CBDevice discoveryFlags](v5, "discoveryFlags") & 0x800000000000000) != 0)
  {
    v9 = -[CBDevice dsInfoVehicleState](v6, "dsInfoVehicleState");
    if (v9 == 2)
      v10 = 2;
    else
      v10 = v9 == 1;
    if (self->_vehicleState == v10)
    {
      v8 = 0;
    }
    else
    {
      if (onceTokenDSDeviceContext != -1)
        dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
      v11 = (void *)logObjDSDeviceContext;
      if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        -[CBDevice identifier](v6, "identifier");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = objc_msgSend(v13, "UTF8String");
        vehicleState = (char)self->_vehicleState;
        if (vehicleState > 2)
          v16 = "?";
        else
          v16 = off_24D910DB0[vehicleState];
        v17 = off_24D910DB0[v10];
        v45 = 136315650;
        v46 = v14;
        v47 = 2080;
        *(_QWORD *)v48 = v16;
        *(_WORD *)&v48[8] = 2080;
        v49 = v17;
        _os_log_impl(&dword_217E3C000, v12, OS_LOG_TYPE_DEFAULT, "Device ID %s : Vehicle State updated from %s to %s", (uint8_t *)&v45, 0x20u);

      }
      self->_vehicleState = v10;
      v8 = 2;
    }
    v18 = -[CBDevice dsInfoVehicleConfidence](v6, "dsInfoVehicleConfidence");
    v19 = 0;
    if (v18 > 10)
    {
      if (v18 != 11 && v18 != 15)
      {
LABEL_25:
        if (self->_vehicleConfidence == v19)
        {
LABEL_52:
          if (self->_dsInfoIsAlreadyFound)
          {
            self->_discoveryFlag &= ~2uLL;
            p_discoveryFlag = &self->_changedFlag;
            v28 = v8;
          }
          else
          {
            self->_dsInfoIsAlreadyFound = 1;
            p_discoveryFlag = &self->_discoveryFlag;
            v28 = 2;
          }
          *p_discoveryFlag |= v28;
          goto LABEL_56;
        }
        if (onceTokenDSDeviceContext != -1)
          dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
        v20 = (void *)logObjDSDeviceContext;
        if (!os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
        {
LABEL_51:
          self->_vehicleConfidence = v19;
          v8 = 2;
          goto LABEL_52;
        }
        v21 = v20;
        -[CBDevice identifier](v6, "identifier");
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v23 = objc_msgSend(v22, "UTF8String");
        vehicleConfidence = self->_vehicleConfidence;
        if (vehicleConfidence <= 6)
        {
          if (!self->_vehicleConfidence)
          {
            v25 = "lowest";
            goto LABEL_41;
          }
          if (vehicleConfidence == 4)
          {
            v25 = "low-medium";
            goto LABEL_41;
          }
        }
        else
        {
          switch(vehicleConfidence)
          {
            case 7u:
              v25 = "medium";
              goto LABEL_41;
            case 0xBu:
              v25 = "medium-high";
              goto LABEL_41;
            case 0xFu:
              v25 = "highest";
LABEL_41:
              if (v19 <= 6)
              {
                if (v19)
                  v26 = "low-medium";
                else
                  v26 = "lowest";
              }
              else if (v19 == 7)
              {
                v26 = "medium";
              }
              else if (v19 == 11)
              {
                v26 = "medium-high";
              }
              else
              {
                v26 = "highest";
              }
              v45 = 136315650;
              v46 = v23;
              v47 = 2080;
              *(_QWORD *)v48 = v25;
              *(_WORD *)&v48[8] = 2080;
              v49 = (void *)v26;
              _os_log_impl(&dword_217E3C000, v21, OS_LOG_TYPE_DEFAULT, "Device ID %s : Vehicle Confidence updated from %s to %s", (uint8_t *)&v45, 0x20u);

              goto LABEL_51;
          }
        }
        v25 = "?";
        goto LABEL_41;
      }
    }
    else if (v18 != 4 && v18 != 7)
    {
      goto LABEL_25;
    }
    v19 = v18;
    goto LABEL_25;
  }
  v8 = 0;
LABEL_56:
  if ((-[CBDevice discoveryFlags](v6, "discoveryFlags") & 0x1000000000000000) != 0)
  {
    v29 = -[CBDevice dsActionFlags](v6, "dsActionFlags");
    v30 = 0;
    switch(v29)
    {
      case 1:
        v30 = 1;
        break;
      case 2:
        v30 = 3;
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        break;
      case 4:
        v30 = 2;
        break;
      case 8:
        v30 = 4;
        break;
      default:
        if (v29 == 16)
          v30 = 5;
        break;
    }
    if (v30 != self->_coordinationStatus)
    {
      if (onceTokenDSDeviceContext != -1)
        dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
      v31 = (void *)logObjDSDeviceContext;
      if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
      {
        v32 = v31;
        -[CBDevice identifier](v6, "identifier");
        v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v34 = objc_msgSend(v33, "UTF8String");
        coordinationStatus = (char)self->_coordinationStatus;
        if (coordinationStatus > 5)
          v36 = "?";
        else
          v36 = off_24D910DC8[coordinationStatus];
        v37 = off_24D910DC8[v30];
        v45 = 136315650;
        v46 = v34;
        v47 = 2080;
        *(_QWORD *)v48 = v36;
        *(_WORD *)&v48[8] = 2080;
        v49 = v37;
        _os_log_impl(&dword_217E3C000, v32, OS_LOG_TYPE_DEFAULT, "Device ID %s : Kappa Coordination Status updated from %s to %s", (uint8_t *)&v45, 0x20u);

      }
      self->_coordinationStatus = v30;
      v8 = 4;
    }
    v38 = -[CBDevice dsActionTieBreaker](v6, "dsActionTieBreaker");
    if (v38 != self->_tiebreaker)
    {
      v39 = v38;
      if (onceTokenDSDeviceContext != -1)
        dispatch_once(&onceTokenDSDeviceContext, &__block_literal_global_5);
      v40 = (void *)logObjDSDeviceContext;
      if (os_log_type_enabled((os_log_t)logObjDSDeviceContext, OS_LOG_TYPE_DEFAULT))
      {
        v41 = v40;
        -[CBDevice identifier](v6, "identifier");
        v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v43 = objc_msgSend(v42, "UTF8String");
        tiebreaker = self->_tiebreaker;
        v45 = 136315650;
        v46 = v43;
        v47 = 1024;
        *(_DWORD *)v48 = tiebreaker;
        *(_WORD *)&v48[4] = 1024;
        *(_DWORD *)&v48[6] = v39;
        _os_log_impl(&dword_217E3C000, v41, OS_LOG_TYPE_DEFAULT, "Device ID %s : Kappa tie breaker updated from %d to %d", (uint8_t *)&v45, 0x18u);

      }
      self->_tiebreaker = v39;
      v8 = 4;
    }
    if (self->_dsActionIsAlreadyFound)
    {
      self->_discoveryFlag &= ~4uLL;
    }
    else
    {
      self->_dsActionIsAlreadyFound = 1;
      p_changedFlag = &self->_discoveryFlag;
      v8 = 4;
    }
    *p_changedFlag |= v8;
  }
  objc_storeStrong((id *)&self->_bleDevice, a3);
LABEL_84:

}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)tiebreaker
{
  return self->_tiebreaker;
}

- (void)setTiebreaker:(unsigned __int8)a3
{
  self->_tiebreaker = a3;
}

- (unsigned)vehicleState
{
  return self->_vehicleState;
}

- (void)setVehicleState:(unsigned __int8)a3
{
  self->_vehicleState = a3;
}

- (unsigned)vehicleConfidence
{
  return self->_vehicleConfidence;
}

- (void)setVehicleConfidence:(unsigned __int8)a3
{
  self->_vehicleConfidence = a3;
}

- (unsigned)coordinationStatus
{
  return self->_coordinationStatus;
}

- (void)setCoordinationStatus:(unsigned __int8)a3
{
  self->_coordinationStatus = a3;
}

- (CBDevice)bleDevice
{
  return self->_bleDevice;
}

- (void)setBleDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)discoveryFlag
{
  return self->_discoveryFlag;
}

- (void)setDiscoveryFlag:(unint64_t)a3
{
  self->_discoveryFlag = a3;
}

- (unint64_t)changedFlag
{
  return self->_changedFlag;
}

- (void)setChangedFlag:(unint64_t)a3
{
  self->_changedFlag = a3;
}

- (unint64_t)dsInfoIsAlreadyFound
{
  return self->_dsInfoIsAlreadyFound;
}

- (void)setDsInfoIsAlreadyFound:(unint64_t)a3
{
  self->_dsInfoIsAlreadyFound = a3;
}

- (unint64_t)dsActionIsAlreadyFound
{
  return self->_dsActionIsAlreadyFound;
}

- (void)setDsActionIsAlreadyFound:(unint64_t)a3
{
  self->_dsActionIsAlreadyFound = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bleDevice, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
