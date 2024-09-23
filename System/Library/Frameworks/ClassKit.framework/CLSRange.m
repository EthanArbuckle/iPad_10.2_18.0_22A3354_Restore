@implementation CLSRange

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D406A3E8;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB3F8 != -1)
    dispatch_once(&qword_1ED0FB3F8, block);
  return (id)qword_1ED0FB3F0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSRange;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSRange)initWithStart:(double)a3 end:(double)a4
{
  CLSRange *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSRange;
  result = -[CLSObject _init](&v7, sel__init);
  if (result)
  {
    result->_start = a3;
    result->_end = a4;
  }
  return result;
}

- (CLSRange)initWithRange:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend_start(v4, v5, v6);
  v8 = v7;
  objc_msgSend_end(v4, v9, v10);
  v12 = v11;

  return (CLSRange *)objc_msgSend_initWithStart_end_(self, v13, v14, v8, v12);
}

- (BOOL)validateObject:(id *)a3
{
  double start;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  double end;
  void *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  void *v23;
  const char *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CLSRange;
  -[CLSObject validateObject:](&v26, sel_validateObject_);
  start = self->_start;
  if (start >= 0.0 && start <= 1.0)
  {
    end = self->_end;
    if (end >= 0.0 && end <= 1.0)
    {
      if (start <= end)
        return 1;
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v19 = (void *)MEMORY[0x1E0CB34D0];
      v20 = objc_opt_class();
      objc_msgSend_bundleForClass_(v19, v21, v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v11, v22, (uint64_t)CFSTR("ERROR_DESCRIPTION_PROGRESS_RANGE_END_BEFORE_START"), &stru_1E974C8A0, CFSTR("ClassKit"));
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v15 = (void *)MEMORY[0x1E0CB34D0];
      v16 = objc_opt_class();
      objc_msgSend_bundleForClass_(v15, v17, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v11, v18, (uint64_t)CFSTR("ERROR_DESCRIPTION_PROGRESS_RANGE_INVALID_END"), &stru_1E974C8A0, CFSTR("ClassKit"));
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = (void *)MEMORY[0x1E0CB34D0];
    v9 = objc_opt_class();
    objc_msgSend_bundleForClass_(v8, v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v11, v12, (uint64_t)CFSTR("ERROR_DESCRIPTION_PROGRESS_RANGE_INVALID_START"), &stru_1E974C8A0, CFSTR("ClassKit"));
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cls_assignError_code_errorObject_description_(v7, v24, (uint64_t)a3, 2, self, v23);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  return (id)MEMORY[0x1E0DE7D20](v7, sel_initWithRange_, self);
}

- (CLSRange)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSRange *v6;
  double v7;
  const char *v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSRange;
  v6 = -[CLSObject initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v6)
  {
    objc_msgSend_decodeDoubleForKey_(v4, v5, (uint64_t)CFSTR("start"));
    v6->_start = v7;
    objc_msgSend_decodeDoubleForKey_(v4, v8, (uint64_t)CFSTR("end"));
    v6->_end = v9;
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
  v7.super_class = (Class)CLSRange;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeDouble_forKey_(v4, v5, (uint64_t)CFSTR("start"), self->_start, v7.receiver, v7.super_class);
  objc_msgSend_encodeDouble_forKey_(v4, v6, (uint64_t)CFSTR("end"), self->_end);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLSRange;
  -[CLSObject dictionaryRepresentation](&v13, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v4, v5, self->_start);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, CFSTR("start"));

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v8, v9, self->_end);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)v10, CFSTR("end"));

  return v3;
}

- (double)delta
{
  return self->_end - self->_start;
}

- (BOOL)overlapsWith:(id)a3
{
  id v4;
  double start;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  BOOL v11;
  double v12;

  v4 = a3;
  start = self->_start;
  objc_msgSend_end(v4, v6, v7);
  if (start <= v10)
  {
    objc_msgSend_start(v4, v8, v9);
    v11 = v12 <= self->_end;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)mergeWithRange:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  id v14;

  v14 = a3;
  objc_msgSend_end(v14, v4, v5);
  if (v8 > self->_end)
  {
    objc_msgSend_end(v14, v6, v7);
    self->_end = v9;
  }
  objc_msgSend_start(v14, v6, v7);
  if (v12 < self->_start)
  {
    objc_msgSend_start(v14, v10, v11);
    self->_start = v13;
  }

}

- (NSString)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLSRange;
  -[CLSObject description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_appendFormat_(v6, v7, (uint64_t)CFSTR("(start: %.2f)"), *(_QWORD *)&self->_start);
  objc_msgSend_appendFormat_(v6, v8, (uint64_t)CFSTR("(end: %.2f)"), *(_QWORD *)&self->_end);
  objc_msgSend_delta(self, v9, v10);
  objc_msgSend_appendFormat_(v6, v11, (uint64_t)CFSTR("(delta: %.2f)"), v12);
  return (NSString *)v6;
}

+ (id)compressOverlappingRanges:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  const char *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend_count(v3, v4, v5) > 1)
  {
    objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v6, (uint64_t)CFSTR("start"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v9;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v36, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingDescriptors_(v3, v12, (uint64_t)v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_opt_new();
    objc_msgSend_firstObject(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = v13;
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v17, (uint64_t)&v31, v35, 16);
    if (v18)
    {
      v20 = v18;
      v21 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v7);
          v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend_overlapsWith_(v23, v19, (uint64_t)v16, (_QWORD)v31))
          {
            objc_msgSend_mergeWithRange_(v16, v24, (uint64_t)v23);
          }
          else
          {
            objc_msgSend_addObject_(v8, v24, (uint64_t)v16);
            v25 = v23;

            v16 = v25;
          }
        }
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v19, (uint64_t)&v31, v35, 16);
      }
      while (v20);
    }

    objc_msgSend_lastObject(v7, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 != v28)
      objc_msgSend_addObject_(v8, v29, (uint64_t)v16);

  }
  else
  {
    v7 = v3;
    v8 = v7;
  }

  return v8;
}

- (double)start
{
  return self->_start;
}

- (void)setStart:(double)a3
{
  self->_start = a3;
}

- (double)end
{
  return self->_end;
}

- (void)setEnd:(double)a3
{
  self->_end = a3;
}

@end
