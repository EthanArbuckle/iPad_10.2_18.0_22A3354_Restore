@implementation MPSGraphPackageMLIRLibrary

- (MPSGraphPackageMLIRLibrary)init
{
  MPSGraphPackageMLIRLibrary *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mlirLibrary;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPSGraphPackageMLIRLibrary;
  v2 = -[MPSGraphPackageMLIRLibrary init](&v11, sel_init);
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  mlirLibrary = v2->_mlirLibrary;
  v2->_mlirLibrary = v3;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_mlirLibrary, "setObject:forKeyedSubscript:", v5, CFSTR("Optimized"));

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_mlirLibrary, "setObject:forKeyedSubscript:", v6, CFSTR("Optimized No Device"));

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_mlirLibrary, "setObject:forKeyedSubscript:", v7, CFSTR("Optimized Resources Used"));

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_mlirLibrary, "setObject:forKeyedSubscript:", v8, CFSTR("Optimized No Device Resources Used"));

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_mlirLibrary, "setObject:forKeyedSubscript:", v9, CFSTR("Resource Offsets"));

  return v2;
}

- (MPSGraphPackageMLIRLibrary)initWithMLIRLibraryDict:(id)a3
{
  id v4;
  MPSGraphPackageMLIRLibrary *v5;
  uint64_t v6;
  NSMutableDictionary *mlirLibrary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPSGraphPackageMLIRLibrary;
  v5 = -[MPSGraphPackageMLIRLibrary init](&v9, sel_init);
  v6 = objc_msgSend(v4, "mutableCopy");
  mlirLibrary = v5->_mlirLibrary;
  v5->_mlirLibrary = (NSMutableDictionary *)v6;

  return v5;
}

- (id)getOptimizedMLIRLibrary
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mlirLibrary, "objectForKeyedSubscript:", CFSTR("Optimized"));
}

- (id)getOptimizedNoDeviceMLIRLibrary
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mlirLibrary, "objectForKeyedSubscript:", CFSTR("Optimized No Device"));
}

- (unint64_t)getResourceStorageMode
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_mlirLibrary, "objectForKeyedSubscript:", CFSTR("Resource Storage Mode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "unsignedLongLongValue");

    return v4;
  }
  else
  {

    return 0;
  }
}

- (id)getOptimizedResourcesUsedLibrary
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mlirLibrary, "objectForKeyedSubscript:", CFSTR("Optimized Resources Used"));
}

- (id)getOriginalResourcesUsed
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mlirLibrary, "objectForKeyedSubscript:", CFSTR("Original Resources Used"));
}

- (id)getOptimizedNoDeviceResourcesUsedLibrary
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mlirLibrary, "objectForKeyedSubscript:", CFSTR("Optimized No Device Resources Used"));
}

- (id)getResourceOffsetsLibrary
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mlirLibrary, "objectForKeyedSubscript:", CFSTR("Resource Offsets"));
}

- (id)getCallablesDescription
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mlirLibrary, "objectForKeyedSubscript:", CFSTR("Callables"));
}

- (void)updateWithMLIRLibrary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  void *mlirLibrary;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "getDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_mlirLibrary, "objectForKey:", CFSTR("Original"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Original")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5 == v6))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_mlirLibrary, "objectForKeyedSubscript:", CFSTR("Optimized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Optimized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addEntriesFromDictionary:", v10);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_mlirLibrary, "objectForKeyedSubscript:", CFSTR("Optimized No Device"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Optimized No Device"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEntriesFromDictionary:", v12);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_mlirLibrary, "objectForKeyedSubscript:", CFSTR("Resource Storage Mode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Resource Storage Mode"));

    -[NSMutableDictionary objectForKeyedSubscript:](self->_mlirLibrary, "objectForKeyedSubscript:", CFSTR("Resource Storage Mode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Resource Storage Mode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 != v15 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_mlirLibrary, "objectForKeyedSubscript:", CFSTR("Optimized Resources Used"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Optimized Resources Used"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addEntriesFromDictionary:", v17);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_mlirLibrary, "objectForKeyedSubscript:", CFSTR("Optimized No Device Resources Used"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Optimized No Device Resources Used"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addEntriesFromDictionary:", v19);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_mlirLibrary, "objectForKeyedSubscript:", CFSTR("Resource Offsets"));
    mlirLibrary = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Resource Offsets"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(mlirLibrary, "addEntriesFromDictionary:", v20);

  }
  else
  {
    v7 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
    mlirLibrary = self->_mlirLibrary;
    self->_mlirLibrary = v7;
  }

}

- (id)getDict
{
  return self->_mlirLibrary;
}

- (BOOL)originalFileExists
{
  void *v2;
  BOOL v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_mlirLibrary, "objectForKeyedSubscript:", CFSTR("Original"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)optimizedFileExistsWithSignature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[MPSGraphPackageMLIRLibrary getOptimizedMLIRLibrary](self, "getOptimizedMLIRLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (BOOL)optimizedNoDeviceFileExistsWithSignature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[MPSGraphPackageMLIRLibrary getOptimizedNoDeviceMLIRLibrary](self, "getOptimizedNoDeviceMLIRLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (void)addOriginalMLIRFile:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mlirLibrary, "setObject:forKeyedSubscript:", a3, CFSTR("Original"));
}

- (void)addOptimizedMLIRFile:(id)a3 withSignature:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MPSGraphPackageMLIRLibrary getOptimizedMLIRLibrary](self, "getOptimizedMLIRLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);

}

- (void)addOptimizedNoDeviceMLIRFile:(id)a3 withSignature:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MPSGraphPackageMLIRLibrary getOptimizedNoDeviceMLIRLibrary](self, "getOptimizedNoDeviceMLIRLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);

}

- (void)setResourceStorageMode:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mlirLibrary, "setObject:forKeyedSubscript:");

}

- (void)setCallablesDescription:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mlirLibrary, "setObject:forKeyedSubscript:", a3, CFSTR("Callables"));
}

- (void)addOriginalResourcesUsed:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mlirLibrary, "setObject:forKeyedSubscript:", a3, CFSTR("Original Resources Used"));
}

- (void)addOptimizedResourcesUsed:(id)a3 withSignature:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MPSGraphPackageMLIRLibrary getOptimizedResourcesUsedLibrary](self, "getOptimizedResourcesUsedLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);

}

- (void)addOptimizedNoDeviceResourcesUsed:(id)a3 withSignature:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MPSGraphPackageMLIRLibrary getOptimizedNoDeviceResourcesUsedLibrary](self, "getOptimizedNoDeviceResourcesUsedLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mlirLibrary, 0);
}

@end
