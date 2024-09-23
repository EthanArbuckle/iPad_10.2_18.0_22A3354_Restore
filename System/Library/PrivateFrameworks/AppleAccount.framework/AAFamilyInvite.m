@implementation AAFamilyInvite

- (BOOL)isEqual:(id)a3
{
  AAFamilyInvite *v4;
  void *v5;
  char v6;

  v4 = (AAFamilyInvite *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AAFamilyInvite code](v4, "code");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", self->_code);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_code, "hash");
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)organizerFirstName
{
  return self->_organizerFirstName;
}

- (void)setOrganizerFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)organizerLastName
{
  return self->_organizerLastName;
}

- (void)setOrganizerLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)organizerEmail
{
  return self->_organizerEmail;
}

- (void)setOrganizerEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)organizerDSID
{
  return self->_organizerDSID;
}

- (void)setOrganizerDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)recepientDSID
{
  return self->_recepientDSID;
}

- (void)setRecepientDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isChildTransferInvite
{
  return self->_isChildTransferInvite;
}

- (void)setIsChildTransferInvite:(BOOL)a3
{
  self->_isChildTransferInvite = a3;
}

- (NSString)childFirstName
{
  return self->_childFirstName;
}

- (void)setChildFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)childLastName
{
  return self->_childLastName;
}

- (void)setChildLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childLastName, 0);
  objc_storeStrong((id *)&self->_childFirstName, 0);
  objc_storeStrong((id *)&self->_recepientDSID, 0);
  objc_storeStrong((id *)&self->_organizerDSID, 0);
  objc_storeStrong((id *)&self->_organizerEmail, 0);
  objc_storeStrong((id *)&self->_organizerLastName, 0);
  objc_storeStrong((id *)&self->_organizerFirstName, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

@end
