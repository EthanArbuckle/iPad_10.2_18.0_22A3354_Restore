@implementation HMMutableUserInviteInformation

- (id)copyWithZone:(_NSZone *)a3
{
  HMUserInviteInformation *v4;
  void *v5;
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  unint64_t v9;
  _BOOL8 v10;
  void *v11;
  HMUserInviteInformation *v12;

  v4 = [HMUserInviteInformation alloc];
  -[HMUserInviteInformation userID](self, "userID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMUserInviteInformation isAdministrator](self, "isAdministrator");
  v7 = -[HMUserInviteInformation isRemoteAccessAllowed](self, "isRemoteAccessAllowed");
  v8 = -[HMUserInviteInformation isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed");
  v9 = -[HMUserInviteInformation camerasAccessLevel](self, "camerasAccessLevel");
  v10 = -[HMUserInviteInformation isRestrictedGuest](self, "isRestrictedGuest");
  -[HMUserInviteInformation restrictedGuestHomeAccessSettings](self, "restrictedGuestHomeAccessSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMUserInviteInformation initWithUser:administrator:remoteAccess:announceAccess:camerasAccessLevel:restrictedGuest:restrictedGuestHomeAccessSettings:](v4, "initWithUser:administrator:remoteAccess:announceAccess:camerasAccessLevel:restrictedGuest:restrictedGuestHomeAccessSettings:", v5, v6, v7, v8, v9, v10, v11);

  return v12;
}

@end
