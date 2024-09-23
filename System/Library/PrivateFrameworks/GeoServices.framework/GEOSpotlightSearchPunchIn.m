@implementation GEOSpotlightSearchPunchIn

- (GEOSpotlightSearchPunchIn)initWithEncodedString:(id)a3
{
  id v5;
  GEOSpotlightSearchPunchIn *v6;
  GEOSpotlightSearchPunchIn *v7;
  void *v8;
  GEOPDSPunchInHints *v9;
  GEOPDSPunchInHints *punchInHints;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOSpotlightSearchPunchIn;
  v6 = -[GEOSpotlightSearchPunchIn init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_spotlightEncodedString, a3);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v5, 0);
    v9 = -[GEOPDSPunchInHints initWithData:]([GEOPDSPunchInHints alloc], "initWithData:", v8);
    punchInHints = v7->_punchInHints;
    v7->_punchInHints = v9;

  }
  return v7;
}

- (NSString)originalSearchQuery
{
  id *v2;
  void *v3;

  -[GEOPDSPunchInHints queryHints]((id *)&self->_punchInHints->super.super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSPunchInQueryHints originalSearchQuery](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)completedSearchQuery
{
  id *v2;
  void *v3;

  -[GEOPDSPunchInHints queryHints]((id *)&self->_punchInHints->super.super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSPunchInQueryHints completedSearchQuery](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)spotlightEncodedString
{
  return self->_spotlightEncodedString;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_spotlightEncodedString, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[GEOPDSPunchInHints copyWithZone:](self->_punchInHints, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightEncodedString, 0);
  objc_storeStrong((id *)&self->_punchInHints, 0);
}

@end
