@implementation FSVolumeDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  FSVolumeIdentifier *volumeID;
  id v5;

  volumeID = self->_volumeID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", volumeID, CFSTR("FSVolumeDescription.volumeID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_volumeName, CFSTR("FSVolumeDescription.volumeName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_volumeState, CFSTR("FSVolumeDescription.volumeState"));

}

- (FSVolumeDescription)initWithCoder:(id)a3
{
  id v4;
  FSVolumeDescription *v5;
  uint64_t v6;
  FSVolumeIdentifier *volumeID;
  uint64_t v8;
  FSFileName *volumeName;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FSVolumeDescription;
  v5 = -[FSVolumeDescription init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSVolumeDescription.volumeID"));
    v6 = objc_claimAutoreleasedReturnValue();
    volumeID = v5->_volumeID;
    v5->_volumeID = (FSVolumeIdentifier *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSVolumeDescription.volumeName"));
    v8 = objc_claimAutoreleasedReturnValue();
    volumeName = v5->_volumeName;
    v5->_volumeName = (FSFileName *)v8;

    v5->_volumeState = (int)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FSVolumeDescription.volumeState"));
  }

  return v5;
}

- (FSVolumeDescription)initWithID:(id)a3 name:(id)a4 state:(int64_t)a5
{
  id v8;
  id v9;
  FSVolumeDescription *v10;
  uint64_t v11;
  FSVolumeIdentifier *volumeID;
  uint64_t v13;
  FSFileName *volumeName;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FSVolumeDescription;
  v10 = -[FSVolumeDescription init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    volumeID = v10->_volumeID;
    v10->_volumeID = (FSVolumeIdentifier *)v11;

    v13 = objc_msgSend(v9, "copy");
    volumeName = v10->_volumeName;
    v10->_volumeName = (FSFileName *)v13;

    v10->_volumeState = a5;
  }

  return v10;
}

+ (id)volumeDescriptionWithID:(id)a3 name:(id)a4 state:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithID:name:state:", v9, v8, a5);

  return v10;
}

- (id)description
{
  FSVolumeIdentifier *volumeID;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  volumeID = self->_volumeID;
  if (volumeID)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" ID (%@)"), volumeID);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_250C33628;
  }
  if (self->_volumeName)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" name (%@)"), self->_volumeName);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_250C33628;
  }
  if (self->_volumeState)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" state (%ld)"), self->_volumeState);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_250C33628;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FSVolumeDescription%@%@%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (FSVolumeIdentifier)volumeID
{
  return (FSVolumeIdentifier *)objc_getProperty(self, a2, 8, 1);
}

- (FSFileName)volumeName
{
  return (FSFileName *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)volumeState
{
  return self->_volumeState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeName, 0);
  objc_storeStrong((id *)&self->_volumeID, 0);
}

@end
