@implementation _AFHomeAccessoryInfoMutation

- (_AFHomeAccessoryInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFHomeAccessoryInfoMutation *v6;
  _AFHomeAccessoryInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFHomeAccessoryInfoMutation;
  v6 = -[_AFHomeAccessoryInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (id)getUniqueIdentifier
{
  NSUUID *v2;

  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_uniqueIdentifier;
  }
  else
  {
    -[AFHomeAccessoryInfo uniqueIdentifier](self->_base, "uniqueIdentifier");
    v2 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getLoggingUniqueIdentifier
{
  NSUUID *v2;

  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_loggingUniqueIdentifier;
  }
  else
  {
    -[AFHomeAccessoryInfo loggingUniqueIdentifier](self->_base, "loggingUniqueIdentifier");
    v2 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLoggingUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_loggingUniqueIdentifier, a3);
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getName
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_name;
  }
  else
  {
    -[AFHomeAccessoryInfo name](self->_base, "name");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getModel
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_model;
  }
  else
  {
    -[AFHomeAccessoryInfo model](self->_base, "model");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getRoomName
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_roomName;
  }
  else
  {
    -[AFHomeAccessoryInfo roomName](self->_base, "roomName");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRoomName:(id)a3
{
  objc_storeStrong((id *)&self->_roomName, a3);
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getAssistantIdentifier
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_assistantIdentifier;
  }
  else
  {
    -[AFHomeAccessoryInfo assistantIdentifier](self->_base, "assistantIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAssistantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assistantIdentifier, a3);
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (BOOL)getIsSpeaker
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
    return self->_isSpeaker;
  else
    return -[AFHomeAccessoryInfo isSpeaker](self->_base, "isSpeaker");
}

- (void)setIsSpeaker:(BOOL)a3
{
  self->_isSpeaker = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (BOOL)getHasActiveThirdPartyMusicSubscription
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
    return self->_hasActiveThirdPartyMusicSubscription;
  else
    return -[AFHomeAccessoryInfo hasActiveThirdPartyMusicSubscription](self->_base, "hasActiveThirdPartyMusicSubscription");
}

- (void)setHasActiveThirdPartyMusicSubscription:(BOOL)a3
{
  self->_hasActiveThirdPartyMusicSubscription = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getManufacturer
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_manufacturer;
  }
  else
  {
    -[AFHomeAccessoryInfo manufacturer](self->_base, "manufacturer");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setManufacturer:(id)a3
{
  objc_storeStrong((id *)&self->_manufacturer, a3);
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getCategoryType
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_categoryType;
  }
  else
  {
    -[AFHomeAccessoryInfo categoryType](self->_base, "categoryType");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setCategoryType:(id)a3
{
  objc_storeStrong((id *)&self->_categoryType, a3);
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (int64_t)getSchemaCategoryType
{
  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
    return self->_schemaCategoryType;
  else
    return -[AFHomeAccessoryInfo schemaCategoryType](self->_base, "schemaCategoryType");
}

- (void)setSchemaCategoryType:(int64_t)a3
{
  self->_schemaCategoryType = a3;
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryType, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_loggingUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
