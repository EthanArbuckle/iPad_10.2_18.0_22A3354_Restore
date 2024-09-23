@implementation GEOComposedGeometryRoute

- (BOOL)isNavigable
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GEOComposedRoute persistentData](self, "persistentData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("persistentData"));

}

- (GEOComposedGeometryRoute)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  GEORouteBuilder_PersistentData *v6;
  GEOComposedGeometryRoute *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persistentData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEORouteBuilder_PersistentData initWithPersistentData:]([GEORouteBuilder_PersistentData alloc], "initWithPersistentData:", v5);
  -[GEORouteBuilderBase buildRoute](v6, "buildRoute");
  v7 = (GEOComposedGeometryRoute *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)initSingleLegRouteWithCoordinates:(id *)a3 count:(unint64_t)a4
{
  uint64_t v6;
  double *p_var2;
  double v8;
  double v9;
  double v10;
  int *v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  uint64_t v17;
  google::protobuf::internal::ArenaImpl *v18;
  int v19;
  int v20;
  int v21;
  int v23;
  void *v24;
  void *v25;
  GEORawRouteGeometry *v26;
  void *v27;
  GEORawRouteGeometry *v28;
  void *v29;
  GEOComposedGeometryRoute *v31;
  _BYTE v32[24];
  google::protobuf::internal::ArenaImpl *v33;
  int v34;
  int v35;
  int *v36;
  _QWORD v37[2];

  v31 = self;
  v37[1] = *MEMORY[0x1E0C80C00];
  maps::path_codec::geo3::RoutingPathLeg::RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)v32, 0);
  if (a4)
  {
    v6 = 0;
    p_var2 = &a3->var2;
    while (1)
    {
      v9 = *(p_var2 - 2);
      v8 = *(p_var2 - 1);
      v10 = *p_var2;
      v11 = v36;
      if (!v36)
        break;
      v12 = v34;
      v13 = *v36;
      if (v34 >= *v36)
      {
        if (v13 == v35)
        {
LABEL_8:
          if (v12 <= v13)
          {
            google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)&v33, v13 - v12 + 1);
            v11 = v36;
          }
          v13 = *v11;
        }
        *v11 = v13 + 1;
        v14 = google::protobuf::Arena::CreateMaybeMessage<maps::path_codec::geo3::RoutingPathPoint>(v33);
        v15 = v34++;
        *(_QWORD *)&v36[2 * v15 + 2] = v14;
        goto LABEL_12;
      }
      ++v34;
      v14 = *(_QWORD *)&v36[2 * v12 + 2];
LABEL_12:
      *(_DWORD *)(v14 + 16) |= 2u;
      v16 = *(_DWORD **)(v14 + 32);
      if (!v16)
      {
        v17 = *(_QWORD *)(v14 + 8);
        v18 = (google::protobuf::internal::ArenaImpl *)(v17 & 0xFFFFFFFFFFFFFFFELL);
        if ((v17 & 1) != 0)
          v18 = *(google::protobuf::internal::ArenaImpl **)v18;
        v16 = google::protobuf::Arena::CreateMaybeMessage<maps::path_codec::geo3::LatLngE7>(v18);
        *(_QWORD *)(v14 + 32) = v16;
      }
      v19 = +[GEOLatLngE7 toE7Coordinate:](GEOLatLngE7, "toE7Coordinate:", v9, v31);
      v16[4] |= 1u;
      v16[6] = v19;
      v20 = +[GEOLatLngE7 toE7Coordinate:](GEOLatLngE7, "toE7Coordinate:", v8);
      v16[4] |= 2u;
      v16[7] = v20;
      v21 = *(_DWORD *)(v14 + 16);
      *(_DWORD *)(v14 + 56) = (int)(v10 * 100.0);
      if (a4 - 1 == v6 || v6 == 0)
        v23 = 1;
      else
        v23 = 2;
      *(_DWORD *)(v14 + 16) = v21 | 0x810;
      *(_DWORD *)(v14 + 84) = v23;
      ++v6;
      p_var2 += 3;
      if (a4 == v6)
        goto LABEL_23;
    }
    v12 = v34;
    v13 = v35;
    goto LABEL_8;
  }
LABEL_23:
  +[PathCodec dataForRoutingPathLeg:]((uint64_t)PathCodec, (google::protobuf::MessageLite *)v32);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setTransportType:", 0);
  v26 = [GEORawRouteGeometry alloc];
  v37[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[GEORawRouteGeometry initWithRawData:](v26, "initWithRawData:", v27);
  objc_msgSend(v25, "setRawRouteGeometry:", v28);

  objc_msgSend(v25, "buildRoute");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  maps::path_codec::geo3::RoutingPathLeg::~RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)v32);
  return v29;
}

@end
