@implementation CLPlacemark(INIntentsAdditions)

+ (id)placemarkWithLocation:()INIntentsAdditions name:postalAddress:
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v24;

  v8 = (objc_class *)MEMORY[0x1E0D27168];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [v8 alloc];
  objc_msgSend(v11, "coordinate");
  v14 = v13;
  objc_msgSend(v11, "coordinate");
  v16 = v15;

  v17 = (void *)objc_msgSend(v12, "initWithLatitude:longitude:", v14, v16);
  v18 = objc_alloc(MEMORY[0x1E0D271A0]);
  objc_msgSend(v9, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v20) = 0;
  LODWORD(v24) = 0;
  v21 = (void *)objc_msgSend(v18, "initWithWithLocation:addressDictionary:name:businessURL:phoneNumber:sessionID:muid:attributionID:sampleSizeForUserRatingScore:normalizedUserRatingScore:", v17, v19, v10, 0, 0, 0, v20, 0, 0, v24);

  objc_msgSend(a1, "placemarkWithGEOMapItem:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end
