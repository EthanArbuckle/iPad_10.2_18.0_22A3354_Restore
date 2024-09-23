@implementation ATXContactRelationshipsCollector

- (ATXContactRelationshipsCollector)initWithContactStore:(id)a3
{
  id v4;
  ATXContactRelationshipsCollector *v5;
  uint64_t v6;
  NSSet *cnContactIdsOfEmergencyContacts;
  uint64_t v8;
  NSSet *vipContactEmailAddresses;
  uint64_t v10;
  NSSet *cnContactIdsOfICloudFamilyMembers;
  uint64_t v12;
  NSSet *cnContactIdsOfFavoriteContacts;
  uint64_t v14;
  NSSet *cnContactIdsOfPinnedChatsInMessage;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATXContactRelationshipsCollector;
  v5 = -[ATXContactRelationshipsCollector init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CF8D48], "cnContactIdsOfEmergencyContacts");
    v6 = objc_claimAutoreleasedReturnValue();
    cnContactIdsOfEmergencyContacts = v5->_cnContactIdsOfEmergencyContacts;
    v5->_cnContactIdsOfEmergencyContacts = (NSSet *)v6;

    objc_msgSend(MEMORY[0x1E0CF8D48], "vipContactEmailAddresses");
    v8 = objc_claimAutoreleasedReturnValue();
    vipContactEmailAddresses = v5->_vipContactEmailAddresses;
    v5->_vipContactEmailAddresses = (NSSet *)v8;

    objc_msgSend(MEMORY[0x1E0CF8D48], "cnContactIdsOfICloudFamilyMembers");
    v10 = objc_claimAutoreleasedReturnValue();
    cnContactIdsOfICloudFamilyMembers = v5->_cnContactIdsOfICloudFamilyMembers;
    v5->_cnContactIdsOfICloudFamilyMembers = (NSSet *)v10;

    objc_msgSend(MEMORY[0x1E0CF8D48], "cnContactIdsOfFavoriteContactsWithContactStore:", v4);
    v12 = objc_claimAutoreleasedReturnValue();
    cnContactIdsOfFavoriteContacts = v5->_cnContactIdsOfFavoriteContacts;
    v5->_cnContactIdsOfFavoriteContacts = (NSSet *)v12;

    v14 = objc_opt_new();
    cnContactIdsOfPinnedChatsInMessage = v5->_cnContactIdsOfPinnedChatsInMessage;
    v5->_cnContactIdsOfPinnedChatsInMessage = (NSSet *)v14;

  }
  return v5;
}

- (NSSet)cnContactIdsOfEmergencyContacts
{
  return self->_cnContactIdsOfEmergencyContacts;
}

- (NSSet)vipContactEmailAddresses
{
  return self->_vipContactEmailAddresses;
}

- (NSSet)cnContactIdsOfICloudFamilyMembers
{
  return self->_cnContactIdsOfICloudFamilyMembers;
}

- (NSSet)cnContactIdsOfFavoriteContacts
{
  return self->_cnContactIdsOfFavoriteContacts;
}

- (NSSet)cnContactIdsOfPinnedChatsInMessage
{
  return self->_cnContactIdsOfPinnedChatsInMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cnContactIdsOfPinnedChatsInMessage, 0);
  objc_storeStrong((id *)&self->_cnContactIdsOfFavoriteContacts, 0);
  objc_storeStrong((id *)&self->_cnContactIdsOfICloudFamilyMembers, 0);
  objc_storeStrong((id *)&self->_vipContactEmailAddresses, 0);
  objc_storeStrong((id *)&self->_cnContactIdsOfEmergencyContacts, 0);
}

@end
