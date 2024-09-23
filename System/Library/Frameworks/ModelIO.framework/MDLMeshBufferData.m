@implementation MDLMeshBufferData

- (void)dealloc
{
  MDLMeshBufferZoneDefault *zoneDefault;
  objc_super v4;

  zoneDefault = self->_zoneDefault;
  if (zoneDefault)
    objc_msgSend_cancelMemory_(zoneDefault, a2, self->_length);
  v4.receiver = self;
  v4.super_class = (Class)MDLMeshBufferData;
  -[MDLMeshBufferData dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_allocator, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_zoneDefault, 0);
  objc_storeStrong((id *)&self->_zone, 0);
}

- (id)map
{
  MDLMeshBufferMap *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;

  v3 = [MDLMeshBufferMap alloc];
  v6 = objc_msgSend_mutableBytes(self->_data, v4, v5);
  return (id)objc_msgSend_initWithBytes_deallocator_(v3, v7, v6, 0);
}

- (unint64_t)length
{
  return self->_length;
}

- (MDLMeshBufferData)initWithLength:(unint64_t)a3 data:(id)a4 allocator:(id)a5 zone:(id)a6
{
  id v10;
  id v11;
  id v12;
  MDLMeshBufferData *v13;
  MDLMeshBufferData *v14;
  const char *v15;
  MDLMeshBufferZoneDefault *zoneDefault;
  id v17;
  const char *v18;
  uint64_t v19;
  MDLMeshBufferData *v20;
  NSMutableData *data;
  objc_super v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MDLMeshBufferData;
  v13 = -[MDLMeshBufferData init](&v23, sel_init);
  v14 = v13;
  if (v13
    && ((objc_storeStrong((id *)&v13->_zone, a6),
         objc_storeStrong((id *)&v14->_zoneDefault, v14->_zone),
         (zoneDefault = v14->_zoneDefault) == 0)
     || objc_msgSend_reserveMemory_allocator_(zoneDefault, v15, v14->_length, v11)))
  {
    objc_storeStrong((id *)&v14->_allocator, a5);
    v14->_length = a3;
    v17 = objc_alloc(MEMORY[0x1E0C99DF0]);
    if (v10)
      v19 = objc_msgSend_initWithData_(v17, v18, (uint64_t)v10);
    else
      v19 = objc_msgSend_initWithLength_(v17, v18, a3);
    data = v14->_data;
    v14->_data = (NSMutableData *)v19;

    v20 = v14;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (MDLMeshBufferAllocator)allocator
{
  uint64_t v3;
  void *v4;

  if (!qword_1F03B5198 && !self->_allocator)
  {
    v3 = objc_opt_new();
    v4 = (void *)qword_1F03B5198;
    qword_1F03B5198 = v3;

    objc_storeStrong((id *)&self->_allocator, (id)qword_1F03B5198);
  }
  return self->_allocator;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (id)name
{
  return self->_name;
}

- (NSData)data
{
  return (NSData *)self->_data;
}

- (MDLMeshBufferZone)zone
{
  return (MDLMeshBufferZone *)self->_zone;
}

- (MDLMeshBufferData)initWithType:(MDLMeshBufferType)type length:(NSUInteger)length
{
  MDLMeshBufferData *v6;
  MDLMeshBufferData *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  NSMutableData *data;
  MDLMeshBufferZoneDefault *zone;
  MDLMeshBufferAllocator *allocator;
  MDLMeshBufferData *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MDLMeshBufferData;
  v6 = -[MDLMeshBufferData init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_length = length;
    v8 = objc_alloc(MEMORY[0x1E0C99DF0]);
    v10 = objc_msgSend_initWithLength_(v8, v9, length);
    data = v7->_data;
    v7->_data = (NSMutableData *)v10;

    zone = v7->_zone;
    v7->_zone = 0;

    objc_storeStrong((id *)&v7->_zoneDefault, v7->_zone);
    allocator = v7->_allocator;
    v7->_allocator = 0;

    v7->_type = type;
    v14 = v7;
  }

  return v7;
}

- (MDLMeshBufferData)initWithType:(MDLMeshBufferType)type data:(NSData *)data
{
  NSData *v6;
  const char *v7;
  uint64_t v8;
  MDLMeshBufferData *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSMutableData *v13;
  MDLMeshBufferZoneDefault *zone;
  MDLMeshBufferAllocator *allocator;
  MDLMeshBufferData *v16;
  objc_super v18;

  v6 = data;
  v18.receiver = self;
  v18.super_class = (Class)MDLMeshBufferData;
  v9 = -[MDLMeshBufferData init](&v18, sel_init);
  if (v9)
  {
    v9->_length = objc_msgSend_length(v6, v7, v8);
    v10 = objc_alloc(MEMORY[0x1E0C99DF0]);
    v12 = objc_msgSend_initWithData_(v10, v11, (uint64_t)v6);
    v13 = v9->_data;
    v9->_data = (NSMutableData *)v12;

    zone = v9->_zone;
    v9->_zone = 0;

    objc_storeStrong((id *)&v9->_zoneDefault, v9->_zone);
    allocator = v9->_allocator;
    v9->_allocator = 0;

    v9->_type = type;
    v16 = v9;
  }

  return v9;
}

- (void)fillData:(id)a3 offset:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t length;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const void *v16;
  unint64_t v17;
  id v18;

  v6 = a3;
  v9 = objc_msgSend_length(v6, v7, v8);
  length = self->_length;
  v13 = objc_msgSend_mutableBytes(self->_data, v11, v12);
  v18 = objc_retainAutorelease(v6);
  v16 = (const void *)objc_msgSend_bytes(v18, v14, v15);
  v17 = v9 + a4 - length;
  if (v9 + a4 < length)
    v17 = 0;
  memcpy((void *)(v13 + a4), v16, v17 + v9);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;

  v4 = (void *)objc_msgSend_allocWithZone_(MDLMeshBufferData, a2, (uint64_t)a3);
  return (id)objc_msgSend_initWithLength_data_allocator_zone_(v4, v5, self->_length, self->_data, self->_allocator, 0);
}

@end
