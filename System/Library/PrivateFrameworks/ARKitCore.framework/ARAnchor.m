@implementation ARAnchor

- (ARAnchor)initWithTransform:(simd_float4x4)transform
{
  ARAnchor *v3;
  void *v4;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v8 = *(double *)transform.columns[2].i64;
  v9 = *(double *)transform.columns[3].i64;
  v6 = *(double *)transform.columns[0].i64;
  v7 = *(double *)transform.columns[1].i64;
  v10.receiver = self;
  v10.super_class = (Class)ARAnchor;
  v3 = -[ARAnchor init](&v10, sel_init);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARAnchor _commonInit:transform:name:](v3, "_commonInit:transform:name:", v4, 0, v6, v7, v8, v9);

  }
  return v3;
}

- (ARAnchor)initWithIdentifier:(double)a3 transform:(double)a4 name:(double)a5
{
  id v10;
  id v11;
  ARAnchor *v12;
  void *v13;
  objc_super v19;

  v10 = a7;
  v11 = a8;
  v19.receiver = a1;
  v19.super_class = (Class)ARAnchor;
  v12 = -[ARAnchor init](&v19, sel_init);
  if (v12)
  {
    v13 = (void *)objc_msgSend(v11, "copy");
    -[ARAnchor _commonInit:transform:name:](v12, "_commonInit:transform:name:", v10, v13, a2, a3, a4, a5);

  }
  return v12;
}

- (ARAnchor)initWithIdentifier:(double)a3 transform:(double)a4 name:(double)a5 hiddenFromPublicDelegate:(uint64_t)a6
{
  id v12;
  id v13;
  ARAnchor *v14;
  void *v15;
  objc_super v21;

  v12 = a7;
  v13 = a8;
  v21.receiver = a1;
  v21.super_class = (Class)ARAnchor;
  v14 = -[ARAnchor init](&v21, sel_init);
  if (v14)
  {
    v15 = (void *)objc_msgSend(v13, "copy");
    -[ARAnchor _commonInit:transform:name:](v14, "_commonInit:transform:name:", v12, v15, a2, a3, a4, a5);

    v14->_isHiddenFromPublicDelegate = a9;
  }

  return v14;
}

- (ARAnchor)initWithName:(NSString *)name transform:(simd_float4x4)transform
{
  NSString *v5;
  ARAnchor *v6;
  void *v7;
  void *v8;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v12 = *(double *)transform.columns[2].i64;
  v13 = *(double *)transform.columns[3].i64;
  v10 = *(double *)transform.columns[0].i64;
  v11 = *(double *)transform.columns[1].i64;
  v5 = name;
  v14.receiver = self;
  v14.super_class = (Class)ARAnchor;
  v6 = -[ARAnchor init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)-[NSString copy](v5, "copy");
    -[ARAnchor _commonInit:transform:name:](v6, "_commonInit:transform:name:", v7, v8, v10, v11, v12, v13);

  }
  return v6;
}

- (ARAnchor)initWithIdentifier:(double)a3 transform:(double)a4
{
  id v8;
  ARAnchor *v9;
  void *v10;
  objc_super v16;

  v8 = a7;
  v16.receiver = a1;
  v16.super_class = (Class)ARAnchor;
  v9 = -[ARAnchor init](&v16, sel_init);
  if (v9)
  {
    v10 = (void *)objc_msgSend(v8, "copy");
    -[ARAnchor _commonInit:transform:name:](v9, "_commonInit:transform:name:", v10, 0, a2, a3, a4, a5);

  }
  return v9;
}

- (void)_commonInit:(__n128)a3 transform:(__n128)a4 name:(__n128)a5
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v18;

  v18 = a7;
  v10 = a8;
  if (v18)
  {
    v11 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)a1[1].n128_u64[0];
  a1[1].n128_u64[0] = (unint64_t)v11;

  a1[3] = a2;
  a1[4] = a3;
  a1[5] = a4;
  a1[6] = a5;
  a1[7] = a2;
  a1[8] = a3;
  a1[9] = a4;
  a1[10] = a5;
  v13 = (void *)a1[1].n128_u64[1];
  a1[1].n128_u64[1] = (unint64_t)v10;

  a1->n128_u8[8] = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "ar_encodeMatrix4x4:forKey:", CFSTR("transform"), *(double *)self->_anon_30, *(double *)&self->_anon_30[16], *(double *)&self->_anon_30[32], *(double *)&self->_anon_30[48]);
  objc_msgSend(v5, "ar_encodeMatrix4x4:forKey:", CFSTR("referenceTransform"), *(double *)&self[1].super.isa, *(double *)&self[1]._identifier, *(double *)&self[1]._sessionIdentifier, *(double *)self[1]._anon_30);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("lastUpdateTimestamp"), self->_lastUpdateTimestamp);
  objc_msgSend(v5, "encodeBool:forKey:", self->_isHiddenFromPublicDelegate, CFSTR("isHiddenFromPublicDelegate"));
  name = self->_name;
  if (name)
    objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));

}

