@implementation GEOEnclosingPlace

- (GEOEnclosingPlace)initWithContainmentPlace:(id)a3
{
  _QWORD *v5;
  _QWORD *v6;
  GEOEnclosingPlace *v7;
  GEOEnclosingPlace *v8;
  GEOEnclosingPlace *v9;
  objc_super v11;

  v5 = a3;
  v6 = v5;
  if (v5 && (-[GEOPDContainmentPlace _readContainmentLine]((uint64_t)v5), v6[4]))
  {
    v11.receiver = self;
    v11.super_class = (Class)GEOEnclosingPlace;
    v7 = -[GEOEnclosingPlace init](&v11, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_enclosingPlace, a3);
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (GEOMapItemIdentifier)parentIdentifier
{
  void *v3;
  GEOMapItemIdentifier *v4;
  void *v5;
  GEOMapItemIdentifier *v6;

  -[GEOPDContainmentPlace containerId]((id *)&self->_enclosingPlace->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [GEOMapItemIdentifier alloc];
    -[GEOPDContainmentPlace containerId]((id *)&self->_enclosingPlace->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v4, "initWithMapsIdentifier:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (GEOServerFormattedString)containmentTextTemplate
{
  return (GEOServerFormattedString *)-[GEOPDContainmentPlace containmentLine]((id *)&self->_enclosingPlace->super.super.isa);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enclosingPlace, 0);
}

@end
