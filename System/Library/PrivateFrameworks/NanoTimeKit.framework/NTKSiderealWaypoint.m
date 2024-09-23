@implementation NTKSiderealWaypoint

+ (id)waypointFromSolarEvent:(id)a3
{
  id v3;
  int64_t v4;
  double v5;
  double v6;

  v3 = a3;
  v4 = +[NTKSiderealWaypoint _waypointTypeFromSolarEventType:](NTKSiderealWaypoint, "_waypointTypeFromSolarEventType:", objc_msgSend(v3, "type"));
  objc_msgSend(v3, "degree");
  v6 = v5;

  return +[NTKSiderealWaypoint waypointWithType:degree:](NTKSiderealWaypoint, "waypointWithType:degree:", v4, v6);
}

+ (id)waypointWithType:(int64_t)a3 degree:(double)a4
{
  return -[NTKSiderealWaypoint initWithType:degree:]([NTKSiderealWaypoint alloc], "initWithType:degree:", a3, a4);
}

- (NTKSiderealWaypoint)initWithType:(int64_t)a3 degree:(double)a4
{
  NTKSiderealWaypoint *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKSiderealWaypoint;
  result = -[NTKSiderealWaypoint init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_degree = a4;
  }
  return result;
}

- (NTKSiderealWaypoint)initWithCoder:(id)a3
{
  id v4;
  NTKSiderealWaypoint *v5;
  void *v6;
  void *v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKSiderealWaypoint;
  v5 = -[NTKSiderealWaypoint init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("degree"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v5->_degree = v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t type;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  type = self->_type;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_degree);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("degree"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type: %ld degree: %f°"), self->_type, *(_QWORD *)&self->_degree);
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type: %ld degree: %f°"), self->_type, *(_QWORD *)&self->_degree);
}

- (id)localizedName
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  switch(self->_type)
  {
    case 0:
      NTKBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SOLAR_NOON");
      goto LABEL_13;
    case 1:
      NTKBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SOLAR_SOLAR_MIDNIGHT");
      goto LABEL_13;
    case 2:
      NTKBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SOLAR_SUNRISE");
      goto LABEL_13;
    case 3:
      NTKBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SOLAR_SUNSET");
      goto LABEL_13;
    case 4:
      NTKBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SOLAR_CIVIL_DAWN");
      goto LABEL_13;
    case 5:
      NTKBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SOLAR_CIVIL_DUSK");
      goto LABEL_13;
    case 6:
      NTKBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SOLAR_NAUTICAL_DAWN");
      goto LABEL_13;
    case 7:
      NTKBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SOLAR_NAUTICAL_DUSK");
      goto LABEL_13;
    case 8:
      NTKBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SOLAR_ASTRONOMICAL_DAWN");
      goto LABEL_13;
    case 9:
      NTKBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      v4 = CFSTR("SOLAR_ASTRONOMICAL_DUSK");
LABEL_13:
      objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_1E6BDC918, CFSTR("Sidereal"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

+ (int64_t)_waypointTypeFromSolarEventType:(int64_t)a3
{
  if ((unint64_t)a3 > 9)
    return 0;
  else
    return qword_1B755E990[a3];
}

- (double)degree
{
  return self->_degree;
}

- (void)setDegree:(double)a3
{
  self->_degree = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end
