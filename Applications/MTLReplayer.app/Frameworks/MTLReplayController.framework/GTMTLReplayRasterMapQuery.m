@implementation GTMTLReplayRasterMapQuery

- (GTMTLReplayRasterMapQuery)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  GTMTLReplayRasterMapQuery *v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;
  uint64_t v16;
  NSArray *layers;
  GTMTLReplayRasterMapQuery *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GTMTLReplayRasterMapQuery;
  v6 = -[GTMTLReplayRasterMapQuery init](&v20, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSData, v5);
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(NSError, v8), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v6->_physicalGranularity.width = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("physicalGranularity.width"));
    v6->_physicalGranularity.height = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("physicalGranularity.height"));
    v6->_physicalGranularity.depth = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("physicalGranularity.depth"));
    v12 = objc_opt_class(NSArray, v11);
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(GTMTLReplayRasterMapLayerQuery, v13), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("layers")));
    layers = v6->_layers;
    v6->_layers = (NSArray *)v16;

    v18 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t width;
  id v5;

  width = self->_physicalGranularity.width;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", width, CFSTR("physicalGranularity.width"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_physicalGranularity.height, CFSTR("physicalGranularity.height"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_physicalGranularity.depth, CFSTR("physicalGranularity.depth"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_layers, CFSTR("layers"));

}

- (GTSize)physicalGranularity
{
  *retstr = *(GTSize *)&self->depth;
  return self;
}

- (void)setPhysicalGranularity:(GTSize *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->width;
  self->_physicalGranularity.depth = a3->depth;
  *(_OWORD *)&self->_physicalGranularity.width = v3;
}

- (NSArray)layers
{
  return self->_layers;
}

- (void)setLayers:(id)a3
{
  objc_storeStrong((id *)&self->_layers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
