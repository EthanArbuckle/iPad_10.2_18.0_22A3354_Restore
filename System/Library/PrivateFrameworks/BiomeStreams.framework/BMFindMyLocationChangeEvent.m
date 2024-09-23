@implementation BMFindMyLocationChangeEvent

- (BMFindMyLocationChangeEvent)initWithIDSHandle:(id)a3 locationChangeType:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  BMFindMyLocationChangeEvent *v10;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithDouble:", 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BMFindMyLocationChangeEvent initWithIDSHandle:locationChangeType:motionActivityState:latitude:longitude:name:](self, "initWithIDSHandle:locationChangeType:motionActivityState:latitude:longitude:name:", v7, a4, 0, v8, v9, &stru_1E2672FA8);

  return v10;
}

- (BMFindMyLocationChangeEvent)initWithIDSHandle:(id)a3 locationChangeType:(unint64_t)a4 motionActivityState:(int64_t)a5 latitude:(id)a6 longitude:(id)a7 name:(id)a8
{
  id v13;
  id v14;
  BMFindMyLocationChangeEvent *v15;
  BMFindMyLocationChangeEvent *v16;
  NSNumber *v17;
  NSNumber *longitude;
  const __CFString *v19;
  NSString *name;
  objc_super v22;

  v13 = a3;
  v14 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BMFindMyLocationChangeEvent;
  v15 = -[BMEventBase init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_idsHandle, a3);
    v16->_locationChangeType = a4;
    v16->_motionActivityState = a5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    longitude = v16->_longitude;
    v16->_longitude = v17;

    objc_storeStrong((id *)&v16->_latitude, v17);
    if (v14)
      v19 = (const __CFString *)v14;
    else
      v19 = &stru_1E2672FA8;
    name = v16->_name;
    v16->_name = &v19->isa;

  }
  return v16;
}

- (NSString)description
{
  id v3;
  NSString *idsHandle;
  void *v5;
  int64_t motionActivityState;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  idsHandle = self->_idsHandle;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_locationChangeType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  motionActivityState = self->_motionActivityState;
  -[NSNumber doubleValue](self->_latitude, "doubleValue");
  v8 = v7;
  -[NSNumber doubleValue](self->_longitude, "doubleValue");
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("FindMyLocationChangeEvent event with idsHandle: %@ locationChangeType: %@ activity: %ld lat: %f lng: %f name:%@"), idsHandle, v5, motionActivityState, v8, v9, self->_name);

  return (NSString *)v10;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;

  if (a4 == 1)
    v4 = (objc_class *)BMFindMyLocationChangeEvent_v1;
  else
    v4 = (objc_class *)a1;
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithProtoData:", v5);

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMFindMyLocationChangeEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMFindMyLocationChangeEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BMFindMyLocationChangeEvent *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject idsHandle](v5, "idsHandle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSObject locationChangeType](v5, "locationChangeType");
      v8 = v7;
      if (v7 >= 3)
      {
        __biome_log_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[BMFindMyLocationChangeEvent initWithProto:].cold.1(v8);

        v9 = 3;
      }
      else
      {
        v9 = v7;
      }
      v12 = activityTypeWithState(-[NSObject activityState](v5, "activityState"));
      v13 = (void *)MEMORY[0x1E0CB37E8];
      -[NSObject latitude](v5, "latitude");
      objc_msgSend(v13, "numberWithDouble:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB37E8];
      -[NSObject longitude](v5, "longitude");
      objc_msgSend(v15, "numberWithDouble:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject name](v5, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[BMFindMyLocationChangeEvent initWithIDSHandle:locationChangeType:motionActivityState:latitude:longitude:name:](self, "initWithIDSHandle:locationChangeType:motionActivityState:latitude:longitude:name:", v6, v9, v12, v14, v16, v17);

      v10 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMFindMyLocationChangeEvent initWithProto:].cold.2();
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BMFindMyLocationChangeEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBFindMyLocationChangeEvent *v5;
  BMFindMyLocationChangeEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBFindMyLocationChangeEvent initWithData:]([BMPBFindMyLocationChangeEvent alloc], "initWithData:", v4);

    self = -[BMFindMyLocationChangeEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t motionActivityState;
  id v11;
  NSObject *v12;

  v3 = (void *)objc_opt_new();
  -[BMFindMyLocationChangeEvent idsHandle](self, "idsHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdsHandle:", v4);

  v5 = -[BMFindMyLocationChangeEvent locationChangeType](self, "locationChangeType");
  if (!v5)
  {
    v8 = 0;
LABEL_7:
    v7 = 1;
    goto LABEL_11;
  }
  v6 = v5;
  if (v5 == 2)
  {
    v8 = 2;
    goto LABEL_7;
  }
  if (v5 == 1)
  {
    v7 = 1;
    v8 = 1;
  }
  else
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BMFindMyLocationChangeEvent proto].cold.2(v6);

    v7 = 0;
    v8 = 0xFFFFFFFFLL;
  }
LABEL_11:
  motionActivityState = self->_motionActivityState;
  if (motionActivityState >= 6)
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[BMFindMyLocationChangeEvent proto].cold.1(motionActivityState);

    goto LABEL_17;
  }
  if (!v7)
  {
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v3, "setLocationChangeType:", v8);
  objc_msgSend(v3, "setActivityState:", motionActivityState);
  -[NSNumber doubleValue](self->_latitude, "doubleValue");
  objc_msgSend(v3, "setLatitude:");
  -[NSNumber doubleValue](self->_longitude, "doubleValue");
  objc_msgSend(v3, "setLongitude:");
  objc_msgSend(v3, "setName:", self->_name);
  v11 = v3;
LABEL_18:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *idsHandle;
  void *v7;
  unint64_t locationChangeType;
  int64_t motionActivityState;
  NSNumber *latitude;
  NSNumber *v11;
  BOOL v12;
  NSNumber *longitude;
  NSNumber *v15;
  NSString *name;
  void *v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    idsHandle = self->_idsHandle;
    objc_msgSend(v5, "idsHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](idsHandle, "isEqualToString:", v7)
      && (locationChangeType = self->_locationChangeType, locationChangeType == objc_msgSend(v5, "locationChangeType"))
      && (motionActivityState = self->_motionActivityState,
          motionActivityState == objc_msgSend(v5, "motionActivityState")))
    {
      latitude = self->_latitude;
      objc_msgSend(v5, "latitude");
      v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      if (latitude == v11)
      {
        longitude = self->_longitude;
        objc_msgSend(v5, "longitude");
        v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        if (longitude == v15)
        {
          name = self->_name;
          objc_msgSend(v5, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[NSString isEqualToString:](name, "isEqualToString:", v17);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)idsHandle
{
  return self->_idsHandle;
}

- (void)setIdsHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)locationChangeType
{
  return self->_locationChangeType;
}

- (void)setLocationChangeType:(unint64_t)a3
{
  self->_locationChangeType = a3;
}

- (int64_t)motionActivityState
{
  return self->_motionActivityState;
}

- (void)setMotionActivityState:(int64_t)a3
{
  self->_motionActivityState = a3;
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_idsHandle, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMFindMyLocationChangeEvent: unable to convert BMPBFindMyLocationChangeType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithProto:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v2, v3, "%@: tried to initialize with a non-BMPBFindMyLocationChangeEvent proto", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)proto
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMFindMyLocationChangeEvent: unable to convert BMFindMyLocationChangeType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
