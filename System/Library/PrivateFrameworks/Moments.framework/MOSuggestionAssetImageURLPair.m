@implementation MOSuggestionAssetImageURLPair

- (id)init:(id)a3 urlAppendix:(id)a4
{
  id v6;
  id v7;
  MOSuggestionAssetImageURLPair *v8;
  MOSuggestionAssetImageURLPair *v9;
  MOSuggestionAssetImageURLPair *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOSuggestionAssetImageURLPair;
  v8 = -[MOSuggestionAssetImageURLPair init](&v12, sel_init);
  v9 = v8;
  if (v8
    && -[MOSuggestionAssetImageURLPair setURLsWithAppendix:](v8, "setURLsWithAppendix:", v7)
    && -[MOSuggestionAssetImageURLPair writeImageToURLs:](v9, "writeImageToURLs:", v6))
  {
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)setURLsWithAppendix:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSURL *v11;
  NSURL *lightURL;
  NSURL *v13;
  NSURL *darkURL;
  BOOL v15;
  NSObject *v16;

  v4 = (objc_class *)MEMORY[0x1E0C99E98];
  v5 = a3;
  v6 = [v4 alloc];
  NSTemporaryDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initFileURLWithPath:", v7);

  objc_msgSend(v5, "stringByAppendingString:", CFSTR("_light.png"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("_dark.png"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
  v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
  lightURL = self->_lightURL;
  self->_lightURL = v11;

  objc_msgSend(v8, "URLByAppendingPathComponent:", v10);
  v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
  darkURL = self->_darkURL;
  self->_darkURL = v13;

  if (!self->_lightURL)
  {
    _mo_log_facility_get_os_log(MOLogFacilityUIService);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MOSuggestionAssetImageURLPair setURLsWithAppendix:].cold.1();
    goto LABEL_8;
  }
  if (!self->_darkURL)
  {
    _mo_log_facility_get_os_log(MOLogFacilityUIService);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MOSuggestionAssetImageURLPair setURLsWithAppendix:].cold.2();
LABEL_8:

    v15 = 0;
    goto LABEL_9;
  }
  v15 = 1;
LABEL_9:

  return v15;
}

- (BOOL)writeImageToURLs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIImage *v7;
  void *v8;
  void *v9;
  UIImage *v10;
  NSObject *v11;
  void *v12;
  NSURL *darkURL;
  BOOL v14;
  NSObject *v15;

  v4 = a3;
  objc_msgSend(v4, "imageAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithTraitCollection:", v6);
  v7 = (UIImage *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "imageAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithTraitCollection:", v9);
  v10 = (UIImage *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v10)
    {
      UIImagePNGRepresentation(v7);
      v11 = objc_claimAutoreleasedReturnValue();
      UIImagePNGRepresentation(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSObject writeToURL:atomically:](v11, "writeToURL:atomically:", self->_lightURL, 1) & 1) != 0)
      {
        darkURL = self->_darkURL;
        v14 = 1;
        if ((objc_msgSend(v12, "writeToURL:atomically:", darkURL, 1) & 1) != 0)
        {
LABEL_15:

          goto LABEL_16;
        }
        _mo_log_facility_get_os_log(MOLogFacilityUIService);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[MOSuggestionAssetImageURLPair writeImageToURLs:].cold.3();
      }
      else
      {
        _mo_log_facility_get_os_log(MOLogFacilityUIService);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[MOSuggestionAssetImageURLPair writeImageToURLs:].cold.4();
      }

      v14 = 0;
      goto LABEL_15;
    }
    _mo_log_facility_get_os_log(MOLogFacilityUIService);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MOSuggestionAssetImageURLPair writeImageToURLs:].cold.2();
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityUIService);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MOSuggestionAssetImageURLPair writeImageToURLs:].cold.1();
  }
  v14 = 0;
LABEL_16:

  return v14;
}

- (id)constructedImage
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", self->_lightURL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", self->_darkURL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5)
    {
      if (v6)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0CEA638]);
        objc_msgSend(v8, "imageAsset");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "registerImage:withTraitCollection:", v5, v10);

        objc_msgSend(v8, "imageAsset");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "registerImage:withTraitCollection:", v7, v12);

LABEL_13:
        goto LABEL_14;
      }
      _mo_log_facility_get_os_log(MOLogFacilityUIService);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[MOSuggestionAssetImageURLPair constructedImage].cold.3();
    }
    else
    {
      _mo_log_facility_get_os_log(MOLogFacilityUIService);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[MOSuggestionAssetImageURLPair constructedImage].cold.2();
    }

    v8 = 0;
    goto LABEL_13;
  }
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MOSuggestionAssetImageURLPair constructedImage].cold.1();
  v8 = 0;
LABEL_14:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *lightURL;
  id v5;

  lightURL = self->_lightURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", lightURL, CFSTR("kCoderKeyLightURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_darkURL, CFSTR("kCoderKeyDarkURL"));

}

- (MOSuggestionAssetImageURLPair)initWithCoder:(id)a3
{
  id v4;
  MOSuggestionAssetImageURLPair *v5;
  uint64_t v6;
  NSURL *lightURL;
  uint64_t v8;
  NSURL *darkURL;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MOSuggestionAssetImageURLPair;
  v5 = -[MOSuggestionAssetImageURLPair init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCoderKeyLightURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    lightURL = v5->_lightURL;
    v5->_lightURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCoderKeyDarkURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    darkURL = v5->_darkURL;
    v5->_darkURL = (NSURL *)v8;

  }
  return v5;
}

- (NSURL)lightURL
{
  return self->_lightURL;
}

- (NSURL)darkURL
{
  return self->_darkURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkURL, 0);
  objc_storeStrong((id *)&self->_lightURL, 0);
}

- (void)setURLsWithAppendix:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "failed to set _lightURL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)setURLsWithAppendix:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "failed to set _darkURL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)writeImageToURLs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "failed to load lightImage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)writeImageToURLs:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "failed to load darkImage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)writeImageToURLs:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "failed to write darkImage data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)writeImageToURLs:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "failed to write lightImage data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)constructedImage
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "failed to construct darkImage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
