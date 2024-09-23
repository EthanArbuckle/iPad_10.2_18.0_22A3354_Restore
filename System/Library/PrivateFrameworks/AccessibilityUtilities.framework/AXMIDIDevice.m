@implementation AXMIDIDevice

- (AXMIDIDevice)initWithMIDIDevice:(unsigned int)a3 delegate:(id)a4
{
  id v6;
  AXMIDIDevice *v7;
  AXMIDIDevice *v8;
  uint64_t v9;
  NSMutableSet *entities;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXMIDIDevice;
  v7 = -[AXMIDIDevice init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_midiDevice = a3;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    entities = v8->_entities;
    v8->_entities = (NSMutableSet *)v9;

  }
  return v8;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXMIDIDevice name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<AXMIDIDevice:%p [%@]>"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)fullDescription
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  const __CFString *v59;
  unint64_t v60;
  unint64_t v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v80;
  void *v81;
  unint64_t v82;
  void *v83;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("AXMIDIDevice<%p>\n"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMIDIDevice name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Name: %@\n"), v4);

  -[AXMIDIDevice manufacturer](self, "manufacturer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Manufacturer: %@\n"), v5);

  -[AXMIDIDevice model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Model: %@\n"), v6);

  -[AXMIDIDevice driverName](self, "driverName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Driver: %@\n"), v7);

  -[AXMIDIDevice uniqueID](self, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Unique ID: %@\n"), v8);

  -[AXMIDIDevice deviceID](self, "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Device ID: %@\n"), v9);

  -[AXMIDIDevice isOffline](self, "isOffline");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Is Offline: %@\n"), v10);

  -[AXMIDIDevice isPrivate](self, "isPrivate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Is Private: %@\n"), v11);

  -[AXMIDIDevice supportsGeneralMIDI](self, "supportsGeneralMIDI");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Supports General MIDI: %@\n"), v12);

  -[AXMIDIDevice supportsMMC](self, "supportsMMC");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Supports MMC: %@\n"), v13);

  -[AXMIDIDevice entities](self, "entities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" Entities: %@\n"), v16);

  if (objc_msgSend(v15, "count"))
  {
    v17 = 0;
    v18 = CFSTR("     Name: %@\n");
    v19 = CFSTR("     Manufacturer: %@\n");
    v20 = CFSTR("     Model: %@\n");
    v80 = v15;
    do
    {
      v82 = v17 + 1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("  Entity %@ of %@\n"), v21, v22);

      objc_msgSend(v15, "objectAtIndex:", v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("   Name: %@\n"), v24);

      objc_msgSend(v23, "driverName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("   Driver: %@\n"), v25);

      objc_msgSend(v23, "uniqueID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("   Unique ID: %@\n"), v26);

      objc_msgSend(v23, "deviceID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("   Device ID: %@\n"), v27);

      objc_msgSend(v23, "isEmbedded");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("   Is Embedded: %@\n"), v28);

      objc_msgSend(v23, "isBroadcast");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("   Is Broadcast: %@\n"), v29);

      objc_msgSend(v23, "isOffline");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("   Is Offline: %@\n"), v30);

      objc_msgSend(v23, "isPrivate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("   Is Private: %@\n"), v31);

      objc_msgSend(v23, "supportsGeneralMIDI");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("   Supports General MIDI: %@\n"), v32);

      objc_msgSend(v23, "supportsMMC");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("   Supports MMC: %@\n"), v33);

      v34 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v23, "sources");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "numberWithUnsignedInteger:", objc_msgSend(v35, "count"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("   Sources: %@\n"), v36);

      v83 = v23;
      objc_msgSend(v23, "sources");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "allObjects");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v38, "count"))
      {
        v39 = 0;
        do
        {
          v40 = v39 + 1;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v39 + 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v38, "count"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("    Source %@ of %@\n"), v41, v42);

          objc_msgSend(v38, "objectAtIndex:", v39);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "name");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", v18, v44);

          objc_msgSend(v43, "manufacturer");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", v19, v45);

          objc_msgSend(v43, "model");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", v20, v46);

          objc_msgSend(v43, "driverName");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("     Driver: %@\n"), v47);

          objc_msgSend(v43, "uniqueID");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("     Unique ID: %@\n"), v48);

          objc_msgSend(v43, "receiveChannels");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("     Receive Channels: %@\n"), v49);

          objc_msgSend(v43, "transmitChannels");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("     Transmit Channels: %@\n"), v50);

          objc_msgSend(v43, "isEmbedded");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("     Is Embedded: %@\n"), v51);

          objc_msgSend(v43, "isBroadcast");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("     Is Broadcast: %@\n"), v52);

          objc_msgSend(v43, "isOffline");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("     Is Offline: %@\n"), v53);

          objc_msgSend(v43, "isPrivate");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("     Is Private: %@\n"), v54);

          v39 = v40;
        }
        while (v40 < objc_msgSend(v38, "count"));
      }
      v81 = v38;
      objc_msgSend(v83, "destinations");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "allObjects");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v56, "count"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("   Destinations: %@\n"), v57);

      v58 = v19;
      v59 = v18;
      if (objc_msgSend(v56, "count"))
      {
        v60 = 0;
        do
        {
          v61 = v60 + 1;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v60 + 1);
          v62 = v20;
          v63 = v59;
          v64 = v58;
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v56, "count"));
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("    Destination %@ of %@\n"), v65, v66);

          v58 = v64;
          v59 = v63;
          v20 = v62;
          objc_msgSend(v56, "objectAtIndex:", v60);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "name");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", v59, v68);

          objc_msgSend(v67, "manufacturer");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", v58, v69);

          objc_msgSend(v67, "model");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", v62, v70);

          objc_msgSend(v67, "driverName");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("     Driver: %@\n"), v71);

          objc_msgSend(v67, "uniqueID");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("     Unique ID: %@\n"), v72);

          objc_msgSend(v67, "receiveChannels");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("     Receive Channels: %@\n"), v73);

          objc_msgSend(v67, "transmitChannels");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("     Transmit Channels: %@\n"), v74);

          objc_msgSend(v67, "isEmbedded");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("     Is Embedded: %@\n"), v75);

          objc_msgSend(v67, "isBroadcast");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("     Is Broadcast: %@\n"), v76);

          objc_msgSend(v67, "isOffline");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("     Is Offline: %@\n"), v77);

          objc_msgSend(v67, "isPrivate");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("     Is Private: %@\n"), v78);

          v60 = v61;
        }
        while (v61 < objc_msgSend(v56, "count"));
      }

      v15 = v80;
      v17 = v82;
      v18 = v59;
      v19 = v58;
    }
    while (v82 < objc_msgSend(v80, "count"));
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AXMIDIDevice uniqueID](self, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AXMIDIDevice uniqueID](self, "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (NSString)name
{
  return (NSString *)_AXMIDIStringProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E0C9E648], CFSTR("kMIDIPropertyName"));
}

