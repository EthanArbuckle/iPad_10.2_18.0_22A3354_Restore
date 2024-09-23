@implementation NTKTrackedPhotosContent

- (NTKTrackedPhotosContent)initWithAlbumUUID:(id)a3
{
  id v5;
  NTKTrackedPhotosContent *v6;
  NTKTrackedPhotosContent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKTrackedPhotosContent;
  v6 = -[NTKTrackedPhotosContent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_albumUUID, a3);

  return v7;
}

- (NTKTrackedPhotosContent)initWithShuffleUUID:(id)a3
{
  id v5;
  NTKTrackedPhotosContent *v6;
  NTKTrackedPhotosContent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKTrackedPhotosContent;
  v6 = -[NTKTrackedPhotosContent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_shuffleUUID, a3);

  return v7;
}

- (NTKTrackedPhotosContent)initWithCoder:(id)a3
{
  id v4;
  NTKTrackedPhotosContent *v5;
  uint64_t v6;
  NSUUID *albumUUID;
  uint64_t v8;
  NSUUID *shuffleUUID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKTrackedPhotosContent;
  v5 = -[NTKTrackedPhotosContent init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("albumUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    albumUUID = v5->_albumUUID;
    v5->_albumUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("shuffleUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    shuffleUUID = v5->_shuffleUUID;
    v5->_shuffleUUID = (NSUUID *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *albumUUID;
  id v5;

  albumUUID = self->_albumUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", albumUUID, CFSTR("albumUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shuffleUUID, CFSTR("shuffleUUID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)albumUUID
{
  return self->_albumUUID;
}

- (NSUUID)shuffleUUID
{
  return self->_shuffleUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shuffleUUID, 0);
  objc_storeStrong((id *)&self->_albumUUID, 0);
}

@end
