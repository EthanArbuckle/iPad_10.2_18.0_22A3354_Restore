@implementation MIDICIProfile

- (BOOL)isEqual:(id)a3
{
  return -[NSData isEqualToData:](self->_profileID, "isEqualToData:", *((_QWORD *)a3 + 2));
}

- (MIDICIProfile)initWithCoder:(id)a3
{
  id v4;
  MIDICIProfile *v5;
  uint64_t v6;
  NSData *profileID;
  uint64_t v8;
  NSString *name;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MIDICIProfile;
  v5 = -[MIDICIProfile init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("profileID"));
    v6 = objc_claimAutoreleasedReturnValue();
    profileID = v5->_profileID;
    v5->_profileID = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_profileID, CFSTR("profileID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"));

}

- (MIDICIProfile)initWithData:(NSData *)data
{
  NSData *v4;
  void **v5;
  void *v6;
  MIDICIProfile *v7;
  void *__p[2];
  char v10;

  v4 = objc_retainAutorelease(data);
  CIProfileBytesToName((uint64_t)__p, (_BYTE *)-[NSData bytes](v4, "bytes"), -[NSData length](v4, "length"));
  if (v10 >= 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MIDICIProfile initWithData:name:](self, "initWithData:name:", v4, v6);

  if (v10 < 0)
    operator delete(__p[0]);

  return v7;
}

- (MIDICIProfile)initWithData:(NSData *)data name:(NSString *)inName
{
  NSData *v6;
  NSString *v7;
  MIDICIProfile *v8;
  uint64_t v9;
  NSData *profileID;
  uint64_t v11;
  NSString *name;
  objc_super v14;

  v6 = data;
  v7 = inName;
  v14.receiver = self;
  v14.super_class = (Class)MIDICIProfile;
  v8 = -[MIDICIProfile init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    profileID = v8->_profileID;
    v8->_profileID = (NSData *)v9;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v11;

  }
  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)profileID
{
  return self->_profileID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)description
{
  return CFSTR("MIDI-CI Profile");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
