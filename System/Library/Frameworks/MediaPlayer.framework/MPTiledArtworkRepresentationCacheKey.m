@implementation MPTiledArtworkRepresentationCacheKey

- (MPTiledArtworkRepresentationCacheKey)init
{
  return -[MPTiledArtworkRepresentationCacheKey initWithTiledArtworkRequest:scaledFittingSize:](self, "initWithTiledArtworkRequest:scaledFittingSize:", 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (MPTiledArtworkRepresentationCacheKey)initWithTiledArtworkRequest:(id)a3 scaledFittingSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  MPTiledArtworkRepresentationCacheKey *v8;
  uint64_t v9;
  id entityIdentifier;
  uint64_t v11;
  id namespaceIdentifier;
  uint64_t v13;
  id revisionIdentifier;
  double v15;
  objc_super v17;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MPTiledArtworkRepresentationCacheKey;
  v8 = -[MPTiledArtworkRepresentationCacheKey init](&v17, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "entityIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    entityIdentifier = v8->_entityIdentifier;
    v8->_entityIdentifier = (id)v9;

    objc_msgSend(v7, "namespaceIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    namespaceIdentifier = v8->_namespaceIdentifier;
    v8->_namespaceIdentifier = (id)v11;

    v8->_numberOfColumns = objc_msgSend(v7, "numberOfColumns");
    v8->_numberOfRows = objc_msgSend(v7, "numberOfRows");
    objc_msgSend(v7, "revisionIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    revisionIdentifier = v8->_revisionIdentifier;
    v8->_revisionIdentifier = (id)v13;

    objc_msgSend(v7, "tileSpacing");
    v8->_scaledFittingSize.height = height;
    v8->_tileSpacing = v15;
    v8->_scaledFittingSize.width = width;
  }

  return v8;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  if (self->_entityIdentifier)
  {
    if (self->_namespaceIdentifier)
    {
      objc_msgSend(v6, "appendFormat:", CFSTR("; entityIdentifier = %@"), self->_entityIdentifier);
      objc_msgSend(v6, "appendFormat:", CFSTR("; namespaceIdentifier = %@"), self->_namespaceIdentifier);
      if (self->_revisionIdentifier)
        objc_msgSend(v6, "appendFormat:", CFSTR("; revisionIdentifier = %@"), self->_revisionIdentifier);
    }
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("; numberOfColumns = %lu"), self->_numberOfColumns);
  objc_msgSend(v6, "appendFormat:", CFSTR("; numberOfRows = %lu"), self->_numberOfRows);
  objc_msgSend(v6, "appendFormat:", CFSTR("; tileSpacing = %.2f"), *(_QWORD *)&self->_tileSpacing);
  NSStringFromCGSize(self->_scaledFittingSize);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("; scaledFittingSize = %@"), v7);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  v3 = objc_msgSend(self->_entityIdentifier, "hash");
  v4 = objc_msgSend(self->_namespaceIdentifier, "hash")
     + v3
     + 100 * self->_numberOfColumns
     + 10000 * self->_numberOfRows;
  return v4
       + objc_msgSend(self->_revisionIdentifier, "hash")
       + vcvtmd_u64_f64(self->_scaledFittingSize.width * 100.0)
       + vcvtmd_u64_f64(self->_scaledFittingSize.height * 100.0)
       + vcvtmd_u64_f64(self->_tileSpacing * 100.0);
}

- (BOOL)isEqual:(id)a3
{
  MPTiledArtworkRepresentationCacheKey *v4;
  MPTiledArtworkRepresentationCacheKey *v5;
  id entityIdentifier;
  id namespaceIdentifier;
  id revisionIdentifier;
  BOOL v9;

  v4 = (MPTiledArtworkRepresentationCacheKey *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      entityIdentifier = self->_entityIdentifier;
      v9 = (entityIdentifier == v5->_entityIdentifier || objc_msgSend(entityIdentifier, "isEqual:"))
        && ((namespaceIdentifier = self->_namespaceIdentifier, namespaceIdentifier == v5->_namespaceIdentifier)
         || objc_msgSend(namespaceIdentifier, "isEqual:"))
        && self->_numberOfColumns == v5->_numberOfColumns
        && self->_numberOfRows == v5->_numberOfRows
        && ((revisionIdentifier = self->_revisionIdentifier, revisionIdentifier == v5->_revisionIdentifier)
         || objc_msgSend(revisionIdentifier, "isEqual:"))
        && vabdd_f64(self->_scaledFittingSize.width, v5->_scaledFittingSize.width) < 0.00000011920929
        && vabdd_f64(self->_scaledFittingSize.height, v5->_scaledFittingSize.height) < 0.00000011920929
        && vabdd_f64(self->_tileSpacing, v5->_tileSpacing) < 0.00000011920929;

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)stringRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lx"), -[MPTiledArtworkRepresentationCacheKey hash](self, "hash"));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_revisionIdentifier, 0);
  objc_storeStrong(&self->_namespaceIdentifier, 0);
  objc_storeStrong(&self->_entityIdentifier, 0);
}

@end
