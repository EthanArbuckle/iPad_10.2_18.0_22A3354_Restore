@implementation NSDateFormatter(RemoteManagementModel)

+ (id)rmmodel_sharedRFC3339DateFormatter
{
  if (rmmodel_sharedRFC3339DateFormatter_onceToken != -1)
    dispatch_once(&rmmodel_sharedRFC3339DateFormatter_onceToken, &__block_literal_global_13);
  return (id)rmmodel_sharedRFC3339DateFormatter_rfcFormatter;
}

@end
