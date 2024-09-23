@implementation LACADMUser

- (BOOL)isMemberOfGroupWithName:(id)a3
{
  return 0;
}

+ (id)allLocalUsers
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)currentUser
{
  return 0;
}

+ (id)rootUser
{
  return 0;
}

+ (id)findUserByID:(unint64_t)a3 searchParent:(BOOL)a4
{
  return 0;
}

+ (id)findUserByName:(id)a3 searchParent:(BOOL)a4
{
  return 0;
}

+ (BOOL)isUserNameUnique:(id)a3 searchParent:(BOOL)a4
{
  return 0;
}

+ (BOOL)shouldDisplayUser:(id)a3
{
  return 0;
}

+ (id)namesFromUsersWithUIDs:(id)a3
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)namesFromUsersWithUIDs:(id)a3 presentInGroupWithName:(id)a4
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (BOOL)isAdministrator
{
  return self->_isAdministrator;
}

- (BOOL)isDirectAdministrator
{
  return self->_isDirectAdministrator;
}

- (BOOL)isGuestUser
{
  return self->_isGuestUser;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (int64_t)userID
{
  return self->_userID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
}

@end
