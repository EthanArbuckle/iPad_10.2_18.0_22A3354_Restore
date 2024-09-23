@implementation DNDSMutableSenderConfigurationRecord

- (void)setAllowedContactTypes:(id)a3
{
  NSSet *v4;
  NSSet *allowedContactTypes;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  allowedContactTypes = self->super._allowedContactTypes;
  self->super._allowedContactTypes = v4;

}

- (void)setDeniedContactTypes:(id)a3
{
  NSSet *v4;
  NSSet *deniedContactTypes;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  deniedContactTypes = self->super._deniedContactTypes;
  self->super._deniedContactTypes = v4;

}

- (void)setAllowedContactGroups:(id)a3
{
  NSSet *v4;
  NSSet *allowedContactGroups;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  allowedContactGroups = self->super._allowedContactGroups;
  self->super._allowedContactGroups = v4;

}

- (void)setDeniedContactGroups:(id)a3
{
  NSSet *v4;
  NSSet *deniedContactGroups;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  deniedContactGroups = self->super._deniedContactGroups;
  self->super._deniedContactGroups = v4;

}

- (void)setAllowedContacts:(id)a3
{
  NSSet *v4;
  NSSet *allowedContacts;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  allowedContacts = self->super._allowedContacts;
  self->super._allowedContacts = v4;

}

- (void)setDeniedContacts:(id)a3
{
  NSSet *v4;
  NSSet *deniedContacts;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  deniedContacts = self->super._deniedContacts;
  self->super._deniedContacts = v4;

}

- (void)setPhoneCallBypassSettings:(id)a3
{
  DNDSBypassSettingsRecord *v4;
  DNDSBypassSettingsRecord *phoneCallBypassSettings;

  v4 = (DNDSBypassSettingsRecord *)objc_msgSend(a3, "copy");
  phoneCallBypassSettings = self->super._phoneCallBypassSettings;
  self->super._phoneCallBypassSettings = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSSenderConfigurationRecord _initWithRecord:]([DNDSSenderConfigurationRecord alloc], "_initWithRecord:", self);
}

@end
