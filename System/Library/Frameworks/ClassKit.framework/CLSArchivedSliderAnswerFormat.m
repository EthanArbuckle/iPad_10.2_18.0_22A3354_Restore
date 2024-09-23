@implementation CLSArchivedSliderAnswerFormat

- (CLSArchivedSliderAnswerFormat)init
{
  CLSArchivedSliderAnswerFormat *v2;
  const char *v3;
  CLSArchivedSliderAnswerFormat *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSArchivedSliderAnswerFormat;
  v2 = -[CLSArchivedAnswerFormat _init](&v6, sel__init);
  v4 = v2;
  if (v2)
  {
    v2->_type = 1;
    v2->_minimum = 0;
    v2->_maximum = 100;
    objc_msgSend_setAnswerFormatType_(v2, v3, 1);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSArchivedSliderAnswerFormat)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSArchivedSliderAnswerFormat *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSString *leadingValueLabel;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSString *trailingValueLabel;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  NSString *midValueLabel;
  const char *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CLSArchivedSliderAnswerFormat;
  v6 = -[CLSArchivedAnswerFormat initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v6)
  {
    v6->_maximum = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("maximum"));
    v6->_minimum = objc_msgSend_decodeIntegerForKey_(v4, v7, (uint64_t)CFSTR("minimum"));
    v8 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, CFSTR("leadingValueLabel"));
    v10 = objc_claimAutoreleasedReturnValue();
    leadingValueLabel = v6->_leadingValueLabel;
    v6->_leadingValueLabel = (NSString *)v10;

    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, CFSTR("trailingValueLabel"));
    v14 = objc_claimAutoreleasedReturnValue();
    trailingValueLabel = v6->_trailingValueLabel;
    v6->_trailingValueLabel = (NSString *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, CFSTR("midValueLabel"));
    v18 = objc_claimAutoreleasedReturnValue();
    midValueLabel = v6->_midValueLabel;
    v6->_midValueLabel = (NSString *)v18;

    v6->_type = objc_msgSend_decodeIntegerForKey_(v4, v20, (uint64_t)CFSTR("type"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLSArchivedSliderAnswerFormat;
  v4 = a3;
  -[CLSArchivedAnswerFormat encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_maximum, CFSTR("maximum"), v11.receiver, v11.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_minimum, CFSTR("minimum"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_leadingValueLabel, CFSTR("leadingValueLabel"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_trailingValueLabel, CFSTR("trailingValueLabel"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_midValueLabel, CFSTR("midValueLabel"));
  objc_msgSend_encodeInteger_forKey_(v4, v10, self->_type, CFSTR("type"));

}

- (int64_t)maximum
{
  uint64_t v2;
  int64_t maximum;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  maximum = self->_maximum;
  objc_msgSend_unlock(self, v5, v6);
  return maximum;
}

- (void)setMaximum:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_maximum != a3)
  {
    self->_maximum = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (int64_t)minimum
{
  uint64_t v2;
  int64_t minimum;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  minimum = self->_minimum;
  objc_msgSend_unlock(self, v5, v6);
  return minimum;
}

- (void)setMinimum:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_minimum != a3)
  {
    self->_minimum = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (NSString)leadingValueLabel
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_leadingValueLabel;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setLeadingValueLabel:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *leadingValueLabel;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  leadingValueLabel = self->_leadingValueLabel;
  v12 = (id)v8;
  if (v8 | (unint64_t)leadingValueLabel
    && (!v8 || !leadingValueLabel || (objc_msgSend_isEqualToString_(leadingValueLabel, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_leadingValueLabel, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)trailingValueLabel
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_trailingValueLabel;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setTrailingValueLabel:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *trailingValueLabel;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  trailingValueLabel = self->_trailingValueLabel;
  v12 = (id)v8;
  if (v8 | (unint64_t)trailingValueLabel
    && (!v8 || !trailingValueLabel || (objc_msgSend_isEqualToString_(trailingValueLabel, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_trailingValueLabel, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)midValueLabel
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_midValueLabel;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setMidValueLabel:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *midValueLabel;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  midValueLabel = self->_midValueLabel;
  v12 = (id)v8;
  if (v8 | (unint64_t)midValueLabel
    && (!v8 || !midValueLabel || (objc_msgSend_isEqualToString_(midValueLabel, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_midValueLabel, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_midValueLabel, 0);
  objc_storeStrong((id *)&self->_trailingValueLabel, 0);
  objc_storeStrong((id *)&self->_leadingValueLabel, 0);
}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D409DC18;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB780 != -1)
    dispatch_once(&qword_1ED0FB780, block);
  return (id)qword_1ED0FB778;
}

@end
