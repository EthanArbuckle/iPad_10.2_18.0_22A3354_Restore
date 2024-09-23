@implementation MPCModelGenericAVItemTimedMetadataResponse

- (MPCModelGenericAVItemTimedMetadataResponse)initWithRequest:(id)a3 personalizationResponse:(id)a4 firstResponse:(BOOL)a5 finalResponse:(BOOL)a6
{
  id v11;
  MPCModelGenericAVItemTimedMetadataResponse *v12;
  MPCModelGenericAVItemTimedMetadataResponse *v13;
  id *p_personalizationResponse;
  void *v15;
  void *v16;
  objc_super v18;

  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MPCModelGenericAVItemTimedMetadataResponse;
  v12 = -[MPModelResponse initWithRequest:](&v18, sel_initWithRequest_, a3);
  v13 = v12;
  if (v12)
  {
    p_personalizationResponse = (id *)&v12->_personalizationResponse;
    objc_storeStrong((id *)&v12->_personalizationResponse, a4);
    v13->_firstResponse = a5;
    v13->_finalResponse = a6;
    if (*p_personalizationResponse)
    {
      objc_msgSend(*p_personalizationResponse, "results");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPModelResponse setResults:](v13, "setResults:", v15);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:object:", v13, sel__personalizationResponseDidInvalidateNotification_, *MEMORY[0x24BDDC3F8], *p_personalizationResponse);
      if ((objc_msgSend(*p_personalizationResponse, "isValid") & 1) == 0)
        -[MPModelResponse _invalidate](v13, "_invalidate");

    }
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_personalizationResponse)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self->_personalizationResponse, *MEMORY[0x24BDDC3F8], self->_personalizationResponse);

  }
  v4.receiver = self;
  v4.super_class = (Class)MPCModelGenericAVItemTimedMetadataResponse;
  -[MPCModelGenericAVItemTimedMetadataResponse dealloc](&v4, sel_dealloc);
}

- (BOOL)isFirstResponse
{
  return self->_firstResponse;
}

- (void)setFirstResponse:(BOOL)a3
{
  self->_firstResponse = a3;
}

- (BOOL)isFinalResponse
{
  return self->_finalResponse;
}

- (void)setFinalResponse:(BOOL)a3
{
  self->_finalResponse = a3;
}

- (NSData)adamIDData
{
  return self->_adamIDData;
}

- (void)setAdamIDData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (MPCModelGenericAVItemTimedMetadataStreamFields)streamFields
{
  return self->_streamFields;
}

- (void)setStreamFields:(id)a3
{
  objc_storeStrong((id *)&self->_streamFields, a3);
}

- (MPSectionedCollection)unpersonalizedContentDescriptors
{
  return self->_unpersonalizedContentDescriptors;
}

- (void)setUnpersonalizedContentDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unpersonalizedContentDescriptors, 0);
  objc_storeStrong((id *)&self->_streamFields, 0);
  objc_storeStrong((id *)&self->_adamIDData, 0);
  objc_storeStrong((id *)&self->_personalizationResponse, 0);
}

@end
