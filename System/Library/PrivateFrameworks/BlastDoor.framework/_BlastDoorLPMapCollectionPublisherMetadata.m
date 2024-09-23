@implementation _BlastDoorLPMapCollectionPublisherMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPMapCollectionPublisherMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPMapCollectionPublisherMetadata *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *name;
  _BlastDoorLPMapCollectionPublisherMetadata *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_BlastDoorLPMapCollectionPublisherMetadata;
  v5 = -[_BlastDoorLPMapCollectionPublisherMetadata init](&v13, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)&v5->_numberOfPublishedCollections;
    *(_QWORD *)&v5->_numberOfPublishedCollections = v6;

    decodeNumberForKey(v4, CFSTR("numberOfPublishedCollections"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)&v5->super.__dummyPropertyForObservation + 1) = objc_msgSend(v8, "unsignedIntValue");

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v9 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)&self->_numberOfPublishedCollections;
  v6 = a3;
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)&self->super.__dummyPropertyForObservation + 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v5, CFSTR("numberOfPublishedCollections"));

  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_name, CFSTR("icon"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPMapCollectionPublisherMetadata *v4;
  void *v5;
  void *v6;
  _BlastDoorLPMapCollectionPublisherMetadata *v7;

  v4 = +[_BlastDoorLPMapCollectionPublisherMetadata allocWithZone:](_BlastDoorLPMapCollectionPublisherMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPMapCollectionPublisherMetadata name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapCollectionPublisherMetadata setName:](v4, "setName:", v5);

    -[_BlastDoorLPMapCollectionPublisherMetadata setNumberOfPublishedCollections:](v4, "setNumberOfPublishedCollections:", -[_BlastDoorLPMapCollectionPublisherMetadata numberOfPublishedCollections](self, "numberOfPublishedCollections"));
    -[_BlastDoorLPMapCollectionPublisherMetadata icon](self, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapCollectionPublisherMetadata setIcon:](v4, "setIcon:", v6);

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_BlastDoorLPMapCollectionPublisherMetadata;
  if (-[_BlastDoorLPMapCollectionPublisherMetadata isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[2];
      if ((!(v7 | *(_QWORD *)&self->_numberOfPublishedCollections) || objc_msgSend((id)v7, "isEqual:"))
        && *((_DWORD *)v6 + 3) == *((_DWORD *)&self->super.__dummyPropertyForObservation + 1))
      {
        v8 = v6[3];
        if (v8 | (unint64_t)self->_name)
          v5 = objc_msgSend((id)v8, "isEqual:");
        else
          v5 = 1;
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return objc_msgSend(*(id *)&self->_numberOfPublishedCollections, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("icon"));
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("name"), CFSTR("numberOfPublishedCollections"), CFSTR("icon"), 0);
}

- (NSString)name
{
  return *(NSString **)&self->_numberOfPublishedCollections;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_BlastDoorLPImage)icon
{
  return (_BlastDoorLPImage *)self->_name;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unsigned)numberOfPublishedCollections
{
  return *((_DWORD *)&self->super.__dummyPropertyForObservation + 1);
}

- (void)setNumberOfPublishedCollections:(unsigned int)a3
{
  *((_DWORD *)&self->super.__dummyPropertyForObservation + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_numberOfPublishedCollections, 0);
}

@end
