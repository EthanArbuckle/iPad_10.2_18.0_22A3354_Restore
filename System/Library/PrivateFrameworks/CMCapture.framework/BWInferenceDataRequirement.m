@implementation BWInferenceDataRequirement

- (unint64_t)hash
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  int64_t identifier;

  identifier = self->_identifier;
  return identifier == objc_msgSend(a3, "identifier");
}

- (BWInferenceDataRequirement)initWithDataRequirement:(id)a3
{
  BWInferenceDataRequirement *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWInferenceDataRequirement;
  v4 = -[BWInferenceDataRequirement init](&v6, sel_init);
  if (v4)
    v4->_identifier = objc_msgSend(a3, "identifier");
  return v4;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (BWInferenceDataRequirement)init
{
  BWInferenceDataRequirement *result;
  int64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BWInferenceDataRequirement;
  result = -[BWInferenceDataRequirement init](&v4, sel_init);
  if (result)
  {
    do
      v3 = __ldaxr(&nextRequirementIdentifier);
    while (__stlxr(v3 + 1, &nextRequirementIdentifier));
    result->_identifier = v3;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@(%ld) %p>"), objc_opt_class(), self->_identifier, self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDataRequirement:", self);
}

@end
