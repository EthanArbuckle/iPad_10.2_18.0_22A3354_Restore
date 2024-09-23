@implementation MPModelRequest

- (MPModelKind)itemKind
{
  return self->_itemKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSortDescriptors, 0);
  objc_storeStrong((id *)&self->_itemProperties, 0);
  objc_storeStrong((id *)&self->_itemKind, 0);
  objc_storeStrong((id *)&self->_sectionSortDescriptors, 0);
  objc_storeStrong((id *)&self->_sectionProperties, 0);
  objc_storeStrong((id *)&self->_sectionKind, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

uint64_t __29__MPModelRequest_sharedQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)sharedQueue___sharedQueue;
  sharedQueue___sharedQueue = (uint64_t)v0;

  objc_msgSend((id)sharedQueue___sharedQueue, "setMaxConcurrentOperationCount:", 4);
  objc_msgSend((id)sharedQueue___sharedQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPModelRequest.sharedQueue"));
  return objc_msgSend((id)sharedQueue___sharedQueue, "setQualityOfService:", 25);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_label);
    objc_storeStrong(v5 + 6, self->_itemProperties);
    objc_storeStrong(v5 + 3, self->_sectionProperties);
    objc_storeStrong(v5 + 5, self->_itemKind);
    objc_storeStrong(v5 + 2, self->_sectionKind);
    objc_storeStrong(v5 + 7, self->_itemSortDescriptors);
    objc_storeStrong(v5 + 4, self->_sectionSortDescriptors);
  }
  return v5;
}

- (MPModelKind)sectionKind
{
  return self->_sectionKind;
}

- (MPPropertySet)sectionProperties
{
  return self->_sectionProperties;
}

- (void)setItemProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setSectionProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MPPropertySet)itemProperties
{
  return self->_itemProperties;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  MPModelKind *sectionKind;
  void *v9;
  uint64_t v10;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  if (self->_label)
    objc_msgSend(v6, "appendFormat:", CFSTR(" label=“%@“"), self->_label);
  -[MPModelKind humanDescription](self->_itemKind, "humanDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sectionKind = self->_sectionKind;
  if (sectionKind)
  {
    -[MPModelKind humanDescription](sectionKind, "humanDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", v7, CFSTR("itemKind"));
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    objc_msgSend(v6, "appendFormat:", CFSTR(" sectionKind=“%@”"), v9);

  }
  if (self->_itemKind)
    objc_msgSend(v6, "appendFormat:", CFSTR(" itemKind=“%@”"), v7);
  objc_msgSend(v6, "appendString:", CFSTR(">"));

  return v6;
}

- (NSString)label
{
  return self->_label;
}

- (NSArray)itemSortDescriptors
{
  return self->_itemSortDescriptors;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setItemSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)performWithResponseHandler:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "preferredQueue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[MPModelRequest newOperationWithResponseHandler:](self, "newOperationWithResponseHandler:", v4);

  objc_msgSend(v6, "addOperation:", v5);
}

