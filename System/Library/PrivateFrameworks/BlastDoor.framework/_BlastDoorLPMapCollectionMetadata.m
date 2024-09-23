@implementation _BlastDoorLPMapCollectionMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPMapCollectionMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPMapCollectionMetadata *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  _BlastDoorLPImage *icon;
  uint64_t v13;
  _BlastDoorLPImage *image;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _BlastDoorLPImage *darkImage;
  uint64_t v20;
  NSArray *addresses;
  uint64_t v22;
  NSString *publisherName;
  _BlastDoorLPMapCollectionMetadata *v24;
  objc_super v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_BlastDoorLPMapCollectionMetadata;
  v5 = -[_BlastDoorLPMapCollectionMetadata init](&v26, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)&v5->_numberOfItems;
    *(_QWORD *)&v5->_numberOfItems = v6;

    decodeNumberForKey(v4, CFSTR("numberOfItems"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)&v5->super.__dummyPropertyForObservation + 1) = objc_msgSend(v8, "unsignedIntValue");

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v9 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v9;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("image"));
    v11 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (_BlastDoorLPImage *)v11;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("darkImage"));
    v13 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (_BlastDoorLPImage *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_bd_lp_strictlyDecodeArrayOfObjectsOfClasses:forKey:", v17, CFSTR("addresses"));
    v18 = objc_claimAutoreleasedReturnValue();
    darkImage = v5->_darkImage;
    v5->_darkImage = (_BlastDoorLPImage *)v18;

    decodeStringForKey(v4, (uint64_t)CFSTR("publisherName"));
    v20 = objc_claimAutoreleasedReturnValue();
    addresses = v5->_addresses;
    v5->_addresses = (NSArray *)v20;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("publisherIcon"));
    v22 = objc_claimAutoreleasedReturnValue();
    publisherName = v5->_publisherName;
    v5->_publisherName = (NSString *)v22;

    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)&self->_numberOfItems;
  v6 = a3;
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)&self->super.__dummyPropertyForObservation + 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v5, CFSTR("numberOfItems"));

  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_name, CFSTR("icon"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("image"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_image, CFSTR("darkImage"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_darkImage, CFSTR("addresses"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_addresses, CFSTR("publisherName"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_publisherName, CFSTR("publisherIcon"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPMapCollectionMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BlastDoorLPMapCollectionMetadata *v12;

  v4 = +[_BlastDoorLPMapCollectionMetadata allocWithZone:](_BlastDoorLPMapCollectionMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPMapCollectionMetadata name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapCollectionMetadata setName:](v4, "setName:", v5);

    -[_BlastDoorLPMapCollectionMetadata setNumberOfItems:](v4, "setNumberOfItems:", -[_BlastDoorLPMapCollectionMetadata numberOfItems](self, "numberOfItems"));
    -[_BlastDoorLPMapCollectionMetadata icon](self, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapCollectionMetadata setIcon:](v4, "setIcon:", v6);

    -[_BlastDoorLPMapCollectionMetadata image](self, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapCollectionMetadata setImage:](v4, "setImage:", v7);

    -[_BlastDoorLPMapCollectionMetadata darkImage](self, "darkImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapCollectionMetadata setDarkImage:](v4, "setDarkImage:", v8);

    -[_BlastDoorLPMapCollectionMetadata addresses](self, "addresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapCollectionMetadata setAddresses:](v4, "setAddresses:", v9);

    -[_BlastDoorLPMapCollectionMetadata publisherName](self, "publisherName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapCollectionMetadata setPublisherName:](v4, "setPublisherName:", v10);

    -[_BlastDoorLPMapCollectionMetadata publisherIcon](self, "publisherIcon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapCollectionMetadata setPublisherIcon:](v4, "setPublisherIcon:", v11);

    v12 = v4;
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
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_BlastDoorLPMapCollectionMetadata;
  if (-[_BlastDoorLPMapCollectionMetadata isEqual:](&v15, sel_isEqual_, v4))
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
      if ((!(v7 | *(_QWORD *)&self->_numberOfItems) || objc_msgSend((id)v7, "isEqual:"))
        && *((_DWORD *)v6 + 3) == *((_DWORD *)&self->super.__dummyPropertyForObservation + 1)
        && ((v8 = v6[3], !(v8 | (unint64_t)self->_name)) || objc_msgSend((id)v8, "isEqual:"))
        && ((v9 = v6[6], !(v9 | (unint64_t)self->_darkImage)) || objc_msgSend((id)v9, "isEqual:"))
        && ((v10 = v6[4], !(v10 | (unint64_t)self->_icon)) || objc_msgSend((id)v10, "isEqual:"))
        && ((v11 = v6[5], !(v11 | (unint64_t)self->_image)) || objc_msgSend((id)v11, "isEqual:"))
        && ((v12 = v6[7], !(v12 | (unint64_t)self->_addresses)) || objc_msgSend((id)v12, "isEqual:")))
      {
        v13 = v6[8];
        if (v13 | (unint64_t)self->_publisherName)
          v5 = objc_msgSend((id)v13, "isEqual:");
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
  return objc_msgSend(*(id *)&self->_numberOfItems, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  void (*v4)(void);
  id v5;

  v4 = (void (*)(void))*((_QWORD *)a3 + 2);
  v5 = a3;
  v4();
  (*((void (**)(id, const __CFString *))a3 + 2))(v5, CFSTR("darkImage"));
  (*((void (**)(id, const __CFString *))a3 + 2))(v5, CFSTR("icon"));
  (*((void (**)(id, const __CFString *))a3 + 2))(v5, CFSTR("publisherIcon"));

}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("name"), CFSTR("numberOfItems"), CFSTR("icon"), CFSTR("image"), CFSTR("darkImage"), CFSTR("addresses"), CFSTR("publisherName"), CFSTR("publisherIcon"), 0);
}

- (NSString)name
{
  return *(NSString **)&self->_numberOfItems;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)numberOfItems
{
  return *((_DWORD *)&self->super.__dummyPropertyForObservation + 1);
}

- (void)setNumberOfItems:(unsigned int)a3
{
  *((_DWORD *)&self->super.__dummyPropertyForObservation + 1) = a3;
}

- (_BlastDoorLPImage)icon
{
  return (_BlastDoorLPImage *)self->_name;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (_BlastDoorLPImage)image
{
  return self->_icon;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (_BlastDoorLPImage)darkImage
{
  return self->_image;
}

- (void)setDarkImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSArray)addresses
{
  return (NSArray *)self->_darkImage;
}

- (void)setAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)publisherName
{
  return (NSString *)&self->_addresses->super.isa;
}

- (void)setPublisherName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (_BlastDoorLPImage)publisherIcon
{
  return (_BlastDoorLPImage *)self->_publisherName;
}

- (void)setPublisherIcon:(id)a3
{
  objc_storeStrong((id *)&self->_publisherName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherName, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_darkImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_numberOfItems, 0);
}

@end
