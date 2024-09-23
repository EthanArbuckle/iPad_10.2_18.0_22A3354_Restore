@implementation CLSGroupMember

+ (id)objectIDForGroupID:(id)a3 andPersonID:(id)a4
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
  v3.super_class = (Class)CLSGroupMember;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSGroupMember)initWithCoder:(id)a3
{
  id v4;
  CLSGroupMember *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *personID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSGroupMember;
  v5 = -[CLSObject initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("personID"));
    v8 = objc_claimAutoreleasedReturnValue();
    personID = v5->_personID;
    v5->_personID = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSGroupMember;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_personID, CFSTR("personID"), v6.receiver, v6.super_class);

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
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSGroupMember;
  -[CLSObject dictionaryRepresentation](&v8, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  personID = self->_personID;
  if (personID)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)personID, CFSTR("personID"));
  return v5;
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
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
  block[2] = sub_1D40CF100;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB960 != -1)
    dispatch_once(&qword_1ED0FB960, block);
  return (id)qword_1ED0FB958;
}

@end
