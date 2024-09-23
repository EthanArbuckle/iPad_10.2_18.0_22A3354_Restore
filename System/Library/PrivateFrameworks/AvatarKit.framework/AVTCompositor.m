@implementation AVTCompositor

- (AVTCompositor)init
{
  AVTCompositor *v2;
  CFMutableSetRef Mutable;
  NSMutableSet *textureProviders;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTCompositor;
  v2 = -[AVTCompositor init](&v6, sel_init);
  if (v2)
  {
    Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    textureProviders = v2->_textureProviders;
    v2->_textureProviders = (NSMutableSet *)Mutable;

  }
  return v2;
}

- (void)addClient:(id)a3
{
  -[NSMutableSet addObject:](self->_textureProviders, "addObject:", a3);
}

- (void)removeClient:(id)a3
{
  -[NSMutableSet removeObject:](self->_textureProviders, "removeObject:", a3);
}

- (void)skinColorDidChange
{
  NSMutableSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_textureProviders;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "skinColorDidChange", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)componentDidChangeForTypes:(unint64_t)a3
{
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = self->_textureProviders;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "componentDidChangeForTypes:", a3, (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)configureMaterial:(id)a3 propertyNamed:(id)a4 memoji:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  AVTCompositorTextureProvider *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v13, "valueForKey:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CD59C8]);
    objc_msgSend(v13, "setValue:forKey:", v10, v8);
  }
  objc_msgSend(v10, "contents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = -[AVTCompositorTextureProvider initWithCompositor:memoji:propertyName:]([AVTCompositorTextureProvider alloc], "initWithCompositor:memoji:propertyName:", self, v9, v8);
    objc_msgSend(v10, "setContents:", v12);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureProviders, 0);
}

@end
