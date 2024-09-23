@implementation ISSymbolIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISSymbolIcon)initWithSymbolName:(id)a3
{
  return -[ISSymbolIcon initWithSymbolName:configuration:](self, "initWithSymbolName:configuration:", a3, 0);
}

- (ISSymbolIcon)initWithSymbolName:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  ISSymbolIcon *v9;
  uint64_t v10;
  ISImageCache *imageCache;
  ISGraphicSymbolDescriptor *graphicSymbolDescriptor;
  uint64_t v13;
  ISGraphicIconConfiguration *config;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ISSymbolIcon;
  v9 = -[ISCodableIcon _init](&v16, sel__init);
  if (v9)
  {
    v10 = objc_opt_new();
    imageCache = v9->_imageCache;
    v9->_imageCache = (ISImageCache *)v10;

    objc_storeStrong((id *)&v9->_symbolName, a3);
    graphicSymbolDescriptor = v9->_graphicSymbolDescriptor;
    v9->_graphicSymbolDescriptor = 0;

    v13 = objc_msgSend(v8, "copy");
    config = v9->_config;
    v9->_config = (ISGraphicIconConfiguration *)v13;

  }
  return v9;
}

- (ISSymbolIcon)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("configset")))
  {
    v6 = (void *)objc_opt_new();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeArrayOfObjectsOfClasses:forKey:", v9, CFSTR("symbolColors"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSymbolColors:", v10);

    v11 = (void *)MEMORY[0x1E0C99E60];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeArrayOfObjectsOfClasses:forKey:", v13, CFSTR("enclosureColors"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnclosureColors:", v14);

    objc_msgSend(v6, "setRenderingMode:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("renderingMode")));
    if (!v5)
      goto LABEL_6;
    goto LABEL_5;
  }
  v6 = 0;
  if (v5)
LABEL_5:
    self = -[ISSymbolIcon initWithSymbolName:configuration:](self, "initWithSymbolName:configuration:", v5, v6);
LABEL_6:

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_symbolName, CFSTR("symbolName"));
  -[ISGraphicIconConfiguration symbolColors](self->_config, "symbolColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("symbolColors"));

  -[ISGraphicIconConfiguration enclosureColors](self->_config, "enclosureColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("enclosureColors"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[ISGraphicIconConfiguration renderingMode](self->_config, "renderingMode"), CFSTR("renderingMode"));
  if (self->_config)
    objc_msgSend(v6, "encodeBool:forKey:", 1, CFSTR("configset"));

}

- (id)symbol
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D3A7E8]);
  -[ISSymbolIcon symbolName](self, "symbolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSymbolName:bundleURL:", v4, 0);

  return v5;
}

- (id)_generateImageWithDescriptor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  NSObject *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D3A7E8]);
  -[ISSymbolIcon symbolName](self, "symbolName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithSymbolName:bundleURL:", v6, 0);

  if (v7)
  {
    -[ISSymbolIcon config](self, "config");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[ISSymbolIcon config](self, "config");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISSymbolIcon symbolName](self, "symbolName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[ISGraphicSymbolResource graphicSymbolResourceWithConfiguration:symbolName:url:](ISGraphicSymbolResource, "graphicSymbolResourceWithConfiguration:symbolName:url:", v9, v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "updateDescriptorWithImageDescriptor:", v4);
      objc_msgSend(v4, "size");
      v13 = v12;
      v15 = v14;
      objc_msgSend(v4, "scale");
      objc_msgSend(v11, "imageForSize:scale:", v13, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v4, "size");
      v21 = v20;
      v23 = v22;
      objc_msgSend(v4, "scale");
      objc_msgSend(v7, "imageForSize:scale:", v21, v23, v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    _ISDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      -[ISSymbolIcon symbolName](self, "symbolName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412290;
      v27 = v19;

    }
    v17 = 0;
  }

  return v17;
}

- (id)_specUpdatedDescriptorForDescriptor:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D3A7B8], "defaultIconSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v3, "scale");
  objc_msgSend(v4, "imageSpecificationForSize:scale:", v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  objc_msgSend(v3, "setSize:");
  objc_msgSend(v10, "scale");
  objc_msgSend(v3, "setScale:");

  return v3;
}

- (void)_prepareImagesForImageDescriptors:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "copy");
        -[ISSymbolIcon _specUpdatedDescriptorForDescriptor:](self, "_specUpdatedDescriptorForDescriptor:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[ISImageCache imageForDescriptor:](self->_imageCache, "imageForDescriptor:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (!v11
          || ((objc_msgSend(v11, "size"), v14 = v13, v16 = v15, objc_msgSend(v10, "size"), v14 == v18)
            ? (v19 = v16 == v17)
            : (v19 = 0),
              !v19))
        {
          -[ISSymbolIcon _generateImageWithDescriptor:](self, "_generateImageWithDescriptor:", v10);
          v20 = objc_claimAutoreleasedReturnValue();

          -[ISImageCache setImage:forDescriptor:](self->_imageCache, "setImage:forDescriptor:", v20, v10);
          v12 = (void *)v20;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

}

- (id)imageForImageDescriptor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "copy");
  -[ISSymbolIcon _specUpdatedDescriptorForDescriptor:](self, "_specUpdatedDescriptorForDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ISImageCache imageForDescriptor:](self->_imageCache, "imageForDescriptor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6
    || ((objc_msgSend(v6, "size"), v9 = v8, v11 = v10, objc_msgSend(v5, "size"), v9 == v13)
      ? (v14 = v11 == v12)
      : (v14 = 0),
        !v14))
  {
    v18[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISIcon prepareImagesForImageDescriptors:](self, "prepareImagesForImageDescriptors:", v15);

    -[ISImageCache imageForDescriptor:](self->_imageCache, "imageForDescriptor:", v5);
    v16 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v16;
  }

  return v7;
}

- (void)getImageForImageDescriptor:(id)a3 completion:(id)a4
{
  void *v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = (void (**)(id, void *))a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISIcon prepareImagesForImageDescriptors:](self, "prepareImagesForImageDescriptors:", v9, v11, v12);

  -[ISSymbolIcon imageForImageDescriptor:](self, "imageForImageDescriptor:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v10);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)ISSymbolIcon;
  -[ISSymbolIcon description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISSymbolIcon symbolName](self, "symbolName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISSymbolIcon config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISSymbolIcon config](self, "config");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Symbol name: %@ Config: %d - %@"), v4, v5, v6 != 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)symbolName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (ISGraphicIconConfiguration)config
{
  return self->_config;
}

- (ISGraphicSymbolDescriptor)graphicSymbolDescriptor
{
  return (ISGraphicSymbolDescriptor *)objc_getProperty(self, a2, 40, 1);
}

- (ISImageCache)imageCache
{
  return (ISImageCache *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_graphicSymbolDescriptor, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
