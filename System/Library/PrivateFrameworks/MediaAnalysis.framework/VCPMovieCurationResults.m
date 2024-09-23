@implementation VCPMovieCurationResults

- (VCPMovieCurationResults)initWithPHAsset:(id)a3
{
  id v5;
  VCPMovieCurationResults *v6;
  VCPMovieCurationResults *v7;
  uint64_t v8;
  NSMutableArray *highlights;
  VCPMovieCurationResults *v10;
  VCPMovieCurationResults *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VCPMovieCurationResults;
  v6 = -[VCPMovieCurationResults init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_phAsset, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    highlights = v7->_highlights;
    v7->_highlights = (NSMutableArray *)v8;

    if (v7->_highlights)
      v10 = v7;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  return v11;
}

- (PHAsset)phAsset
{
  return self->_phAsset;
}

- (NSMutableArray)highlights
{
  return self->_highlights;
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_highlights, 0);
  objc_storeStrong((id *)&self->_phAsset, 0);
}

@end
