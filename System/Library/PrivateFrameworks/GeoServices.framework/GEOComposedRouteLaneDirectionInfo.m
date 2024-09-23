@implementation GEOComposedRouteLaneDirectionInfo

- (GEOComposedRouteLaneDirectionInfo)initWithLaneArrowHead:(id)a3
{
  id v4;
  GEOComposedRouteLaneDirectionInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOComposedRouteLaneDirectionInfo;
  v5 = -[GEOComposedRouteLaneDirectionInfo init](&v7, sel_init);
  if (v5)
  {
    v5->_direction = objc_msgSend(v4, "category");
    v5->_angle = (float)(int)objc_msgSend(v4, "angle");
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteLaneDirectionInfo)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteLaneDirectionInfo *v5;
  id v6;
  const void *v7;
  size_t v8;
  double v9;
  unint64_t v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedRouteLaneDirectionInfo;
  v5 = -[GEOComposedRouteLaneDirectionInfo init](&v12, sel_init);
  if (v5)
  {
    v11 = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("_direction"), &v11);
    if (v11 && v7)
    {
      if (v11 >= 4)
        v8 = 4;
      else
        v8 = v11;
      memcpy(&v5->_direction, v7, v8);
    }
    objc_msgSend(v6, "decodeDoubleForKey:", CFSTR("_angle"));
    *(float *)&v9 = v9;
    v5->_angle = *(float *)&v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBytes:length:forKey:", &self->_direction, 4, CFSTR("_direction"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_angle"), self->_angle);

}

- (int)direction
{
  return self->_direction;
}

- (float)angle
{
  return self->_angle;
}

- (unint64_t)hash
{
  return -[GEOComposedRouteLaneDirectionInfo direction](self, "direction");
}

- (BOOL)isEqual:(id)a3
{
  GEOComposedRouteLaneDirectionInfo *v4;
  GEOComposedRouteLaneDirectionInfo *v5;
  int v6;
  float v7;
  float v8;
  float v9;
  BOOL v10;

  v4 = (GEOComposedRouteLaneDirectionInfo *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[GEOComposedRouteLaneDirectionInfo direction](v5, "direction");
      if (v6 == -[GEOComposedRouteLaneDirectionInfo direction](self, "direction"))
      {
        -[GEOComposedRouteLaneDirectionInfo angle](v5, "angle");
        v8 = v7;
        -[GEOComposedRouteLaneDirectionInfo angle](self, "angle");
        v10 = vabds_f32(v8, v9) <= 0.00000011921;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

@end
