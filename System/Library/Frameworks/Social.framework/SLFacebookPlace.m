@implementation SLFacebookPlace

+ (id)placeWithResponseDictionary:(id)a3
{
  id v3;
  SLFacebookPlace *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  v4 = objc_alloc_init(SLFacebookPlace);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLPlace setIdentifier:](v4, "setIdentifier:", v5);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLPlace setName:](v4, "setName:", v6);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLPlace setCategory:](v4, "setCategory:", v7);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("picture"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("picture"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("data"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLPlace setPictureURL:](v4, "setPictureURL:", v13);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("location"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("location"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("latitude"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    -[SLPlace setLatitude:](v4, "setLatitude:");

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("longitude"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    -[SLPlace setLongitude:](v4, "setLongitude:");

  }
  return v4;
}

@end
