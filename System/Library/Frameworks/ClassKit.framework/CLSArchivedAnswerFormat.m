@implementation CLSArchivedAnswerFormat

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSArchivedAnswerFormat;
  return -[CLSObject _init](&v3, sel__init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSArchivedAnswerFormat)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSArchivedAnswerFormat *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLSArchivedAnswerFormat;
  v6 = -[CLSObject initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v6)
    v6->_answerFormatType = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("answerFormatType"));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSArchivedAnswerFormat;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_answerFormatType, CFSTR("answerFormatType"), v6.receiver, v6.super_class);

}

- (int64_t)answerFormatType
{
  uint64_t v2;
  int64_t answerFormatType;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  answerFormatType = self->_answerFormatType;
  objc_msgSend_unlock(self, v5, v6);
  return answerFormatType;
}

- (void)setAnswerFormatType:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_answerFormatType != a3)
  {
    self->_answerFormatType = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

@end
