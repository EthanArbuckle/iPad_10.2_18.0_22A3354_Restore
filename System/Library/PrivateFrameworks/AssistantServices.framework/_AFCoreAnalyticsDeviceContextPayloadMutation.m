@implementation _AFCoreAnalyticsDeviceContextPayloadMutation

- (_AFCoreAnalyticsDeviceContextPayloadMutation)initWithBase:(id)a3
{
  id v5;
  _AFCoreAnalyticsDeviceContextPayloadMutation *v6;
  _AFCoreAnalyticsDeviceContextPayloadMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFCoreAnalyticsDeviceContextPayloadMutation;
  v6 = -[_AFCoreAnalyticsDeviceContextPayloadMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (id)getNearbyProductType
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_nearbyProductType;
  }
  else
  {
    -[AFCoreAnalyticsDeviceContextPayload nearbyProductType](self->_base, "nearbyProductType");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setNearbyProductType:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyProductType, a3);
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getProximity
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_proximity;
  }
  else
  {
    -[AFCoreAnalyticsDeviceContextPayload proximity](self->_base, "proximity");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setProximity:(id)a3
{
  objc_storeStrong((id *)&self->_proximity, a3);
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getAlarmFiring
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_alarmFiring;
  }
  else
  {
    -[AFCoreAnalyticsDeviceContextPayload alarmFiring](self->_base, "alarmFiring");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAlarmFiring:(id)a3
{
  objc_storeStrong((id *)&self->_alarmFiring, a3);
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getTimerFiring
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_timerFiring;
  }
  else
  {
    -[AFCoreAnalyticsDeviceContextPayload timerFiring](self->_base, "timerFiring");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setTimerFiring:(id)a3
{
  objc_storeStrong((id *)&self->_timerFiring, a3);
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getPlaybackState
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_playbackState;
  }
  else
  {
    -[AFCoreAnalyticsDeviceContextPayload playbackState](self->_base, "playbackState");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setPlaybackState:(id)a3
{
  objc_storeStrong((id *)&self->_playbackState, a3);
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getPlaybackRecency
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_playbackRecency;
  }
  else
  {
    -[AFCoreAnalyticsDeviceContextPayload playbackRecency](self->_base, "playbackRecency");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setPlaybackRecency:(id)a3
{
  objc_storeStrong((id *)&self->_playbackRecency, a3);
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getHomeAnnouncementState
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_homeAnnouncementState;
  }
  else
  {
    -[AFCoreAnalyticsDeviceContextPayload homeAnnouncementState](self->_base, "homeAnnouncementState");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setHomeAnnouncementState:(id)a3
{
  objc_storeStrong((id *)&self->_homeAnnouncementState, a3);
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getHomeAnnouncementRecency
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v2 = self->_homeAnnouncementRecency;
  }
  else
  {
    -[AFCoreAnalyticsDeviceContextPayload homeAnnouncementRecency](self->_base, "homeAnnouncementRecency");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setHomeAnnouncementRecency:(id)a3
{
  objc_storeStrong((id *)&self->_homeAnnouncementRecency, a3);
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getNearbyDevicesRequestIdentifier
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_nearbyDevicesRequestIdentifier;
  }
  else
  {
    -[AFCoreAnalyticsDeviceContextPayload nearbyDevicesRequestIdentifier](self->_base, "nearbyDevicesRequestIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setNearbyDevicesRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyDevicesRequestIdentifier, a3);
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getTargetedResult
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_targetedResult;
  }
  else
  {
    -[AFCoreAnalyticsDeviceContextPayload targetedResult](self->_base, "targetedResult");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setTargetedResult:(id)a3
{
  objc_storeStrong((id *)&self->_targetedResult, a3);
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getContextIdentifier
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
  {
    v2 = self->_contextIdentifier;
  }
  else
  {
    -[AFCoreAnalyticsDeviceContextPayload contextIdentifier](self->_base, "contextIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setContextIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contextIdentifier, a3);
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_targetedResult, 0);
  objc_storeStrong((id *)&self->_nearbyDevicesRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_homeAnnouncementRecency, 0);
  objc_storeStrong((id *)&self->_homeAnnouncementState, 0);
  objc_storeStrong((id *)&self->_playbackRecency, 0);
  objc_storeStrong((id *)&self->_playbackState, 0);
  objc_storeStrong((id *)&self->_timerFiring, 0);
  objc_storeStrong((id *)&self->_alarmFiring, 0);
  objc_storeStrong((id *)&self->_proximity, 0);
  objc_storeStrong((id *)&self->_nearbyProductType, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
