@implementation AXMMediaAnalysisCaptionsResult

- (NSArray)imageCaptionResults
{
  return self->_imageCaptionResults;
}

- (void)setImageCaptionResults:(id)a3
{
  objc_storeStrong((id *)&self->_imageCaptionResults, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("AXMMediaAnalysisCaptionsResult<%p>"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMMediaAnalysisCaptionsResult imageCaptionResults](self, "imageCaptionResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v3, "appendString:", CFSTR(" Image Caption results:\n"));
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[AXMMediaAnalysisCaptionsResult imageCaptionResults](self, "imageCaptionResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v11, "text");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v11, "confidence");
          objc_msgSend(v13, "numberWithDouble:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("  - Text: '%@' Confidence: %@\n"), v12, v14);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR(" [no image caption results]"));
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_imageCaptionResults, CFSTR("imageCaptionResults"));
}

- (AXMMediaAnalysisCaptionsResult)initWithCoder:(id)a3
{
  id v4;
  AXMMediaAnalysisCaptionsResult *v5;
  uint64_t v6;
  NSArray *imageCaptionResults;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMMediaAnalysisCaptionsResult;
  v5 = -[AXMMediaAnalysisCaptionsResult init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageCaptionResults"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageCaptionResults = v5->_imageCaptionResults;
    v5->_imageCaptionResults = (NSArray *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCaptionResults, 0);
}

@end
