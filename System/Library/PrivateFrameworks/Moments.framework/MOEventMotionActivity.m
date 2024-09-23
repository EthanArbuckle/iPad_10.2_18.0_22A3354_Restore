@implementation MOEventMotionActivity

+ (id)descriptionOfMotionType:(unint64_t)a3
{
  if (a3 > 6)
    return CFSTR("Invalid");
  else
    return off_1E85428F8[a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *motionStepCount;
  id v5;

  motionStepCount = self->_motionStepCount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", motionStepCount, CFSTR("motionStepCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_motionType, CFSTR("motionType"));
  -[NSNumber doubleValue](self->_motionDistance, "doubleValue");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("motionDistance"));

}

- (MOEventMotionActivity)initWithCoder:(id)a3
{
  id v4;
  MOEventMotionActivity *v5;
  uint64_t v6;
  NSNumber *motionStepCount;
  void *v8;
  uint64_t v9;
  NSNumber *motionDistance;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MOEventMotionActivity;
  v5 = -[MOEventMotionActivity init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("motionStepCount"));
    v6 = objc_claimAutoreleasedReturnValue();
    motionStepCount = v5->_motionStepCount;
    v5->_motionStepCount = (NSNumber *)v6;

    v5->_motionType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("motionType"));
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("motionDistance"));
    objc_msgSend(v8, "numberWithDouble:");
    v9 = objc_claimAutoreleasedReturnValue();
    motionDistance = v5->_motionDistance;
    v5->_motionDistance = (NSNumber *)v9;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventMotionActivity *v4;

  v4 = objc_alloc_init(MOEventMotionActivity);
  v4->_motionType = self->_motionType;
  objc_storeStrong((id *)&v4->_motionStepCount, self->_motionStepCount);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[MOEventMotionActivity descriptionOfMotionType:](MOEventMotionActivity, "descriptionOfMotionType:", -[MOEventMotionActivity motionType](self, "motionType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("motion type, %@"), v4);

  return v5;
}

- (unint64_t)motionType
{
  return self->_motionType;
}

- (void)setMotionType:(unint64_t)a3
{
  self->_motionType = a3;
}

- (NSNumber)motionStepCount
{
  return self->_motionStepCount;
}

- (void)setMotionStepCount:(id)a3
{
  objc_storeStrong((id *)&self->_motionStepCount, a3);
}

- (NSNumber)motionDistance
{
  return self->_motionDistance;
}

- (void)setMotionDistance:(id)a3
{
  objc_storeStrong((id *)&self->_motionDistance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionDistance, 0);
  objc_storeStrong((id *)&self->_motionStepCount, 0);
}

@end
