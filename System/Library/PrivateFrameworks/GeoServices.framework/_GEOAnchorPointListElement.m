@implementation _GEOAnchorPointListElement

- (_GEOAnchorPointListElement)initWithAnchorPoint:(id)a3
{
  return -[_GEOAnchorPointListElement initWithAnchorPoint:conjoinedWith:](self, "initWithAnchorPoint:conjoinedWith:", a3, 0);
}

- (_GEOAnchorPointListElement)initWithAnchorPoint:(id)a3 conjoinedWith:(id)a4
{
  id v7;
  id *v8;
  _GEOAnchorPointListElement *v9;
  _GEOAnchorPointListElement *v10;
  uint64_t v11;
  NSUUID *elementID;
  NSMutableSet *v13;
  NSMutableSet *conjunctElements;
  _GEOAnchorPointListElement *v15;
  objc_super v17;

  v7 = a3;
  v8 = (id *)a4;
  v17.receiver = self;
  v17.super_class = (Class)_GEOAnchorPointListElement;
  v9 = -[_GEOAnchorPointListElement init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_anchorPoint, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = objc_claimAutoreleasedReturnValue();
    elementID = v10->_elementID;
    v10->_elementID = (NSUUID *)v11;

    if (!v8 || (v13 = (NSMutableSet *)v8[3]) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v13 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    }
    -[NSMutableSet addObject:](v13, "addObject:", v10->_elementID);
    conjunctElements = v10->_conjunctElements;
    v10->_conjunctElements = v13;

    v15 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  char v5;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4[1], "isEqual:", self->_anchorPoint);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[GEOComposedRouteAnchorPoint hash](self->_anchorPoint, "hash");
}

- (id)duplicate
{
  _GEOAnchorPointListElement *v2;
  void *v3;
  _GEOAnchorPointListElement *v4;

  v2 = self;
  if (self)
    self = (_GEOAnchorPointListElement *)self->_anchorPoint;
  -[_GEOAnchorPointListElement duplicate](self, "duplicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_GEOAnchorPointListElement initWithAnchorPoint:conjoinedWith:]([_GEOAnchorPointListElement alloc], "initWithAnchorPoint:conjoinedWith:", v3, v2);

  return v4;
}

- (BOOL)isInConjunctionWith:(id)a3
{
  uint64_t *v4;
  uint64_t *v5;
  NSMutableSet *conjunctElements;
  uint64_t v7;
  NSMutableSet *v8;
  char v9;

  v4 = (uint64_t *)a3;
  v5 = v4;
  if (!self)
  {
    conjunctElements = 0;
    if (v4)
      goto LABEL_3;
LABEL_6:
    v7 = 0;
    goto LABEL_4;
  }
  conjunctElements = self->_conjunctElements;
  if (!v4)
    goto LABEL_6;
LABEL_3:
  v7 = v4[2];
LABEL_4:
  v8 = conjunctElements;
  v9 = -[NSMutableSet containsObject:](v8, "containsObject:", v7);

  return v9;
}

- (void)updateWithSnappedAnchorPoint:(id)a3
{
  objc_storeStrong((id *)&self->_anchorPoint, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  GEOComposedRouteAnchorPoint *anchorPoint;
  id v5;

  anchorPoint = self->_anchorPoint;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", anchorPoint, CFSTR("_anchorPoint"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_elementID, CFSTR("_elementID"));

}

- (_GEOAnchorPointListElement)initWithCoder:(id)a3
{
  id v4;
  _GEOAnchorPointListElement *v5;
  uint64_t v6;
  GEOComposedRouteAnchorPoint *anchorPoint;
  uint64_t v8;
  NSUUID *elementID;
  _GEOAnchorPointListElement *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GEOAnchorPointListElement;
  v5 = -[_GEOAnchorPointListElement init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_anchorPoint"));
    v6 = objc_claimAutoreleasedReturnValue();
    anchorPoint = v5->_anchorPoint;
    v5->_anchorPoint = (GEOComposedRouteAnchorPoint *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_elementID"));
    v8 = objc_claimAutoreleasedReturnValue();
    elementID = v5->_elementID;
    v5->_elementID = (NSUUID *)v8;

    v10 = v5;
  }

  return v5;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOComposedRouteAnchorPoint locationCoordinate](self->_anchorPoint, "locationCoordinate");
  v5 = v4;
  -[GEOComposedRouteAnchorPoint locationCoordinate](self->_anchorPoint, "locationCoordinate");
  v7 = v6;
  -[NSUUID UUIDString](self->_elementID, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%f, %f | %@ | Conjunct elements: %d"), v5, v7, v8, -[NSMutableSet count](self->_conjunctElements, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setAnchorPoint:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void)setConjunctElements:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conjunctElements, 0);
  objc_storeStrong((id *)&self->_elementID, 0);
  objc_storeStrong((id *)&self->_anchorPoint, 0);
}

@end
