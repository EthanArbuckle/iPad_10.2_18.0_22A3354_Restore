@implementation AXMIDIDeviceEntityEndpoint

- (AXMIDIDeviceEntityEndpoint)initWithMIDIEndpoint:(unsigned int)a3 entity:(id)a4
{
  id v6;
  AXMIDIDeviceEntityEndpoint *v7;
  AXMIDIDeviceEntityEndpoint *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AXMIDIDeviceEntityEndpoint;
  v7 = -[AXMIDIDeviceEntityEndpoint init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_entity, v6);
    v8->_midiEndpoint = a3;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXMIDIDeviceEntityEndpoint entity](self, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<AXMIDIDeviceEntityEndpoint:%p parent:%@>"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)name
{
  return (NSString *)_AXMIDIStringProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E0C9E648], CFSTR("kMIDIPropertyName"));
}

- (NSString)manufacturer
{
  return (NSString *)_AXMIDIStringProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E0C9E638], CFSTR("kMIDIPropertyManufacturer"));
}

- (NSString)model
{
  return (NSString *)_AXMIDIStringProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E0C9E640], CFSTR("kMIDIPropertyModel"));
}

- (NSNumber)uniqueID
{
  return (NSNumber *)_AXMIDIIntegerProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E0C9E678], CFSTR("kMIDIPropertyUniqueID"));
}

- (NSNumber)receiveChannels
{
  return (NSNumber *)_AXMIDIIntegerProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E0C9E670], CFSTR("kMIDIPropertyTransmitChannels"));
}

- (NSNumber)transmitChannels
{
  return (NSNumber *)_AXMIDIIntegerProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E0C9E670], CFSTR("kMIDIPropertyTransmitChannels"));
}

- (NSNumber)isEmbedded
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E0C9E630], CFSTR("kMIDIPropertyIsEmbeddedEntity"));
}

- (NSNumber)isBroadcast
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E0C9E628], CFSTR("kMIDIPropertyIsBroadcast"));
}

- (NSNumber)isOffline
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E0C9E650], CFSTR("kMIDIPropertyOffline"));
}

- (NSNumber)isPrivate
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E0C9E658], CFSTR("kMIDIPropertyPrivate"));
}

- (NSString)driverName
{
  return (NSString *)_AXMIDIStringProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E0C9E620], CFSTR("kMIDIPropertyDriverOwner"));
}

- (unsigned)midiEndpoint
{
  return self->_midiEndpoint;
}

- (void)setMidiEndpoint:(unsigned int)a3
{
  self->_midiEndpoint = a3;
}

- (AXMIDIDeviceEntity)entity
{
  return (AXMIDIDeviceEntity *)objc_loadWeakRetained((id *)&self->_entity);
}

- (void)setEntity:(id)a3
{
  objc_storeWeak((id *)&self->_entity, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_entity);
}

@end
