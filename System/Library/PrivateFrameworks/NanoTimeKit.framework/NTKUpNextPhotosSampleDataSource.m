@implementation NTKUpNextPhotosSampleDataSource

+ (id)bundleIdentifier
{
  return CFSTR("com.apple.NanoPhotos");
}

- (id)supportedSections
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0D843D8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a4;
  REUISampleRelevanceProviderForSamplePosition();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NTKImageNamed(CFSTR("SG_Photo_Sample"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NTKUpNextPhotosContent(v6, 1, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D842E8]);
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithIdentifier:content:action:relevanceProviders:", CFSTR("com.apple.NanoPhotos.photos!"), v7, 0, v9);

  v12 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v11);

}

@end
