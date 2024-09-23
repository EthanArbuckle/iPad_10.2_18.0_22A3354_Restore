@implementation MIDICIDiscoveredNode

- (MIDICIDiscoveredNode)init
{

  return 0;
}

- (MIDICIDiscoveredNode)initWithDestination:(unsigned int)a3 deviceID:(MIDICIDeviceIdentification)a4 profilesSupported:(BOOL)a5 propertiesSupported:(BOOL)a6 maxSysExSize:(unsigned int)a7
{
  uint64_t v10;
  MIDICIDiscoveredNode *v11;
  MIDICIDiscoveredNode *v12;
  MIDICIDeviceInfo *v13;
  MIDICIDeviceInfo *deviceInfo;
  objc_super v16;
  MIDICIDeviceIdentification v17;

  v10 = *(_QWORD *)&a3;
  v17 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MIDICIDiscoveredNode;
  v11 = -[MIDICIDiscoveredNode init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_destination = v10;
    v13 = -[MIDICIDeviceInfo initWithDestination:deviceID:]([MIDICIDeviceInfo alloc], "initWithDestination:deviceID:", v10, &v17);
    deviceInfo = v12->_deviceInfo;
    v12->_deviceInfo = v13;

    v12->_supportsProfiles = a5;
    v12->_supportsProperties = a6;
    v12->_maxSysExSize = a7;
  }
  return v12;
}

- (MIDICIDiscoveredNode)initWithCoder:(id)a3
{
  id v4;
  MIDICIDiscoveredNode *v5;
  uint64_t v6;
  MIDICIDeviceInfo *deviceInfo;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MIDICIDiscoveredNode;
  v5 = -[MIDICIDiscoveredNode init](&v9, sel_init);
  if (v5)
  {
    v5->_destination = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("destination"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    deviceInfo = v5->_deviceInfo;
    v5->_deviceInfo = (MIDICIDeviceInfo *)v6;

    v5->_supportsProfiles = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsProfiles"));
    v5->_supportsProperties = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsProperties"));
    v5->_maxSysExSize = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("maxSysExSize"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", self->_destination, CFSTR("destination"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_deviceInfo, CFSTR("deviceInfo"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsProfiles, CFSTR("supportsProfiles"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsProperties, CFSTR("supportsProperties"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_maxSysExSize, CFSTR("maxSysExSize"));

}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  if (self->_supportsProperties)
    v2 = CFSTR("supports profiles & properties");
  else
    v2 = CFSTR("supports profiles");
  v3 = CFSTR("supports properties");
  if (!self->_supportsProperties)
    v3 = CFSTR("MIDI-CI supported?");
  if (!self->_supportsProfiles)
    v2 = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<MIDICIDiscoveredNode(%p) : destination: 0x%x (%@) deviceInfo: %@>"), self, self->_destination, v2, self->_deviceInfo);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSNumber)maximumSysExSize
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_maxSysExSize);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "destination") == self->_destination
    && self->_supportsProfiles == objc_msgSend(v4, "supportsProfiles")
    && self->_supportsProperties == objc_msgSend(v4, "supportsProperties"))
  {
    objc_msgSend(v4, "deviceInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", self->_deviceInfo))
    {
      objc_msgSend(v4, "maximumSysExSize");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "unsignedLongValue") == self->_maxSysExSize;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (MIDIEntityRef)destination
{
  return self->_destination;
}

- (MIDICIDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (BOOL)supportsProfiles
{
  return self->_supportsProfiles;
}

- (BOOL)supportsProperties
{
  return self->_supportsProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)description
{
  return CFSTR("MIDI-CI Discovered Node");
}

@end
