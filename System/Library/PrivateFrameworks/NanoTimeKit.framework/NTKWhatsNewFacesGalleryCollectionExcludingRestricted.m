@implementation NTKWhatsNewFacesGalleryCollectionExcludingRestricted

- (id)facesForDevice:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKWhatsNewFacesGalleryCollectionExcludingRestricted;
  -[NTKWhatsNewFacesGalleryCollection facesForDevice:](&v7, sel_facesForDevice_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_48);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __71__NTKWhatsNewFacesGalleryCollectionExcludingRestricted_facesForDevice___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_faceGalleryIsRestricted") ^ 1;
}

@end