- (NSString)manufacturer
{
  return (NSString *)_AXMIDIStringProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E0C9E638], CFSTR("kMIDIPropertyManufacturer"));
}

- (NSString)model
{
  return (NSString *)_AXMIDIStringProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E0C9E640], CFSTR("kMIDIPropertyModel"));
}

- (NSNumber)uniqueID
{
  return (NSNumber *)_AXMIDIIntegerProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E0C9E678], CFSTR("kMIDIPropertyUniqueID"));
}

- (NSNumber)deviceID
{
  return (NSNumber *)_AXMIDIIntegerProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E0C9E618], CFSTR("kMIDIPropertyDeviceID"));
}

- (NSNumber)isOffline
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E0C9E650], CFSTR("kMIDIPropertyOffline"));
}

- (NSNumber)isPrivate
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E0C9E658], CFSTR("kMIDIPropertyPrivate"));
}

- (NSString)driverName
{
  return (NSString *)_AXMIDIStringProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E0C9E620], CFSTR("kMIDIPropertyDriverOwner"));
}

- (NSNumber)supportsGeneralMIDI
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E0C9E660], CFSTR("kMIDIPropertySupportsGeneralMIDI"));
}

- (id)supportsGeneralMMC
{
  return _AXMIDIBooleanProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E0C9E668], CFSTR("kMIDIPropertySupportsMMC"));
}

- (void)resetAndDetectEntities
{
  ItemCount NumberOfEntities;
  ItemCount v4;
  ItemCount i;
  id v6;

  NumberOfEntities = MIDIDeviceGetNumberOfEntities(self->_midiDevice);
  if (NumberOfEntities)
  {
    v4 = NumberOfEntities;
    for (i = 0; i != v4; ++i)
      v6 = -[AXMIDIDevice _entityForMidiEntity:addIfNeeded:](self, "_entityForMidiEntity:addIfNeeded:", MIDIDeviceGetEntity(self->_midiDevice, i), 1);
  }
}

