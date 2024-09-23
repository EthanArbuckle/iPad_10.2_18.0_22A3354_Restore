@implementation RTPolygon

- (RTPolygon)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithCentroid_vertices_);
}

- (RTPolygon)initWithVertices:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  RTCoordinate *v15;
  RTPolygon *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[8];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      v9 = 0.0;
      v10 = 0.0;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v12, "latitude", (_QWORD)v18);
          v9 = v9 + v13;
          objc_msgSend(v12, "longitude");
          v10 = v10 + v14;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 0.0;
      v10 = 0.0;
    }

    v15 = -[RTCoordinate initWithLatitude:longitude:]([RTCoordinate alloc], "initWithLatitude:longitude:", v9 / (double)(unint64_t)objc_msgSend(v5, "count"), v10 / (double)(unint64_t)objc_msgSend(v5, "count"));
    self = -[RTPolygon initWithCentroid:vertices:](self, "initWithCentroid:vertices:", v15, v5);
    v16 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = (RTCoordinate *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, &v15->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: vertices.count > 0", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

- (RTPolygon)initWithCentroid:(id)a3 vertices:(id)a4
{
  id v7;
  id v8;
  RTPolygon *v9;
  RTPolygon *v10;
  uint64_t v11;
  NSArray *vertices;
  RTPolygon *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v16.receiver = self;
    v16.super_class = (Class)RTPolygon;
    v9 = -[RTPolygon init](&v16, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_centroid, a3);
      v11 = objc_msgSend(v8, "copy");
      vertices = v10->_vertices;
      v10->_vertices = (NSArray *)v11;

    }
    self = v10;
    v13 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: vertices.count > 0", buf, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("centroid, %@, number of vertices, %lu"), self->_centroid, -[NSArray count](self->_vertices, "count"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  RTCoordinate *centroid;
  id v5;

  centroid = self->_centroid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", centroid, CFSTR("centroid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vertices, CFSTR("vertices"));

}

- (RTPolygon)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  RTPolygon *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("centroid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("vertices"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[RTPolygon initWithCentroid:vertices:](self, "initWithCentroid:vertices:", v5, v9);
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithCentroid:vertices:", self->_centroid, self->_vertices);
}

- (BOOL)isEqualToPolygon:(id)a3
{
  id v4;
  NSUInteger v5;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = -[NSArray count](self->_vertices, "count");
  objc_msgSend(v4, "vertices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 == v7 && (v8 = -[NSArray count](self->_vertices, "count")) != 0)
  {
    v9 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_vertices, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "vertices");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "isEqual:", v12);

      if (v13)
        break;
      if (++v9 >= -[NSArray count](self->_vertices, "count"))
        goto LABEL_6;
    }
    if (-[NSArray count](self->_vertices, "count"))
    {
      v16 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_vertices, "objectAtIndexedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "vertices");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", (v9 + v16) % v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v17, "isEqual:", v19);

        if ((v14 & 1) == 0)
          break;
        ++v16;
      }
      while (v16 < -[NSArray count](self->_vertices, "count"));
    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
LABEL_6:
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  RTPolygon *v4;
  RTPolygon *v5;
  BOOL v6;

  v4 = (RTPolygon *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTPolygon isEqualToPolygon:](self, "isEqualToPolygon:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  -[NSArray objectAtIndexedSubscript:](self->_vertices, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  if (-[NSArray count](self->_vertices, "count") >= 2)
  {
    v5 = 1;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_vertices, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 ^= objc_msgSend(v6, "hash");

      ++v5;
    }
    while (v5 < -[NSArray count](self->_vertices, "count"));
  }
  return v4;
}

- (RTCoordinate)centroid
{
  return self->_centroid;
}

- (NSArray)vertices
{
  return self->_vertices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vertices, 0);
  objc_storeStrong((id *)&self->_centroid, 0);
}

@end
