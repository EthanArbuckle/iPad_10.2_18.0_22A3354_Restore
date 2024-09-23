@implementation ATXFaceGalleryEvent

+ (id)galleryDidAppearEventWithConfiguration:(id)a3
{
  id v3;
  ATXFaceGalleryEvent *v4;

  v3 = a3;
  v4 = -[ATXFaceGalleryEvent initWithEventType:configuration:items:]([ATXFaceGalleryEvent alloc], "initWithEventType:configuration:items:", 1, v3, 0);

  return v4;
}

+ (id)galleryDidDisappearEvent
{
  return -[ATXFaceGalleryEvent initWithEventType:configuration:items:]([ATXFaceGalleryEvent alloc], "initWithEventType:configuration:items:", 2, 0, 0);
}

+ (id)itemsDidAppearEventWithItems:(id)a3
{
  id v3;
  ATXFaceGalleryEvent *v4;

  v3 = a3;
  v4 = -[ATXFaceGalleryEvent initWithEventType:configuration:items:]([ATXFaceGalleryEvent alloc], "initWithEventType:configuration:items:", 3, 0, v3);

  return v4;
}

- (ATXFaceGalleryEvent)initWithEventType:(int64_t)a3 configuration:(id)a4 items:(id)a5
{
  id v9;
  id v10;
  ATXFaceGalleryEvent *v11;
  ATXFaceGalleryEvent *v12;
  uint64_t v13;
  NSArray *items;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ATXFaceGalleryEvent;
  v11 = -[ATXFaceGalleryEvent init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_eventType = a3;
    objc_storeStrong((id *)&v11->_configuration, a4);
    v13 = objc_msgSend(v10, "copy");
    items = v12->_items;
    v12->_items = (NSArray *)v13;

  }
  return v12;
}

- (NSString)description
{
  void *v3;
  int64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[ATXFaceGalleryEvent eventType](self, "eventType");
  if (v4 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E4D5C4C0[(int)v4];
  }
  -[ATXFaceGalleryEvent configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<ATXFaceGalleryEvent type: %@ configuration: %@>"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (NSDictionary)jsonDictionary
{
  int64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("eventType");
  v3 = -[ATXFaceGalleryEvent eventType](self, "eventType");
  if (v3 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E4D5C4C0[(int)v3];
  }
  v14[0] = v4;
  v13[1] = CFSTR("configuration");
  -[ATXFaceGalleryEvent configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v7;
  v13[2] = CFSTR("items");
  -[ATXFaceGalleryEvent items](self, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_80);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)

  if (!v6)
  return (NSDictionary *)v11;
}

uint64_t __37__ATXFaceGalleryEvent_jsonDictionary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonDictionary");
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXFaceGalleryEvent jsonDictionary](self, "jsonDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ATXFaceGalleryEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBFaceGalleryEvent *v5;
  ATXFaceGalleryEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBFaceGalleryEvent initWithData:]([ATXPBFaceGalleryEvent alloc], "initWithData:", v4);

    self = -[ATXFaceGalleryEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXFaceGalleryEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXFaceGalleryEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  ATXFaceGalleryConfiguration *v7;
  void *v8;
  ATXFaceGalleryConfiguration *v9;
  NSObject *v10;
  ATXFaceGalleryEvent *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (!v4)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_lock_screen();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXDigestTimeline initWithProto:].cold.1((uint64_t)self, v10);

    goto LABEL_8;
  }
  v5 = v4;
  v6 = (int)-[ATXPBFaceGalleryEvent eventType]((uint64_t)v5);
  if (-[ATXPBFaceGalleryEvent hasConfiguration]((_BOOL8)v5))
  {
    v7 = [ATXFaceGalleryConfiguration alloc];
    -[ATXPBFaceGalleryEvent configuration]((uint64_t)v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ATXFaceGalleryConfiguration initWithProto:](v7, "initWithProto:", v8);

  }
  else
  {
    v9 = 0;
  }
  -[ATXPBFaceGalleryEvent items]((uint64_t)v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    -[ATXPBFaceGalleryEvent items]((uint64_t)v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_23_1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  self = -[ATXFaceGalleryEvent initWithEventType:configuration:items:](self, "initWithEventType:configuration:items:", v6, v9, v15);

  v11 = self;
LABEL_14:

  return v11;
}

ATXFaceGalleryItem *__37__ATXFaceGalleryEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXFaceGalleryItem *v3;

  v2 = a2;
  v3 = -[ATXFaceGalleryItem initWithProto:]([ATXFaceGalleryItem alloc], "initWithProto:", v2);

  return v3;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  -[ATXPBFaceGalleryEvent setEventType:]((uint64_t)v3, -[ATXFaceGalleryEvent eventType](self, "eventType"));
  -[ATXFaceGalleryEvent configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBFaceGalleryEvent setConfiguration:]((uint64_t)v3, v5);

  -[ATXFaceGalleryEvent items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_25_1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = (void *)MEMORY[0x1E0C9AA60];
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  -[ATXPBFaceGalleryEvent setItems:]((uint64_t)v3, v9);

  return v3;
}

uint64_t __28__ATXFaceGalleryEvent_proto__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (ATXFaceGalleryConfiguration)configuration
{
  return self->_configuration;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
