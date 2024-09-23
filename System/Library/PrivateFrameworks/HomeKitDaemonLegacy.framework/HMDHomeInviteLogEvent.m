@implementation HMDHomeInviteLogEvent

- (HMDHomeInviteLogEvent)initWithHomeInviteLogEventState:(int64_t)a3 isFMFDevice:(BOOL)a4
{
  HMDHomeInviteLogEvent *v6;
  HMDHomeInviteLogEvent *v7;
  BOOL *p_received;
  void *v9;
  HMDHomeInviteLogEvent *v10;
  NSObject *v11;
  void *v12;
  HMDHomeInviteLogEvent *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)HMDHomeInviteLogEvent;
  v6 = -[HMMLogEvent init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_expired = 0;
    v6->_ignored = 0;
    v6->_declined = 0;
    v6->_accepted = 0;
    v6->_suppressedNotification = 0;
    v6->_filtered = 0;
    p_received = &v6->_received;
    v6->_received = 0;
    v6->_isFMFDevice = a4;
    switch(a3)
    {
      case 1:
        goto LABEL_12;
      case 2:
        p_received = &v6->_filtered;
        goto LABEL_12;
      case 3:
        p_received = &v6->_suppressedNotification;
        goto LABEL_12;
      case 4:
        p_received = &v6->_accepted;
        goto LABEL_12;
      case 5:
        p_received = &v6->_declined;
        goto LABEL_12;
      case 6:
        p_received = &v6->_ignored;
        goto LABEL_12;
      case 7:
        p_received = &v6->_expired;
LABEL_12:
        *p_received = 1;
        break;
      default:
        v9 = (void *)MEMORY[0x1D17BA0A0]();
        v10 = v7;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v17 = v12;
          _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@No home invitation event to log. Invitation was cancelled or is pending.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v9);
        v13 = 0;
        goto LABEL_14;
    }
  }
  v13 = v6;
LABEL_14:

  return v13;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.receiverHomeInvitationState");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[15];
  _QWORD v21[17];

  v21[15] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("received_BOOL");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeInviteLogEvent received](self, "received"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v19;
  v20[1] = CFSTR("filtered_BOOL");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeInviteLogEvent filtered](self, "filtered"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v18;
  v20[2] = CFSTR("suppressedNotification_BOOL");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeInviteLogEvent suppressedNotification](self, "suppressedNotification"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v17;
  v20[3] = CFSTR("accepted_BOOL");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeInviteLogEvent accepted](self, "accepted"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v16;
  v20[4] = CFSTR("declined_BOOL");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeInviteLogEvent declined](self, "declined"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v15;
  v20[5] = CFSTR("ignored_BOOL");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeInviteLogEvent ignored](self, "ignored"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v14;
  v20[6] = CFSTR("expired_BOOL");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeInviteLogEvent expired](self, "expired"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v3;
  v20[7] = CFSTR("received_INT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeInviteLogEvent received](self, "received"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[7] = v4;
  v20[8] = CFSTR("filtered_INT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeInviteLogEvent filtered](self, "filtered"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[8] = v5;
  v20[9] = CFSTR("suppressedNotification_INT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeInviteLogEvent suppressedNotification](self, "suppressedNotification"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[9] = v6;
  v20[10] = CFSTR("accepted_INT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeInviteLogEvent accepted](self, "accepted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[10] = v7;
  v20[11] = CFSTR("declined_INT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeInviteLogEvent declined](self, "declined"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[11] = v8;
  v20[12] = CFSTR("ignored_INT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeInviteLogEvent ignored](self, "ignored"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[12] = v9;
  v20[13] = CFSTR("expired_INT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeInviteLogEvent expired](self, "expired"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[13] = v10;
  v20[14] = CFSTR("isFMFDevice");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHomeInviteLogEvent isFMFDevice](self, "isFMFDevice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[14] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (BOOL)received
{
  return self->_received;
}

- (BOOL)filtered
{
  return self->_filtered;
}

- (BOOL)suppressedNotification
{
  return self->_suppressedNotification;
}

- (BOOL)accepted
{
  return self->_accepted;
}

- (BOOL)declined
{
  return self->_declined;
}

- (BOOL)ignored
{
  return self->_ignored;
}

- (BOOL)expired
{
  return self->_expired;
}

- (BOOL)isFMFDevice
{
  return self->_isFMFDevice;
}

+ (id)updateWithState:(int64_t)a3 isFMFDevice:(BOOL)a4
{
  return -[HMDHomeInviteLogEvent initWithHomeInviteLogEventState:isFMFDevice:]([HMDHomeInviteLogEvent alloc], "initWithHomeInviteLogEventState:isFMFDevice:", a3, a4);
}

+ (id)updateWithInvitationState:(int64_t)a3 isFMFDevice:(BOOL)a4
{
  uint64_t v4;

  if ((unint64_t)(a3 - 3) > 4)
    v4 = 0;
  else
    v4 = qword_1CDB8F540[a3 - 3];
  objc_msgSend(a1, "updateWithState:isFMFDevice:", v4, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
