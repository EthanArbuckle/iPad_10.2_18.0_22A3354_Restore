@implementation IAXPCProtocolObject

- (void)didAction:(id)a3
{
  NSObject *v3;

  sub_23F09755C();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    sub_23F0A0190();

}

- (void)didSessionBeginWithSessionMetadata:(id)a3
{
  NSObject *v3;

  sub_23F09755C();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    sub_23F0A01BC();

}

- (void)didSessionEndWithSessionMetadata:(id)a3
{
  NSObject *v3;

  sub_23F09755C();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    sub_23F0A01E8();

}

- (void)getDateWithReply:(id)a3
{
  NSObject *v3;

  if (os_variant_has_internal_diagnostics())
  {
    sub_23F09755C();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      sub_23F0A0214();

  }
}

- (void)logMessage:(id)a3
{
  NSObject *v3;

  if (os_variant_has_internal_diagnostics())
  {
    sub_23F09755C();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      sub_23F0A0240();

  }
}

- (void)reportStatus
{
  NSObject *v2;

  if (os_variant_has_internal_diagnostics())
  {
    sub_23F09755C();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      sub_23F0A026C();

  }
}

@end
