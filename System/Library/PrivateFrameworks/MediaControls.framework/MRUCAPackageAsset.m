@implementation MRUCAPackageAsset

+ (id)packageNamed:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPackageName:", v4);

  return v5;
}

+ (id)packageNamed:(id)a3 glyphState:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPackageName:glyphState:", v7, v6);

  return v8;
}

+ (id)packageNamed:(id)a3 glyphState:(id)a4 permanentTransform:(CATransform3D *)a5
{
  id v8;
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  _OWORD v17[8];

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc((Class)a1);
  v11 = *(_OWORD *)&a5->m33;
  v17[4] = *(_OWORD *)&a5->m31;
  v17[5] = v11;
  v12 = *(_OWORD *)&a5->m43;
  v17[6] = *(_OWORD *)&a5->m41;
  v17[7] = v12;
  v13 = *(_OWORD *)&a5->m13;
  v17[0] = *(_OWORD *)&a5->m11;
  v17[1] = v13;
  v14 = *(_OWORD *)&a5->m23;
  v17[2] = *(_OWORD *)&a5->m21;
  v17[3] = v14;
  v15 = (void *)objc_msgSend(v10, "initWithPackageName:glyphState:permanentTransform:", v9, v8, v17);

  return v15;
}

- (MRUCAPackageAsset)initWithPackageName:(id)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[8];

  v3 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v8[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v8[5] = v3;
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v8[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v8[7] = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v8[0] = *MEMORY[0x1E0CD2610];
  v8[1] = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v8[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v8[3] = v6;
  return -[MRUCAPackageAsset initWithPackageName:glyphState:permanentTransform:](self, "initWithPackageName:glyphState:permanentTransform:", a3, 0, v8);
}

- (MRUCAPackageAsset)initWithPackageName:(id)a3 glyphState:(id)a4
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[8];

  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v9[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v9[5] = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v9[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v9[7] = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v9[0] = *MEMORY[0x1E0CD2610];
  v9[1] = v6;
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v9[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v9[3] = v7;
  return -[MRUCAPackageAsset initWithPackageName:glyphState:permanentTransform:](self, "initWithPackageName:glyphState:permanentTransform:", a3, a4, v9);
}

- (MRUCAPackageAsset)initWithPackageName:(id)a3 glyphState:(id)a4 permanentTransform:(CATransform3D *)a5
{
  id v9;
  id v10;
  MRUCAPackageAsset *v11;
  MRUCAPackageAsset *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MRUCAPackageAsset;
  v11 = -[MRUCAPackageAsset init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_packageName, a3);
    objc_storeStrong((id *)&v12->_glyphState, a4);
    v13 = *(_OWORD *)&a5->m11;
    v14 = *(_OWORD *)&a5->m13;
    v15 = *(_OWORD *)&a5->m23;
    *(_OWORD *)&v12->_permanentTransform.m21 = *(_OWORD *)&a5->m21;
    *(_OWORD *)&v12->_permanentTransform.m23 = v15;
    *(_OWORD *)&v12->_permanentTransform.m11 = v13;
    *(_OWORD *)&v12->_permanentTransform.m13 = v14;
    v16 = *(_OWORD *)&a5->m31;
    v17 = *(_OWORD *)&a5->m33;
    v18 = *(_OWORD *)&a5->m43;
    *(_OWORD *)&v12->_permanentTransform.m41 = *(_OWORD *)&a5->m41;
    *(_OWORD *)&v12->_permanentTransform.m43 = v18;
    *(_OWORD *)&v12->_permanentTransform.m31 = v16;
    *(_OWORD *)&v12->_permanentTransform.m33 = v17;
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ package: %@ | symbol: %@"), objc_opt_class(), self->_packageName, self->_glyphState);
}

- (BOOL)isEqual:(id)a3
{
  MRUCAPackageAsset *v4;
  MRUCAPackageAsset *v5;
  NSString *v6;
  NSString *v7;
  int v8;
  _BOOL4 v9;
  NSString *v10;
  NSString *v11;
  int v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CATransform3D v19;
  CATransform3D a;

  v4 = (MRUCAPackageAsset *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MRUCAPackageAsset packageName](v5, "packageName");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 == self->_packageName)
        v8 = 1;
      else
        v8 = -[NSString isEqual:](v6, "isEqual:");

      -[MRUCAPackageAsset glyphState](v5, "glyphState");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 == self->_glyphState)
        v12 = 1;
      else
        v12 = -[NSString isEqual:](v10, "isEqual:");
      v13 = v8 & v12;

      if (v5)
        -[MRUCAPackageAsset permanentTransform](v5, "permanentTransform");
      else
        memset(&a, 0, sizeof(a));
      v14 = *(_OWORD *)&self->_permanentTransform.m33;
      *(_OWORD *)&v19.m31 = *(_OWORD *)&self->_permanentTransform.m31;
      *(_OWORD *)&v19.m33 = v14;
      v15 = *(_OWORD *)&self->_permanentTransform.m43;
      *(_OWORD *)&v19.m41 = *(_OWORD *)&self->_permanentTransform.m41;
      *(_OWORD *)&v19.m43 = v15;
      v16 = *(_OWORD *)&self->_permanentTransform.m13;
      *(_OWORD *)&v19.m11 = *(_OWORD *)&self->_permanentTransform.m11;
      *(_OWORD *)&v19.m13 = v16;
      v17 = *(_OWORD *)&self->_permanentTransform.m23;
      *(_OWORD *)&v19.m21 = *(_OWORD *)&self->_permanentTransform.m21;
      *(_OWORD *)&v19.m23 = v17;
      v9 = v13 & CATransform3DEqualToTransform(&a, &v19);

    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (CAPackage)package
{
  return (CAPackage *)+[MRUAssetsProvider packageWithName:](MRUAssetsProvider, "packageWithName:", self->_packageName);
}

- (CCUICAPackageDescription)packageDescription
{
  CCUICAPackageDescription *packageDescription;
  CCUICAPackageDescription *v4;
  CCUICAPackageDescription *v5;

  packageDescription = self->_packageDescription;
  if (!packageDescription)
  {
    +[MRUAssetsProvider packageDescriptionWithName:](MRUAssetsProvider, "packageDescriptionWithName:", self->_packageName);
    v4 = (CCUICAPackageDescription *)objc_claimAutoreleasedReturnValue();
    v5 = self->_packageDescription;
    self->_packageDescription = v4;

    packageDescription = self->_packageDescription;
  }
  return packageDescription;
}

- (NSString)packageName
{
  return self->_packageName;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (void)setGlyphState:(id)a3
{
  objc_storeStrong((id *)&self->_glyphState, a3);
}

- (CATransform3D)permanentTransform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self->m43;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m41;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[1].m13;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self->m23;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m21;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self->m33;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m31;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setPermanentTransform:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m13;
  v5 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_permanentTransform.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_permanentTransform.m23 = v5;
  *(_OWORD *)&self->_permanentTransform.m11 = v3;
  *(_OWORD *)&self->_permanentTransform.m13 = v4;
  v6 = *(_OWORD *)&a3->m31;
  v7 = *(_OWORD *)&a3->m33;
  v8 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_permanentTransform.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_permanentTransform.m43 = v8;
  *(_OWORD *)&self->_permanentTransform.m31 = v6;
  *(_OWORD *)&self->_permanentTransform.m33 = v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_packageName, 0);
  objc_storeStrong((id *)&self->_packageDescription, 0);
}

@end
