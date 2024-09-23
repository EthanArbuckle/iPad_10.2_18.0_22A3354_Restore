@implementation CLSSurveyStep

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSSurveyStep)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSSurveyStep *v6;
  const char *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSSurveyStep;
  v6 = -[CLSObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v6)
  {
    v6->_version = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("version"));
    v6->_type = objc_msgSend_decodeIntegerForKey_(v4, v7, (uint64_t)CFSTR("type"));
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
  v7.super_class = (Class)CLSSurveyStep;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_version, CFSTR("version"), v7.receiver, v7.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_type, CFSTR("type"));

}

- (int64_t)version
{
  uint64_t v2;
  int64_t version;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  version = self->_version;
  objc_msgSend_unlock(self, v5, v6);
  return version;
}

- (void)setVersion:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_version != a3)
  {
    self->_version = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (int64_t)type
{
  uint64_t v2;
  int64_t type;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  type = self->_type;
  objc_msgSend_unlock(self, v5, v6);
  return type;
}

- (void)setType:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_type != a3)
  {
    self->_type = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (BOOL)validateObject:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLSSurveyStep;
  return -[CLSObject validateObject:](&v4, sel_validateObject_, a3);
}

@end
