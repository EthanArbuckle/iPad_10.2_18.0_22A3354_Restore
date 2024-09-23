@implementation PHAssetPLAdapter

- (id)newObjectWithPropertySets:(id)a3
{
  void *v4;
  unint64_t v5;
  PHAsset *v6;
  void *v7;
  PHAsset *v8;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[PHAsset propertyFetchHintsForPropertySets:](PHAsset, "propertyFetchHintsForPropertySets:", v4);

  v6 = [PHAsset alloc];
  -[PHObjectPLAdapter photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PHAsset initWithFetchDictionary:propertyHint:photoLibrary:](v6, "initWithFetchDictionary:propertyHint:photoLibrary:", self, v5, v7);

  return v8;
}

@end
