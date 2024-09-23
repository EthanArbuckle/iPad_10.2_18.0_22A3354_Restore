@implementation CLSClassMember

+ (id)objectIDForClassID:(id)a3 andPersonID:(id)a4
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%@%@"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sha224(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSClassMember;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSClassMember)initWithClassID:(id)a3 personID:(id)a4 roles:(unint64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  CLSClassMember *v11;
  void *v12;
  const char *v13;
  const char *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CLSClassMember;
  v11 = -[CLSObject _init](&v16, sel__init);
  if (v11)
  {
    objc_msgSend_objectIDForClassID_andPersonID_(CLSClassMember, v10, (uint64_t)v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObjectID_(v11, v13, (uint64_t)v12);

    objc_msgSend_setParentObjectID_(v11, v14, (uint64_t)v8);
    objc_storeStrong((id *)&v11->_personID, a4);
    v11->_roles = a5;
  }

  return v11;
}

- (CLSClassMember)initWithCoder:(id)a3
{
  id v4;
  CLSClassMember *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *personID;
  const char *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLSClassMember;
  v5 = -[CLSObject initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("personID"));
    v8 = objc_claimAutoreleasedReturnValue();
    personID = v5->_personID;
    v5->_personID = (NSString *)v8;

    v5->_roles = (int)objc_msgSend_decodeInt32ForKey_(v4, v10, (uint64_t)CFSTR("roles"));
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
  v7.super_class = (Class)CLSClassMember;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_personID, CFSTR("personID"), v7.receiver, v7.super_class);
  objc_msgSend_encodeInt32_forKey_(v4, v6, LODWORD(self->_roles), CFSTR("roles"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  void *v5;
  NSString *personID;
  void *v7;
  const char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLSClassMember;
  -[CLSObject dictionaryRepresentation](&v10, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  personID = self->_personID;
  if (personID)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)personID, CFSTR("personID"));
  objc_msgSend_stringForRole_(CLSPerson, v4, self->_roles);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v8, (uint64_t)v7, CFSTR("roles"));

  return v5;
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unint64_t)roles
{
  return self->_roles;
}

- (void)setRoles:(unint64_t)a3
{
  self->_roles = a3;
}

- (BOOL)markedForDeletion
{
  return self->_markedForDeletion;
}

- (void)setMarkedForDeletion:(BOOL)a3
{
  self->_markedForDeletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personID, 0);
}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40A9304;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB800 != -1)
    dispatch_once(&qword_1ED0FB800, block);
  return (id)qword_1ED0FB7F8;
}

@end
