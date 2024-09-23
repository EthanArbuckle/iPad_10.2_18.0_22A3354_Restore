@implementation AAFamilyMember

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)personIDHash
{
  return self->_personIDHash;
}

- (void)setPersonIDHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)joinDate
{
  return self->_joinDate;
}

- (void)setJoinDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (BOOL)isChild
{
  return self->_isChild;
}

- (void)setIsChild:(BOOL)a3
{
  self->_isChild = a3;
}

- (BOOL)isSharingPurchases
{
  return self->_isSharingPurchases;
}

- (void)setIsSharingPurchases:(BOOL)a3
{
  self->_isSharingPurchases = a3;
}

- (BOOL)isOrganizer
{
  return self->_isOrganizer;
}

- (void)setIsOrganizer:(BOOL)a3
{
  self->_isOrganizer = a3;
}

- (NSString)iTunesNotLinkedMessage
{
  return self->_iTunesNotLinkedMessage;
}

- (void)setITunesNotLinkedMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)linkediTunesAppleID
{
  return self->_linkediTunesAppleID;
}

- (void)setLinkediTunesAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)linkediTunesDSID
{
  return self->_linkediTunesDSID;
}

- (void)setLinkediTunesDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)areParentalControlsEnabled
{
  return self->_areParentalControlsEnabled;
}

- (void)setAreParentalControlsEnabled:(BOOL)a3
{
  self->_areParentalControlsEnabled = a3;
}

- (BOOL)isAskToBuyEnabled
{
  return self->_isAskToBuyEnabled;
}

- (void)setIsAskToBuyEnabled:(BOOL)a3
{
  self->_isAskToBuyEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkediTunesDSID, 0);
  objc_storeStrong((id *)&self->_linkediTunesAppleID, 0);
  objc_storeStrong((id *)&self->_iTunesNotLinkedMessage, 0);
  objc_storeStrong((id *)&self->_joinDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_personIDHash, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end
