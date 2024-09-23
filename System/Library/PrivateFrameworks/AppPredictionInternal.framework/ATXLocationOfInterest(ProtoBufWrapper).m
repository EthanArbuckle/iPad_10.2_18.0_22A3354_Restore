@implementation ATXLocationOfInterest(ProtoBufWrapper)

- (id)initWithProto:()ProtoBufWrapper
{
  id v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  CLLocationDegrees v11;
  CLLocationDegrees v12;
  CLLocationCoordinate2D v13;
  uint64_t v14;
  id v15;
  NSObject *v16;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[ATXLocationOfInterest(ProtoBufWrapper) initWithProto:].cold.1((uint64_t)a1, v16);

    goto LABEL_7;
  }
  v5 = (objc_class *)MEMORY[0x1E0CB3A28];
  v6 = v4;
  v7 = [v5 alloc];
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

  objc_msgSend(v6, "latitude");
  v11 = v10;
  objc_msgSend(v6, "longitude");
  v13 = CLLocationCoordinate2DMake(v11, v12);
  v14 = objc_msgSend(v6, "type");

  a1 = (id)objc_msgSend(a1, "initWithUUID:visits:coordinate:type:", v9, 0, objc_msgSend(a1, "_routineLOITypeFromProtoLOIType:", v14), v13.latitude, v13.longitude);
  v15 = a1;
LABEL_8:

  return v15;
}

- (id)initWithProtoData:()ProtoBufWrapper
{
  id v4;
  ATXPBPredictionLocationOfInterest *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBPredictionLocationOfInterest initWithData:]([ATXPBPredictionLocationOfInterest alloc], "initWithData:", v4);

    a1 = (id)objc_msgSend(a1, "initWithProto:", v5);
    v6 = a1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "proto");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)proto
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUuid:", v4);

  objc_msgSend(a1, "coordinate");
  objc_msgSend(v2, "setLatitude:");
  objc_msgSend(a1, "coordinate");
  objc_msgSend(v2, "setLongitude:", v5);
  objc_msgSend(v2, "setType:", objc_msgSend(a1, "_protoLOITypeFromRoutineLOIType:", objc_msgSend(a1, "type")));
  return v2;
}

- (uint64_t)_routineLOITypeFromProtoLOIType:()ProtoBufWrapper
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  void *v11;

  if (a3 < 5)
    return a3 - 1;
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[ATXLocationOfInterest(ProtoBufWrapper) _routineLOITypeFromProtoLOIType:].cold.1(a1, a3, v6);

  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "raise:format:", v8, CFSTR("%@ - _routineLOITypeFromProtoLOIType got unhandled LOI type of %@"), v10, v11);

  return -1;
}

- (uint64_t)_protoLOITypeFromRoutineLOIType:()ProtoBufWrapper
{
  if (a3 < 4)
    return (a3 + 1);
  else
    return 0;
}

- (void)initWithProto:()ProtoBufWrapper .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBPredictionLocationOfInterest proto", (uint8_t *)&v5, 0xCu);

}

- (void)_routineLOITypeFromProtoLOIType:()ProtoBufWrapper .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "%@ - _routineLOITypeFromProtoLOIType got unhandled LOI type of %@", buf, 0x16u);

}

@end
