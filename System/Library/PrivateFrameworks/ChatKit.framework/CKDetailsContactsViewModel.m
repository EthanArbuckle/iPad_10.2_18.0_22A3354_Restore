@implementation CKDetailsContactsViewModel

+ (id)descriptorForContactRequiredKeys
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (CKDetailsContactsViewModel)initWithEntity:(id)a3 locationString:(id)a4 tuConversationStatusIsActive:(BOOL)a5 callType:(int64_t)a6 showsLocation:(BOOL)a7 showsMessageButton:(BOOL)a8 showsFaceTimeVideoButton:(BOOL)a9 showsPhoneButton:(BOOL)a10 showsScreenSharingButton:(BOOL)a11 contact:(id)a12 isPendingRecipient:(BOOL)a13 verified:(BOOL)a14 isSatellite:(BOOL)a15 showsTUConversationStatus:(BOOL)a16
{
  _BOOL8 v16;
  _BOOL8 v17;
  _BOOL8 v19;
  id v22;
  id v23;
  id v24;
  CKDetailsContactsViewModel *v25;
  CKDetailsContactsViewModel *v26;
  void *v27;
  void *v28;

  v16 = a8;
  v17 = a7;
  v19 = a5;
  v22 = a3;
  v23 = a4;
  v24 = a12;
  v25 = -[CKDetailsContactsViewModel init](self, "init");
  v26 = v25;
  if (v25)
  {
    -[CKDetailsContactsViewModel setEntity:](v25, "setEntity:", v22);
    objc_msgSend(v22, "rawAddress");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsViewModel setPreferredHandle:](v26, "setPreferredHandle:", v27);

    objc_msgSend(v22, "fullName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsViewModel setEntityName:](v26, "setEntityName:", v28);

    -[CKDetailsContactsViewModel setLocationString:](v26, "setLocationString:", v23);
    -[CKDetailsContactsViewModel setTuConversationStatusIsActive:](v26, "setTuConversationStatusIsActive:", v19);
    -[CKDetailsContactsViewModel setCallType:](v26, "setCallType:", a6);
    -[CKDetailsContactsViewModel setShowsLocation:](v26, "setShowsLocation:", v17);
    -[CKDetailsContactsViewModel setShowsMessageButton:](v26, "setShowsMessageButton:", v16);
    -[CKDetailsContactsViewModel setShowsFaceTimeVideoButton:](v26, "setShowsFaceTimeVideoButton:", a9);
    -[CKDetailsContactsViewModel setShowsPhoneButton:](v26, "setShowsPhoneButton:", a10);
    -[CKDetailsContactsViewModel setShowsScreenSharingButton:](v26, "setShowsScreenSharingButton:", a11);
    -[CKDetailsContactsViewModel setContact:](v26, "setContact:", v24);
    -[CKDetailsContactsViewModel setIsPendingRecipient:](v26, "setIsPendingRecipient:", a13);
    -[CKDetailsContactsViewModel setVerified:](v26, "setVerified:", a14);
    -[CKDetailsContactsViewModel setIsSatellite:](v26, "setIsSatellite:", a15);
    -[CKDetailsContactsViewModel setShowsTUConversationStatus:](v26, "setShowsTUConversationStatus:", a16);
  }

  return v26;
}

- (NSString)preferredHandle
{
  return self->_preferredHandle;
}

- (void)setPreferredHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)entityName
{
  return self->_entityName;
}

- (void)setEntityName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CKEntity)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (NSString)locationString
{
  return self->_locationString;
}

- (void)setLocationString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)tuConversationStatusIsActive
{
  return self->_tuConversationStatusIsActive;
}

- (void)setTuConversationStatusIsActive:(BOOL)a3
{
  self->_tuConversationStatusIsActive = a3;
}

- (int64_t)callType
{
  return self->_callType;
}

- (void)setCallType:(int64_t)a3
{
  self->_callType = a3;
}

- (BOOL)showsLocation
{
  return self->_showsLocation;
}

- (void)setShowsLocation:(BOOL)a3
{
  self->_showsLocation = a3;
}

- (BOOL)showsMessageButton
{
  return self->_showsMessageButton;
}

- (void)setShowsMessageButton:(BOOL)a3
{
  self->_showsMessageButton = a3;
}

- (BOOL)showsFaceTimeVideoButton
{
  return self->_showsFaceTimeVideoButton;
}

- (void)setShowsFaceTimeVideoButton:(BOOL)a3
{
  self->_showsFaceTimeVideoButton = a3;
}

- (BOOL)showsPhoneButton
{
  return self->_showsPhoneButton;
}

- (void)setShowsPhoneButton:(BOOL)a3
{
  self->_showsPhoneButton = a3;
}

- (BOOL)showsScreenSharingButton
{
  return self->_showsScreenSharingButton;
}

- (void)setShowsScreenSharingButton:(BOOL)a3
{
  self->_showsScreenSharingButton = a3;
}

- (BOOL)showsTUConversationStatus
{
  return self->_showsTUConversationStatus;
}

- (void)setShowsTUConversationStatus:(BOOL)a3
{
  self->_showsTUConversationStatus = a3;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (BOOL)isPendingRecipient
{
  return self->_isPendingRecipient;
}

- (void)setIsPendingRecipient:(BOOL)a3
{
  self->_isPendingRecipient = a3;
}

- (BOOL)isSatellite
{
  return self->_isSatellite;
}

- (void)setIsSatellite:(BOOL)a3
{
  self->_isSatellite = a3;
}

- (BOOL)verified
{
  return self->_verified;
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_preferredHandle, 0);
}

@end
