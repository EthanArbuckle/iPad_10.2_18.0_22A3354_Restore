@implementation HMFMutableMessage(RemoteMessage)

- (void)setRemote:()RemoteMessage
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setUserInfoValue:forKey:", v2, CFSTR("HMD.remote"));

}

- (void)setSecureRemote:()RemoteMessage
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setUserInfoValue:forKey:", v2, CFSTR("HMD.remoteSecure"));

}

- (uint64_t)setRemoteSourceID:()RemoteMessage
{
  return objc_msgSend(a1, "setUserInfoValue:forKey:", a3, CFSTR("kIDSMessageSourceIDKey"));
}

- (uint64_t)setRemoteToID:()RemoteMessage
{
  return objc_msgSend(a1, "setUserInfoValue:forKey:", a3, CFSTR("kRemoteMessageIDSToIDKey"));
}

- (void)setRemoteRestriction:()RemoteMessage
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setUserInfoValue:forKey:", v2, CFSTR("HMD.remoteTransportRestriction"));

}

- (void)setRemoteResponseRestriction:()RemoteMessage
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setUserInfoValue:forKey:", v2, CFSTR("HMD.remoteTransportResponseRestriction"));

}

- (uint64_t)setRemoteSenderContext:()RemoteMessage
{
  return objc_msgSend(a1, "setUserInfoValue:forKey:", a3, CFSTR("HMD.remoteSenderContext"));
}

- (void)setRemoteDisallowsIDSRacing:()RemoteMessage
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setUserInfoValue:forKey:", v2, CFSTR("HMD.remoteDisallowsIDSRacing"));

}

@end