- (void)addMidiEntity:(unsigned int)a3
{
  id v3;

  v3 = -[AXMIDIDevice _entityForMidiEntity:addIfNeeded:](self, "_entityForMidiEntity:addIfNeeded:", *(_QWORD *)&a3, 1);
}

- (void)removeMidiEntity:(unsigned int)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[AXMIDIDevice _entityForMidiEntity:addIfNeeded:](self, "_entityForMidiEntity:addIfNeeded:", *(_QWORD *)&a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    AXLogMIDI();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_INFO, "Removing entity: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(v4, "setDevice:", 0);
    -[AXMIDIDevice entities](self, "entities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v4);

    -[AXMIDIDevice delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "device:didRemoveEntity:", self, v4);

  }
}

- (void)addMidiSource:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  AXMIDIEntityForEndpoint(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    -[AXMIDIDevice _entityForMidiEntity:addIfNeeded:](self, "_entityForMidiEntity:addIfNeeded:", objc_msgSend(v5, "MIDIEntity"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addMidiSource:", v3);

    v5 = v7;
  }

}

- (void)removeMidiSource:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  AXMIDIEntityForEndpoint(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    -[AXMIDIDevice _entityForMidiEntity:addIfNeeded:](self, "_entityForMidiEntity:addIfNeeded:", objc_msgSend(v5, "MIDIEntity"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeMidiSource:", v3);

    v5 = v7;
  }

}

- (void)addMidiDestination:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  AXMIDIEntityForEndpoint(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    -[AXMIDIDevice _entityForMidiEntity:addIfNeeded:](self, "_entityForMidiEntity:addIfNeeded:", objc_msgSend(v5, "MIDIEntity"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addMidiDestination:", v3);

    v5 = v7;
  }

}

- (void)removeMidiDestination:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  AXMIDIEntityForEndpoint(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    -[AXMIDIDevice _entityForMidiEntity:addIfNeeded:](self, "_entityForMidiEntity:addIfNeeded:", objc_msgSend(v5, "MIDIEntity"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeMidiDestination:", v3);

    v5 = v7;
  }

}

- (id)_entityForMidiEntity:(unsigned int)a3 addIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  AXMIDIDeviceEntity *v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  AXMIDIDeviceEntity *v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AXMIDIDevice entities](self, "entities", 0);
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
        if (objc_msgSend(v12, "midiEntity") == (_DWORD)v5)
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
  v13 = -[AXMIDIDeviceEntity initWithMIDIEntity:device:]([AXMIDIDeviceEntity alloc], "initWithMIDIEntity:device:", v5, self);
  -[AXMIDIDevice entities](self, "entities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v13);

  AXLogMIDI();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_18C62B000, v15, OS_LOG_TYPE_INFO, "Did add entity: %@", buf, 0xCu);
  }

  -[AXMIDIDeviceEntity resetAndDetectEndpoints](v13, "resetAndDetectEndpoints");
  -[AXMIDIDevice delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "device:didAddEntity:", self, v13);
LABEL_14:

  return v13;
}

- (void)entity:(id)a3 didAddSource:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AXMIDIDevice delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device:entity:didAddSource:", self, v7, v6);

}

- (void)entity:(id)a3 didRemoveSource:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AXMIDIDevice delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device:entity:didRemoveSource:", self, v7, v6);

}

- (void)entity:(id)a3 didAddDestination:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AXMIDIDevice delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device:entity:didAddDestination:", self, v7, v6);

}

- (void)entity:(id)a3 didRemoveDestination:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AXMIDIDevice delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device:entity:didRemoveDestination:", self, v7, v6);

}

- (unsigned)midiDevice
{
  return self->_midiDevice;
}

- (void)setMidiDevice:(unsigned int)a3
{
  self->_midiDevice = a3;
}

- (AXMIDIDeviceProtocol)delegate
{
  return (AXMIDIDeviceProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSNumber)supportsMMC
{
  return self->_supportsMMC;
}

- (NSMutableSet)entities
{
  return self->_entities;
}

- (void)setEntities:(id)a3
{
  objc_storeStrong((id *)&self->_entities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_supportsMMC, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
