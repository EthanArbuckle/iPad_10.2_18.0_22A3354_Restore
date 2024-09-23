@implementation CLSArchivedOpenResponseAnswerFormat

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D408CB7C;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB6E8 != -1)
    dispatch_once(&qword_1ED0FB6E8, block);
  return (id)qword_1ED0FB6E0;
}

- (CLSArchivedOpenResponseAnswerFormat)initWithType:(int64_t)a3
{
  CLSArchivedOpenResponseAnswerFormat *v4;
  const char *v5;
  CLSArchivedOpenResponseAnswerFormat *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSArchivedOpenResponseAnswerFormat;
  v4 = -[CLSArchivedAnswerFormat _init](&v8, sel__init);
  v6 = v4;
  if (v4)
  {
    v4->_type = a3;
    v4->_minimumTextLength = 0;
    v4->_maximumTextLength = 1600;
    objc_msgSend_setAnswerFormatType_(v4, v5, 3);
  }
  return v6;
}

- (CLSArchivedOpenResponseAnswerFormat)initWithType:(int64_t)a3 starterText:(id)a4 minimumLength:(int64_t)a5 maximumLength:(int64_t)a6
{
  id v11;
  const char *v12;
  uint64_t v13;
  CLSArchivedOpenResponseAnswerFormat *v14;

  v11 = a4;
  v13 = objc_msgSend_initWithType_(self, v12, a3);
  v14 = (CLSArchivedOpenResponseAnswerFormat *)v13;
  if (v13)
  {
    objc_storeStrong((id *)(v13 + 128), a4);
    v14->_minimumTextLength = a5;
    v14->_maximumTextLength = a6;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSArchivedOpenResponseAnswerFormat)initWithCoder:(id)a3
{
  id v4;
  CLSArchivedOpenResponseAnswerFormat *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *teacherProvidedText;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLSArchivedOpenResponseAnswerFormat;
  v5 = -[CLSArchivedAnswerFormat initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("teacherProvidedText"));
    v8 = objc_claimAutoreleasedReturnValue();
    teacherProvidedText = v5->_teacherProvidedText;
    v5->_teacherProvidedText = (NSString *)v8;

    v5->_minimumTextLength = objc_msgSend_decodeIntegerForKey_(v4, v10, (uint64_t)CFSTR("minimumTextLength"));
    v5->_maximumTextLength = objc_msgSend_decodeIntegerForKey_(v4, v11, (uint64_t)CFSTR("maximumTextLength"));
    v5->_type = objc_msgSend_decodeIntegerForKey_(v4, v12, (uint64_t)CFSTR("type"));
    v5->_allowsMultimedia = objc_msgSend_decodeBoolForKey_(v4, v13, (uint64_t)CFSTR("allowsMultimedia"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLSArchivedOpenResponseAnswerFormat;
  v4 = a3;
  -[CLSArchivedAnswerFormat encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_minimumTextLength, CFSTR("minimumTextLength"), v10.receiver, v10.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_maximumTextLength, CFSTR("maximumTextLength"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_teacherProvidedText, CFSTR("teacherProvidedText"));
  objc_msgSend_encodeInteger_forKey_(v4, v8, self->_type, CFSTR("type"));
  objc_msgSend_encodeBool_forKey_(v4, v9, self->_allowsMultimedia, CFSTR("allowsMultimedia"));

}

- (int64_t)maximumTextLength
{
  uint64_t v2;
  int64_t maximumTextLength;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  maximumTextLength = self->_maximumTextLength;
  objc_msgSend_unlock(self, v5, v6);
  return maximumTextLength;
}

- (void)setMaximumTextLength:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_maximumTextLength != a3)
  {
    self->_maximumTextLength = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (int64_t)minimumTextLength
{
  uint64_t v2;
  int64_t minimumTextLength;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  minimumTextLength = self->_minimumTextLength;
  objc_msgSend_unlock(self, v5, v6);
  return minimumTextLength;
}

- (void)setMinimum:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_minimumTextLength != a3)
  {
    self->_minimumTextLength = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (NSString)teacherProvidedText
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_teacherProvidedText;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setTeacherProvidedText:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *teacherProvidedText;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  teacherProvidedText = self->_teacherProvidedText;
  v12 = (id)v8;
  if (v8 | (unint64_t)teacherProvidedText
    && (!v8
     || !teacherProvidedText
     || (objc_msgSend_isEqualToString_(teacherProvidedText, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_teacherProvidedText, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)setAllowsMultimedia:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend_lock(self, a2, a3);
  if (self->_allowsMultimedia != v3)
  {
    self->_allowsMultimedia = v3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (BOOL)allowsMultimedia
{
  uint64_t v2;
  BOOL allowsMultimedia;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  allowsMultimedia = self->_allowsMultimedia;
  objc_msgSend_unlock(self, v5, v6);
  return allowsMultimedia;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setMinimumTextLength:(int64_t)a3
{
  self->_minimumTextLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teacherProvidedText, 0);
}

@end
