@implementation AVOutputDeviceGroupMembershipChangeResult

- (AVOutputDeviceGroupMembershipChangeResult)initWithStatus:(int64_t)a3 cancellationReason:(id)a4
{
  AVOutputDeviceGroupMembershipChangeResult *v6;
  AVOutputDeviceGroupMembershipChangeResult *v7;
  AVOutputDeviceGroupMembershipChangeResult *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVOutputDeviceGroupMembershipChangeResult;
  v6 = -[AVOutputDeviceGroupMembershipChangeResult init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_status = a3;
    v6->_cancellationReason = (NSString *)objc_msgSend(a4, "copy");
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVOutputDeviceGroupMembershipChangeResult;
  -[AVOutputDeviceGroupMembershipChangeResult dealloc](&v3, sel_dealloc);
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)cancellationReason
{
  return self->_cancellationReason;
}

@end
