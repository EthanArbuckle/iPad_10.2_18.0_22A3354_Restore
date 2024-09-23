@implementation MPModelStoreBrowseRequest

- (MPModelStoreBrowseRequest)init
{
  MPModelStoreBrowseRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPModelStoreBrowseRequest;
  result = -[MPStoreModelRequest init](&v3, sel_init);
  if (result)
  {
    result->_domain = 0;
    result->_filteringPolicy = 0;
    result->_requestEndpoint = 0;
    result->_subscriptionStatus = 0;
    result->_additionalContent = 0;
    result->_options = 0;
  }
  return result;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  __objc2_class **v7;
  void *v8;

  v4 = a3;
  v5 = (void *)-[MPModelStoreBrowseRequest copy](self, "copy");
  if (-[MPModelStoreBrowseRequest requestEndpoint](self, "requestEndpoint") == 1)
  {
    v6 = -[MPModelStoreBrowseRequest domain](self, "domain");
    v7 = off_1E31468D0;
    if (v6 == 1)
      v7 = off_1E3146900;
  }
  else
  {
    v7 = off_1E31468E0;
  }
  v8 = (void *)objc_msgSend(objc_alloc(*v7), "initWithRequest:responseHandler:", v5, v4);

  return v8;
}

- (MPModelStoreBrowseRequest)initWithCoder:(id)a3
{
  id v4;
  MPModelStoreBrowseRequest *v5;
  uint64_t v6;
  NSURL *loadAdditionalContentURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPModelStoreBrowseRequest;
  v5 = -[MPStoreModelRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_domain = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPModelStoreBrowseRequestDomain"));
    v5->_filteringPolicy = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPModelStoreBrowseRequestFilteringPolicy"));
    v5->_requestEndpoint = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPModelStoreBrowseRequestEndpoint"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPModelStoreBrowseRequestLoadAdditionalContentURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    loadAdditionalContentURL = v5->_loadAdditionalContentURL;
    v5->_loadAdditionalContentURL = (NSURL *)v6;

    v5->_subscriptionStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPModelStoreBrowseRequestSubscriptionStatus"));
    v5->_additionalContent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPModelStoreBrowseRequestAdditionalContent"));
    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPModelStoreBrowseRequestOptions"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPModelStoreBrowseRequest;
  v4 = a3;
  -[MPStoreModelRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_loadAdditionalContentURL, CFSTR("MPModelStoreBrowseRequestLoadAdditionalContentURL"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_domain, CFSTR("MPModelStoreBrowseRequestDomain"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_filteringPolicy, CFSTR("MPModelStoreBrowseRequestFilteringPolicy"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_requestEndpoint, CFSTR("MPModelStoreBrowseRequestEndpoint"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_subscriptionStatus, CFSTR("MPModelStoreBrowseRequestSubscriptionStatus"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_additionalContent, CFSTR("MPModelStoreBrowseRequestAdditionalContent"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, CFSTR("MPModelStoreBrowseRequestOptions"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPModelStoreBrowseRequest;
  v4 = -[MPStoreModelRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 14, self->_loadAdditionalContentURL);
    v5[16] = (id)self->_domain;
    v5[19] = (id)self->_filteringPolicy;
    v5[22] = (id)self->_requestEndpoint;
    objc_storeStrong(v5 + 15, self->_previousRetrievedNestedResponse);
    objc_storeStrong(v5 + 21, self->_previousResponse);
    v5[20] = (id)self->_subscriptionStatus;
    v5[17] = (id)self->_additionalContent;
    v5[18] = (id)self->_options;
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
  -[MPModelStoreBrowseRequest setLoadAdditionalContentURL:](self, "setLoadAdditionalContentURL:", v5);

  objc_msgSend(v4, "previouslyRetrievedNestedResponse");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[MPModelStoreBrowseRequest setPreviousRetrievedNestedResponse:](self, "setPreviousRetrievedNestedResponse:", v6);
}

- (BOOL)flattenRadioList
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (void)setFlattenRadioList:(BOOL)a3
{
  self->_options |= 2uLL;
}

- (NSURL)loadAdditionalContentURL
{
  return self->_loadAdditionalContentURL;
}

- (void)setLoadAdditionalContentURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (MPModelStoreBrowseResponse)previousRetrievedNestedResponse
{
  return self->_previousRetrievedNestedResponse;
}

- (void)setPreviousRetrievedNestedResponse:(id)a3
{
  objc_storeStrong((id *)&self->_previousRetrievedNestedResponse, a3);
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (int64_t)additionalContent
{
  return self->_additionalContent;
}

- (void)setAdditionalContent:(int64_t)a3
{
  self->_additionalContent = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (int64_t)filteringPolicy
{
  return self->_filteringPolicy;
}

- (void)setFilteringPolicy:(int64_t)a3
{
  self->_filteringPolicy = a3;
}

- (int64_t)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (void)setSubscriptionStatus:(int64_t)a3
{
  self->_subscriptionStatus = a3;
}

- (MPModelStoreBrowseResponse)previousResponse
{
  return self->_previousResponse;
}

- (void)setPreviousResponse:(id)a3
{
  objc_storeStrong((id *)&self->_previousResponse, a3);
}

- (int64_t)requestEndpoint
{
  return self->_requestEndpoint;
}

- (void)setRequestEndpoint:(int64_t)a3
{
  self->_requestEndpoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousResponse, 0);
  objc_storeStrong((id *)&self->_previousRetrievedNestedResponse, 0);
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
