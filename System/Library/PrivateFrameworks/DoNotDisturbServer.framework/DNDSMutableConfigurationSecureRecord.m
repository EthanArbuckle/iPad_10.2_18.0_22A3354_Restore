@implementation DNDSMutableConfigurationSecureRecord

- (void)setSenderConfiguration:(id)a3
{
  DNDSSenderConfigurationRecord *v4;
  DNDSSenderConfigurationRecord *senderConfiguration;

  v4 = (DNDSSenderConfigurationRecord *)objc_msgSend(a3, "copy");
  senderConfiguration = self->super._senderConfiguration;
  self->super._senderConfiguration = v4;

}

- (void)setAllowedApplications:(id)a3
{
  NSDictionary *v4;
  NSDictionary *allowedApplications;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  allowedApplications = self->super._allowedApplications;
  self->super._allowedApplications = v4;

}

- (void)setDeniedApplications:(id)a3
{
  NSSet *v4;
  NSSet *deniedApplications;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  deniedApplications = self->super._deniedApplications;
  self->super._deniedApplications = v4;

}

- (void)setAllowedWebApplications:(id)a3
{
  NSSet *v4;
  NSSet *allowedWebApplications;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  allowedWebApplications = self->super._allowedWebApplications;
  self->super._allowedWebApplications = v4;

}

- (void)setDeniedWebApplications:(id)a3
{
  NSSet *v4;
  NSSet *deniedWebApplications;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  deniedWebApplications = self->super._deniedWebApplications;
  self->super._deniedWebApplications = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSConfigurationSecureRecord _initWithRecord:]([DNDSConfigurationSecureRecord alloc], "_initWithRecord:", self);
}

@end
