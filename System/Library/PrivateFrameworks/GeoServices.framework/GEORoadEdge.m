@implementation GEORoadEdge

- (id)init:(GeoCodecsRoadEdge *)a3 withMultiSectionFeatureInterface:(id)a4
{
  id v7;
  char *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  GEORoadEdge *v13;
  objc_super v15;

  v7 = a4;
  if (a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)GEORoadEdge;
    v8 = -[GEORoadEdge init](&v15, sel_init);
    v9 = v8;
    if (v8)
    {
      v10 = *(_OWORD *)&a3->road;
      v11 = *(_OWORD *)&a3->vertexIndexB;
      v12 = *(_OWORD *)&a3->junctionIndexB;
      *((_QWORD *)v8 + 7) = a3->junctionB;
      *(_OWORD *)(v8 + 40) = v12;
      *(_OWORD *)(v8 + 24) = v11;
      *(_OWORD *)(v8 + 8) = v10;
      objc_storeStrong((id *)v8 + 8, a4);
    }
    self = v9;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)setMultiSectionFeature:(id)a3
{
  objc_storeStrong((id *)&self->_feature, a3);
}

- (GeoCodecsRoadEdge)get
{
  return &self->_edge;
}

- (GEOMultiSectionFeature)road
{
  return self->_feature;
}

- (unint64_t)vertexIndexA
{
  return self->_edge.vertexIndexA;
}

- (unint64_t)vertexIndexB
{
  return self->_edge.vertexIndexB;
}

- (unint64_t)junctionIndexA
{
  return self->_edge.junctionIndexA;
}

- (unint64_t)junctionIndexB
{
  return self->_edge.junctionIndexB;
}

- (GeoCodecsConnectivityJunction)junctionA
{
  return self->_edge.junctionA;
}

- (GeoCodecsConnectivityJunction)junctionB
{
  return self->_edge.junctionB;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  GeoCodecsRoadEdge *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  void *v10;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[GEORoadEdge get](self, "get");
    v6 = *(_OWORD *)&v5->road;
    v7 = *(_OWORD *)&v5->vertexIndexB;
    v8 = *(_OWORD *)&v5->junctionIndexB;
    *(_QWORD *)(v4 + 56) = v5->junctionB;
    *(_OWORD *)(v4 + 40) = v8;
    *(_OWORD *)(v4 + 24) = v7;
    *(_OWORD *)(v4 + 8) = v6;
    -[GEORoadEdge road](self, "road");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = v9;

  }
  return (id)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
}

@end
