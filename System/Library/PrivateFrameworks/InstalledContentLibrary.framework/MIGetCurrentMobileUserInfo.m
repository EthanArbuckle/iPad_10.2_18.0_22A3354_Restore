@implementation MIGetCurrentMobileUserInfo

id __MIGetCurrentMobileUserInfo_block_invoke()
{
  return MIFetchInfoForUsername("mobile", (uid_t *)&MIGetCurrentMobileUserInfo_uid, (gid_t *)&MIGetCurrentMobileUserInfo_gid, 0);
}

@end
