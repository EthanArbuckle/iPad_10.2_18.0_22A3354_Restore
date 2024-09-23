@implementation CLKSimpleProgressProvider

+ (id)simpleProgressProviderWithProgress:(double)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setProgress:", a3);
  return v4;
}

- (double)_progressFractionForNow:(id)a3
{
  return self->_progress;
}

- (BOOL)_needsUpdates
{
  return 0;
}

- (void)_validate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLKSimpleProgressProvider;
  -[CLKProgressProvider _validate](&v2, sel__validate);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKSimpleProgressProvider;
  result = -[CLKProgressProvider copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result != self)
    *((_QWORD *)result + 7) = *(_QWORD *)&self->_progress;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;
  objc_super v7;

  v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKSimpleProgressProvider;
  v5 = -[CLKProgressProvider isEqual:](&v7, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && self->_progress == v4[7];

  return v5;
}

- (unint64_t)hash
{
  double v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKSimpleProgressProvider;
  v3 = (double)-[CLKProgressProvider hash](&v7, sel_hash);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_progress);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)(v3 + (double)(unint64_t)objc_msgSend(v4, "hash") * 100.0);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKSimpleProgressProvider;
  v4 = a3;
  -[CLKProgressProvider encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_progress, v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_progress"));

}

- (CLKSimpleProgressProvider)initWithCoder:(id)a3
{
  id v4;
  CLKSimpleProgressProvider *v5;
  void *v6;
  float v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKSimpleProgressProvider;
  v5 = -[CLKProgressProvider initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_progress"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v5->_progress = v7;

  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKSimpleProgressProvider;
  -[CLKProgressProvider JSONObjectRepresentation](&v6, sel_JSONObjectRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_progress);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("progress"));

  return v3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

@end
