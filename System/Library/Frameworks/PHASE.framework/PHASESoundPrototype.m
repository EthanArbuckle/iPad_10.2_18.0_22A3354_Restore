@implementation PHASESoundPrototype

- (NSString)assetUID
{
  return self->_assetIdentifier;
}

- (void)setAssetUID:(id)a3
{
  objc_storeStrong((id *)&self->_assetIdentifier, a3);
}

- (PHASESoundPrototype)init
{
  -[PHASESoundPrototype doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASESoundPrototype)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASESoundPrototype)initWithEngine:(id)a3 registeredActionTreeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  PHASESoundPrototype *v10;
  PHASESoundPrototype *v11;
  PHASESoundEventNodeAsset *programmaticAPIAsset;
  PHASESoundPrototype *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  Phase::Logger *v17;
  NSObject *v18;
  id v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (a5)
    *a5 = 0;
  if (v8)
  {
    v21.receiver = self;
    v21.super_class = (Class)PHASESoundPrototype;
    v10 = -[PHASESoundPrototype init](&v21, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeWeak((id *)&v10->_engine, v8);
      objc_storeStrong((id *)&v11->_assetIdentifier, a4);
      programmaticAPIAsset = v11->_programmaticAPIAsset;
      v11->_programmaticAPIAsset = 0;

    }
    self = v11;
    v13 = self;
  }
  else
  {
    v14 = *MEMORY[0x24BDD0FC8];
    v28 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid PHASEEngine"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v17)
                                                                                        + 432)));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", v14);
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v23 = "PHASESoundPrototype.mm";
      v24 = 1024;
      v25 = 65;
      v26 = 2080;
      v27 = objc_msgSend(v19, "UTF8String");
      _os_log_impl(&dword_2164CC000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346913633, v16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    v13 = 0;
  }

  return v13;
}

- (PHASESoundPrototype)initWithEngine:(id)a3 actionTreeRootNode:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  PHASESoundPrototype *v10;
  id v11;
  void *v12;
  NSString *v13;
  NSString *assetIdentifier;
  id WeakRetained;
  void *v16;
  PHASESoundEventNodeAsset *v17;
  PHASESoundEventNodeAsset *programmaticAPIAsset;
  PHASESoundPrototype *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  if (!v8)
    goto LABEL_5;
  v21.receiver = self;
  v21.super_class = (Class)PHASESoundPrototype;
  v10 = -[PHASESoundPrototype init](&v21, sel_init);
  self = v10;
  if (!v10)
    goto LABEL_4;
  v11 = objc_storeWeak((id *)&v10->_engine, v8);
  objc_msgSend(v8, "assetRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getUniqueIdentifier");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  assetIdentifier = self->_assetIdentifier;
  self->_assetIdentifier = v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(WeakRetained, "assetRegistry");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerSoundEventAssetWithRootNode:identifier:error:", v9, self->_assetIdentifier, a5);
  v17 = (PHASESoundEventNodeAsset *)objc_claimAutoreleasedReturnValue();
  programmaticAPIAsset = self->_programmaticAPIAsset;
  self->_programmaticAPIAsset = v17;

  if (self->_programmaticAPIAsset)
  {
LABEL_4:
    self = self;
    v19 = self;
  }
  else
  {
LABEL_5:
    v19 = 0;
  }

  return v19;
}

- (void)deRegister
{
  id WeakRetained;
  void *v4;
  void *v5;
  PHASESoundEventNodeAsset *programmaticAPIAsset;

  if (self->_programmaticAPIAsset)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
    objc_msgSend(WeakRetained, "assetRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHASEAsset identifier](self->_programmaticAPIAsset, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unregisterAssetWithIdentifier:completion:", v5, 0);

    programmaticAPIAsset = self->_programmaticAPIAsset;
    self->_programmaticAPIAsset = 0;

  }
}

- (void)dealloc
{
  objc_super v3;

  if (self->_programmaticAPIAsset)
    -[PHASESoundPrototype deRegister](self, "deRegister");
  v3.receiver = self;
  v3.super_class = (Class)PHASESoundPrototype;
  -[PHASESoundPrototype dealloc](&v3, sel_dealloc);
}

- (NSArray)mixerInformation
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(WeakRetained, "assetRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mixerInformationForActionTreeWithIdentifier:", self->_assetIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSString)assetIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAssetIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_programmaticAPIAsset, 0);
  objc_destroyWeak((id *)&self->_engine);
}

@end
