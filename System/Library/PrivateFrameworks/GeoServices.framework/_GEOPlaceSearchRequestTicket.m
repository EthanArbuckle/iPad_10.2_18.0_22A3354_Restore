@implementation _GEOPlaceSearchRequestTicket

- (NSString)searchQuery
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  void *v6;

  -[GEOPDPlaceRequest placeRequestParameters](self->super._request, "placeRequestParameters");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    goto LABEL_12;
  -[GEOPDPlaceRequestParameters _readSearchParameters](v2);
  if (!*(_QWORD *)(v3 + 376))
  {
    -[GEOPDPlaceRequestParameters _readPlaceRefinementParameters](v3);
    if (*(_QWORD *)(v3 + 296))
    {
      -[GEOPDPlaceRequestParameters placeRefinementParameters]((id *)v3);
      v4 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDPlaceRefinementParameters placeNameHint](v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    -[GEOPDPlaceRequestParameters _readVendorSpecificPlaceRefinementParameters](v3);
    if (*(_QWORD *)(v3 + 448))
    {
      -[GEOPDPlaceRequestParameters vendorSpecificPlaceRefinementParameters]((id *)v3);
      v4 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDVendorSpecificPlaceRefinementParameters placeNameHint](v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    -[GEOPDPlaceRequestParameters _readLocationDirectedSearchParameters](v3);
    if (*(_QWORD *)(v3 + 216))
    {
      -[GEOPDPlaceRequestParameters locationDirectedSearchParameters]((id *)v3);
      v4 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDLocationDirectedSearchParameters searchString](v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_12:
    v6 = 0;
    goto LABEL_11;
  }
  -[GEOPDPlaceRequestParameters searchParameters]((id *)v3);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchParameters searchString](v4);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v6 = (void *)v5;

LABEL_11:
  return (NSString *)v6;
}

@end
