@implementation CLFindMyAccessoryFragmentAccumulator

- (CLFindMyAccessoryFragmentAccumulator)initWithMaxBytesPerUUID:(unint64_t)a3
{
  CLFindMyAccessoryFragmentAccumulator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLFindMyAccessoryFragmentAccumulator;
  v4 = -[CLFindMyAccessoryFragmentAccumulator init](&v6, sel_init);
  if (v4)
  {
    v4->_uuidToData = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_maxBytesPerUUID = a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFindMyAccessoryFragmentAccumulator;
  -[CLFindMyAccessoryFragmentAccumulator dealloc](&v3, sel_dealloc);
}

- (BOOL)clearForUUID:(id)a3
{
  uint64_t v3;

  if (a3)
    objc_msgSend_removeObjectForKey_(self->_uuidToData, a2, (uint64_t)a3, v3);
  return a3 != 0;
}

- (unint64_t)getDataStatusForUUID:(id)a3
{
  uint64_t v3;
  unint64_t result;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  if (!a3)
    return 0;
  result = objc_msgSend_objectForKeyedSubscript_(self->_uuidToData, a2, (uint64_t)a3, v3);
  if (result)
  {
    v9 = (void *)objc_msgSend_objectForKeyedSubscript_(self->_uuidToData, v7, (uint64_t)a3, v8);
    if (objc_msgSend_length(v9, v10, v11, v12) < self->_maxBytesPerUUID)
      return 1;
    else
      return 2;
  }
  return result;
}

- (BOOL)appendData:(id)a3 forUUID:(id)a4
{
  BOOL v4;
  BOOL v5;
  void *v7;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  int64_t maxBytesPerUUID;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;

  if (a3)
    v4 = a4 == 0;
  else
    v4 = 1;
  v5 = !v4;
  if (!v4)
  {
    v7 = a3;
    if (!objc_msgSend_objectForKeyedSubscript_(self->_uuidToData, a2, (uint64_t)a4, (uint64_t)a4))
    {
      v12 = objc_msgSend_data(MEMORY[0x1E0C99DF0], v9, v10, v11);
      objc_msgSend_setObject_forKeyedSubscript_(self->_uuidToData, v13, v12, (uint64_t)a4);
    }
    if (objc_msgSend_length(v7, v9, v10, v11) >= self->_maxBytesPerUUID)
    {
      v47 = objc_msgSend_length(v7, v14, v15, v16);
      v7 = (void *)objc_msgSend_subdataWithRange_(v7, v48, v47 - self->_maxBytesPerUUID, self->_maxBytesPerUUID);
      v45 = objc_msgSend_data(MEMORY[0x1E0C99DF0], v49, v50, v51);
    }
    else
    {
      v17 = (void *)objc_msgSend_objectForKeyedSubscript_(self->_uuidToData, v14, (uint64_t)a4, v16);
      v21 = objc_msgSend_length(v17, v18, v19, v20);
      v28 = objc_msgSend_length(v7, v22, v23, v24) + v21;
      maxBytesPerUUID = self->_maxBytesPerUUID;
      if (v28 <= maxBytesPerUUID)
      {
LABEL_15:
        v52 = (void *)objc_msgSend_objectForKeyedSubscript_(self->_uuidToData, v25, (uint64_t)a4, v27);
        objc_msgSend_appendData_(v52, v53, (uint64_t)v7, v54);
        return v5;
      }
      v30 = maxBytesPerUUID - objc_msgSend_length(v7, v25, v26, v27);
      v33 = (void *)objc_msgSend_objectForKeyedSubscript_(self->_uuidToData, v31, (uint64_t)a4, v32);
      v36 = (void *)objc_msgSend_objectForKeyedSubscript_(self->_uuidToData, v34, (uint64_t)a4, v35);
      v40 = objc_msgSend_length(v36, v37, v38, v39);
      v42 = objc_msgSend_subdataWithRange_(v33, v41, v40 - v30, v30);
      v45 = objc_msgSend_dataWithData_(MEMORY[0x1E0C99DF0], v43, v42, v44);
    }
    objc_msgSend_setObject_forKeyedSubscript_(self->_uuidToData, v46, v45, (uint64_t)a4);
    goto LABEL_15;
  }
  return v5;
}

- (id)dataForUUID:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->_uuidToData, a2, (uint64_t)a3, v3);
}

+ (id)convertDataStatusToString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Data does not exist");
  if (a3 == 1)
    v3 = CFSTR("Data is valid");
  if (a3 == 2)
    return CFSTR("Data exceeded maximum buffer size");
  else
    return (id)v3;
}

- (NSMutableDictionary)uuidToData
{
  return self->_uuidToData;
}

- (void)setUuidToData:(id)a3
{
  self->_uuidToData = (NSMutableDictionary *)a3;
}

- (unint64_t)maxBytesPerUUID
{
  return self->_maxBytesPerUUID;
}

- (void)setMaxBytesPerUUID:(unint64_t)a3
{
  self->_maxBytesPerUUID = a3;
}

@end