+ (NSOperationQueue)preferredQueue
{
  if ((objc_msgSend(a1, "requiresNetwork") & 1) != 0)
    objc_msgSend(a1, "sharedNetworkQueue");
  else
    objc_msgSend(a1, "sharedQueue");
  return (NSOperationQueue *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)sharedQueue
{
  if (sharedQueue_onceToken != -1)
    dispatch_once(&sharedQueue_onceToken, &__block_literal_global_14344);
  return (id)sharedQueue___sharedQueue;
}

+ (BOOL)requiresNetwork
{
  return 0;
}

- (void)setSectionSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (MPModelRequest)initWithCoder:(id)a3
{
  id v4;
  MPModelRequest *v5;
  uint64_t v6;
  NSString *label;
  uint64_t v8;
  MPPropertySet *sectionProperties;
  uint64_t v10;
  MPPropertySet *itemProperties;
  uint64_t v12;
  MPModelKind *itemKind;
  uint64_t v14;
  MPModelKind *sectionKind;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *sectionSortDescriptors;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *itemSortDescriptors;

  v4 = a3;
  v5 = -[MPModelRequest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPModelRequestLabel"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPModelRequestSectionProperties"));
    v8 = objc_claimAutoreleasedReturnValue();
    sectionProperties = v5->_sectionProperties;
    v5->_sectionProperties = (MPPropertySet *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPModelRequestItemProperties"));
    v10 = objc_claimAutoreleasedReturnValue();
    itemProperties = v5->_itemProperties;
    v5->_itemProperties = (MPPropertySet *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemKind"));
    v12 = objc_claimAutoreleasedReturnValue();
    itemKind = v5->_itemKind;
    v5->_itemKind = (MPModelKind *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectionKind"));
    v14 = objc_claimAutoreleasedReturnValue();
    sectionKind = v5->_sectionKind;
    v5->_sectionKind = (MPModelKind *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("MPModelRequestSectionSortDescriptors"));
    v19 = objc_claimAutoreleasedReturnValue();
    sectionSortDescriptors = v5->_sectionSortDescriptors;
    v5->_sectionSortDescriptors = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("MPModelRequestItemSortDescriptors"));
    v24 = objc_claimAutoreleasedReturnValue();
    itemSortDescriptors = v5->_itemSortDescriptors;
    v5->_itemSortDescriptors = (NSArray *)v24;

  }
  return v5;
}

- (void)setItemKind:(id)a3
{
  objc_storeStrong((id *)&self->_itemKind, a3);
}

- (void)setSectionKind:(id)a3
{
  objc_storeStrong((id *)&self->_sectionKind, a3);
}

- (id)debugDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  MPModelKind *sectionKind;
  void *v8;
  MPPropertySet *sectionProperties;
  void *v10;
  MPModelKind *itemKind;
  void *v12;
  MPPropertySet *itemProperties;
  void *v14;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  if (self->_label)
    objc_msgSend(v6, "appendFormat:", CFSTR("; label = %@"), self->_label);
  sectionKind = self->_sectionKind;
  if (sectionKind)
  {
    -[MPModelKind debugDescription](sectionKind, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; sectionKind=%@"), v8);

  }
  sectionProperties = self->_sectionProperties;
  if (sectionProperties)
  {
    -[MPPropertySet debugDescription](sectionProperties, "debugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; sectionProperties = %@"), v10);

  }
  itemKind = self->_itemKind;
  if (itemKind)
  {
    -[MPModelKind debugDescription](itemKind, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; itemKind=%@"), v12);

  }
  itemProperties = self->_itemProperties;
  if (itemProperties)
  {
    -[MPPropertySet debugDescription](itemProperties, "debugDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; itemProperties = %@"), v14);

  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *label;
  id v5;

  label = self->_label;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", label, CFSTR("MPModelRequestLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sectionProperties, CFSTR("MPModelRequestSectionProperties"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemProperties, CFSTR("MPModelRequestItemProperties"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemKind, CFSTR("itemKind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sectionKind, CFSTR("sectionKind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sectionSortDescriptors, CFSTR("MPModelRequestSectionSortDescriptors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemSortDescriptors, CFSTR("MPModelRequestItemSortDescriptors"));

}

- (void)responseWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "preferredQueue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[MPModelRequest newOperationWithResponseHandler:](self, "newOperationWithResponseHandler:", v4);

  objc_msgSend(v6, "addOperation:", v5);
}

- (id)newOperationWithResponseHandler:(id)a3
{
  uint64_t v5;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;

  v5 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v5 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelRequest.m"), 169, CFSTR("Subclass %@ must implement -%@ defined in %@."), v9, v10, CFSTR("[MPModelRequest class]"));

  }
  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", &__block_literal_global_55);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (Class)sectionClass
{
  void *v2;
  void *v3;

  -[MPModelRequest sectionKind](self, "sectionKind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (void)setSectionClass:(Class)a3
{
  uint64_t v5;
  id v6;

  if (a3)
  {
    -[MPModelRequest _kindForClass:](self, "_kindForClass:");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", a3);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (id)v5;
    -[MPModelRequest setSectionKind:](self, "setSectionKind:", v5);

  }
  else
  {
    -[MPModelRequest setSectionKind:](self, "setSectionKind:");
  }
}

- (Class)itemClass
{
  void *v2;
  void *v3;

  -[MPModelRequest itemKind](self, "itemKind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (void)setItemClass:(Class)a3
{
  uint64_t v5;
  id v6;

  if (a3)
  {
    -[MPModelRequest _kindForClass:](self, "_kindForClass:");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", a3);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (id)v5;
    -[MPModelRequest setItemKind:](self, "setItemKind:", v5);

  }
  else
  {
    -[MPModelRequest setItemKind:](self, "setItemKind:");
  }
}

- (id)_kindForClass:(Class)a3
{
  void *v6;
  void *v7;
  __objc2_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  if ((Class)objc_opt_class() == a3)
  {
    +[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelAlbum kindWithSongKind:](MPModelAlbum, "kindWithSongKind:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v8 = MPModelArtist;
LABEL_15:
    +[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelAlbum kindWithSongKind:](MPModelAlbum, "kindWithSongKind:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[__objc2_class kindWithAlbumKind:](v8, "kindWithAlbumKind:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v8 = MPModelComposer;
    goto LABEL_15;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v8 = MPModelGenre;
    goto LABEL_15;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[MPModelRequest _kindForClass:](self, "_kindForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelPlaylist kindWithVariants:playlistEntryKind:options:](MPModelPlaylist, "kindWithVariants:playlistEntryKind:options:", 223, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((Class)objc_opt_class() == a3)
    {
      -[MPModelRequest _kindForClass:](self, "_kindForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v9;
      +[MPModelTVEpisode kindWithVariants:](MPModelTVEpisode, "kindWithVariants:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((Class)objc_opt_class() == a3)
      {
        +[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 3);
        return (id)objc_claimAutoreleasedReturnValue();
      }
      if ((Class)objc_opt_class() != a3)
        return 0;
      v15[0] = CFSTR("MPModelRelationshipGenericAlbum");
      -[MPModelRequest _kindForClass:](self, "_kindForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = CFSTR("MPModelRelationshipGenericPlaylist");
      v16[0] = v9;
      -[MPModelRequest _kindForClass:](self, "_kindForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPModelGenericObject kindWithRelationshipKinds:](MPModelGenericObject, "kindWithRelationshipKinds:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v14;

  }
LABEL_16:

  return v11;
}

- (NSArray)sectionSortDescriptors
{
  return self->_sectionSortDescriptors;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharedNetworkQueue
{
  if (sharedNetworkQueue_onceToken != -1)
    dispatch_once(&sharedNetworkQueue_onceToken, &__block_literal_global_43);
  return (id)sharedNetworkQueue___sharedNetworkQueue;
}

uint64_t __36__MPModelRequest_sharedNetworkQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)sharedNetworkQueue___sharedNetworkQueue;
  sharedNetworkQueue___sharedNetworkQueue = (uint64_t)v0;

  objc_msgSend((id)sharedNetworkQueue___sharedNetworkQueue, "setMaxConcurrentOperationCount:", 4);
  objc_msgSend((id)sharedNetworkQueue___sharedNetworkQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPModelRequest.sharedNetworkQueue"));
  return objc_msgSend((id)sharedNetworkQueue___sharedNetworkQueue, "setQualityOfService:", 25);
}

@end
