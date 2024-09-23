@implementation MPStoreLibraryPersonalizationRequest

- (MPSectionedCollection)unpersonalizedContentDescriptors
{
  return self->_unpersonalizedContentDescriptors;
}

- (MPSectionedCollection)representedObjects
{
  return self->_representedObjects;
}

- (MPMediaLibrary)mediaLibraryOverrideForTestingOnly
{
  return self->_mediaLibraryOverrideForTestingOnly;
}

- (NSDictionary)itemIndexPathToOverridePropertySet
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_itemIndexPathToOverridePropertySet, "copy");
}

+ (id)libraryViewWithUserIdentity:(id)a3
{
  id v3;
  MPMediaLibraryView *v4;
  void *v5;
  MPMediaLibraryView *v6;

  v3 = a3;
  v4 = [MPMediaLibraryView alloc];
  +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPMediaLibraryView initWithLibrary:filteringOptions:](v4, "initWithLibrary:filteringOptions:", v5, 4);

  return v6;
}

- (void)setRepresentedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_representedObjects, a3);
}

- (MPStoreLibraryPersonalizationRequest)init
{
  MPStoreLibraryPersonalizationRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPStoreLibraryPersonalizationRequest;
  result = -[MPStoreLibraryPersonalizationRequest init](&v3, sel_init);
  if (result)
    result->_matchAlbumArtistsOnNameAndStoreID = 1;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibraryOverrideForTestingOnly, 0);
  objc_storeStrong((id *)&self->_representedObjects, 0);
  objc_storeStrong((id *)&self->_unpersonalizedContentDescriptors, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_itemIndexPathToOverridePropertySet, 0);
}

- (MPStoreLibraryPersonalizationRequest)initWithUnpersonalizedRequest:(id)a3 unpersonalizedContentDescriptors:(id)a4
{
  id v6;
  id v7;
  MPStoreLibraryPersonalizationRequest *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[MPStoreLibraryPersonalizationRequest initWithUnpersonalizedContentDescriptors:](self, "initWithUnpersonalizedContentDescriptors:", v7);
  if (v8)
  {
    objc_msgSend(v6, "itemProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelRequest setItemProperties:](v8, "setItemProperties:", v9);

    objc_msgSend(v6, "sectionProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelRequest setSectionProperties:](v8, "setSectionProperties:", v10);

  }
  return v8;
}

- (MPStoreLibraryPersonalizationRequest)initWithUnpersonalizedContentDescriptors:(id)a3
{
  id v5;
  MPStoreLibraryPersonalizationRequest *v6;
  MPStoreLibraryPersonalizationRequest *v7;

  v5 = a3;
  v6 = -[MPStoreLibraryPersonalizationRequest init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_unpersonalizedContentDescriptors, a3);
    v7->_matchAlbumArtistsOnNameAndStoreID = 1;
  }

  return v7;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPStoreLibraryPersonalizationRequestOperation *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(MPStoreLibraryPersonalizationRequestOperation);
  -[MPStoreLibraryPersonalizationRequest userIdentity](self, "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAsyncOperation setUserIdentity:](v5, "setUserIdentity:", v6);

  -[MPStoreLibraryPersonalizationRequestOperation setRequest:](v5, "setRequest:", self);
  -[MPStoreLibraryPersonalizationRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

  return v5;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

+ (id)preferredQueue
{
  if (+[MPStoreLibraryPersonalizationRequest preferredQueue]::onceToken != -1)
    dispatch_once(&+[MPStoreLibraryPersonalizationRequest preferredQueue]::onceToken, &__block_literal_global_35401);
  return (id)+[MPStoreLibraryPersonalizationRequest preferredQueue]::__sharedQueue;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPStoreLibraryPersonalizationRequest;
  v4 = -[MPModelRequest copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4)
  {
    v5 = -[NSMutableDictionary mutableCopy](self->_itemIndexPathToOverridePropertySet, "mutableCopy");
    v6 = (void *)*((_QWORD *)v4 + 8);
    *((_QWORD *)v4 + 8) = v5;

    objc_storeStrong((id *)v4 + 11, self->_unpersonalizedContentDescriptors);
    objc_storeStrong((id *)v4 + 12, self->_representedObjects);
    objc_storeStrong((id *)v4 + 13, self->_mediaLibraryOverrideForTestingOnly);
  }
  return v4;
}

uint64_t __54__MPStoreLibraryPersonalizationRequest_preferredQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)+[MPStoreLibraryPersonalizationRequest preferredQueue]::__sharedQueue;
  +[MPStoreLibraryPersonalizationRequest preferredQueue]::__sharedQueue = (uint64_t)v0;

  objc_msgSend((id)+[MPStoreLibraryPersonalizationRequest preferredQueue]::__sharedQueue, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend((id)+[MPStoreLibraryPersonalizationRequest preferredQueue]::__sharedQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPStoreLibraryPersonalizationRequest.sharedQueue"));
  return objc_msgSend((id)+[MPStoreLibraryPersonalizationRequest preferredQueue]::__sharedQueue, "setQualityOfService:", 25);
}

- (BOOL)matchAlbumArtistsOnNameAndStoreID
{
  return self->_matchAlbumArtistsOnNameAndStoreID;
}

- (id)propertiesForItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[NSMutableDictionary objectForKey:](self->_itemIndexPathToOverridePropertySet, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[MPModelRequest itemProperties](self, "itemProperties");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)setProperties:(id)a3 forItemAtIndexPath:(id)a4
{
  id v6;
  NSMutableDictionary *itemIndexPathToOverridePropertySet;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  itemIndexPathToOverridePropertySet = self->_itemIndexPathToOverridePropertySet;
  if (v10)
  {
    if (!itemIndexPathToOverridePropertySet)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->_itemIndexPathToOverridePropertySet;
      self->_itemIndexPathToOverridePropertySet = v8;

      itemIndexPathToOverridePropertySet = self->_itemIndexPathToOverridePropertySet;
    }
    -[NSMutableDictionary setObject:forKey:](itemIndexPathToOverridePropertySet, "setObject:forKey:", v10, v6);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](itemIndexPathToOverridePropertySet, "removeObjectForKey:", v6);
  }

}

- (void)setUserIdentity:(id)a3
{
  ICUserIdentity *v4;
  ICUserIdentity *v5;

  v4 = (ICUserIdentity *)a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v4 = (ICUserIdentity *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_userIdentity != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&self->_userIdentity, v4);
    v4 = v5;
  }

}

- (void)setMediaLibraryOverrideForTestingOnly:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibraryOverrideForTestingOnly, a3);
}

