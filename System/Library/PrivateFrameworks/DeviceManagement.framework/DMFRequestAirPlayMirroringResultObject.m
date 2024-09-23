@implementation DMFRequestAirPlayMirroringResultObject

- (DMFRequestAirPlayMirroringResultObject)initWithStatus:(unint64_t)a3
{
  DMFRequestAirPlayMirroringResultObject *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DMFRequestAirPlayMirroringResultObject;
  result = -[CATTaskResultObject init](&v5, sel_init);
  if (result)
    result->_status = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFRequestAirPlayMirroringResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFRequestAirPlayMirroringResultObject *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMFRequestAirPlayMirroringResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = objc_msgSend(v6, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFRequestAirPlayMirroringResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFRequestAirPlayMirroringResultObject status](self, "status", v6.receiver, v6.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("status"));

}

- (unint64_t)status
{
  return self->_status;
}

@end
