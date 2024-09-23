@implementation GKDisplaceNoiseModifier

- (GKDisplaceNoiseModifier)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKDisplaceNoiseModifier;
  return -[GKNoiseModifier initWithInputModuleCount:](&v3, sel_initWithInputModuleCount_, 4);
}

- (int)requiredInputModuleCount
{
  return 4;
}

- (double)valueAt:(GKDisplaceNoiseModifier *)self
{
  __int128 *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  void *v10;
  __int128 v11;
  double v12;
  double v13;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[2];
  _OWORD v21[2];
  _OWORD v22[2];
  _OWORD v23[2];

  v17 = v2[1];
  v18 = *v2;
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputModules, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v18;
  v23[1] = v17;
  objc_msgSend(v4, "valueAt:", v23);
  v16 = v5;

  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputModules, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  v22[1] = v17;
  objc_msgSend(v6, "valueAt:", v22);
  v15 = v7;

  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputModules, "objectAtIndexedSubscript:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  v21[1] = v17;
  objc_msgSend(v8, "valueAt:", v21);
  v19 = v9;

  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputModules, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v11 = v16;
  *((_QWORD *)&v11 + 1) = v15;
  v20[0] = v11;
  v20[1] = v19;
  objc_msgSend(v10, "valueAt:", v20);
  v13 = v12;

  return v13;
}

- (id)cloneModule
{
  return objc_alloc_init(GKDisplaceNoiseModifier);
}

@end
