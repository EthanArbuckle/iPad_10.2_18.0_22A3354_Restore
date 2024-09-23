@implementation GESSAlgReport

- (GESSAlgReport)init
{
  GESSAlgReport *v2;
  GESSAlgReport *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GESSAlgReport;
  v2 = -[GESSAlgReport init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[GESSAlgReport setSuccess:](v2, "setSuccess:", 0);
  return v3;
}

- (BOOL)success
{
  return self->success;
}

- (void)setSuccess:(BOOL)a3
{
  self->success = a3;
}

@end
