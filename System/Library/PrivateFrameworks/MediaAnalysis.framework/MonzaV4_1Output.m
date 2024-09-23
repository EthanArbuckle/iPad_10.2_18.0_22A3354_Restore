@implementation MonzaV4_1Output

- (MonzaV4_1Output)initWithAngle:(id)a3
{
  id v5;
  MonzaV4_1Output *v6;
  MonzaV4_1Output *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MonzaV4_1Output;
  v6 = -[MonzaV4_1Output init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_angle, a3);

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6B76AB8);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("angle")))
  {
    v4 = (void *)MEMORY[0x1E0C9E918];
    -[MonzaV4_1Output angle](self, "angle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureValueWithMultiArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MLMultiArray)angle
{
  return self->_angle;
}

- (void)setAngle:(id)a3
{
  objc_storeStrong((id *)&self->_angle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_angle, 0);
}

@end
