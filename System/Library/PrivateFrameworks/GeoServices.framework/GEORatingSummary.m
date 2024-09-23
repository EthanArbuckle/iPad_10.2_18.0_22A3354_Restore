@implementation GEORatingSummary

- (GEORatingSummary)initWithRatingData:(id)a3 attributionMap:(id)a4
{
  _QWORD *v7;
  id v8;
  GEORatingSummary *v9;
  id *p_isa;
  GEORatingSummary *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (v7 && (-[GEOPDRatingData _readVendorId]((uint64_t)v7), v7[4]))
  {
    v13.receiver = self;
    v13.super_class = (Class)GEORatingSummary;
    v9 = -[GEORatingSummary init](&v13, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeWeak((id *)&v9->_attributionMap, v8);
      objc_storeStrong(p_isa + 1, a3);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isAppleRating
{
  void *v2;
  uint64_t v3;
  BOOL v4;

  -[GEOPDRatingData ratings]((id *)&self->_ratingData->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3 && (*(_BYTE *)(v3 + 48) & 8) != 0 && *(_DWORD *)(v3 + 44) == 4;

  return v4;
}

- (float)normalizedUserRatingScore
{
  float result;

  if (-[GEORatingSummary isAppleRating](self, "isAppleRating"))
    -[GEORatingSummary _normalizedFirstPartyUserRatingScore](self, "_normalizedFirstPartyUserRatingScore");
  else
    -[GEORatingSummary _normalizedThirdPartyUserRatingScore](self, "_normalizedThirdPartyUserRatingScore");
  return result;
}

- (float)_normalizedFirstPartyUserRatingScore
{
  GEOAppleRating *v3;
  void *v4;
  void *v5;
  GEOAppleRating *v6;
  double v7;
  float v8;

  v3 = [GEOAppleRating alloc];
  -[GEOPDRatingData ratings]((id *)&self->_ratingData->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEOAppleRating initWithRating:](v3, "initWithRating:", v5);

  -[GEOAppleRating percentage](v6, "percentage");
  *(float *)&v7 = v7;
  v8 = *(float *)&v7 * 100.0;

  return v8;
}

- (float)_normalizedThirdPartyUserRatingScore
{
  void *v2;
  uint64_t v3;
  double v4;
  float v5;

  -[GEOPDRatingData ratings]((id *)&self->_ratingData->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(double *)(v3 + 32);
    if ((*(_BYTE *)(v3 + 48) & 1) != 0)
      v4 = v4 * (5.0 / *(double *)(v3 + 24));
  }
  else
  {
    v4 = 0.0;
  }
  v5 = v4;

  return v5;
}

- (float)sampleSizeUsedForScore
{
  void *v2;
  int *v3;
  float v4;

  -[GEOPDRatingData ratings]((id *)&self->_ratingData->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (int *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (float)v3[10];
  else
    v4 = 0.0;

  return v4;
}

- (NSString)vendorName
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_attributionMap);
  -[GEOPDRatingData vendorId]((id *)&self->_ratingData->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attributionMap);
  objc_storeStrong((id *)&self->_ratingData, 0);
}

@end
