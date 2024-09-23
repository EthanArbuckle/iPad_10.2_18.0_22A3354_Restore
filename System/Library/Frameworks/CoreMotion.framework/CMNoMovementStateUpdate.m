@implementation CMNoMovementStateUpdate

- (CMNoMovementStateUpdate)initWithState:(int64_t)a3 startTime:(double)a4
{
  CMNoMovementStateUpdate *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMNoMovementStateUpdate;
  result = -[CMNoMovementStateUpdate init](&v7, sel_init);
  if (result)
  {
    result->_state = a3;
    result->_startTime = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMNoMovementStateUpdate)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMNoMovementStateUpdate *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CMNoMovementStateUpdate;
  v7 = -[CMNoMovementStateUpdate init](&v13, sel_init);
  if (v7)
  {
    v7->_state = (int)objc_msgSend_decodeIntForKey_(a3, v4, (uint64_t)CFSTR("kCMNoMovementCodingKeyState"), v5, v6);
    objc_msgSend_decodeDoubleForKey_(a3, v8, (uint64_t)CFSTR("kCMNoMovementCodingKeyStartTime"), v9, v10);
    v7->_startTime = v11;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend_encodeInt_forKey_(a3, a2, LODWORD(self->_state), (uint64_t)CFSTR("kCMNoMovementCodingKeyState"), v3);
  objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("kCMNoMovementCodingKeyStartTime"), v7, v8, self->_startTime);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = (void *)objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_state(self, v10, v11, v12, v13);
  objc_msgSend_startTime(self, v15, v16, v17, v18);
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithState_startTime_, v14, v19, v20);
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
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v9 = objc_msgSend_state(self, v5, v6, v7, v8);
  if (v9 != objc_msgSend_state(a3, v10, v11, v12, v13))
    return 0;
  objc_msgSend_startTime(self, v14, v15, v16, v17);
  v19 = v18;
  objc_msgSend_startTime(a3, v20, v21, v22, v23);
  return v19 == v24;
}

- (int64_t)state
{
  return self->_state;
}

- (double)startTime
{
  return self->_startTime;
}

@end
