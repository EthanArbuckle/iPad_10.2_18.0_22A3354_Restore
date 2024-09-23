@implementation _AFCompanionDeviceInfoMutation

- (_AFCompanionDeviceInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFCompanionDeviceInfoMutation *v6;
  _AFCompanionDeviceInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFCompanionDeviceInfoMutation;
  v6 = -[_AFCompanionDeviceInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (id)getAssistantID
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_assistantID;
  }
  else
  {
    -[AFCompanionDeviceInfo assistantID](self->_base, "assistantID");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAssistantID:(id)a3
{
  objc_storeStrong((id *)&self->_assistantID, a3);
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getSpeechID
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_speechID;
  }
  else
  {
    -[AFCompanionDeviceInfo speechID](self->_base, "speechID");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSpeechID:(id)a3
{
  objc_storeStrong((id *)&self->_speechID, a3);
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getIdsIdentifier
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_idsIdentifier;
  }
  else
  {
    -[AFCompanionDeviceInfo idsIdentifier](self->_base, "idsIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setIdsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_idsIdentifier, a3);
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getProductPrefix
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_productPrefix;
  }
  else
  {
    -[AFCompanionDeviceInfo productPrefix](self->_base, "productPrefix");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setProductPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_productPrefix, a3);
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getAceHost
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_aceHost;
  }
  else
  {
    -[AFCompanionDeviceInfo aceHost](self->_base, "aceHost");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAceHost:(id)a3
{
  objc_storeStrong((id *)&self->_aceHost, a3);
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getSyncMetadata
{
  NSDictionary *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_syncMetadata;
  }
  else
  {
    -[AFCompanionDeviceInfo syncMetadata](self->_base, "syncMetadata");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSyncMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_syncMetadata, a3);
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (BOOL)getSyncMetadataCapability
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
    return self->_syncMetadataCapability;
  else
    return -[AFCompanionDeviceInfo syncMetadataCapability](self->_base, "syncMetadataCapability");
}

- (void)setSyncMetadataCapability:(BOOL)a3
{
  self->_syncMetadataCapability = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (BOOL)getPeerToPeerHandoffCapability
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
    return self->_peerToPeerHandoffCapability;
  else
    return -[AFCompanionDeviceInfo peerToPeerHandoffCapability](self->_base, "peerToPeerHandoffCapability");
}

- (void)setPeerToPeerHandoffCapability:(BOOL)a3
{
  self->_peerToPeerHandoffCapability = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (BOOL)getMuxSupportCapability
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
    return self->_muxSupportCapability;
  else
    return -[AFCompanionDeviceInfo muxSupportCapability](self->_base, "muxSupportCapability");
}

- (void)setMuxSupportCapability:(BOOL)a3
{
  self->_muxSupportCapability = a3;
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (BOOL)getMeDevice
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
    return self->_meDevice;
  else
    return -[AFCompanionDeviceInfo meDevice](self->_base, "meDevice");
}

- (void)setMeDevice:(BOOL)a3
{
  self->_meDevice = a3;
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getSiriLanguage
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
  {
    v2 = self->_siriLanguage;
  }
  else
  {
    -[AFCompanionDeviceInfo siriLanguage](self->_base, "siriLanguage");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSiriLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_siriLanguage, a3);
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriLanguage, 0);
  objc_storeStrong((id *)&self->_syncMetadata, 0);
  objc_storeStrong((id *)&self->_aceHost, 0);
  objc_storeStrong((id *)&self->_productPrefix, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_speechID, 0);
  objc_storeStrong((id *)&self->_assistantID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
