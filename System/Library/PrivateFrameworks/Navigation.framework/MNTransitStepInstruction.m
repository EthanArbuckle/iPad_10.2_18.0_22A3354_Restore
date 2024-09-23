@implementation MNTransitStepInstruction

+ (id)instructionForStep:(id)a3 context:(int64_t)a4
{
  return (id)objc_msgSend(a1, "instructionForStep:overrides:context:", a3, 0, a4);
}

+ (id)instructionForStep:(id)a3 overrides:(id)a4 context:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStep:overrides:context:", v9, v8, a5);

  return v10;
}

- (MNTransitStepInstruction)initWithStep:(id)a3 overrides:(id)a4 context:(int64_t)a5
{
  id v9;
  id v10;
  MNTransitStepInstruction *v11;
  MNTransitStepInstruction *v12;
  MNTransitStepInstruction *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MNTransitStepInstruction;
  v11 = -[MNTransitInstruction initWithContext:](&v15, sel_initWithContext_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_step, a3);
    objc_storeStrong((id *)&v12->_overridenInstructionsMapping, a4);
    -[MNTransitInstruction _fillInInstructions](v12, "_fillInInstructions");
    v13 = v12;
  }

  return v12;
}

- (id)instructionSet
{
  return (id)-[GEOComposedRouteStep instructions](self->_step, "instructions");
}

- (GEOComposedRouteStep)step
{
  return self->_step;
}

- (NSDictionary)overridenInstructionsMapping
{
  return self->_overridenInstructionsMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridenInstructionsMapping, 0);
  objc_storeStrong((id *)&self->_step, 0);
}

@end
