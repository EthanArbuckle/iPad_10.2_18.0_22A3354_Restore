@implementation VCPFaceAnchor

- (VCPFaceAnchor)initWithTransform:(__n128)a3 blendShapes:(__n128)a4 geometry:(__n128)a5
{
  id v10;
  id v11;
  VCPFaceAnchor *v12;
  VCPFaceAnchor *v13;
  uint64_t v14;
  NSDictionary *blendShapes;
  objc_super v21;

  v10 = a7;
  v11 = a8;
  v21.receiver = a1;
  v21.super_class = (Class)VCPFaceAnchor;
  v12 = -[VCPFaceAnchor init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    *(__n128 *)&v12[1].super.isa = a2;
    *(__n128 *)&v12[1]._geometry = a3;
    *(__n128 *)&v12[2].super.isa = a4;
    *(__n128 *)&v12[2]._geometry = a5;
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v10);
      v14 = objc_claimAutoreleasedReturnValue();
      blendShapes = v13->_blendShapes;
      v13->_blendShapes = (NSDictionary *)v14;

    }
    objc_storeStrong((id *)&v13->_geometry, a8);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  NSDictionary *blendShapes;
  VCPFaceGeometry *geometry;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self[1], 64);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("transform"));

  blendShapes = self->_blendShapes;
  if (blendShapes)
    objc_msgSend(v7, "encodeObject:forKey:", blendShapes, CFSTR("blendshapes"));
  geometry = self->_geometry;
  if (geometry)
    objc_msgSend(v7, "encodeObject:forKey:", geometry, CFSTR("geometry"));

}

- (VCPFaceAnchor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  VCPFaceAnchor *v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transform"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "length") > 0x3F)
  {
    objc_msgSend(v5, "getBytes:length:", &v10, 64);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blendshapes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geometry"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[VCPFaceAnchor initWithTransform:blendShapes:geometry:](self, "initWithTransform:blendShapes:geometry:", v7, v8, *(double *)&v10, *(double *)&v11, *(double *)&v12, *(double *)&v13);

    v6 = self;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPFaceAnchor initWithCoder - unexpected size of transform data", (uint8_t *)&v10, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (__n128)transform
{
  return a1[2];
}

- (NSDictionary)blendShapes
{
  return self->_blendShapes;
}

- (VCPFaceGeometry)geometry
{
  return self->_geometry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_blendShapes, 0);
}

@end
