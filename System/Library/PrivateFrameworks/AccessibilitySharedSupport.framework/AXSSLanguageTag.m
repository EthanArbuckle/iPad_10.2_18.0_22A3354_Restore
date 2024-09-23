@implementation AXSSLanguageTag

- (AXSSLanguageTag)initWithDialect:(id)a3 range:(_NSRange)a4 content:(id)a5 createdFromNewline:(BOOL)a6
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  AXSSLanguageTag *v14;
  AXSSLanguageTag *v15;
  void *v16;
  uint64_t v17;
  NSString *taggedString;
  objc_super v20;

  length = a4.length;
  location = a4.location;
  v12 = a3;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AXSSLanguageTag;
  v14 = -[AXSSLanguageTag init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_taggedRange.location = location;
    v14->_taggedRange.length = length;
    objc_msgSend(v13, "substringWithRange:", location, length);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    taggedString = v15->_taggedString;
    v15->_taggedString = (NSString *)v17;

    objc_storeStrong((id *)&v15->_content, a5);
    objc_storeStrong((id *)&v15->_dialect, a3);
    v15->_createdFromNewline = a6;
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSRange v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXSSLanguageTag dialect](self, "dialect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSLanguageTag taggedString](self, "taggedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.location = -[AXSSLanguageTag taggedRange](self, "taggedRange");
  NSStringFromRange(v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXSSLanguageTag <%p>. dialect:%@ content:%@ range:-%@- createdFromNewline:(%d)"), self, v4, v5, v6, -[AXSSLanguageTag createdFromNewline](self, "createdFromNewline"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addPredictedSecondaryDialects:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[AXSSLanguageTag predictedSecondaryDialects](self, "predictedSecondaryDialects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    -[AXSSLanguageTag setPredictedSecondaryDialects:](self, "setPredictedSecondaryDialects:", v6);

  }
  -[AXSSLanguageTag predictedSecondaryDialects](self, "predictedSecondaryDialects");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionOrderedSet:", v4);

}

- (_NSRange)taggedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_taggedRange.length;
  location = self->_taggedRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)taggedString
{
  return self->_taggedString;
}

- (int64_t)offsetToInitialLocation
{
  return self->_offsetToInitialLocation;
}

- (void)setOffsetToInitialLocation:(int64_t)a3
{
  self->_offsetToInitialLocation = a3;
}

- (NSString)content
{
  return self->_content;
}

- (AXSSDialectMap)dialect
{
  return self->_dialect;
}

- (BOOL)createdFromNewline
{
  return self->_createdFromNewline;
}

- (NSMutableOrderedSet)predictedSecondaryDialects
{
  return self->_predictedSecondaryDialects;
}

- (void)setPredictedSecondaryDialects:(id)a3
{
  objc_storeStrong((id *)&self->_predictedSecondaryDialects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedSecondaryDialects, 0);
  objc_storeStrong((id *)&self->_dialect, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_taggedString, 0);
}

@end
