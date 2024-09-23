@implementation CLSArchivedQuestionStep

- (CLSArchivedQuestionStep)init
{
  CLSArchivedQuestionStep *v2;
  const char *v3;
  const char *v4;
  const char *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSArchivedQuestionStep;
  v2 = -[CLSObject _init](&v7, sel__init);
  objc_msgSend_setVersion_(v2, v3, 1);
  objc_msgSend_setType_(v2, v4, 1);
  objc_msgSend_setQuestionType_(v2, v5, 0);
  return v2;
}

- (CLSArchivedQuestionStep)initWithQuestionText:(id)a3 answerFormat:(id)a4
{
  id v7;
  id v8;
  id *v9;
  CLSArchivedQuestionStep *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  unint64_t v15;
  const char *v16;
  const char *v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CLSArchivedQuestionStep;
  v9 = -[CLSObject _init](&v19, sel__init);
  v10 = (CLSArchivedQuestionStep *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 17, a3);
    objc_msgSend_setVersion_(v10, v11, 1);
    objc_msgSend_setType_(v10, v12, 1);
    v15 = objc_msgSend_answerFormatType(v8, v13, v14);
    if (v15 >= 5)
      objc_msgSend_setQuestionType_(v10, v16, 1);
    else
      objc_msgSend_setQuestionType_(v10, v16, v15);
    objc_msgSend_addChild_changedPropertyName_(v10, v17, (uint64_t)v8, CFSTR("archivedAnswerFormat"));
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSArchivedQuestionStep)initWithCoder:(id)a3
{
  id v4;
  CLSArchivedQuestionStep *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *questionText;
  const char *v10;
  const char *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLSArchivedQuestionStep;
  v5 = -[CLSArchivedSurveyStep initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("questionText"));
    v8 = objc_claimAutoreleasedReturnValue();
    questionText = v5->_questionText;
    v5->_questionText = (NSString *)v8;

    v5->_displayOrder = objc_msgSend_decodeIntegerForKey_(v4, v10, (uint64_t)CFSTR("displayOrder"));
    v5->_questionType = objc_msgSend_decodeIntegerForKey_(v4, v11, (uint64_t)CFSTR("questionType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSArchivedQuestionStep;
  v4 = a3;
  -[CLSArchivedSurveyStep encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_questionText, CFSTR("questionText"), v8.receiver, v8.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_displayOrder, CFSTR("displayOrder"));
  objc_msgSend_encodeInteger_forKey_(v4, v7, self->_questionType, CFSTR("questionType"));

}

- (CLSArchivedAnswerFormat)archivedAnswerFormat
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend_childrenPassingTest_(self, a2, (uint64_t)&unk_1E9749970);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLSArchivedAnswerFormat *)v5;
}

- (void)setArchivedAnswerFormat:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend_archivedAnswerFormat(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeChild_changedPropertyName_(self, v8, (uint64_t)v7, CFSTR("archivedAnswerFormat"));

  objc_msgSend_addChild_changedPropertyName_(self, v9, (uint64_t)v4, CFSTR("archivedAnswerFormat"));
  v12 = objc_msgSend_answerFormatType(v4, v10, v11);

  if (v12 >= 5)
    v14 = 1;
  else
    v14 = v12;
  objc_msgSend_setQuestionType_(self, v13, v14);
}

- (int64_t)questionType
{
  uint64_t v2;
  int64_t questionType;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  questionType = self->_questionType;
  objc_msgSend_unlock(self, v5, v6);
  return questionType;
}

- (void)setQuestionType:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_questionType != a3)
  {
    self->_questionType = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (int64_t)displayOrder
{
  uint64_t v2;
  int64_t displayOrder;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  displayOrder = self->_displayOrder;
  objc_msgSend_unlock(self, v5, v6);
  return displayOrder;
}

- (void)setDisplayOrder:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_displayOrder != a3)
  {
    self->_displayOrder = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (NSString)questionText
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_questionText;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setQuestionText:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *questionText;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  questionText = self->_questionText;
  v12 = (id)v8;
  if (v8 | (unint64_t)questionText
    && (!v8 || !questionText || (objc_msgSend_isEqualToString_(questionText, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_questionText, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSArray)assets
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->assets, 0);
  objc_storeStrong((id *)&self->_questionText, 0);
}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D407905C;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB590 != -1)
    dispatch_once(&qword_1ED0FB590, block);
  return (id)qword_1ED0FB588;
}

@end
