@implementation CLSHandoutRecipient

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSHandoutRecipient;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSHandoutRecipient)initWithClassID:(id)a3 personID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  CLSHandoutRecipient *v10;
  uint64_t v11;
  NSString *classID;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *personID;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CLSHandoutRecipient;
  v10 = -[CLSObject _init](&v18, sel__init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v6, v8, v9);
    classID = v10->_classID;
    v10->_classID = (NSString *)v11;

    v15 = objc_msgSend_copy(v7, v13, v14);
    personID = v10->_personID;
    v10->_personID = (NSString *)v15;

  }
  return v10;
}

- (BOOL)validateObject:(id *)a3
{
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLSHandoutRecipient;
  v5 = -[CLSObject validateObject:](&v17, sel_validateObject_);
  if (v5)
  {
    if (objc_msgSend_length(self->_classID, v6, v7))
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = (void *)MEMORY[0x1E0CB34D0];
      v10 = objc_opt_class();
      objc_msgSend_bundleForClass_(v9, v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v12, v13, (uint64_t)CFSTR("ERROR_DESCRIPTION_HANDOUT_RECIPIENT_NO_ROSTER_ID"), &stru_1E974C8A0, CFSTR("ClassKit"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cls_assignError_code_errorObject_description_(v8, v15, (uint64_t)a3, 2, self, v14);

      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (CLSHandoutRecipient)initWithCoder:(id)a3
{
  id v4;
  CLSHandoutRecipient *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *personID;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *classID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLSHandoutRecipient;
  v5 = -[CLSObject initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("personID"));
    v8 = objc_claimAutoreleasedReturnValue();
    personID = v5->_personID;
    v5->_personID = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("classID"));
    v12 = objc_claimAutoreleasedReturnValue();
    classID = v5->_classID;
    v5->_classID = (NSString *)v12;

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
  v7.super_class = (Class)CLSHandoutRecipient;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_classID, CFSTR("classID"), v7.receiver, v7.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_personID, CFSTR("personID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CLSHandoutRecipient;
  -[CLSObject description](&v19, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_classID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR(" (%@)"), v9);

  objc_msgSend_personID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_personID(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v17, (uint64_t)CFSTR(" (%@)"), v16);

  }
  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  const char *v5;
  NSString *personID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSHandoutRecipient;
  -[CLSObject dictionaryRepresentation](&v8, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)self->_classID, CFSTR("classID"));
  personID = self->_personID;
  if (personID)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v5, (uint64_t)personID, CFSTR("personID"));
  return v3;
}

- (NSString)classID
{
  return self->_classID;
}

- (void)setClassID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_classID, 0);
}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4074480;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB480 != -1)
    dispatch_once(&qword_1ED0FB480, block);
  return (id)qword_1ED0FB478;
}

@end
