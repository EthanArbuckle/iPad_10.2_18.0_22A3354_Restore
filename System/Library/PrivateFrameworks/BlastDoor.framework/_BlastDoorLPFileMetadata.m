@implementation _BlastDoorLPFileMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPFileMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPFileMetadata *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *type;
  void *v10;
  uint64_t v11;
  _BlastDoorLPImage *thumbnail;
  uint64_t v13;
  _BlastDoorLPImage *icon;
  uint64_t v15;
  NSDate *creationDate;
  _BlastDoorLPFileMetadata *v17;
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_BlastDoorLPFileMetadata;
  v5 = -[_BlastDoorLPFileMetadata init](&v19, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("type"));
    v8 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v8;

    decodeNumberForKey(v4, CFSTR("size"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_size = objc_msgSend(v10, "unsignedLongLongValue");

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("thumbnail"));
    v11 = objc_claimAutoreleasedReturnValue();
    thumbnail = v5->_thumbnail;
    v5->_thumbnail = (_BlastDoorLPImage *)v11;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v13 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (_BlastDoorLPImage *)v13;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v15 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v15;

    v17 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_type, CFSTR("type"));
  if (self->_size)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("size"));

  }
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_thumbnail, CFSTR("thumbnail"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_creationDate, CFSTR("creationDate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPFileMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BlastDoorLPFileMetadata *v10;

  v4 = +[_BlastDoorLPFileMetadata allocWithZone:](_BlastDoorLPFileMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPFileMetadata name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPFileMetadata setName:](v4, "setName:", v5);

    -[_BlastDoorLPFileMetadata type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPFileMetadata setType:](v4, "setType:", v6);

    -[_BlastDoorLPFileMetadata setSize:](v4, "setSize:", -[_BlastDoorLPFileMetadata size](self, "size"));
    -[_BlastDoorLPFileMetadata thumbnail](self, "thumbnail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPFileMetadata setThumbnail:](v4, "setThumbnail:", v7);

    -[_BlastDoorLPFileMetadata icon](self, "icon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPFileMetadata setIcon:](v4, "setIcon:", v8);

    -[_BlastDoorLPFileMetadata creationDate](self, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPFileMetadata setCreationDate:](v4, "setCreationDate:", v9);

    v10 = v4;
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
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_BlastDoorLPFileMetadata;
  if (-[_BlastDoorLPFileMetadata isEqual:](&v13, sel_isEqual_, v4))
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
      if ((!(v7 | (unint64_t)self->_name) || objc_msgSend((id)v7, "isEqual:"))
        && ((v8 = v6[3], !(v8 | (unint64_t)self->_type)) || objc_msgSend((id)v8, "isEqual:"))
        && v6[4] == self->_size
        && ((v9 = v6[5], !(v9 | (unint64_t)self->_thumbnail)) || objc_msgSend((id)v9, "isEqual:"))
        && ((v10 = v6[6], !(v10 | (unint64_t)self->_icon)) || objc_msgSend((id)v10, "isEqual:")))
      {
        v11 = v6[7];
        if (v11 | (unint64_t)self->_creationDate)
          v5 = objc_msgSend((id)v11, "isEqual:");
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
  return -[NSString hash](self->_name, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  void (*v4)(void);
  id v5;

  v4 = (void (*)(void))*((_QWORD *)a3 + 2);
  v5 = a3;
  v4();
  (*((void (**)(id, const __CFString *))a3 + 2))(v5, CFSTR("icon"));

}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("name"), CFSTR("type"), CFSTR("size"), CFSTR("thumbnail"), CFSTR("icon"), CFSTR("creationDate"), CFSTR("encodedTokens"), 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (_BlastDoorLPImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (_BlastDoorLPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
