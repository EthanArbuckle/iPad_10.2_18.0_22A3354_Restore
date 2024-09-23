@implementation CNCoreMutableDelegateInfo

- (NSNumber)dsid
{
  return self->super._dsid;
}

- (void)setDsid:(id)a3
{
  NSNumber *v4;
  NSNumber *dsid;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  dsid = self->super._dsid;
  self->super._dsid = v4;

}

- (NSString)altDSID
{
  return self->super._altDSID;
}

- (void)setAltDSID:(id)a3
{
  NSString *v4;
  NSString *altDSID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  altDSID = self->super._altDSID;
  self->super._altDSID = v4;

}

- (NSString)appleID
{
  return self->super._appleID;
}

- (void)setAppleID:(id)a3
{
  NSString *v4;
  NSString *appleID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  appleID = self->super._appleID;
  self->super._appleID = v4;

}

- (NSString)principalPath
{
  return self->super._principalPath;
}

- (void)setPrincipalPath:(id)a3
{
  NSString *v4;
  NSString *principalPath;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  principalPath = self->super._principalPath;
  self->super._principalPath = v4;

}

- (NSPersonNameComponents)nameComponents
{
  return self->super._nameComponents;
}

- (void)setNameComponents:(id)a3
{
  NSPersonNameComponents *v4;
  NSPersonNameComponents *nameComponents;

  v4 = (NSPersonNameComponents *)objc_msgSend(a3, "copy");
  nameComponents = self->super._nameComponents;
  self->super._nameComponents = v4;

}

- (BOOL)isMe
{
  return self->super._isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->super._isMe = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CNCoreDelegateInfo initWithDSID:altDSID:appleID:principalPath:nameComponents:isMe:]([CNCoreDelegateInfo alloc], "initWithDSID:altDSID:appleID:principalPath:nameComponents:isMe:", self->super._dsid, self->super._altDSID, self->super._appleID, self->super._principalPath, self->super._nameComponents, self->super._isMe);
}

@end
