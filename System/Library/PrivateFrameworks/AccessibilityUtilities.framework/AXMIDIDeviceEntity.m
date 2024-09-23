@implementation AXMIDIDeviceEntity

- (AXMIDIDeviceEntity)initWithMIDIEntity:(unsigned int)a3 device:(id)a4
{
  id v6;
  AXMIDIDeviceEntity *v7;
  AXMIDIDeviceEntity *v8;
  uint64_t v9;
  NSMutableSet *sources;
  uint64_t v11;
  NSMutableSet *destinations;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXMIDIDeviceEntity;
  v7 = -[AXMIDIDeviceEntity init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_device, v6);
    v8->_midiEntity = a3;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    sources = v8->_sources;
    v8->_sources = (NSMutableSet *)v9;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    destinations = v8->_destinations;
    v8->_destinations = (NSMutableSet *)v11;

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXMIDIDeviceEntity device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<AXMIDIDeviceEntity:%p parent:%@>"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)name
{
  return (NSString *)_AXMIDIStringProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E0C9E648], CFSTR("kMIDIPropertyName"));
}

- (NSNumber)uniqueID
{
  return (NSNumber *)_AXMIDIIntegerProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E0C9E678], CFSTR("kMIDIPropertyUniqueID"));
}

- (NSNumber)deviceID
{
  return (NSNumber *)_AXMIDIIntegerProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E0C9E618], CFSTR("kMIDIPropertyDeviceID"));
}

- (NSNumber)isEmbedded
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E0C9E630], CFSTR("kMIDIPropertyIsEmbeddedEntity"));
}

- (NSNumber)isBroadcast
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E0C9E628], CFSTR("kMIDIPropertyIsBroadcast"));
}

- (NSNumber)isOffline
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E0C9E650], CFSTR("kMIDIPropertyOffline"));
}

- (NSNumber)isPrivate
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E0C9E658], CFSTR("kMIDIPropertyPrivate"));
}

- (NSString)driverName
{
  return (NSString *)_AXMIDIStringProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E0C9E620], CFSTR("kMIDIPropertyDriverOwner"));
}

- (NSNumber)supportsGeneralMIDI
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E0C9E660], CFSTR("kMIDIPropertySupportsGeneralMIDI"));
}

- (id)supportsGeneralMMC
{
  return _AXMIDIBooleanProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E0C9E668], CFSTR("kMIDIPropertySupportsMMC"));
}

- (void)resetAndDetectEndpoints
{
  ItemCount NumberOfSources;
  ItemCount v4;
  ItemCount i;
  ItemCount NumberOfDestinations;
  ItemCount v7;
  ItemCount j;

  NumberOfSources = MIDIEntityGetNumberOfSources(self->_midiEntity);
  if (NumberOfSources)
  {
    v4 = NumberOfSources;
    for (i = 0; i != v4; ++i)
      -[AXMIDIDeviceEntity addMidiSource:](self, "addMidiSource:", MIDIEntityGetSource(self->_midiEntity, i));
  }
  NumberOfDestinations = MIDIEntityGetNumberOfDestinations(self->_midiEntity);
  if (NumberOfDestinations)
  {
    v7 = NumberOfDestinations;
    for (j = 0; j != v7; ++j)
      -[AXMIDIDeviceEntity addMidiDestination:](self, "addMidiDestination:", MIDIEntityGetDestination(self->_midiEntity, j));
  }
}

- (void)addMidiSource:(unsigned int)a3
{
  id v3;

  v3 = -[AXMIDIDeviceEntity _sourceForMidiEndpoint:addIfNeeded:](self, "_sourceForMidiEndpoint:addIfNeeded:", *(_QWORD *)&a3, 1);
}

