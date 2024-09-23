@implementation CKContextResult

- (NSString)topicId
{
  return self->_topicId;
}

- (void)setRelatedItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSOrderedSet)relatedItems
{
  return self->_relatedItems;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_query, CFSTR("query"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_url, CFSTR("url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_topicId, CFSTR("topicId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_category, CFSTR("category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_debug, CFSTR("debug"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relatedItems, CFSTR("relatedItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedResults, CFSTR("associatedResults"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tags, CFSTR("tags"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_minPrefix, CFSTR("minPrefix"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_exactMatch, CFSTR("exactMatch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extractedStartDateComponents, CFSTR("extractedStartDateComponents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extractedEndDateComponents, CFSTR("extractedEndDateComponents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extractedAddressComponents, CFSTR("extractedAddressComponents"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_onScreen, CFSTR("onScreen"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sceneIdentifier, CFSTR("sceneIdentifier"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("frameInWindow.x"), self->_frameInWindow.origin.x);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("frameInWindow.y"), self->_frameInWindow.origin.y);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("frameInWindow.width"), self->_frameInWindow.size.width);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("frameInWindow.height"), self->_frameInWindow.size.height);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("absoluteOrigin.x"), self->_absoluteOriginOnScreen.x);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("absoluteOrigin.y"), self->_absoluteOriginOnScreen.y);

}

- (CKContextResult)initWithTitle:(id)a3 query:(id)a4 url:(id)a5 category:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CKContextResult *v14;
  uint64_t v15;
  NSString *title;
  uint64_t v17;
  NSString *query;
  uint64_t v19;
  NSURL *url;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CKContextResult;
  v14 = -[CKContextResult init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    title = v14->_title;
    v14->_title = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    query = v14->_query;
    v14->_query = (NSString *)v17;

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
      v19 = objc_claimAutoreleasedReturnValue();
      url = v14->_url;
      v14->_url = (NSURL *)v19;
    }
    else
    {
      url = v14->_url;
      v14->_url = 0;
    }

    objc_storeStrong((id *)&v14->_category, a6);
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedResults, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_extractedAddressComponents, 0);
  objc_storeStrong((id *)&self->_extractedEndDateComponents, 0);
  objc_storeStrong((id *)&self->_extractedStartDateComponents, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_relatedItems, 0);
  objc_storeStrong((id *)&self->_debug, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_topicId, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (CKContextResult)initWithCoder:(id)a3
{
  id v4;
  CKContextResult *v5;
  NSString *v6;
  NSString *title;
  NSString *v8;
  uint64_t v9;
  NSString *query;
  uint64_t v11;
  NSURL *url;
  uint64_t v13;
  NSString *topicId;
  uint64_t v15;
  NSString *category;
  uint64_t v17;
  NSString *debug;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSOrderedSet *relatedItems;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSArray *associatedResults;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSSet *tags;
  uint64_t v34;
  NSDateComponents *extractedStartDateComponents;
  uint64_t v36;
  NSDateComponents *extractedEndDateComponents;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSDictionary *extractedAddressComponents;
  uint64_t v43;
  NSString *sceneIdentifier;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  CGFloat v54;
  objc_super v56;

  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)CKContextResult;
  v5 = -[CKContextResult init](&v56, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = v6;
    v8 = v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("query"));
    v9 = objc_claimAutoreleasedReturnValue();
    query = v5->_query;
    v5->_query = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v11 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topicId"));
    v13 = objc_claimAutoreleasedReturnValue();
    topicId = v5->_topicId;
    v5->_topicId = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
    v15 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("debug"));
    v17 = objc_claimAutoreleasedReturnValue();
    debug = v5->_debug;
    v5->_debug = (NSString *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("relatedItems"));
    v22 = objc_claimAutoreleasedReturnValue();
    relatedItems = v5->_relatedItems;
    v5->_relatedItems = (NSOrderedSet *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("associatedResults"));
    v27 = objc_claimAutoreleasedReturnValue();
    associatedResults = v5->_associatedResults;
    v5->_associatedResults = (NSArray *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("tags"));
    v32 = objc_claimAutoreleasedReturnValue();
    tags = v5->_tags;
    v5->_tags = (NSSet *)v32;

    v5->_minPrefix = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minPrefix"));
    v5->_exactMatch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("exactMatch"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extractedStartDateComponents"));
    v34 = objc_claimAutoreleasedReturnValue();
    extractedStartDateComponents = v5->_extractedStartDateComponents;
    v5->_extractedStartDateComponents = (NSDateComponents *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extractedEndDateComponents"));
    v36 = objc_claimAutoreleasedReturnValue();
    extractedEndDateComponents = v5->_extractedEndDateComponents;
    v5->_extractedEndDateComponents = (NSDateComponents *)v36;

    v38 = (void *)MEMORY[0x1E0C99E60];
    v39 = objc_opt_class();
    objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("extractedAddressComponents"));
    v41 = objc_claimAutoreleasedReturnValue();
    extractedAddressComponents = v5->_extractedAddressComponents;
    v5->_extractedAddressComponents = (NSDictionary *)v41;

    v5->_onScreen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onScreen"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneIdentifier"));
    v43 = objc_claimAutoreleasedReturnValue();
    sceneIdentifier = v5->_sceneIdentifier;
    v5->_sceneIdentifier = (NSString *)v43;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("frameInWindow.x"));
    v46 = v45;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("frameInWindow.y"));
    v48 = v47;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("frameInWindow.width"));
    v50 = v49;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("frameInWindow.height"));
    v5->_frameInWindow.origin.x = v46;
    v5->_frameInWindow.origin.y = v48;
    v5->_frameInWindow.size.width = v50;
    v5->_frameInWindow.size.height = v51;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("absoluteOrigin.x"));
    v53 = v52;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("absoluteOrigin.y"));
    v5->_absoluteOriginOnScreen.x = v53;
    v5->_absoluteOriginOnScreen.y = v54;
  }

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTopicId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  CKContextResult *v4;
  uint64_t v5;
  char v6;
  NSString *title;
  void *v8;

  v4 = (CKContextResult *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      title = self->_title;
      -[CKContextResult title](v4, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[NSString isEqualToString:](title, "isEqualToString:", v8);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return 31 * -[NSString hash](self->_title, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTitle:query:url:category:", self->_title, self->_query, 0, self->_category);
  objc_msgSend(v4, "setUrl:", self->_url);
  objc_msgSend(v4, "setTopicId:", self->_topicId);
  objc_msgSend(v4, "setDebug:", self->_debug);
  objc_msgSend(v4, "setRelatedItems:", self->_relatedItems);
  objc_msgSend(v4, "setAssociatedResults:", self->_associatedResults);
  objc_msgSend(v4, "setTags:", self->_tags);
  objc_msgSend(v4, "setMinPrefix:", self->_minPrefix);
  objc_msgSend(v4, "setExactMatch:", self->_exactMatch);
  objc_msgSend(v4, "setExtractedStartDateComponents:", self->_extractedStartDateComponents);
  objc_msgSend(v4, "setExtractedEndDateComponents:", self->_extractedEndDateComponents);
  objc_msgSend(v4, "setExtractedAddressComponents:", self->_extractedAddressComponents);
  objc_msgSend(v4, "setFrameInWindow:", self->_frameInWindow.origin.x, self->_frameInWindow.origin.y, self->_frameInWindow.size.width, self->_frameInWindow.size.height);
  objc_msgSend(v4, "setAbsoluteOriginOnScreen:", self->_absoluteOriginOnScreen.x, self->_absoluteOriginOnScreen.y);
  objc_msgSend(v4, "setOnScreen:", self->_onScreen);
  objc_msgSend(v4, "setSceneIdentifier:", self->_sceneIdentifier);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)CKContextResult;
  -[CKContextResult description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, self->_title);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)toJSONSerializableDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *query;
  NSURL *url;
  void *v15;
  NSString *topicId;
  NSString *category;
  NSString *debug;
  NSOrderedSet *relatedItems;
  void *v20;
  NSSet *tags;
  void *v22;
  NSArray *associatedResults;
  void *v24;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_title, CFSTR("title"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minPrefix);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("minPrefix"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_exactMatch);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("exactMatch"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteOriginOnScreen.x);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("absoluteOriginX"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteOriginOnScreen.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("absoluteOriginY"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_frameInWindow.origin.x);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("x"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_frameInWindow.origin.y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("y"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_frameInWindow.size.width);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("width"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_frameInWindow.size.height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("height"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_onScreen);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("onScreen"));

  query = self->_query;
  if (query)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", query, CFSTR("query"));
  url = self->_url;
  if (url)
  {
    -[NSURL absoluteString](url, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("urlString"));

  }
  topicId = self->_topicId;
  if (topicId)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", topicId, CFSTR("topicId"));
  category = self->_category;
  if (category)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", category, CFSTR("category"));
  debug = self->_debug;
  if (debug)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", debug, CFSTR("debug"));
  relatedItems = self->_relatedItems;
  if (relatedItems)
  {
    -[NSOrderedSet array](relatedItems, "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("relatedItems"));

  }
  tags = self->_tags;
  if (tags)
  {
    -[NSSet allObjects](tags, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("tags"));

  }
  associatedResults = self->_associatedResults;
  if (associatedResults)
  {
    -[NSArray valueForKey:](associatedResults, "valueForKey:", CFSTR("toJSONSerializableDictionary"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("associatedResults"));

  }
  if (-[NSString length](self->_sceneIdentifier, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_sceneIdentifier, CFSTR("sceneIdentifier"));
  return v3;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)minPrefix
{
  return self->_minPrefix;
}

- (void)setMinPrefix:(int64_t)a3
{
  self->_minPrefix = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)debug
{
  return self->_debug;
}

- (void)setDebug:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSSet)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isExactMatch
{
  return self->_exactMatch;
}

- (void)setExactMatch:(BOOL)a3
{
  self->_exactMatch = a3;
}

- (NSDateComponents)extractedStartDateComponents
{
  return self->_extractedStartDateComponents;
}

- (void)setExtractedStartDateComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDateComponents)extractedEndDateComponents
{
  return self->_extractedEndDateComponents;
}

- (void)setExtractedEndDateComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDictionary)extractedAddressComponents
{
  return self->_extractedAddressComponents;
}

- (void)setExtractedAddressComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (CGRect)frameInWindow
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frameInWindow.origin.x;
  y = self->_frameInWindow.origin.y;
  width = self->_frameInWindow.size.width;
  height = self->_frameInWindow.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrameInWindow:(CGRect)a3
{
  self->_frameInWindow = a3;
}

- (CGPoint)absoluteOriginOnScreen
{
  double x;
  double y;
  CGPoint result;

  x = self->_absoluteOriginOnScreen.x;
  y = self->_absoluteOriginOnScreen.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAbsoluteOriginOnScreen:(CGPoint)a3
{
  self->_absoluteOriginOnScreen = a3;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (void)setOnScreen:(BOOL)a3
{
  self->_onScreen = a3;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)associatedResults
{
  return self->_associatedResults;
}

- (void)setAssociatedResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

@end
