@implementation _GEOTransitSystem

- (_GEOTransitSystem)initWithSystem:(id)a3
{
  id v5;
  _GEOTransitSystem *v6;
  _GEOTransitSystem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GEOTransitSystem;
  v6 = -[_GEOTransitSystem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_system, a3);

  return v7;
}

- (unint64_t)muid
{
  return -[GEOPBTransitSystem muid](self->_system, "muid");
}

- (NSString)name
{
  return -[GEOPBTransitSystem nameDisplayString](self->_system, "nameDisplayString");
}

- (GEOTransitArtworkDataSource)artwork
{
  return (GEOTransitArtworkDataSource *)-[GEOPBTransitSystem artwork](self->_system, "artwork");
}

- (GEOStyleAttributes)styleAttributes
{
  return -[GEOPBTransitSystem styleAttributes](self->_system, "styleAttributes");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GEOTransitSystem)initWithCoder:(id)a3
{
  id v4;
  _GEOTransitSystem *v5;
  uint64_t v6;
  GEOPBTransitSystem *system;
  _GEOTransitSystem *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GEOTransitSystem;
  v5 = -[_GEOTransitSystem init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_system"));
    v6 = objc_claimAutoreleasedReturnValue();
    system = v5->_system;
    v5->_system = (GEOPBTransitSystem *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_system, CFSTR("_system"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_system, 0);
}

@end
