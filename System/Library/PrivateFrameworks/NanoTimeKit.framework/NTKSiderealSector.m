@implementation NTKSiderealSector

- (NTKSiderealSector)initWithStartingEvent:(id)a3 endingEvent:(id)a4
{
  id v7;
  id v8;
  NTKSiderealSector *v9;
  NTKSiderealSector *v10;
  unint64_t v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKSiderealSector;
  v9 = -[NTKSiderealSector init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startingEvent, a3);
    objc_storeStrong((id *)&v10->_endingEvent, a4);
    v11 = objc_msgSend(v7, "type");
    if (v11 <= 9)
      v10->_type = qword_1B7560048[v11];
  }

  return v10;
}

- (NTKSiderealSector)initWithCoder:(id)a3
{
  id v4;
  NTKSiderealSector *v5;
  void *v6;
  uint64_t v7;
  NTKSiderealSolarEvent *startingEvent;
  uint64_t v9;
  NTKSiderealSolarEvent *endingEvent;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NTKSiderealSector;
  v5 = -[NTKSiderealSector init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startingEvent"));
    v7 = objc_claimAutoreleasedReturnValue();
    startingEvent = v5->_startingEvent;
    v5->_startingEvent = (NTKSiderealSolarEvent *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endingEvent"));
    v9 = objc_claimAutoreleasedReturnValue();
    endingEvent = v5->_endingEvent;
    v5->_endingEvent = (NTKSiderealSolarEvent *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gradientStartPoint.x"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v23 = v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gradientStartPoint.y"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v22 = v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gradientEndPoint.x"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v21 = v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gradientEndPoint.y"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    v20 = v18;

    *(_QWORD *)v5->_gradientStartPoint = __PAIR64__(v22, v23);
    *(_QWORD *)v5->_gradientEndPoint = __PAIR64__(v20, v21);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t type;
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  type = self->_type;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("type"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_startingEvent, CFSTR("startingEvent"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_endingEvent, CFSTR("endingEvent"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)self->_gradientStartPoint);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("gradientStartPoint.x"));

  LODWORD(v9) = *(_DWORD *)&self->_gradientStartPoint[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("gradientStartPoint.y"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)self->_gradientEndPoint);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("gradientEndPoint.x"));

  LODWORD(v12) = *(_DWORD *)&self->_gradientEndPoint[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v13, CFSTR("gradientEndPoint.y"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NTKSiderealSector localizedName](self, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSiderealSolarEvent angle](self->_startingEvent, "angle");
  v6 = v5;
  -[NTKSiderealSolarEvent angle](self->_endingEvent, "angle");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SiderealSector: %@ %f %f"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)localizedName
{
  NSString *localizedName;
  NSString **p_localizedName;
  __CFString *v4;
  void *v5;
  void *v6;
  const __CFString *v7;

  p_localizedName = &self->_localizedName;
  localizedName = self->_localizedName;
  if (localizedName)
  {
    v4 = localizedName;
  }
  else
  {
    switch(self->_type)
    {
      case 0uLL:
        NTKBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("SOLAR_DAYTIME");
        goto LABEL_13;
      case 1uLL:
        NTKBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("SOLAR_TWILIGHT_CIVIL_DAWN");
        goto LABEL_13;
      case 2uLL:
        NTKBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("SOLAR_TWILIGHT_CIVIL_DUSK");
        goto LABEL_13;
      case 3uLL:
        NTKBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("SOLAR_TWILIGHT_NAUTICAL_DAWN");
        goto LABEL_13;
      case 4uLL:
        NTKBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("SOLAR_TWILIGHT_NAUTICAL_DUSK");
        goto LABEL_13;
      case 5uLL:
        NTKBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("SOLAR_TWILIGHT_ASTRONOMICAL_DAWN");
        goto LABEL_13;
      case 6uLL:
        NTKBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("SOLAR_TWILIGHT_ASTRONOMICAL_DUSK");
        goto LABEL_13;
      case 7uLL:
        NTKBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("SOLAR_NIGHTTIME");
LABEL_13:
        objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E6BDC918, CFSTR("Sidereal"));
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        v4 = &stru_1E6BDC918;
        break;
    }
    objc_storeStrong((id *)p_localizedName, v4);
  }
  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NTKSiderealSolarEvent)startingEvent
{
  return self->_startingEvent;
}

- (void)setStartingEvent:(id)a3
{
  objc_storeStrong((id *)&self->_startingEvent, a3);
}

- (NTKSiderealSolarEvent)endingEvent
{
  return self->_endingEvent;
}

- (void)setEndingEvent:(id)a3
{
  objc_storeStrong((id *)&self->_endingEvent, a3);
}

- (double)gradientStartPoint
{
  return *(double *)(a1 + 40);
}

- (void)setGradientStartPoint:(NTKSiderealSector *)self
{
  uint64_t v2;

  *(_QWORD *)self->_gradientStartPoint = v2;
}

- (double)gradientEndPoint
{
  return *(double *)(a1 + 48);
}

- (void)setGradientEndPoint:(NTKSiderealSector *)self
{
  uint64_t v2;

  *(_QWORD *)self->_gradientEndPoint = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endingEvent, 0);
  objc_storeStrong((id *)&self->_startingEvent, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
