@implementation ABVCardExporter

+ (id)_vCard21RepresentationOfRecords:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  ABVCardRecord *v7;

  v3 = (void *)objc_msgSend(a3, "objectEnumerator");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v5 = objc_msgSend(v3, "nextObject");
  if (v5)
  {
    v6 = v5;
    do
    {
      v7 = -[ABVCardRecord initWithRecord:]([ABVCardRecord alloc], "initWithRecord:", v6);
      objc_msgSend(v4, "appendData:", -[ABVCardRecord _21vCardRepresentationAsData](v7, "_21vCardRepresentationAsData"));

      v6 = objc_msgSend(v3, "nextObject");
    }
    while (v6);
  }
  return v4;
}

+ (id)_vCard30RepresentationOfRecords:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  ABVCardRecord *v7;
  id v8;
  void *v9;

  v3 = (void *)objc_msgSend(a3, "objectEnumerator");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = objc_msgSend(v3, "nextObject");
  if (v5)
  {
    v6 = v5;
    do
    {
      v7 = -[ABVCardRecord initWithRecord:]([ABVCardRecord alloc], "initWithRecord:", v6);
      v8 = -[ABVCardRecord _copyVCardRepresentationAsStringIncludeExternalProperties:withPhoto:extraPhotoParameters:includePrivateData:includeWallpaper:](v7, "_copyVCardRepresentationAsStringIncludeExternalProperties:withPhoto:extraPhotoParameters:includePrivateData:includeWallpaper:", 0, 0, 0, 0, 0);
      objc_msgSend(v4, "appendString:", v8);

      v6 = objc_msgSend(v3, "nextObject");
    }
    while (v6);
  }
  v9 = (void *)objc_msgSend(v4, "copyABVCardDataRepresentation");
  ABRegulatoryLogReadTransmitContactsData();
  return v9;
}

+ (id)vCardRepresentationOfRecords:(id)a3 mode:(int)a4
{
  if (a4 == 1)
    return +[ABVCardExporter _vCard30RepresentationOfRecords:](ABVCardExporter, "_vCard30RepresentationOfRecords:", a3);
  if (a4)
    return 0;
  return +[ABVCardExporter _vCard21RepresentationOfRecords:](ABVCardExporter, "_vCard21RepresentationOfRecords:", a3);
}

+ (id)vCardRepresentationOfRecord:(void *)a3 mode:(int)a4
{
  ABVCardRecord *v5;
  ABVCardRecord *v6;
  id v7;
  id v8;

  v5 = -[ABVCardRecord initWithRecord:]([ABVCardRecord alloc], "initWithRecord:", a3);
  v6 = v5;
  if (a4 == 1)
  {
    v8 = -[ABVCardRecord _copyVCardRepresentationAsStringIncludeExternalProperties:withPhoto:extraPhotoParameters:includePrivateData:includeWallpaper:](v5, "_copyVCardRepresentationAsStringIncludeExternalProperties:withPhoto:extraPhotoParameters:includePrivateData:includeWallpaper:", 0, 0, 0, 0, 0);
    v7 = (id)objc_msgSend(v8, "copyABVCardDataRepresentation");
    ABRegulatoryLogReadTransmitContactsData();

  }
  else if (a4)
  {
    v7 = 0;
  }
  else
  {
    v7 = -[ABVCardRecord _21vCardRepresentationAsData](v5, "_21vCardRepresentationAsData");
  }

  return v7;
}

@end
