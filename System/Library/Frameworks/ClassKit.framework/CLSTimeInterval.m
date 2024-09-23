@implementation CLSTimeInterval

- (CLSTimeInterval)initWithCoder:(id)a3
{
  id v4;
  CLSTimeInterval *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSDate *startTime;
  const char *v10;
  double v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLSTimeInterval;
  v5 = -[CLSObject initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("startTime"));
    v8 = objc_claimAutoreleasedReturnValue();
    startTime = v5->_startTime;
    v5->_startTime = (NSDate *)v8;

    objc_msgSend_decodeDoubleForKey_(v4, v10, (uint64_t)CFSTR("length"));
    v5->_length = v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSTimeInterval;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_startTime, CFSTR("startTime"), v7.receiver, v7.super_class);
  objc_msgSend_encodeDouble_forKey_(v4, v6, (uint64_t)CFSTR("length"), self->_length);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLSTimeInterval;
  -[CLSObject description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_appendFormat_(v6, v7, (uint64_t)CFSTR(" (startTime: %@)"), self->_startTime);
  objc_msgSend_appendFormat_(v6, v8, (uint64_t)CFSTR(" (length: %f)"), *(_QWORD *)&self->_length);
  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLSTimeInterval;
  -[CLSObject dictionaryRepresentation](&v12, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mediumStringFromDate_(CLSUtil, v4, (uint64_t)self->_startTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)v5, CFSTR("startTime"));

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v7, v8, self->_length);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, CFSTR("length"));

  return v3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (double)length
{
  return self->_length;
}

- (void)setLength:(double)a3
{
  self->_length = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D409DD98;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB790 != -1)
    dispatch_once(&qword_1ED0FB790, block);
  return (id)qword_1ED0FB788;
}

@end
