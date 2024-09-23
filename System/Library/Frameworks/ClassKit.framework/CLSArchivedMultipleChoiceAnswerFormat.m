@implementation CLSArchivedMultipleChoiceAnswerFormat

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D407A658;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB5E0 != -1)
    dispatch_once(&qword_1ED0FB5E0, block);
  return (id)qword_1ED0FB5D8;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSArchivedMultipleChoiceAnswerFormat;
  return -[CLSArchivedAnswerFormat _init](&v3, sel__init);
}

- (CLSArchivedMultipleChoiceAnswerFormat)initWithType:(int64_t)a3
{
  CLSArchivedMultipleChoiceAnswerFormat *v4;
  const char *v5;
  CLSArchivedMultipleChoiceAnswerFormat *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLSArchivedMultipleChoiceAnswerFormat;
  v4 = -[CLSArchivedAnswerFormat _init](&v9, sel__init);
  v6 = v4;
  if (v4)
  {
    v4->_type = a3;
    v7 = 4;
    if (a3 == 1)
      v7 = 2;
    if (a3)
      objc_msgSend_setAnswerFormatType_(v4, v5, v7);
    else
      objc_msgSend_setAnswerFormatType_(v4, v5, 0);
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSArchivedMultipleChoiceAnswerFormat)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSArchivedMultipleChoiceAnswerFormat *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLSArchivedMultipleChoiceAnswerFormat;
  v6 = -[CLSArchivedAnswerFormat initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v6)
    v6->_type = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("type"));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSArchivedMultipleChoiceAnswerFormat;
  v4 = a3;
  -[CLSArchivedAnswerFormat encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_type, CFSTR("type"), v6.receiver, v6.super_class);

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

- (NSArray)archivedAnswerChoiceItems
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (void)addAnswerItem:(id)a3
{
  objc_msgSend_addChild_changedPropertyName_(self, a2, (uint64_t)a3, CFSTR("archivedAnswerChoiceItems"));
}

@end
