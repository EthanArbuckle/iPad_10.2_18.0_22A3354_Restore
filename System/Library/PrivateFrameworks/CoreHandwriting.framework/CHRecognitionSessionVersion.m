@implementation CHRecognitionSessionVersion

- (CHRecognitionSessionVersion)initWithSessionVersion:(int64_t)a3 sessionResultVersion:(int64_t)a4
{
  CHRecognitionSessionVersion *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHRecognitionSessionVersion;
  result = -[CHRecognitionSessionVersion init](&v7, sel_init);
  if (result)
  {
    result->_sessionVersion = a3;
    result->_sessionResultVersion = a4;
  }
  return result;
}

- (BOOL)isValidSessionVersion
{
  return self->_sessionVersion == 1;
}

- (BOOL)isValidSessionResultVersion
{
  return self->_sessionResultVersion == 4;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend_encodeInteger_forKey_(v10, v4, self->_sessionVersion, (uint64_t)CFSTR("sessionVersion"), v5, v6);
  objc_msgSend_encodeInteger_forKey_(v10, v7, self->_sessionResultVersion, (uint64_t)CFSTR("sessionResultVersion"), v8, v9);

}

- (CHRecognitionSessionVersion)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CHRecognitionSessionVersion *v18;

  v4 = a3;
  v9 = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("sessionVersion"), v6, v7, v8);
  v14 = objc_msgSend_decodeIntegerForKey_(v4, v10, (uint64_t)CFSTR("sessionResultVersion"), v11, v12, v13);
  v18 = (CHRecognitionSessionVersion *)objc_msgSend_initWithSessionVersion_sessionResultVersion_(self, v15, v9, v14, v16, v17);

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)sessionVersion
{
  return self->_sessionVersion;
}

- (int64_t)sessionResultVersion
{
  return self->_sessionResultVersion;
}

@end
