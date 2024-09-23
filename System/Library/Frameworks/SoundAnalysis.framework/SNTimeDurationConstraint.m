@implementation SNTimeDurationConstraint

- (SNTimeDurationConstraint)initWithImpl:(id)a3
{
  id v5;
  SNTimeDurationConstraint *v6;
  SNTimeDurationConstraint *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNTimeDurationConstraint;
  v6 = -[SNTimeDurationConstraint init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_impl, a3);

  return v7;
}

- (SNTimeDurationConstraint)initWithEnumeratedDurations:(NSArray *)enumeratedDurations
{
  NSArray *v4;
  SNTimeDurationConstraint *v5;
  _SNTimeDurationConstraint *v6;
  _SNTimeDurationConstraint *impl;
  objc_super v9;

  v4 = enumeratedDurations;
  v9.receiver = self;
  v9.super_class = (Class)SNTimeDurationConstraint;
  v5 = -[SNTimeDurationConstraint init](&v9, sel_init);
  if (v5)
  {
    v6 = -[_SNTimeDurationConstraint initWithEnumeratedDurations:]([_SNTimeDurationConstraint alloc], "initWithEnumeratedDurations:", v4);
    impl = v5->_impl;
    v5->_impl = v6;

    if (!v5->_impl)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (SNTimeDurationConstraint)initWithDurationRange:(CMTimeRange *)durationRange
{
  SNTimeDurationConstraint *v4;
  _SNTimeDurationConstraint *v5;
  __int128 v6;
  uint64_t v7;
  _SNTimeDurationConstraint *impl;
  _OWORD v10[3];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SNTimeDurationConstraint;
  v4 = -[SNTimeDurationConstraint init](&v11, sel_init);
  if (v4)
  {
    v5 = [_SNTimeDurationConstraint alloc];
    v6 = *(_OWORD *)&durationRange->start.epoch;
    v10[0] = *(_OWORD *)&durationRange->start.value;
    v10[1] = v6;
    v10[2] = *(_OWORD *)&durationRange->duration.timescale;
    v7 = -[_SNTimeDurationConstraint initWithDurationRange:](v5, "initWithDurationRange:", v10);
    impl = v4->_impl;
    v4->_impl = (_SNTimeDurationConstraint *)v7;

    if (!v4->_impl)
    {

      return 0;
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SNTimeDurationConstraint *v4;
  SNTimeDurationConstraint *v5;
  BOOL v6;

  v4 = (SNTimeDurationConstraint *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[_SNTimeDurationConstraint isEqual:](self->_impl, "isEqual:", v5->_impl);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[_SNTimeDurationConstraint copyWithZone:](self->_impl, "copyWithZone:", a3);
  v7 = (void *)objc_msgSend(v5, "initWithImpl:", v6);

  return v7;
}

- (unint64_t)hash
{
  return MEMORY[0x1E0DE7D20](self->_impl, sel_hash);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SNTimeDurationConstraint)initWithCoder:(id)a3
{
  id v4;
  SNTimeDurationConstraint *v5;
  SNTimeDurationConstraint *v6;
  _SNTimeDurationConstraint *v7;
  _SNTimeDurationConstraint *impl;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SNTimeDurationConstraint;
  v5 = -[SNTimeDurationConstraint init](&v10, sel_init);
  v6 = v5;
  if (!v4
    || v5
    && (v7 = -[_SNTimeDurationConstraint initWithCoder:]([_SNTimeDurationConstraint alloc], "initWithCoder:", v4), impl = v6->_impl, v6->_impl = v7, impl, !v6->_impl))
  {

    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (a3)
    MEMORY[0x1E0DE7D20](self->_impl, sel_encodeWithCoder_);
}

- (SNTimeDurationConstraintType)type
{
  return -[_SNTimeDurationConstraint type](self->_impl, "type");
}

- (NSArray)enumeratedDurations
{
  return (NSArray *)MEMORY[0x1E0DE7D20](self->_impl, sel_enumeratedDurations);
}

- (CMTimeRange)durationRange
{
  CMTimeRange *result;

  result = (CMTimeRange *)self->_impl;
  if (result)
    return (CMTimeRange *)MEMORY[0x1E0DE7D20](result, sel_durationRange);
  *(_OWORD *)&retstr->start.epoch = 0u;
  *(_OWORD *)&retstr->duration.timescale = 0u;
  *(_OWORD *)&retstr->start.value = 0u;
  return result;
}

- (id)impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
