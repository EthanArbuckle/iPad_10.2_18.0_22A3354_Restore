@implementation JTView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JTView;
  -[JTView layoutSubviews](&v3, sel_layoutSubviews);
  if (-[JTView debuggingUIEnabled](self, "debuggingUIEnabled"))
    -[JTView enableDebugMode:](self, "enableDebugMode:", self);
}

- (void)enableDebugMode:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id v18;
  JTLayer *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        -[JTView enableDebugMode:](self, "enableDebugMode:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v4, "layer", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sublayers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (!v12)
  {

LABEL_20:
    v19 = -[JTLayer initWithDebugEnabled]([JTLayer alloc], "initWithDebugEnabled");
    objc_msgSend(v4, "bounds");
    -[JTLayer setFrame:](v19, "setFrame:");
    objc_msgSend(v4, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSublayer:", v19);

    goto LABEL_21;
  }
  v13 = v12;
  v14 = 0;
  v15 = *(_QWORD *)v22;
  do
  {
    for (j = 0; j != v13; ++j)
    {
      if (*(_QWORD *)v22 != v15)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v17;
        v14 = objc_msgSend(v18, "debuggingUIEnabled");
        objc_msgSend(v4, "bounds");
        objc_msgSend(v18, "setFrame:");

      }
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  }
  while (v13);

  if ((v14 & 1) == 0)
    goto LABEL_20;
LABEL_21:

}

- (BOOL)debuggingUIEnabled
{
  return self->_debuggingUIEnabled;
}

- (void)setDebuggingUIEnabled:(BOOL)a3
{
  self->_debuggingUIEnabled = a3;
}

@end