- (ARAnchor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  double v14;
  double v15;
  ARAnchor *v16;
  ARAnchor *v17;
  uint64_t v18;
  NSString *name;
  ARAnchor *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("transform"));
    v29 = v6;
    v27 = v8;
    v28 = v7;
    v26 = v9;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("referenceTransform"));
    v24 = v11;
    v25 = v10;
    v22 = v13;
    v23 = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lastUpdateTimestamp"));
    v15 = v14;
    v30.receiver = self;
    v30.super_class = (Class)ARAnchor;
    v16 = -[ARAnchor init](&v30, sel_init);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_identifier, v5);
      *(_OWORD *)v17->_anon_30 = v29;
      *(_OWORD *)&v17->_anon_30[16] = v28;
      *(_OWORD *)&v17->_anon_30[32] = v27;
      *(_OWORD *)&v17->_anon_30[48] = v26;
      *(_OWORD *)&v17[1].super.isa = v25;
      *(_OWORD *)&v17[1]._identifier = v24;
      *(_OWORD *)&v17[1]._sessionIdentifier = v23;
      *(_OWORD *)v17[1]._anon_30 = v22;
      v17->_lastUpdateTimestamp = v15;
      v17->_isHiddenFromPublicDelegate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHiddenFromPublicDelegate"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
      v18 = objc_claimAutoreleasedReturnValue();
      name = v17->_name;
      v17->_name = (NSString *)v18;

    }
    self = v17;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (ARAnchor)initWithAnchor:(id)a3
{
  id v4;
  ARAnchor *v5;
  void *v6;
  uint64_t v7;
  NSUUID *identifier;
  void *v9;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSUUID *sessionIdentifier;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  double v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ARAnchor;
  v5 = -[ARAnchor init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v7;

    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v10;

    objc_msgSend(v4, "sessionIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v12;

    objc_msgSend(v4, "transform");
    *(_OWORD *)v5->_anon_30 = v14;
    *(_OWORD *)&v5->_anon_30[16] = v15;
    *(_OWORD *)&v5->_anon_30[32] = v16;
    *(_OWORD *)&v5->_anon_30[48] = v17;
    objc_msgSend(v4, "referenceTransform");
    *(_OWORD *)&v5[1].super.isa = v18;
    *(_OWORD *)&v5[1]._identifier = v19;
    *(_OWORD *)&v5[1]._sessionIdentifier = v20;
    *(_OWORD *)v5[1]._anon_30 = v21;
    objc_msgSend(v4, "lastUpdateTimestamp");
    v5->_lastUpdateTimestamp = v22;
    v5->_isHiddenFromPublicDelegate = objc_msgSend(v4, "isHiddenFromPublicDelegate");
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAnchor:", self);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ARAnchor identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ARAnchor;
  if (-[ARAnchor isEqual:](&v7, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[ARAnchor isEqualToAnchor:](self, "isEqualToAnchor:", v4);
  }

  return v5;
}

- (BOOL)isEqualToAnchor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ARAnchor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (id)_description:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  void *v21;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB37A0];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p"), v7, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARAnchor identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR(" identifier=\"%@\"), v9);

  -[ARAnchor sessionIdentifier](self, "sessionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ARAnchor sessionIdentifier](self, "sessionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(" sessionIdentifier=\"%@\"), v12);

  }
  -[ARAnchor name](self, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[ARAnchor name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(" name=\"%@\"), v14);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = -[ARAnchor isTracked](self, "isTracked");
    v16 = CFSTR("NO");
    if (v15)
      v16 = CFSTR("YES");
    objc_msgSend(v8, "appendFormat:", CFSTR(" tracked=%@"), v16);
  }
  -[ARAnchor transform](self, "transform");
  ARMatrix4x4Description(v3, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR(" transform=%@"), v21);

  objc_msgSend(v8, "appendString:", CFSTR(">"));
  return v8;
}

- (id)description
{
  return -[ARAnchor _description:](self, "_description:", 0);
}

- (id)debugQuickLookObject
{
  return -[ARAnchor _description:](self, "_description:", 1);
}

- (uint64_t)updateTransformToCoordinateSpace:(float32x4_t)a3 withTimestamp:(float32x4_t)a4
{
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t result;
  _OWORD v18[4];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  objc_msgSend(a1, "transform");
  v8 = 0;
  v18[0] = v9;
  v18[1] = v10;
  v18[2] = v11;
  v18[3] = v12;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  do
  {
    *(__int128 *)((char *)&v19 + v8 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(v18[v8])), a3, *(float32x2_t *)&v18[v8], 1), a4, (float32x4_t)v18[v8], 2), a5, (float32x4_t)v18[v8], 3);
    ++v8;
  }
  while (v8 != 4);
  result = objc_msgSend(a1, "setTransform:", *(double *)&v19, *(double *)&v20, *(double *)&v21, *(double *)&v22);
  if (a6 != 0.0)
    return objc_msgSend(a1, "setLastUpdateTimestamp:", a6);
  return result;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (simd_float4x4)transform
{
  simd_float4 v2;
  simd_float4 v3;
  simd_float4 v4;
  simd_float4 v5;
  simd_float4x4 result;

  v2 = *(simd_float4 *)self->_anon_30;
  v3 = *(simd_float4 *)&self->_anon_30[16];
  v4 = *(simd_float4 *)&self->_anon_30[32];
  v5 = *(simd_float4 *)&self->_anon_30[48];
  result.columns[3] = v5;
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
}

- (__n128)setTransform:(__n128)a3
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  return result;
}

- (__n128)referenceTransform
{
  return a1[7];
}

- (__n128)setReferenceTransform:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  result[10] = a5;
  return result;
}

- (double)lastUpdateTimestamp
{
  return self->_lastUpdateTimestamp;
}

- (void)setLastUpdateTimestamp:(double)a3
{
  self->_lastUpdateTimestamp = a3;
}

- (BOOL)isHiddenFromPublicDelegate
{
  return self->_isHiddenFromPublicDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
