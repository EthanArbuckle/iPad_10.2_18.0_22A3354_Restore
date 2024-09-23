@implementation _AFServiceDeviceContextMutation

- (_AFServiceDeviceContextMutation)initWithBase:(id)a3
{
  id v5;
  _AFServiceDeviceContextMutation *v6;
  _AFServiceDeviceContextMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFServiceDeviceContextMutation;
  v6 = -[_AFServiceDeviceContextMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (id)getIdentifier
{
  NSUUID *v2;

  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_identifier;
  }
  else
  {
    -[AFServiceDeviceContext identifier](self->_base, "identifier");
    v2 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getAssistantIdentifier
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_assistantIdentifier;
  }
  else
  {
    -[AFServiceDeviceContext assistantIdentifier](self->_base, "assistantIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAssistantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assistantIdentifier, a3);
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getMediaSystemIdentifier
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_mediaSystemIdentifier;
  }
  else
  {
    -[AFServiceDeviceContext mediaSystemIdentifier](self->_base, "mediaSystemIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setMediaSystemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSystemIdentifier, a3);
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getMediaRouteIdentifier
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_mediaRouteIdentifier;
  }
  else
  {
    -[AFServiceDeviceContext mediaRouteIdentifier](self->_base, "mediaRouteIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setMediaRouteIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, a3);
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getSharedUserID
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_sharedUserID;
  }
  else
  {
    -[AFServiceDeviceContext sharedUserID](self->_base, "sharedUserID");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSharedUserID:(id)a3
{
  objc_storeStrong((id *)&self->_sharedUserID, a3);
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getRoomName
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_roomName;
  }
  else
  {
    -[AFServiceDeviceContext roomName](self->_base, "roomName");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRoomName:(id)a3
{
  objc_storeStrong((id *)&self->_roomName, a3);
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (int64_t)getProximity
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
    return self->_proximity;
  else
    return -[AFServiceDeviceContext proximity](self->_base, "proximity");
}

- (void)setProximity:(int64_t)a3
{
  self->_proximity = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getSerializedContextByKey
{
  NSDictionary *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v2 = self->_serializedContextByKey;
  }
  else
  {
    -[AFServiceDeviceContext serializedContextByKey](self->_base, "serializedContextByKey");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSerializedContextByKey:(id)a3
{
  objc_storeStrong((id *)&self->_serializedContextByKey, a3);
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getMetricsContext
{
  NSDictionary *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_metricsContext;
  }
  else
  {
    -[AFServiceDeviceContext metricsContext](self->_base, "metricsContext");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setMetricsContext:(id)a3
{
  objc_storeStrong((id *)&self->_metricsContext, a3);
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsContext, 0);
  objc_storeStrong((id *)&self->_serializedContextByKey, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_sharedUserID, 0);
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
