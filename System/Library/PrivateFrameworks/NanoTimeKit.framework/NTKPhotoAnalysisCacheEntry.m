@implementation NTKPhotoAnalysisCacheEntry

- (NTKPhotoAnalysisCacheEntry)initWithCoder:(id)a3
{
  id v4;
  NTKPhotoAnalysisCacheEntry *v5;
  uint64_t v6;
  NTKPhotoAnalysis *analysis;
  NTKPhotoAnalysisCacheEntry *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKPhotoAnalysisCacheEntry;
  v5 = -[NTKPhotoAnalysisCacheEntry init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("analysis"));
    v6 = objc_claimAutoreleasedReturnValue();
    analysis = v5->_analysis;
    v5->_analysis = (NTKPhotoAnalysis *)v6;

    v5->_sequenceNumber = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("sequenceNumber"));
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NTKPhotoAnalysis *analysis;
  id v5;

  analysis = self->_analysis;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", analysis, CFSTR("analysis"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_sequenceNumber, CFSTR("sequenceNumber"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKPhotoAnalysis)analysis
{
  return self->_analysis;
}

- (void)setAnalysis:(id)a3
{
  objc_storeStrong((id *)&self->_analysis, a3);
}

- (int)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int)a3
{
  self->_sequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysis, 0);
}

@end
