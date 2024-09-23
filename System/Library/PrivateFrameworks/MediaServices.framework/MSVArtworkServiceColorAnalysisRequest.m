@implementation MSVArtworkServiceColorAnalysisRequest

- (MSVArtworkServiceColorAnalysisRequest)initWithSourceURL:(id)a3 preferredImageSize:(CGSize)a4
{
  double height;
  double width;
  id v8;
  MSVArtworkServiceColorAnalysisRequest *v9;
  MSVArtworkServiceColorAnalysisRequest *v10;
  float v11;
  float v12;
  objc_super v14;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MSVArtworkServiceColorAnalysisRequest;
  v9 = -[MSVArtworkServiceRequest init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceURL, a3);
    v11 = width;
    v10->_preferredImageWidth = v11;
    v12 = height;
    v10->_preferredImageHeight = v12;
  }

  return v10;
}

- (MSVArtworkServiceColorAnalysisRequest)initWithCoder:(id)a3
{
  id v4;
  MSVArtworkServiceColorAnalysisRequest *v5;
  uint64_t v6;
  NSURL *sourceURL;
  float v8;
  float v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSVArtworkServiceColorAnalysisRequest;
  v5 = -[MSVArtworkServiceRequest init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSVArtworkServiceColorAnalysisRequestSourceURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    sourceURL = v5->_sourceURL;
    v5->_sourceURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("MSVArtworkServiceColorAnalysisRequestPreferredImageWidth"));
    v5->_preferredImageWidth = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("MSVArtworkServiceColorAnalysisRequestPreferredImageHeight"));
    v5->_preferredImageHeight = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *sourceURL;
  double v5;
  double v6;
  id v7;

  sourceURL = self->_sourceURL;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", sourceURL, CFSTR("MSVArtworkServiceColorAnalysisRequestSourceURL"));
  *(float *)&v5 = self->_preferredImageWidth;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("MSVArtworkServiceColorAnalysisRequestPreferredImageWidth"), v5);
  *(float *)&v6 = self->_preferredImageHeight;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("MSVArtworkServiceColorAnalysisRequestPreferredImageHeight"), v6);

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[MSVArtworkServiceColorAnalysisRequest sourceURL](self, "sourceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<algorithm=MSVArtworkColorAnalyzerAlgorithmiTunes -- %@>"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (Class)operationClass
{
  return (Class)objc_opt_class();
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (float)preferredImageWidth
{
  return self->_preferredImageWidth;
}

- (float)preferredImageHeight
{
  return self->_preferredImageHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
