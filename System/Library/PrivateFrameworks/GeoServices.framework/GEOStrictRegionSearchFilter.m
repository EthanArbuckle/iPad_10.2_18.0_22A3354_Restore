@implementation GEOStrictRegionSearchFilter

- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  GEOPDSSearchFilter *v6;
  uint64_t v7;

  v4 = a3;
  v5 = (uint64_t)v4;
  if (!v4 || (-[GEOPDSearchParameters _readSearchFilter]((uint64_t)v4), !*(_QWORD *)(v5 + 240)))
  {
    v6 = objc_alloc_init(GEOPDSSearchFilter);
    -[GEOPDSearchParameters setSearchFilter:](v5, v6);

  }
  -[GEOPDSearchParameters searchFilter]((id *)v5);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    *(_WORD *)(v7 + 116) |= 0x400u;
    *(_WORD *)(v7 + 116) |= 2u;
    *(_BYTE *)(v7 + 112) = 1;
  }

  return 1;
}

@end
