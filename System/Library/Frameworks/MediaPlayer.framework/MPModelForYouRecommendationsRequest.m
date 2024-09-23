@implementation MPModelForYouRecommendationsRequest

- (MPModelForYouRecommendationsRequest)init
{
  MPModelForYouRecommendationsRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPModelForYouRecommendationsRequest;
  result = -[MPStoreModelRequest init](&v3, sel_init);
  if (result)
  {
    result->_filteringPolicy = 0;
    result->_requestEndpoint = 0;
    result->_mode = 0;
    result->_withRecentlyPlayed = 1;
    result->_withSocial = 0;
    result->_types = 106622;
    result->_withPlainEditorialNotes = 1;
    result->_displayFilterKinds = 102;
    result->_refreshRequest = 0;
  }
  return result;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  __objc2_class *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[MPModelForYouRecommendationsRequest requestEndpoint](self, "requestEndpoint") == 1)
    v5 = MPModelForYouRecommendationsMusicKitRequestOperation;
  else
    v5 = MPModelForYouRecommendationsRequestOperation;
  v6 = [v5 alloc];
  v7 = (void *)-[MPModelForYouRecommendationsRequest copy](self, "copy");
  v8 = (void *)objc_msgSend(v6, "initWithRequest:responseHandler:", v7, v4);

  return v8;
}

- (MPModelForYouRecommendationsRequest)initWithCoder:(id)a3
{
  id v4;
  MPModelForYouRecommendationsRequest *v5;
  uint64_t v6;
  NSURL *customForYouURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPModelForYouRecommendationsRequest;
  v5 = -[MPStoreModelRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customForYouURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    customForYouURL = v5->_customForYouURL;
    v5->_customForYouURL = (NSURL *)v6;

    v5->_filteringPolicy = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPModelStoreForYouRequestFilteringPolicy"));
    v5->_requestEndpoint = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPModelStoreForYouRequestEndpoint"));
    v5->_mode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPModelStoreForYouRequestMode"));
    v5->_withRecentlyPlayed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("withRecentlyPlayed"));
    v5->_withSocial = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("withSocial"));
    v5->_types = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("types"));
    v5->_withPlainEditorialNotes = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("withPlainEditorialNotes"));
    v5->_displayFilterKinds = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPModelStoreForYouDisplayFilterKind"));
    v5->_refreshRequest = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("refreshRequest"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPModelForYouRecommendationsRequest;
  v4 = a3;
  -[MPStoreModelRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_customForYouURL, CFSTR("customForYouURL"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_filteringPolicy, CFSTR("MPModelStoreForYouRequestFilteringPolicy"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_requestEndpoint, CFSTR("MPModelStoreForYouRequestEndpoint"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_mode, CFSTR("MPModelStoreForYouRequestMode"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_withRecentlyPlayed, CFSTR("withRecentlyPlayed"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_withSocial, CFSTR("withSocial"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_types, CFSTR("types"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_withPlainEditorialNotes, CFSTR("withPlainEditorialNotes"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_displayFilterKinds, CFSTR("MPModelStoreForYouDisplayFilterKind"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_refreshRequest, CFSTR("refreshRequest"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPModelForYouRecommendationsRequest;
  v4 = -[MPStoreModelRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 20, self->_customForYouURL);
    v5[15] = (id)self->_filteringPolicy;
    v5[16] = (id)self->_requestEndpoint;
    v5[17] = (id)self->_mode;
    *((_BYTE *)v5 + 114) = self->_withRecentlyPlayed;
    *((_BYTE *)v5 + 112) = self->_withSocial;
    v5[18] = (id)self->_types;
    *((_BYTE *)v5 + 113) = self->_withPlainEditorialNotes;
    v5[19] = (id)self->_displayFilterKinds;
    *((_BYTE *)v5 + 115) = self->_refreshRequest;
  }
  return v5;
}

- (int64_t)filteringPolicy
{
  return self->_filteringPolicy;
}

- (void)setFilteringPolicy:(int64_t)a3
{
  self->_filteringPolicy = a3;
}

- (int64_t)requestEndpoint
{
  return self->_requestEndpoint;
}

- (void)setRequestEndpoint:(int64_t)a3
{
  self->_requestEndpoint = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)types
{
  return self->_types;
}

- (void)setTypes:(int64_t)a3
{
  self->_types = a3;
}

- (BOOL)withSocial
{
  return self->_withSocial;
}

- (void)setWithSocial:(BOOL)a3
{
  self->_withSocial = a3;
}

- (BOOL)withPlainEditorialNotes
{
  return self->_withPlainEditorialNotes;
}

- (void)setWithPlainEditorialNotes:(BOOL)a3
{
  self->_withPlainEditorialNotes = a3;
}

- (int64_t)displayFilterKinds
{
  return self->_displayFilterKinds;
}

- (void)setDisplayFilterKinds:(int64_t)a3
{
  self->_displayFilterKinds = a3;
}

- (BOOL)withRecentlyPlayed
{
  return self->_withRecentlyPlayed;
}

- (void)setWithRecentlyPlayed:(BOOL)a3
{
  self->_withRecentlyPlayed = a3;
}

- (NSURL)customForYouURL
{
  return self->_customForYouURL;
}

- (void)setCustomForYouURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)refreshRequest
{
  return self->_refreshRequest;
}

- (void)setRefreshRequest:(BOOL)a3
{
  self->_refreshRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customForYouURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allSupportedItemProperties
{
  return +[MPModelForYouRecommendationGroupBuilder allSupportedItemProperties](MPModelForYouRecommendationGroupBuilder, "allSupportedItemProperties");
}

+ (id)allSupportedSectionProperties
{
  return +[MPModelForYouRecommendationGroupBuilder allSupportedGroupProperties](MPModelForYouRecommendationGroupBuilder, "allSupportedGroupProperties");
}

@end