- (void)removeMidiSource:(unsigned int)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[AXMIDIDeviceEntity _sourceForMidiEndpoint:addIfNeeded:](self, "_sourceForMidiEndpoint:addIfNeeded:", *(_QWORD *)&a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    AXLogMIDI();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_INFO, "Removing source: %@", (uint8_t *)&v8, 0xCu);
    }

    -[AXMIDIDeviceEntity sources](self, "sources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v4);

    -[AXMIDIDeviceEntity device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entity:didRemoveSource:", self, v4);

  }
}

- (void)addMidiDestination:(unsigned int)a3
{
  id v3;

  v3 = -[AXMIDIDeviceEntity _destinationForMidiEndpoint:addIfNeeded:](self, "_destinationForMidiEndpoint:addIfNeeded:", *(_QWORD *)&a3, 1);
}

- (void)removeMidiDestination:(unsigned int)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[AXMIDIDeviceEntity _destinationForMidiEndpoint:addIfNeeded:](self, "_destinationForMidiEndpoint:addIfNeeded:", *(_QWORD *)&a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    AXLogMIDI();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_INFO, "Removing destination: %@", (uint8_t *)&v8, 0xCu);
    }

    -[AXMIDIDeviceEntity destinations](self, "destinations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v4);

    -[AXMIDIDeviceEntity device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entity:didRemoveDestination:", self, v4);

  }
}

- (id)_sourceForMidiEndpoint:(unsigned int)a3 addIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  AXMIDIDeviceEntityEndpoint *v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  AXMIDIDeviceEntityEndpoint *v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AXMIDIDeviceEntity sources](self, "sources", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "midiEndpoint") == (_DWORD)v5)
        {
          v13 = v12;
          goto LABEL_14;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v9)
        continue;
      break;
    }
  }

  if (!v4)
    return 0;
  v13 = -[AXMIDIDeviceEntityEndpoint initWithMIDIEndpoint:entity:]([AXMIDIDeviceEntityEndpoint alloc], "initWithMIDIEndpoint:entity:", v5, self);
  -[AXMIDIDeviceEntity sources](self, "sources");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v13);

  AXLogMIDI();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_18C62B000, v15, OS_LOG_TYPE_INFO, "Did add source endpoint: %@", buf, 0xCu);
  }

  -[AXMIDIDeviceEntity device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entity:didAddSource:", self, v13);
LABEL_14:

  return v13;
}

- (id)_destinationForMidiEndpoint:(unsigned int)a3 addIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  AXMIDIDeviceEntityEndpoint *v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  AXMIDIDeviceEntityEndpoint *v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AXMIDIDeviceEntity destinations](self, "destinations", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "midiEndpoint") == (_DWORD)v5)
        {
          v13 = v12;
          goto LABEL_14;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v9)
        continue;
      break;
    }
  }

  if (!v4)
    return 0;
  v13 = -[AXMIDIDeviceEntityEndpoint initWithMIDIEndpoint:entity:]([AXMIDIDeviceEntityEndpoint alloc], "initWithMIDIEndpoint:entity:", v5, self);
  -[AXMIDIDeviceEntity destinations](self, "destinations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v13);

  AXLogMIDI();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_18C62B000, v15, OS_LOG_TYPE_INFO, "Did add destination endpoint: %@", buf, 0xCu);
  }

  -[AXMIDIDeviceEntity device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entity:didAddDestination:", self, v13);
LABEL_14:

  return v13;
}

- (AXMIDIDevice)device
{
  return (AXMIDIDevice *)objc_loadWeakRetained((id *)&self->_device);
}

- (void)setDevice:(id)a3
{
  objc_storeWeak((id *)&self->_device, a3);
}

- (NSMutableSet)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
  objc_storeStrong((id *)&self->_sources, a3);
}

- (NSMutableSet)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_destinations, a3);
}

- (NSNumber)supportsMMC
{
  return self->_supportsMMC;
}

- (unsigned)midiEntity
{
  return self->_midiEntity;
}

- (void)setMidiEntity:(unsigned int)a3
{
  self->_midiEntity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportsMMC, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_destroyWeak((id *)&self->_device);
}

@end
