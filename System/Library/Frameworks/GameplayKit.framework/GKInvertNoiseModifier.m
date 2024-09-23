@implementation GKInvertNoiseModifier

- (GKInvertNoiseModifier)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKInvertNoiseModifier;
  return -[GKNoiseModifier initWithInputModuleCount:](&v3, sel_initWithInputModuleCount_, 1);
}

- (int)requiredInputModuleCount
{
  return 1;
}

- (double)valueAt:(GKInvertNoiseModifier *)self
{
  __int128 *v2;
  void *v3;
  double v4;
  double v5;
  __int128 v7;
  __int128 v8;
  _OWORD v9[2];

  v7 = v2[1];
  v8 = *v2;
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputModules, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v8;
  v9[1] = v7;
  objc_msgSend(v3, "valueAt:", v9);
  v5 = v4;

  return -v5;
}

- (id)cloneModule
{
  return objc_alloc_init(GKInvertNoiseModifier);
}

@end
