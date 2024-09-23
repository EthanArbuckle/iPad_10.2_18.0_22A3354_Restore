@implementation AXMTextDetectionOptions

+ (id)defaultOptions
{
  return -[AXMTextDetectionOptions _init]([AXMTextDetectionOptions alloc], "_init");
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMTextDetectionOptions;
  result = -[AXMTextDetectionOptions init](&v3, sel_init);
  if (result)
  {
    *((_QWORD *)result + 2) = 0;
    *((_QWORD *)result + 3) = 0;
    *((_BYTE *)result + 8) = 1;
    *((_QWORD *)result + 5) = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMTextDetectionOptions)initWithCoder:(id)a3
{
  id v4;
  AXMTextDetectionOptions *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[AXMTextDetectionOptions _init](self, "_init");
  if (v5)
  {
    -[AXMTextDetectionOptions setRecognitionLevel:](v5, "setRecognitionLevel:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("recognitionLevel")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("normalizedMinimumTextHeightRatio"));
    -[AXMTextDetectionOptions setNormalizedMinimumTextHeightRatio:](v5, "setNormalizedMinimumTextHeightRatio:");
    -[AXMTextDetectionOptions setUsesLanguageCorrection:](v5, "setUsesLanguageCorrection:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesLanguageCorrection")));
    AXMSecureCodingClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("textDetectionLocales"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMTextDetectionOptions setTextDetectionLocales:](v5, "setTextDetectionLocales:", v7);

    -[AXMTextDetectionOptions setPostProcessingOptions:](v5, "setPostProcessingOptions:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("postProcessingOptions")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[AXMTextDetectionOptions recognitionLevel](self, "recognitionLevel"), CFSTR("recognitionLevel"));
  -[AXMTextDetectionOptions normalizedMinimumTextHeightRatio](self, "normalizedMinimumTextHeightRatio");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("normalizedMinimumTextHeightRatio"));
  objc_msgSend(v5, "encodeBool:forKey:", -[AXMTextDetectionOptions usesLanguageCorrection](self, "usesLanguageCorrection"), CFSTR("usesLanguageCorrection"));
  -[AXMTextDetectionOptions textDetectionLocales](self, "textDetectionLocales");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("textDetectionLocales"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[AXMTextDetectionOptions postProcessingOptions](self, "postProcessingOptions"), CFSTR("postProcessingOptions"));
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("[ "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[AXMTextDetectionOptions textDetectionLocales](self, "textDetectionLocales");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "languageCode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR("]"));
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("AXMTextDetectionOptions<%p>\n"), self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendFormat:", CFSTR("  Options: \n"));
  v11 = -[AXMTextDetectionOptions recognitionLevel](self, "recognitionLevel");
  v12 = CFSTR("Accurate");
  if (!v11)
    v12 = CFSTR("Fast");
  objc_msgSend(v10, "appendFormat:", CFSTR("    Recognition Level: %@\n"), v12);
  -[AXMTextDetectionOptions normalizedMinimumTextHeightRatio](self, "normalizedMinimumTextHeightRatio");
  objc_msgSend(v10, "appendFormat:", CFSTR("    Minimum Text Height Ratio: %.3f\n"), v13);
  objc_msgSend(v10, "appendFormat:", CFSTR("    Use Language Correction: %ld\n"), -[AXMTextDetectionOptions usesLanguageCorrection](self, "usesLanguageCorrection"));
  objc_msgSend(v10, "appendFormat:", CFSTR("    Detection Languages: %@\n"), v3);
  objc_msgSend(v10, "appendFormat:", CFSTR("    Apply Semantic Text Filtering: %ld\n"), -[AXMTextDetectionOptions shouldApplySemanticTextFiltering](self, "shouldApplySemanticTextFiltering"));

  return v10;
}

- (BOOL)shouldApplySemanticTextFiltering
{
  return 0;
}

- (void)setNormalizedMinimumTextHeightRatio:(double)a3
{
  self->_normalizedMinimumTextHeightRatio = fmin(fmax(a3, 0.0), 1.0);
}

- (NSArray)textDetectionLocales
{
  NSArray *textDetectionLocales;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;

  textDetectionLocales = self->_textDetectionLocales;
  if (!textDetectionLocales)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v6);
      if (v7)
        objc_msgSend(v4, "addObject:", v7);

    }
    if (!objc_msgSend(v4, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_msgSend(v4, "addObject:", v8);

    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_textDetectionLocales;
    self->_textDetectionLocales = v9;

    textDetectionLocales = self->_textDetectionLocales;
  }
  return textDetectionLocales;
}

- (unint64_t)recognitionLevel
{
  return self->_recognitionLevel;
}

- (void)setRecognitionLevel:(unint64_t)a3
{
  self->_recognitionLevel = a3;
}

- (double)normalizedMinimumTextHeightRatio
{
  return self->_normalizedMinimumTextHeightRatio;
}

- (BOOL)usesLanguageCorrection
{
  return self->_usesLanguageCorrection;
}

- (void)setUsesLanguageCorrection:(BOOL)a3
{
  self->_usesLanguageCorrection = a3;
}

- (void)setTextDetectionLocales:(id)a3
{
  objc_storeStrong((id *)&self->_textDetectionLocales, a3);
}

- (unint64_t)postProcessingOptions
{
  return self->_postProcessingOptions;
}

- (void)setPostProcessingOptions:(unint64_t)a3
{
  self->_postProcessingOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textDetectionLocales, 0);
}

@end
