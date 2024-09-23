@implementation MPModelStoreBrowseRoomRequest

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelStoreBrowseRoomMusicKitRequestOperation *v5;
  void *v6;
  MPModelStoreBrowseRoomMusicKitRequestOperation *v7;

  v4 = a3;
  v5 = [MPModelStoreBrowseRoomMusicKitRequestOperation alloc];
  v6 = (void *)-[MPModelStoreBrowseRoomRequest copy](self, "copy");
  v7 = -[MPStoreModelRequestOperation initWithRequest:responseHandler:](v5, "initWithRequest:responseHandler:", v6, v4);

  return v7;
}

- (MPModelStoreBrowseRoomRequest)initWithCoder:(id)a3
{
  id v4;
  MPModelStoreBrowseRoomRequest *v5;
  uint64_t v6;
  NSURL *loadAdditionalContentURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPModelStoreBrowseRoomRequest;
  v5 = -[MPStoreModelRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPModelStoreBrowseRequestLoadAdditionalContentURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    loadAdditionalContentURL = v5->_loadAdditionalContentURL;
    v5->_loadAdditionalContentURL = (NSURL *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPModelStoreBrowseRoomRequest;
  v4 = a3;
  -[MPStoreModelRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_loadAdditionalContentURL, CFSTR("MPModelStoreBrowseRequestLoadAdditionalContentURL"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPModelStoreBrowseRoomRequest;
  v4 = -[MPStoreModelRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 14, self->_loadAdditionalContentURL);
    objc_storeStrong(v5 + 16, self->_previousRetrievedNestedResponse);
    objc_storeStrong(v5 + 17, self->_previousResponse);
  }
  return v5;
}

- (void)configureWithParentSection:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "loadAdditionalContentURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelStoreBrowseRoomRequest setLoadAdditionalContentURL:](self, "setLoadAdditionalContentURL:", v5);

  objc_msgSend(v4, "previouslyRetrievedNestedResponse");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[MPModelStoreBrowseRoomRequest setPreviousRetrievedNestedResponse:](self, "setPreviousRetrievedNestedResponse:", v6);
}

- (NSURL)loadAdditionalContentURL
{
  return self->_loadAdditionalContentURL;
}

- (void)setLoadAdditionalContentURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)roomID
{
  return self->_roomID;
}

- (void)setRoomID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (MPModelStoreBrowseResponse)previousRetrievedNestedResponse
{
  return self->_previousRetrievedNestedResponse;
}

- (void)setPreviousRetrievedNestedResponse:(id)a3
{
  objc_storeStrong((id *)&self->_previousRetrievedNestedResponse, a3);
}

- (MPModelStoreBrowseResponse)previousResponse
{
  return self->_previousResponse;
}

- (void)setPreviousResponse:(id)a3
{
  objc_storeStrong((id *)&self->_previousResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousResponse, 0);
  objc_storeStrong((id *)&self->_previousRetrievedNestedResponse, 0);
  objc_storeStrong((id *)&self->_roomID, 0);
  objc_storeStrong((id *)&self->_loadAdditionalContentURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allSupportedItemProperties
{
  return +[MPModelStoreBrowseContentItemBuilder allSupportedProperties](MPModelStoreBrowseContentItemBuilder, "allSupportedProperties");
}

+ (id)allSupportedSectionProperties
{
  return +[MPModelStoreBrowseSectionBuilder allSupportedPropertiesIncludingInternalOnlyProperties:](MPModelStoreBrowseSectionBuilder, "allSupportedPropertiesIncludingInternalOnlyProperties:", 0);
}

@end
