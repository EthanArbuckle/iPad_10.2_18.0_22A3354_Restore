@implementation BMPhotosKnowledgeGraphEnrichmentLocation

- (BMPhotosKnowledgeGraphEnrichmentLocation)initWithStreet:(id)a3 city:(id)a4 state:(id)a5 country:(id)a6 encodedLocation:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BMPhotosKnowledgeGraphEnrichmentLocation *v17;
  BMPhotosKnowledgeGraphEnrichmentLocation *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  obj = a7;
  v16 = a7;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMPhotosKnowledgeGraphEnrichmentEvent.m"), 370, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("street"));

    if (v13)
    {
LABEL_3:
      if (v14)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMPhotosKnowledgeGraphEnrichmentEvent.m"), 371, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("city"));

  if (v14)
  {
LABEL_4:
    if (v15)
      goto LABEL_5;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMPhotosKnowledgeGraphEnrichmentEvent.m"), 373, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("country"));

    if (v16)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMPhotosKnowledgeGraphEnrichmentEvent.m"), 372, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state"));

  if (!v15)
    goto LABEL_12;
LABEL_5:
  if (v16)
    goto LABEL_6;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMPhotosKnowledgeGraphEnrichmentEvent.m"), 374, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("encodedLocation"));

LABEL_6:
  v28.receiver = self;
  v28.super_class = (Class)BMPhotosKnowledgeGraphEnrichmentLocation;
  v17 = -[BMPhotosKnowledgeGraphEnrichmentLocation init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_street, a3);
    objc_storeStrong((id *)&v18->_city, a4);
    objc_storeStrong((id *)&v18->_state, a5);
    objc_storeStrong((id *)&v18->_country, a6);
    objc_storeStrong((id *)&v18->_encodedLocation, obj);
  }

  return v18;
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  if (a4 == 2)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[BMPhotosKnowledgeGraphEnrichmentLocation eventWithData:dataVersion:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  NSString *street;
  NSData *encodedLocation;
  NSString *country;
  void *v5;
  void *v6;
  _QWORD v8[5];
  NSString *v9;
  __int128 v10;
  NSString *v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  street = self->_street;
  v8[0] = CFSTR("street");
  v8[1] = CFSTR("city");
  v10 = *(_OWORD *)&self->_city;
  v8[2] = CFSTR("state");
  v8[3] = CFSTR("country");
  country = self->_country;
  encodedLocation = self->_encodedLocation;
  v11 = country;
  v8[4] = CFSTR("encodedLocation");
  v9 = street;
  -[NSData base64EncodedStringWithOptions:](encodedLocation, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, v8, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMPhotosKnowledgeGraphEnrichmentLocation jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (!v4)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMPhotosKnowledgeGraphEnrichmentLocation json].cold.1();

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BMPhotosKnowledgeGraphEnrichmentLocation encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMPhotosKnowledgeGraphEnrichmentLocation)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMPhotosKnowledgeGraphEnrichmentLocation *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMPhotosKnowledgeGraphEnrichmentLocation initWithProtoData:](self, "initWithProtoData:", v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMPhotosKnowledgeGraphEnrichmentLocation proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMPhotosKnowledgeGraphEnrichmentLocation)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BMPhotosKnowledgeGraphEnrichmentLocation *v11;
  NSObject *v12;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSObject hasStreet](v5, "hasStreet")
        && -[NSObject hasCity](v5, "hasCity")
        && -[NSObject hasState](v5, "hasState")
        && (-[NSObject hasCountry](v5, "hasCountry") & 1) != 0)
      {
        -[NSObject street](v5, "street");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject city](v5, "city");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject state](v5, "state");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject country](v5, "country");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject encodedLocation](v5, "encodedLocation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[BMPhotosKnowledgeGraphEnrichmentLocation initWithStreet:city:state:country:encodedLocation:](self, "initWithStreet:city:state:country:encodedLocation:", v6, v7, v8, v9, v10);

        v11 = self;
LABEL_15:

        goto LABEL_16;
      }
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[BMPhotosKnowledgeGraphEnrichmentLocation initWithProto:].cold.1();

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMPhotosKnowledgeGraphEnrichmentLocation initWithProto:].cold.2();
    }
    v11 = 0;
    goto LABEL_15;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (BMPhotosKnowledgeGraphEnrichmentLocation)initWithProtoData:(id)a3
{
  id v4;
  BMPBPhotosKnowledgeGraphEnrichmentLocation *v5;
  BMPhotosKnowledgeGraphEnrichmentLocation *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBPhotosKnowledgeGraphEnrichmentLocation initWithData:]([BMPBPhotosKnowledgeGraphEnrichmentLocation alloc], "initWithData:", v4);

    self = -[BMPhotosKnowledgeGraphEnrichmentLocation initWithProto:](self, "initWithProto:", v5);
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
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[BMPhotosKnowledgeGraphEnrichmentLocation street](self, "street");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStreet:", v4);

  -[BMPhotosKnowledgeGraphEnrichmentLocation city](self, "city");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCity:", v5);

  -[BMPhotosKnowledgeGraphEnrichmentLocation state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setState:", v6);

  -[BMPhotosKnowledgeGraphEnrichmentLocation country](self, "country");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCountry:", v7);

  -[BMPhotosKnowledgeGraphEnrichmentLocation encodedLocation](self, "encodedLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEncodedLocation:", v8);

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_street, "hash");
  v4 = -[NSString hash](self->_city, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_state, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *street;
  void *v7;
  NSString *city;
  void *v9;
  NSString *state;
  void *v11;
  NSString *country;
  void *v13;
  NSData *encodedLocation;
  void *v15;
  char v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    street = self->_street;
    objc_msgSend(v5, "street");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](street, "isEqualToString:", v7))
    {
      city = self->_city;
      objc_msgSend(v5, "city");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](city, "isEqualToString:", v9))
      {
        state = self->_state;
        objc_msgSend(v5, "state");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](state, "isEqualToString:", v11))
        {
          country = self->_country;
          objc_msgSend(v5, "country");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSString isEqualToString:](country, "isEqualToString:", v13))
          {
            encodedLocation = self->_encodedLocation;
            objc_msgSend(v5, "encodedLocation");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[NSData isEqual:](encodedLocation, "isEqual:", v15);

          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (self->_street && self->_city && self->_state && self->_country && self->_encodedLocation)
  {
    v7 = 1;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMStreamErrorDomain"), 3, 0);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)street
{
  return self->_street;
}

- (NSString)city
{
  return self->_city;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)country
{
  return self->_country;
}

- (NSData)encodedLocation
{
  return self->_encodedLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedLocation, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_street, 0);
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_18D810000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentLocation: Mismatched data versions (%u != %u) cannot deserialize", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)json
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentLocation: Unable to create json from object: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithProto:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentLocation: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMPhotosKnowledgeGraphEnrichmentLocation: tried to initialize with a non-BMPhotosKnowledgeGraphEnrichmentLocation proto", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
