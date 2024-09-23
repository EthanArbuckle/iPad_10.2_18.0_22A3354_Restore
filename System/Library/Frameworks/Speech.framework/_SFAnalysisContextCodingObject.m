@implementation _SFAnalysisContextCodingObject

- (_SFAnalysisContextCodingObject)initWithLeftContext:(id)a3 rightContext:(id)a4 selectedText:(id)a5 geoLMRegionID:(id)a6 contextualStrings:(id)a7 contextualNamedEntities:(id)a8 profileData:(id)a9 jitProfileData:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _SFAnalysisContextCodingObject *v24;
  uint64_t v25;
  NSArray *leftContext;
  uint64_t v27;
  NSArray *rightContext;
  uint64_t v29;
  NSArray *selectedText;
  uint64_t v31;
  NSString *geoLMRegionID;
  uint64_t v33;
  NSArray *contextualStrings;
  uint64_t v35;
  NSArray *contextualNamedEntities;
  uint64_t v37;
  NSData *profileData;
  uint64_t v39;
  NSData *jitProfileData;
  objc_super v42;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v42.receiver = self;
  v42.super_class = (Class)_SFAnalysisContextCodingObject;
  v24 = -[_SFAnalysisContextCodingObject init](&v42, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v16, "copy");
    leftContext = v24->_leftContext;
    v24->_leftContext = (NSArray *)v25;

    v27 = objc_msgSend(v17, "copy");
    rightContext = v24->_rightContext;
    v24->_rightContext = (NSArray *)v27;

    v29 = objc_msgSend(v18, "copy");
    selectedText = v24->_selectedText;
    v24->_selectedText = (NSArray *)v29;

    v31 = objc_msgSend(v19, "copy");
    geoLMRegionID = v24->_geoLMRegionID;
    v24->_geoLMRegionID = (NSString *)v31;

    v33 = objc_msgSend(v20, "copy");
    contextualStrings = v24->_contextualStrings;
    v24->_contextualStrings = (NSArray *)v33;

    v35 = objc_msgSend(v21, "copy");
    contextualNamedEntities = v24->_contextualNamedEntities;
    v24->_contextualNamedEntities = (NSArray *)v35;

    v37 = objc_msgSend(v22, "copy");
    profileData = v24->_profileData;
    v24->_profileData = (NSData *)v37;

    v39 = objc_msgSend(v23, "copy");
    jitProfileData = v24->_jitProfileData;
    v24->_jitProfileData = (NSData *)v39;

  }
  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *leftContext;
  id v5;

  leftContext = self->_leftContext;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", leftContext, CFSTR("_leftContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rightContext, CFSTR("_rightContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selectedText, CFSTR("_selectedText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_geoLMRegionID, CFSTR("_geoLMRegionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextualStrings, CFSTR("_contextualStrings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextualNamedEntities, CFSTR("_contextualNamedEntities"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_profileData, CFSTR("_profileData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_jitProfileData, CFSTR("_jitProfileData"));

}

- (_SFAnalysisContextCodingObject)initWithCoder:(id)a3
{
  id v4;
  _SFAnalysisContextCodingObject *v5;
  uint64_t v6;
  NSArray *leftContext;
  uint64_t v8;
  NSArray *rightContext;
  uint64_t v10;
  NSArray *selectedText;
  uint64_t v12;
  NSString *geoLMRegionID;
  uint64_t v14;
  NSArray *contextualStrings;
  uint64_t v16;
  NSArray *contextualNamedEntities;
  uint64_t v18;
  NSData *profileData;
  uint64_t v20;
  NSData *jitProfileData;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_SFAnalysisContextCodingObject;
  v5 = -[_SFAnalysisContextCodingObject init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_leftContext"));
    v6 = objc_claimAutoreleasedReturnValue();
    leftContext = v5->_leftContext;
    v5->_leftContext = (NSArray *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_rightContext"));
    v8 = objc_claimAutoreleasedReturnValue();
    rightContext = v5->_rightContext;
    v5->_rightContext = (NSArray *)v8;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_selectedText"));
    v10 = objc_claimAutoreleasedReturnValue();
    selectedText = v5->_selectedText;
    v5->_selectedText = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_geoLMRegionID"));
    v12 = objc_claimAutoreleasedReturnValue();
    geoLMRegionID = v5->_geoLMRegionID;
    v5->_geoLMRegionID = (NSString *)v12;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_contextualStrings"));
    v14 = objc_claimAutoreleasedReturnValue();
    contextualStrings = v5->_contextualStrings;
    v5->_contextualStrings = (NSArray *)v14;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_contextualNamedEntities"));
    v16 = objc_claimAutoreleasedReturnValue();
    contextualNamedEntities = v5->_contextualNamedEntities;
    v5->_contextualNamedEntities = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_profileData"));
    v18 = objc_claimAutoreleasedReturnValue();
    profileData = v5->_profileData;
    v5->_profileData = (NSData *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_jitProfileData"));
    v20 = objc_claimAutoreleasedReturnValue();
    jitProfileData = v5->_jitProfileData;
    v5->_jitProfileData = (NSData *)v20;

  }
  return v5;
}

- (NSArray)leftContext
{
  return self->_leftContext;
}

- (NSArray)rightContext
{
  return self->_rightContext;
}

- (NSArray)selectedText
{
  return self->_selectedText;
}

- (NSString)geoLMRegionID
{
  return self->_geoLMRegionID;
}

- (NSArray)contextualStrings
{
  return self->_contextualStrings;
}

- (NSArray)contextualNamedEntities
{
  return self->_contextualNamedEntities;
}

- (NSData)profileData
{
  return self->_profileData;
}

- (NSData)jitProfileData
{
  return self->_jitProfileData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jitProfileData, 0);
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_contextualNamedEntities, 0);
  objc_storeStrong((id *)&self->_contextualStrings, 0);
  objc_storeStrong((id *)&self->_geoLMRegionID, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_rightContext, 0);
  objc_storeStrong((id *)&self->_leftContext, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
