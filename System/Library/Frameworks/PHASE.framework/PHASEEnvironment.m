@implementation PHASEEnvironment

- (PHASEEnvironment)init
{
  -[PHASEEnvironment doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEEnvironment)initWithEngine:(id)a3 shapes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PHASEEnvironment *v9;
  PHASEEnvironment *v10;
  PHASEMedium *medium;
  uint64_t v12;
  NSArray *shapes;
  PHASEEnvironment *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
  {
    v16.receiver = self;
    v16.super_class = (Class)PHASEEnvironment;
    v9 = -[PHASEObject initWithEngine:entityType:shapes:](&v16, sel_initWithEngine_entityType_shapes_, v6, 5, v8);
    v10 = v9;
    if (v9)
    {
      medium = v9->_medium;
      v9->_medium = 0;

      v10->_mediumScaleFactor = 1.0;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
      v12 = objc_claimAutoreleasedReturnValue();
      shapes = v10->_shapes;
      v10->_shapes = (NSArray *)v12;

    }
    self = v10;
    v14 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), CFSTR("Cannot create a PHASEEnvironment with nil or empty shape array"));
    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[PHASEObject engine](self, "engine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHASEEnvironment shapes](self, "shapes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithEngine:shapes:", v5, v6);

  objc_msgSend(v7, "setMedium:", self->_medium);
  *(float *)&v8 = self->_mediumScaleFactor;
  objc_msgSend(v7, "setMediumScaleFactor:", v8);
  -[PHASEObject transform](self, "transform");
  objc_msgSend(v7, "setTransform:");
  return v7;
}

- (PHASEMedium)medium
{
  return self->_medium;
}

- (void)setMedium:(id)a3
{
  objc_storeStrong((id *)&self->_medium, a3);
}

- (float)mediumScaleFactor
{
  return self->_mediumScaleFactor;
}

- (void)setMediumScaleFactor:(float)a3
{
  self->_mediumScaleFactor = a3;
}

- (NSArray)shapes
{
  return self->_shapes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medium, 0);
  objc_storeStrong((id *)&self->_shapes, 0);
}

@end
