@implementation GEOPOIClaim

- (GEOPOIClaim)initWithPOIClaim:(id)a3
{
  id v5;
  GEOPOIClaim *v6;
  GEOPOIClaim *v7;
  GEOPOIClaim *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOPOIClaim;
    v6 = -[GEOPOIClaim init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_poiClaim, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isClaimed
{
  GEOPDPOIClaim *poiClaim;

  poiClaim = self->_poiClaim;
  return poiClaim && poiClaim->_isClaimed;
}

- (BOOL)isClaimable
{
  GEOPDPOIClaim *poiClaim;
  void *v3;
  BOOL v4;

  poiClaim = self->_poiClaim;
  if (!poiClaim || !poiClaim->_isClaimable)
    return 0;
  -[GEOPDPOIClaim claimUrl]((id *)&poiClaim->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (NSURL)claimURL
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  -[GEOPDPOIClaim claimUrl]((id *)&self->_poiClaim->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E98]);
    -[GEOPDPOIClaim claimUrl]((id *)&self->_poiClaim->super.super.isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

  }
  else
  {
    v7 = 0;
  }
  return (NSURL *)v7;
}

- (id)description
{
  return -[GEOPDPOIClaim description](self->_poiClaim, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiClaim, 0);
}

@end
