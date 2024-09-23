@implementation ABVCardCardDAVExporter

+ (id)copyVCardRepresentationOfRecord:(void *)a3 withPhoto:(id)a4 extraPhotoParameters:(id)a5
{
  return (id)objc_msgSend((id)objc_opt_class(), "copyVCardRepresentationOfRecord:withPhoto:extraPhotoParameters:includeWallpaper:", a3, a4, a5, 0);
}

+ (id)copyVCardRepresentationOfRecord:(void *)a3 withPhoto:(id)a4 extraPhotoParameters:(id)a5 includeWallpaper:(BOOL)a6
{
  _BOOL8 v6;
  ABVCardCardDAVRecord *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a6;
  v10 = -[ABVCardRecord initWithRecord:]([ABVCardCardDAVRecord alloc], "initWithRecord:", a3);
  if (ABRecordGetRecordType(a3))
  {
    v11 = -[ABVCardRecord _copyGroupVCardRepresentationAsStringIncludeExternalProperties:](v10, "_copyGroupVCardRepresentationAsStringIncludeExternalProperties:", 1);
  }
  else
  {
    if (!a4)
      a4 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v11 = -[ABVCardRecord _copyVCardRepresentationAsStringIncludeExternalProperties:withPhoto:extraPhotoParameters:includePrivateData:includeWallpaper:](v10, "_copyVCardRepresentationAsStringIncludeExternalProperties:withPhoto:extraPhotoParameters:includePrivateData:includeWallpaper:", 1, a4, a5, 1, v6);
  }
  v12 = (void *)v11;

  v13 = (void *)objc_msgSend(v12, "copyABVCardDataRepresentation");
  return v13;
}

@end
