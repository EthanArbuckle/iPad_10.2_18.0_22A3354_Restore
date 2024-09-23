@implementation BMPOICategoryEvent

- (BMPOICategoryEvent)initWithPOICategory:(id)a3 rank:(unint64_t)a4 timeIntervalSince1970:(double)a5
{
  id v9;
  BMPOICategoryEvent *v10;
  BMPOICategoryEvent *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMPOICategoryEvent;
  v10 = -[BMEventBase init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_poiCategory, a3);
    v11->_rank = a4;
    v11->_timeIntervalSince1970 = a5;
  }

  return v11;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("POI Category Event. POI Category: %@, rank: %lu"), self->_poiCategory, self->_rank);
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("poiCategory");
  -[BMPOICategoryEvent poiCategory](self, "poiCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("rank");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BMPOICategoryEvent rank](self, "rank"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("timeIntervalSince1970");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMPOICategoryEvent timeIntervalSince1970](self, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMPOICategoryEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMPOICategoryEvent json].cold.1(v6);

  }
  return v4;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMPOICategoryEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMPOICategoryEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  BMPOICategoryEvent *v10;
  NSObject *v11;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BMPOICategoryEvent initWithProto:].cold.1((uint64_t)self, v11);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "poiCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "rank");
  objc_msgSend(v5, "timeIntervalSince1970");
  v9 = v8;

  self = -[BMPOICategoryEvent initWithPOICategory:rank:timeIntervalSince1970:](self, "initWithPOICategory:rank:timeIntervalSince1970:", v6, v7, v9);
  v10 = self;
LABEL_8:

  return v10;
}

- (BMPOICategoryEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBPOICategoryEvent *v5;
  BMPOICategoryEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBPOICategoryEvent initWithData:]([BMPBPOICategoryEvent alloc], "initWithData:", v4);

    self = -[BMPOICategoryEvent initWithProto:](self, "initWithProto:", v5);
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

  v3 = (void *)objc_opt_new();
  -[BMPOICategoryEvent poiCategory](self, "poiCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPoiCategory:", v4);

  objc_msgSend(v3, "setRank:", -[BMPOICategoryEvent rank](self, "rank"));
  -[BMPOICategoryEvent timeIntervalSince1970](self, "timeIntervalSince1970");
  objc_msgSend(v3, "setTimeIntervalSince1970:");
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  char v18;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = 0;
    goto LABEL_16;
  }
  v6 = v5;
  v7 = -[BMPOICategoryEvent rank](self, "rank");
  v8 = objc_msgSend(v6, "rank");
  -[BMPOICategoryEvent timeIntervalSince1970](self, "timeIntervalSince1970");
  v10 = v9;
  objc_msgSend(v6, "timeIntervalSince1970");
  v12 = v11;
  -[BMPOICategoryEvent poiCategory](self, "poiCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(v6, "poiCategory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v16 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  -[BMPOICategoryEvent poiCategory](self, "poiCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "poiCategory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (!v13)
    goto LABEL_8;
LABEL_9:

  if (v7 == v8)
    v18 = v16;
  else
    v18 = 0;
  if (v10 == v12)
    v17 = v18;
  else
    v17 = 0;

LABEL_16:
  return v17;
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (unint64_t)rank
{
  return self->_rank;
}

- (void)setRank:(unint64_t)a3
{
  self->_rank = a3;
}

- (double)timeIntervalSince1970
{
  return self->_timeIntervalSince1970;
}

- (void)setTimeIntervalSince1970:(double)a3
{
  self->_timeIntervalSince1970 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiCategory, 0);
}

- (void)json
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D810000, log, OS_LOG_TYPE_ERROR, "Unable to create json from object", v1, 2u);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
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
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBPOICategoryEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
