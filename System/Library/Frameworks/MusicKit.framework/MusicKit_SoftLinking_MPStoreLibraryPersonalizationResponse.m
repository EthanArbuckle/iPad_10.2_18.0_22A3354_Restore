@implementation MusicKit_SoftLinking_MPStoreLibraryPersonalizationResponse

- (MusicKit_SoftLinking_MPStoreLibraryPersonalizationResponse)initWithUnderlyingPersonalizationResponse:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPStoreLibraryPersonalizationResponse *v6;
  MusicKit_SoftLinking_MPStoreLibraryPersonalizationResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPStoreLibraryPersonalizationResponse;
  v6 = -[MusicKit_SoftLinking_MPModelResponse initWithUnderlyingResponse:](&v9, sel_initWithUnderlyingResponse_, v5);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingResponse, a3);

  return v7;
}

- (MusicKit_SoftLinking_MPMutableSectionedCollection)representedObjectResults
{
  MusicKit_SoftLinking_MPSectionedCollection *v3;
  void *v4;
  MusicKit_SoftLinking_MPSectionedCollection *v5;

  v3 = [MusicKit_SoftLinking_MPSectionedCollection alloc];
  -[MPStoreLibraryPersonalizationResponse representedObjectResults](self->_underlyingResponse, "representedObjectResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MusicKit_SoftLinking_MPSectionedCollection initWithUnderlyingSectionedCollection:](v3, "initWithUnderlyingSectionedCollection:", v4);

  return (MusicKit_SoftLinking_MPMutableSectionedCollection *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingResponse, 0);
}

@end
