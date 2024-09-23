@implementation MPCModelRadioPersonalizationResponse

- (MPCModelRadioPersonalizationResponse)initWithRequest:(id)a3 personalizationResponse:(id)a4
{
  id v7;
  MPCModelRadioPersonalizationResponse *v8;
  MPCModelRadioPersonalizationResponse *v9;
  id *p_personalizationResponse;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MPCModelRadioPersonalizationResponse;
  v8 = -[MPModelResponse initWithRequest:](&v15, sel_initWithRequest_, a3);
  v9 = v8;
  if (v8)
  {
    p_personalizationResponse = (id *)&v8->_personalizationResponse;
    objc_storeStrong((id *)&v8->_personalizationResponse, a4);
    objc_msgSend(v7, "representedObjectResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPersonalizationResponse setRadioStationTracks:](v9, "setRadioStationTracks:", v11);

    objc_msgSend(v7, "results");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelResponse setResults:](v9, "setResults:", v12);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v9, sel__invalidate, *MEMORY[0x24BDDC3F8], *p_personalizationResponse);
    if ((objc_msgSend(*p_personalizationResponse, "isValid") & 1) == 0)
      -[MPModelResponse _invalidate](v9, "_invalidate");

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_personalizationResponse)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDDC3F8], self->_personalizationResponse);

  }
  v4.receiver = self;
  v4.super_class = (Class)MPCModelRadioPersonalizationResponse;
  -[MPCModelRadioPersonalizationResponse dealloc](&v4, sel_dealloc);
}

- (MPSectionedCollection)radioStationTracks
{
  return self->_radioStationTracks;
}

- (void)setRadioStationTracks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioStationTracks, 0);
  objc_storeStrong((id *)&self->_personalizationResponse, 0);
}

@end
