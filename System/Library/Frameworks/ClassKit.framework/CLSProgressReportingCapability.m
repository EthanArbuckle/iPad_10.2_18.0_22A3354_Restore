@implementation CLSProgressReportingCapability

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSProgressReportingCapability;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSProgressReportingCapability)initWithKind:(CLSProgressReportingCapabilityKind)kind details:(NSString *)details
{
  NSString *v6;
  CLSProgressReportingCapability *v7;
  const char *v8;
  uint64_t v9;
  CLSProgressReportingCapability *v10;
  uint64_t v11;
  NSString *v12;
  objc_super v14;

  v6 = details;
  v14.receiver = self;
  v14.super_class = (Class)CLSProgressReportingCapability;
  v7 = -[CLSObject _init](&v14, sel__init);
  v10 = v7;
  if (v7)
  {
    v7->_kind = kind;
    v11 = objc_msgSend_copy(v6, v8, v9);
    v12 = v10->_details;
    v10->_details = (NSString *)v11;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSProgressReportingCapability)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSProgressReportingCapability *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *details;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLSProgressReportingCapability;
  v6 = -[CLSObject initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v6)
  {
    v6->_kind = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("kind"));
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, CFSTR("details"));
    v9 = objc_claimAutoreleasedReturnValue();
    details = v6->_details;
    v6->_details = (NSString *)v9;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSProgressReportingCapability;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_kind, CFSTR("kind"), v7.receiver, v7.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_details, CFSTR("details"));

}

- (BOOL)validateObject:(id *)a3
{
  const char *v4;
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSProgressReportingCapability;
  v5 = -[CLSObject validateObject:](&v7, sel_validateObject_, a3);
  if (v5)
    objc_msgSend_setAppIdentifier_(self, v4, 0);
  return v5;
}

- (void)mergeWithObject:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  const char *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  const char *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39.receiver = self;
    v39.super_class = (Class)CLSProgressReportingCapability;
    -[CLSObject mergeWithObject:](&v39, sel_mergeWithObject_, v4);
    v5 = (void *)objc_opt_new();
    objc_msgSend_dateLastModified(self, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v11 = (void *)v8;
      objc_msgSend_dateLastModified(v4, v9, v10);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v15 = (void *)v12;
        objc_msgSend_dateLastModified(self, v13, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dateLastModified(v4, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend_compare_(v16, v20, (uint64_t)v19);

        if (v21 == -1)
        {
          objc_msgSend_addObject_(v5, v22, (uint64_t)CFSTR("kind"));
          objc_msgSend_addObject_(v5, v23, (uint64_t)CFSTR("details"));
          objc_msgSend_addObject_(v5, v24, (uint64_t)CFSTR("dateLastModified"));
        }
      }
      else
      {

      }
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v25 = v5;
    v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v35, v40, 16);
    if (v27)
    {
      v29 = v27;
      v30 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v36 != v30)
            objc_enumerationMutation(v25);
          v32 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend_valueForKey_(v4, v28, v32, (_QWORD)v35);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setValue_forKey_(self, v34, (uint64_t)v33, v32);

        }
        v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v35, v40, 16);
      }
      while (v29);
    }

  }
}

- (NSString)description
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  unint64_t kind;
  const char *v9;
  objc_super v11;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v11.receiver = self;
  v11.super_class = (Class)CLSProgressReportingCapability;
  -[CLSObject description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_initWithString_(v3, v5, (uint64_t)v4);

  kind = self->_kind;
  if (kind > 4)
    objc_msgSend_appendFormat_(v6, v7, (uint64_t)CFSTR(" (kind: %@)"), 0);
  else
    objc_msgSend_appendFormat_(v6, v7, (uint64_t)CFSTR(" (kind: %@)"), off_1E974A7B8[kind]);
  objc_msgSend_appendFormat_(v6, v9, (uint64_t)CFSTR(" (details: %@)"), self->_details);
  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  void *v5;
  unint64_t kind;
  const char *v7;
  void *v8;
  const char *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLSProgressReportingCapability;
  -[CLSObject dictionaryRepresentation](&v11, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  kind = self->_kind;
  if (kind > 4)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v4, 0, CFSTR("kind"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)off_1E974A7B8[kind], CFSTR("kind"));
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("%@"), self->_details);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v9, (uint64_t)v8, CFSTR("details"));

  return v5;
}

- (CLSProgressReportingCapabilityKind)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (NSString)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D409DEC4;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB7A0 != -1)
    dispatch_once(&qword_1ED0FB7A0, block);
  return (id)qword_1ED0FB798;
}

@end
