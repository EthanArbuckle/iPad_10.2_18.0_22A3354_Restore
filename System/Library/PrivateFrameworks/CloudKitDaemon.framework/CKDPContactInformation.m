@implementation CKDPContactInformation

- (BOOL)hasEmailAddress
{
  return self->_emailAddress != 0;
}

- (BOOL)hasContainerScopedUserId
{
  return self->_containerScopedUserId != 0;
}

- (BOOL)hasFirstName
{
  return self->_firstName != 0;
}

- (BOOL)hasLastName
{
  return self->_lastName != 0;
}

- (BOOL)hasPhoneNumber
{
  return self->_phoneNumber != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPContactInformation;
  -[CKDPContactInformation description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  NSString *emailAddress;
  NSString *containerScopedUserId;
  NSString *firstName;
  NSString *lastName;
  NSString *phoneNumber;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  emailAddress = self->_emailAddress;
  if (emailAddress)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)emailAddress, CFSTR("emailAddress"));
  containerScopedUserId = self->_containerScopedUserId;
  if (containerScopedUserId)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)containerScopedUserId, CFSTR("containerScopedUserId"));
  firstName = self->_firstName;
  if (firstName)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)firstName, CFSTR("firstName"));
  lastName = self->_lastName;
  if (lastName)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)lastName, CFSTR("lastName"));
  phoneNumber = self->_phoneNumber;
  if (phoneNumber)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)phoneNumber, CFSTR("phoneNumber"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPContactInformationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_emailAddress)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_containerScopedUserId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_firstName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_lastName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_phoneNumber)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *emailAddress;
  NSString *containerScopedUserId;
  NSString *firstName;
  NSString *lastName;
  NSString *phoneNumber;
  id v11;

  v4 = a3;
  emailAddress = self->_emailAddress;
  v11 = v4;
  if (emailAddress)
  {
    objc_msgSend_setEmailAddress_(v4, v5, (uint64_t)emailAddress);
    v4 = v11;
  }
  containerScopedUserId = self->_containerScopedUserId;
  if (containerScopedUserId)
  {
    objc_msgSend_setContainerScopedUserId_(v11, v5, (uint64_t)containerScopedUserId);
    v4 = v11;
  }
  firstName = self->_firstName;
  if (firstName)
  {
    objc_msgSend_setFirstName_(v11, v5, (uint64_t)firstName);
    v4 = v11;
  }
  lastName = self->_lastName;
  if (lastName)
  {
    objc_msgSend_setLastName_(v11, v5, (uint64_t)lastName);
    v4 = v11;
  }
  phoneNumber = self->_phoneNumber;
  if (phoneNumber)
  {
    objc_msgSend_setPhoneNumber_(v11, v5, (uint64_t)phoneNumber);
    v4 = v11;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_emailAddress, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_containerScopedUserId, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  v18 = objc_msgSend_copyWithZone_(self->_firstName, v17, (uint64_t)a3);
  v19 = (void *)v10[3];
  v10[3] = v18;

  v21 = objc_msgSend_copyWithZone_(self->_lastName, v20, (uint64_t)a3);
  v22 = (void *)v10[4];
  v10[4] = v21;

  v24 = objc_msgSend_copyWithZone_(self->_phoneNumber, v23, (uint64_t)a3);
  v25 = (void *)v10[5];
  v10[5] = v24;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *emailAddress;
  uint64_t v9;
  NSString *containerScopedUserId;
  uint64_t v11;
  NSString *firstName;
  uint64_t v13;
  NSString *lastName;
  uint64_t v15;
  NSString *phoneNumber;
  uint64_t v17;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_12;
  emailAddress = self->_emailAddress;
  v9 = v4[2];
  if ((unint64_t)emailAddress | v9)
  {
    if (!objc_msgSend_isEqual_(emailAddress, v7, v9))
      goto LABEL_12;
  }
  if (((containerScopedUserId = self->_containerScopedUserId,
         v11 = v4[1],
         !((unint64_t)containerScopedUserId | v11))
     || objc_msgSend_isEqual_(containerScopedUserId, v7, v11))
    && ((firstName = self->_firstName, v13 = v4[3], !((unint64_t)firstName | v13))
     || objc_msgSend_isEqual_(firstName, v7, v13))
    && ((lastName = self->_lastName, v15 = v4[4], !((unint64_t)lastName | v15))
     || objc_msgSend_isEqual_(lastName, v7, v15)))
  {
    phoneNumber = self->_phoneNumber;
    v17 = v4[5];
    if ((unint64_t)phoneNumber | v17)
      isEqual = objc_msgSend_isEqual_(phoneNumber, v7, v17);
    else
      isEqual = 1;
  }
  else
  {
LABEL_12:
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;

  v4 = objc_msgSend_hash(self->_emailAddress, a2, v2);
  v7 = objc_msgSend_hash(self->_containerScopedUserId, v5, v6) ^ v4;
  v10 = objc_msgSend_hash(self->_firstName, v8, v9);
  v13 = v7 ^ v10 ^ objc_msgSend_hash(self->_lastName, v11, v12);
  return v13 ^ objc_msgSend_hash(self->_phoneNumber, v14, v15);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v10 = a3;
  v5 = v10[2];
  if (v5)
    objc_msgSend_setEmailAddress_(self, v4, v5);
  v6 = v10[1];
  if (v6)
    objc_msgSend_setContainerScopedUserId_(self, v4, v6);
  v7 = v10[3];
  if (v7)
    objc_msgSend_setFirstName_(self, v4, v7);
  v8 = v10[4];
  if (v8)
    objc_msgSend_setLastName_(self, v4, v8);
  v9 = v10[5];
  if (v9)
    objc_msgSend_setPhoneNumber_(self, v4, v9);

}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddress, a3);
}

- (NSString)containerScopedUserId
{
  return self->_containerScopedUserId;
}

- (void)setContainerScopedUserId:(id)a3
{
  objc_storeStrong((id *)&self->_containerScopedUserId, a3);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_containerScopedUserId, 0);
}

@end
