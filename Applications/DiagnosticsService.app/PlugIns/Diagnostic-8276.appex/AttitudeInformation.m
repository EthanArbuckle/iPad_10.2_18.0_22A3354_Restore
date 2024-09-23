@implementation AttitudeInformation

- (id)init:(id)a3
{
  id v4;
  AttitudeInformation *v5;
  AttitudeInformation *v6;
  AttitudeInformation *v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AttitudeInformation;
  v5 = -[AttitudeInformation init](&v12, "init");
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
  {
    objc_msgSend(v4, "pitch");
    v6->information[0] = v8;
    objc_msgSend(v4, "roll");
    v6->information[1] = v9;
    objc_msgSend(v4, "yaw");
    v6->information[2] = v10;
    v7 = v6;
  }

  return v7;
}

- (AttitudeInformation)init
{
  AttitudeInformation *v2;
  AttitudeInformation *v3;
  AttitudeInformation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AttitudeInformation;
  v2 = -[AttitudeInformation init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)subtract:(id)a3
{
  char *v4;
  AttitudeInformation *v5;
  AttitudeInformation *v6;
  uint64_t i;

  v4 = (char *)a3;
  v5 = objc_opt_new(AttitudeInformation);
  v6 = v5;
  for (i = 8; i != 32; i += 8)
    *(double *)((char *)&v5->super.isa + i) = *(double *)((char *)&self->super.isa + i) - *(double *)&v4[i];

  return v6;
}

- (double)l2Norm
{
  double v2;
  uint64_t i;

  v2 = 0.0;
  for (i = 8; i != 32; i += 8)
    v2 = v2 + *(double *)((char *)&self->super.isa + i) * *(double *)((char *)&self->super.isa + i);
  return sqrt(v2);
}

@end
