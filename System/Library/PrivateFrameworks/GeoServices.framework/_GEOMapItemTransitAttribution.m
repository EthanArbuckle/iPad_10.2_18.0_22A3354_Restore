@implementation _GEOMapItemTransitAttribution

- (_GEOMapItemTransitAttribution)initWithTransitAttribution:(id)a3
{
  id v5;
  _GEOMapItemTransitAttribution *v6;
  _GEOMapItemTransitAttribution *v7;
  _GEOMapItemTransitAttribution *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GEOMapItemTransitAttribution;
  v6 = -[_GEOMapItemTransitAttribution init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transitAttribution, a3);
    v8 = v7;
  }

  return v7;
}

- (NSArray)_providerNames
{
  return (NSArray *)-[GEOPDTransitAttribution providerNames]((id *)&self->_transitAttribution->super.super.isa);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitAttribution, 0);
}

@end
