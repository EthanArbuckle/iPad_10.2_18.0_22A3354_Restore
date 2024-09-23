@implementation CLSArchivedSurvey

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4055D30;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB358 != -1)
    dispatch_once(&qword_1ED0FB358, block);
  return (id)qword_1ED0FB350;
}

- (CLSArchivedSurvey)initWithType:(int64_t)a3 authorID:(id)a4
{
  id v7;
  CLSArchivedSurvey *v8;
  CLSArchivedSurvey *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CLSArchivedSurvey;
  v8 = -[CLSObject _init](&v11, sel__init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_authorID, a4);
  }

  return v9;
}

- (NSArray)archivedSurveySteps
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (void)addArchivedSurveyStep:(id)a3
{
  objc_msgSend_addChild_changedPropertyName_(self, a2, (uint64_t)a3, CFSTR("archivedSurveySteps"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSArchivedSurvey)initWithCoder:(id)a3
{
  id v4;
  CLSArchivedSurvey *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *authorID;
  const char *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLSArchivedSurvey;
  v5 = -[CLSObject initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("authorID"));
    v12 = objc_claimAutoreleasedReturnValue();
    authorID = v5->_authorID;
    v5->_authorID = (NSString *)v12;

    v5->_type = objc_msgSend_decodeIntegerForKey_(v4, v14, (uint64_t)CFSTR("type"));
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
  v8.super_class = (Class)CLSArchivedSurvey;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_title, CFSTR("title"), v8.receiver, v8.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_authorID, CFSTR("authorID"));
  objc_msgSend_encodeInteger_forKey_(v4, v7, self->_type, CFSTR("type"));

}

- (NSString)title
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_title;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setTitle:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *title;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  title = self->_title;
  v12 = (id)v8;
  if (v8 | (unint64_t)title
    && (!v8 || !title || (objc_msgSend_isEqualToString_(title, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_title, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

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

- (NSString)authorID
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_authorID;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setAuthorID:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *authorID;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  authorID = self->_authorID;
  v12 = (id)v8;
  if (v8 | (unint64_t)authorID
    && (!v8 || !authorID || (objc_msgSend_isEqualToString_(authorID, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_authorID, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorID, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