- (void)setMatchAlbumArtistsOnNameAndStoreID:(BOOL)a3
{
  self->_matchAlbumArtistsOnNameAndStoreID = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

+ (BOOL)requiresNetwork
{
  return 0;
}

+ (id)personalizedResponseForContentDescriptor:(id)a3 requestedProperties:(id)a4
{
  +[MPStoreLibraryPersonalizationRequest personalizedResponseForContentDescriptor:requestedProperties:matchAlbumArtistOnStoreIdAndName:](MPStoreLibraryPersonalizationRequest, "personalizedResponseForContentDescriptor:requestedProperties:matchAlbumArtistOnStoreIdAndName:", a3, a4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)personalizedResponseForContentDescriptor:(id)a3 requestedProperties:(id)a4 matchAlbumArtistOnStoreIdAndName:(BOOL)a5
{
  +[MPStoreLibraryPersonalizationRequestOperation personalizedResponseForContentDescriptor:requestedProperties:matchAlbumArtistOnStoreIdAndName:](MPStoreLibraryPersonalizationRequestOperation, "personalizedResponseForContentDescriptor:requestedProperties:matchAlbumArtistOnStoreIdAndName:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)libraryViewWithMediaLibraryOverrideForTestingOnly:(id)a3
{
  id v3;
  MPMediaLibraryView *v4;

  v3 = a3;
  v4 = -[MPMediaLibraryView initWithLibrary:filteringOptions:]([MPMediaLibraryView alloc], "initWithLibrary:filteringOptions:", v3, 4);

  return v4;
}

+ (id)libraryViewAllowingEmptyCollectionsForUserIdentity:(id)a3
{
  id v3;
  MPMediaLibraryView *v4;
  void *v5;
  MPMediaLibraryView *v6;

  v3 = a3;
  v4 = [MPMediaLibraryView alloc];
  +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPMediaLibraryView initWithLibrary:filteringOptions:](v4, "initWithLibrary:filteringOptions:", v5, 0x400000);

  return v6;
}

@end
