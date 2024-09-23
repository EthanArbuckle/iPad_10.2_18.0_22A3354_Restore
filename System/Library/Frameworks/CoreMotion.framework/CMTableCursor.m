@implementation CMTableCursor

- (CMTableCursor)initWithDatatype:(unint64_t)a3
{
  CMTableCursor *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMTableCursor;
  v4 = -[CMTableCursor init](&v10, sel_init);
  v4->_cachedLastRecordId = 0;
  v4->_datatype = a3;
  v4->_recordId = 0;
  v4->_tableName = (NSString *)objc_msgSend_string(MEMORY[0x1E0CB3940], v5, v6, v7, v8);
  return v4;
}

- (void)dealloc
{
  NSString *tableName;
  objc_super v4;

  tableName = self->_tableName;
  if (tableName)

  v4.receiver = self;
  v4.super_class = (Class)CMTableCursor;
  -[CMTableCursor dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMTableCursor)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMTableCursor *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CMTableCursor;
  v7 = -[CMTableCursor init](&v18, sel_init);
  if (v7)
  {
    v7->_datatype = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMTableCursorCodingKeyTable"), v5, v6);
    v7->_recordId = objc_msgSend_decodeIntegerForKey_(a3, v8, (uint64_t)CFSTR("kCMTableCursorCodingKeyRecordId"), v9, v10);
    v7->_cachedLastRecordId = objc_msgSend_decodeIntegerForKey_(a3, v11, (uint64_t)CFSTR("kCMTableCursorCodingKeyCachedLastRecordId"), v12, v13);
    v14 = objc_opt_class();
    v7->_tableName = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMTableCursorCodingKeyTableName"), v16);
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_datatype, (uint64_t)CFSTR("kCMTableCursorCodingKeyTable"), v3);
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_recordId, (uint64_t)CFSTR("kCMTableCursorCodingKeyRecordId"), v7);
  objc_msgSend_encodeInteger_forKey_(a3, v8, self->_cachedLastRecordId, (uint64_t)CFSTR("kCMTableCursorCodingKeyCachedLastRecordId"), v9);
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->_tableName, (uint64_t)CFSTR("kCMTableCursorCodingKeyTableName"), v11);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v13 = (_QWORD *)objc_msgSend_initWithDatatype_(v9, v10, self->_datatype, v11, v12);
  v13[4] = objc_msgSend_copyWithZone_(self->_tableName, v14, (uint64_t)a3, v15, v16);
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t RecordId;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v9 = objc_msgSend_datatype(self, v5, v6, v7, v8);
  if (v9 != objc_msgSend_datatype(a3, v10, v11, v12, v13))
    return 0;
  v18 = objc_msgSend_recordId(self, v14, v15, v16, v17);
  if (v18 != objc_msgSend_recordId(a3, v19, v20, v21, v22))
    return 0;
  RecordId = objc_msgSend_cachedLastRecordId(self, v23, v24, v25, v26);
  if (RecordId != objc_msgSend_cachedLastRecordId(a3, v28, v29, v30, v31))
    return 0;
  v36 = (void *)objc_msgSend_tableName(self, v32, v33, v34, v35);
  v41 = objc_msgSend_tableName(a3, v37, v38, v39, v40);
  return objc_msgSend_isEqualToString_(v36, v42, v41, v43, v44);
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = objc_msgSend_datatype(self, a2, v2, v3, v4);
  v11 = objc_msgSend_recordId(self, v7, v8, v9, v10) - v6 + 32 * v6;
  v16 = objc_msgSend_cachedLastRecordId(self, v12, v13, v14, v15) - v11 + 32 * v11;
  v21 = (void *)objc_msgSend_tableName(self, v17, v18, v19, v20);
  return objc_msgSend_hash(v21, v22, v23, v24, v25) - v16 + 32 * v16 + 923521;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t RecordId;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_datatype(self, v6, v7, v8, v9);
  v15 = objc_msgSend_tableName(self, v11, v12, v13, v14);
  v20 = objc_msgSend_recordId(self, v16, v17, v18, v19);
  RecordId = objc_msgSend_cachedLastRecordId(self, v21, v22, v23, v24);
  return (id)objc_msgSend_stringWithFormat_(v3, v26, (uint64_t)CFSTR("%@, <table, %lu, tableName, %@, recordId, %lu, lastRecordId, %lu>"), v27, v28, v5, v10, v15, v20, RecordId);
}

- (unint64_t)recordId
{
  return self->_recordId;
}

- (void)setRecordId:(unint64_t)a3
{
  self->_recordId = a3;
}

- (unint64_t)cachedLastRecordId
{
  return self->_cachedLastRecordId;
}

- (void)setCachedLastRecordId:(unint64_t)a3
{
  self->_cachedLastRecordId = a3;
}

- (unint64_t)datatype
{
  return self->_datatype;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void)setTableName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
