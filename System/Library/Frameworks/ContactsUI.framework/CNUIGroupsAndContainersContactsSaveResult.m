@implementation CNUIGroupsAndContainersContactsSaveResult

- (CNUIGroupsAndContainersContactsSaveResult)initWithSuccess:(BOOL)a3 error:(id)a4 addedContacts:(id)a5
{
  id v9;
  id v10;
  CNUIGroupsAndContainersContactsSaveResult *v11;
  CNUIGroupsAndContainersContactsSaveResult *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CNUIGroupsAndContainersContactsSaveResult;
  v11 = -[CNUIGroupsAndContainersContactsSaveResult init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_saveDidSucceed = a3;
    objc_storeStrong((id *)&v11->_error, a4);
    objc_storeStrong((id *)&v12->_addedContacts, a5);
  }

  return v12;
}

- (BOOL)saveDidSucceed
{
  return self->_saveDidSucceed;
}

- (NSError)error
{
  return self->_error;
}

- (NSArray)addedContacts
{
  return self->_addedContacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedContacts, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
