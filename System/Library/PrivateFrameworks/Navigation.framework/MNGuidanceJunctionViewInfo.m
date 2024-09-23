@implementation MNGuidanceJunctionViewInfo

- (MNGuidanceJunctionViewInfo)initWithID:(id)a3 images:(id)a4
{
  id v7;
  id v8;
  MNGuidanceJunctionViewInfo *v9;
  MNGuidanceJunctionViewInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MNGuidanceJunctionViewInfo;
  v9 = -[MNGuidanceJunctionViewInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uniqueID, a3);
    objc_storeStrong((id *)&v10->_images, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_images;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v3, "appendFormat:", CFSTR("%ld"), objc_msgSend(v9, "imageID"));
        -[NSArray lastObject](self->_images, "lastObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 != v9)
          objc_msgSend(v3, "appendString:", CFSTR(", "));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UUID: %@, Image IDs: %@"), self->_uniqueID, v3, (_QWORD)v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNGuidanceJunctionViewInfo)initWithCoder:(id)a3
{
  id v4;
  MNGuidanceJunctionViewInfo *v5;
  uint64_t v6;
  NSUUID *uniqueID;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *images;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MNGuidanceJunctionViewInfo;
  v5 = -[MNGuidanceJunctionViewInfo init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uniqueID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSUUID *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_images"));
    v11 = objc_claimAutoreleasedReturnValue();
    images = v5->_images;
    v5->_images = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uniqueID;
  id v5;

  uniqueID = self->_uniqueID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueID, CFSTR("_uniqueID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_images, CFSTR("_images"));

}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (NSArray)images
{
  return self->_images;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
