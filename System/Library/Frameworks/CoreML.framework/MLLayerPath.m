@implementation MLLayerPath

- (MLLayerPath)init
{
  return -[MLLayerPath initWithScopedModelAndLayerName:layerName:](self, "initWithScopedModelAndLayerName:layerName:", MEMORY[0x1E0C9AA60], &stru_1E3D68DC8);
}

- (MLLayerPath)initWithScopedModelAndLayerName:(id)a3 layerName:(id)a4
{
  id v7;
  id v8;
  MLLayerPath *v9;
  MLLayerPath *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLLayerPath;
  v9 = -[MLLayerPath init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scopedModelNames, a3);
    objc_storeStrong((id *)&v10->_layerName, a4);
  }

  return v10;
}

- (void)appendPathComponent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MLLayerPath scopedModelNames](self, "scopedModelNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObject:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLLayerPath setScopedModelNames:](self, "setScopedModelNames:", v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  MLLayerPath *v4;
  void *v5;
  void *v6;

  v4 = -[MLLayerPath init](+[MLLayerPath allocWithZone:](MLLayerPath, "allocWithZone:", a3), "init");
  if (v4)
  {
    -[MLLayerPath layerName](self, "layerName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLLayerPath setLayerName:](v4, "setLayerName:", v5);

    -[MLLayerPath scopedModelNames](self, "scopedModelNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLLayerPath setScopedModelNames:](v4, "setScopedModelNames:", v6);

  }
  return v4;
}

- (BOOL)isEqualToMLLayerPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[MLLayerPath layerName](self, "layerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[MLLayerPath scopedModelNames](self, "scopedModelNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scopedModelNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToArray:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  MLLayerPath *v4;
  BOOL v5;

  v4 = (MLLayerPath *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[MLLayerPath isEqualToMLLayerPath:](self, "isEqualToMLLayerPath:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MLLayerPath layerName](self, "layerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[MLLayerPath scopedModelNames](self, "scopedModelNames", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        v4 ^= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "hash");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v4;
}

- (NSArray)scopedModelNames
{
  return self->_scopedModelNames;
}

- (void)setScopedModelNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)layerName
{
  return self->_layerName;
}

- (void)setLayerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerName, 0);
  objc_storeStrong((id *)&self->_scopedModelNames, 0);
}

@end
