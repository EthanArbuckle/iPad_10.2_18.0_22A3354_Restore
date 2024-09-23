@implementation GKMinimumNoiseModifier

- (GKMinimumNoiseModifier)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKMinimumNoiseModifier;
  return -[GKNoiseModifier initWithInputModuleCount:](&v3, sel_initWithInputModuleCount_, 2);
}

- (int)requiredInputModuleCount
{
  return 2;
}

- (double)valueAt:(GKMinimumNoiseModifier *)self
{
  __int128 *v2;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  __int128 v11;
  __int128 v12;
  _OWORD v13[2];
  _OWORD v14[2];

  v11 = v2[1];
  v12 = *v2;
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputModules, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v12;
  v14[1] = v11;
  objc_msgSend(v4, "valueAt:", v14);
  v6 = v5;

  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputModules, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v12;
  v13[1] = v11;
  objc_msgSend(v7, "valueAt:", v13);
  v9 = v8;

  return fmin(v9, v6);
}

- (id)cloneModule
{
  return objc_alloc_init(GKMinimumNoiseModifier);
}

@end
