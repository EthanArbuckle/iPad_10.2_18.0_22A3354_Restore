@implementation MIDICIDeviceInfo

- (MIDICIDeviceInfo)initWithDestination:(MIDIEntityRef)midiDestination manufacturer:(NSData *)manufacturer family:(NSData *)family model:(NSData *)modelNumber revision:(NSData *)revisionLevel
{
  NSData *v13;
  NSData *v14;
  NSData *v15;
  NSData *v16;
  MIDICIDeviceInfo *v17;
  id *p_isa;
  MIDICIDeviceInfo *v19;
  objc_super v21;

  v13 = manufacturer;
  v14 = family;
  v15 = modelNumber;
  v16 = revisionLevel;
  if (!midiDestination
    || -[NSData length](v13, "length") != 3
    || -[NSData length](v14, "length") != 2
    || -[NSData length](v15, "length") != 2
    || -[NSData length](v16, "length") != 4)
  {
    goto LABEL_9;
  }
  v21.receiver = self;
  v21.super_class = (Class)MIDICIDeviceInfo;
  v17 = -[MIDICIDeviceInfo init](&v21, sel_init);
  if (!v17)
  {
    self = 0;
LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
  v17->_midiDestination = midiDestination;
  p_isa = (id *)&v17->super.isa;
  objc_storeStrong((id *)&v17->_manufacturerID, manufacturer);
  objc_storeStrong(p_isa + 2, family);
  objc_storeStrong(p_isa + 3, modelNumber);
  objc_storeStrong(p_isa + 4, revisionLevel);
  self = p_isa;
  v19 = self;
LABEL_10:

  return v19;
}

- (MIDICIDeviceInfo)initWithDestination:(unsigned int)a3 deviceID:(MIDICIDeviceIdentification *)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MIDICIDeviceInfo *v11;

  v5 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a4, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a4->family, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a4->modelNumber, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a4->revisionLevel, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MIDICIDeviceInfo initWithDestination:manufacturer:family:model:revision:](self, "initWithDestination:manufacturer:family:model:revision:", v5, v7, v8, v9, v10);

  return v11;
}

- (MIDICIDeviceIdentification)asDeviceIDStruct
{
  NSData *manufacturerID;
  NSData *family;
  NSData *model;
  NSData *revision;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  MIDICIDeviceIdentification result;

  v9 = 0;
  v10 = 0;
  manufacturerID = self->_manufacturerID;
  if (manufacturerID && -[NSData length](manufacturerID, "length") == 3)
    memcpy(&v9, -[NSData bytes](self->_manufacturerID, "bytes"), -[NSData length](self->_manufacturerID, "length"));
  family = self->_family;
  if (family && -[NSData length](family, "length") == 2)
    memcpy((char *)&v9 + 3, -[NSData bytes](self->_family, "bytes"), -[NSData length](self->_family, "length"));
  model = self->_model;
  if (model && -[NSData length](model, "length") == 2)
    memcpy((char *)&v9 + 5, -[NSData bytes](self->_model, "bytes"), -[NSData length](self->_model, "length"));
  revision = self->_revision;
  if (revision && -[NSData length](revision, "length") == 4)
    memcpy((char *)&v9 + 7, -[NSData bytes](self->_revision, "bytes"), -[NSData length](self->_revision, "length"));
  v7 = v9;
  v8 = v10;
  *(_DWORD *)&result.revisionLevel[1] = v8;
  *(_DWORD *)&result.reserved[1] = HIDWORD(v8);
  *(_WORD *)result.manufacturer = v7;
  result.manufacturer[2] = BYTE2(v7);
  *(_WORD *)result.family = *(_WORD *)((char *)&v7 + 3);
  *(_WORD *)result.modelNumber = *(_WORD *)((char *)&v7 + 5);
  result.revisionLevel[0] = HIBYTE(v7);
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<MIDICIDeviceID(%p) manufacturer: %@, family: %@, model: %@, revision: %@>"), self, self->_manufacturerID, self->_family, self->_model, self->_revision);
}

- (MIDICIDeviceInfo)initWithCoder:(id)a3
{
  id v4;
  MIDICIDeviceInfo *v5;
  uint64_t v6;
  NSData *manufacturerID;
  uint64_t v8;
  NSData *family;
  uint64_t v10;
  NSData *model;
  uint64_t v12;
  NSData *revision;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MIDICIDeviceInfo;
  v5 = -[MIDICIDeviceInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manufacturerID"));
    v6 = objc_claimAutoreleasedReturnValue();
    manufacturerID = v5->_manufacturerID;
    v5->_manufacturerID = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("family"));
    v8 = objc_claimAutoreleasedReturnValue();
    family = v5->_family;
    v5->_family = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
    v10 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("revision"));
    v12 = objc_claimAutoreleasedReturnValue();
    revision = v5->_revision;
    v5->_revision = (NSData *)v12;

    v5->_midiDestination = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("midiDestination"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_manufacturerID, CFSTR("manufacturerID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_family, CFSTR("family"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_model, CFSTR("model"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_revision, CFSTR("revision"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_midiDestination, CFSTR("midiDestination"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "midiDestination") == self->_midiDestination)
  {
    objc_msgSend(v4, "manufacturerID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToData:", self->_manufacturerID))
    {
      objc_msgSend(v4, "family");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToData:", self->_family))
      {
        objc_msgSend(v4, "modelNumber");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqualToData:", self->_model))
        {
          objc_msgSend(v4, "revisionLevel");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "isEqualToData:", self->_revision);

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSData)manufacturerID
{
  return self->_manufacturerID;
}

- (NSData)family
{
  return self->_family;
}

- (NSData)modelNumber
{
  return self->_model;
}

- (NSData)revisionLevel
{
  return self->_revision;
}

- (MIDIEndpointRef)midiDestination
{
  return self->_midiDestination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_family, 0);
  objc_storeStrong((id *)&self->_manufacturerID, 0);
}

+ (id)description
{
  return CFSTR("MIDI-CI Device Info");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
