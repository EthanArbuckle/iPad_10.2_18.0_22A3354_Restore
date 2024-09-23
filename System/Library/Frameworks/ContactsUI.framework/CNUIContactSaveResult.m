@implementation CNUIContactSaveResult

- (CNUIContactSaveResult)initWithSuccess:(BOOL)a3 contact:(id)a4 identifiersOfIssuedSaveRequests:(id)a5
{
  id v9;
  id v10;
  CNUIContactSaveResult *v11;
  CNUIContactSaveResult *v12;
  CNUIContactSaveResult *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CNUIContactSaveResult;
  v11 = -[CNUIContactSaveResult init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_success = a3;
    objc_storeStrong((id *)&v11->_contact, a4);
    objc_storeStrong((id *)&v12->_identifiersOfIssuedSaveRequests, a5);
    v13 = v12;
  }

  return v12;
}

- (BOOL)success
{
  return self->_success;
}

- (CNMutableContact)contact
{
  return self->_contact;
}

- (NSArray)identifiersOfIssuedSaveRequests
{
  return self->_identifiersOfIssuedSaveRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersOfIssuedSaveRequests, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
