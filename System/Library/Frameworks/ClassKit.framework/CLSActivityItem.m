@implementation CLSActivityItem

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSActivityItem;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSActivityItem)initWithIdentifier:(id)a3 title:(id)a4
{
  id v7;
  id v8;
  id *v9;
  CLSActivityItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CLSActivityItem;
  v9 = -[CLSObject _init](&v12, sel__init);
  v10 = (CLSActivityItem *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 14, a3);
    objc_storeStrong((id *)&v10->_title, a4);
  }

  return v10;
}

- (CLSActivityItem)initWithCoder:(id)a3
{
  id v4;
  CLSActivityItem *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *title;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLSActivityItem;
  v5 = -[CLSObject initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("title"));
    v12 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v12;

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
  v7.super_class = (Class)CLSActivityItem;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_identifier, CFSTR("identifier"), v7.receiver, v7.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_title, CFSTR("title"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  objc_super v29;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v29.receiver = self;
  v29.super_class = (Class)CLSActivityItem;
  -[CLSObject description](&v29, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_initWithString_(v3, v5, (uint64_t)v4);

  objc_msgSend_title(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v9, v10, v11))
  {
    v14 = objc_msgSend_UTF8String(v9, v12, v13);
    objc_msgSend_appendFormat_(v6, v15, (uint64_t)CFSTR(" (title: %.512s)"), v14);
  }
  objc_msgSend_identifier(self, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_length(v16, v17, v18);

  if (v19)
  {
    objc_msgSend_identifier(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_UTF8String(v22, v23, v24);
    objc_msgSend_appendFormat_(v6, v26, (uint64_t)CFSTR(" (identifier: %.512s)"), v25);

  }
  v27 = (void *)objc_msgSend_copy(v6, v20, v21);

  return (NSString *)v27;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  void *v5;
  NSString *identifier;
  const char *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLSActivityItem;
  -[CLSObject dictionaryRepresentation](&v10, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)identifier, CFSTR("identifier"));
  objc_msgSend_title(self, v4, (uint64_t)identifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v7, (uint64_t)v8, CFSTR("title"));

  return v5;
}

- (BOOL)validateObject:(id *)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  BOOL v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  unint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  void *v42;
  const char *v43;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)CLSActivityItem;
  if (!-[CLSObject validateObject:](&v45, sel_validateObject_))
    return 0;
  if ((objc_msgSend_isDeleted(self, v5, v6) & 1) == 0)
  {
    if ((unint64_t)objc_msgSend_length(self->_identifier, v7, v8) >= 0x100)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (void *)MEMORY[0x1E0CB34D0];
      v14 = objc_opt_class();
      objc_msgSend_bundleForClass_(v13, v15, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v16, v17, (uint64_t)CFSTR("ERROR_DESCRIPTION_ACTIVITY_ITEM_IDENTIFIER_TOO_LONG_FORMAT"), &stru_1E974C8A0, CFSTR("ClassKit"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v12, v19, (uint64_t)v18, 256);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E0CB35C8], v21, (uint64_t)a3, 2, self, v20);
      v9 = 0;
LABEL_13:

      return v9;
    }
    objc_msgSend_title(self, v10, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_length(v20, v22, v23);
    v9 = v24 < 0x101;
    if (v24 >= 0x101)
    {
      v27 = (void *)MEMORY[0x1E0CB3940];
      v28 = (void *)MEMORY[0x1E0CB34D0];
      v29 = objc_opt_class();
      objc_msgSend_bundleForClass_(v28, v30, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v31, v32, (uint64_t)CFSTR("ERROR_DESCRIPTION_ACTIVITY_ITEM_TITLE_TOO_LONG_FORMAT"), &stru_1E974C8A0, CFSTR("ClassKit"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v27, v34, (uint64_t)v33, 256);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E0CB35C8], v36, (uint64_t)a3, 2, self, v35);
    }
    else
    {
      if (objc_msgSend_length(v20, v25, v26))
      {
        v9 = 1;
        goto LABEL_13;
      }
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v38 = (void *)MEMORY[0x1E0CB34D0];
      v39 = objc_opt_class();
      objc_msgSend_bundleForClass_(v38, v40, v39);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v35, v41, (uint64_t)CFSTR("ERROR_DESCRIPTION_ACTIVITY_ITEM_NO_TITLE"), &stru_1E974C8A0, CFSTR("ClassKit"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cls_assignError_code_errorObject_description_(v37, v43, (uint64_t)a3, 2, self, v42);

    }
    goto LABEL_13;
  }
  return 1;
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

- (void)setTitle:(NSString *)title
{
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  const char *v11;
  id v12;

  v5 = title;
  objc_msgSend_lock(self, v6, v7);
  v8 = v5;
  v10 = self->_title;
  v12 = (id)v8;
  if (v8 | (unint64_t)v10
    && (!v8 || !v10 || (objc_msgSend_isEqualToString_(v10, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_title, title);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D407949C;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB5B0 != -1)
    dispatch_once(&qword_1ED0FB5B0, block);
  return (id)qword_1ED0FB5A8;
}

@end
