@implementation MKCuratedCollectionsTestManager

- (id)placeWithCollectionUsingJSONAtPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  id v12;

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", a3, 0, &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  v11 = v4;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D272F0]), "initWithJSON:", v5);
  objc_msgSend(v7, "legacyPlaceResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)collectionIsSaved:(id)a3
{
  return 1;
}

- (BOOL)collectionIsSavedWithIdentifier:(id)a3
{
  return 1;
}

@end
