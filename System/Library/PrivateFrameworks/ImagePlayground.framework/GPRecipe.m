@implementation GPRecipe

- (GPRecipe)initWithPromptElements:(id)a3 sourceImage:(id)a4
{
  id v6;
  id v7;
  GPRecipe *v8;
  GPRecipe *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GPRecipe;
  v8 = -[GPRecipe init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[GPRecipe setPromptElements:](v8, "setPromptElements:", v6);
    -[GPRecipe setSourceImage:](v9, "setSourceImage:", v7);
  }

  return v9;
}

- (GPRecipe)initWithEncodedRecipe:(id)a3 prompt:(id)a4 contextElements:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  GPPromptElement *v12;
  GPRecipe *v13;
  GPRecipe *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v9, "length"))
  {
    v12 = -[GPPromptElement initWithText:]([GPPromptElement alloc], "initWithText:", v9);
    objc_msgSend(v11, "addObject:", v12);

  }
  objc_msgSend(v11, "addObjectsFromArray:", v10);
  v13 = -[GPRecipe initWithPromptElements:sourceImage:](self, "initWithPromptElements:sourceImage:", v11, 0);
  v14 = v13;
  if (v13)
    -[GPRecipe setAdditionalMetadata:](v13, "setAdditionalMetadata:", v8);

  return v14;
}

- (GPRecipe)initWithEncodedRecipe:(id)a3 prompts:(id)a4 contextElements:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  GPPromptElement *v18;
  GPRecipe *v19;
  GPRecipe *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v17, "length", (_QWORD)v22))
        {
          v18 = -[GPPromptElement initWithText:]([GPPromptElement alloc], "initWithText:", v17);
          objc_msgSend(v11, "addObject:", v18);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  objc_msgSend(v11, "addObjectsFromArray:", v10);
  v19 = -[GPRecipe initWithPromptElements:sourceImage:](self, "initWithPromptElements:sourceImage:", v11, 0);
  v20 = v19;
  if (v19)
    -[GPRecipe setAdditionalMetadata:](v19, "setAdditionalMetadata:", v8);

  return v20;
}

- (NSData)additionalMetadata
{
  return self->_additionalMetadata;
}

- (void)setAdditionalMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)promptElements
{
  return self->_promptElements;
}

- (void)setPromptElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIImage)sourceImage
{
  return (UIImage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSourceImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)sourceImageIsSketch
{
  return self->_sourceImageIsSketch;
}

- (void)setSourceImageIsSketch:(BOOL)a3
{
  self->_sourceImageIsSketch = a3;
}

- (GPDrawOnImageRecipe)drawOnImageRecipe
{
  return self->_drawOnImageRecipe;
}

- (void)setDrawOnImageRecipe:(id)a3
{
  objc_storeStrong((id *)&self->_drawOnImageRecipe, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawOnImageRecipe, 0);
  objc_storeStrong((id *)&self->_sourceImage, 0);
  objc_storeStrong((id *)&self->_promptElements, 0);
  objc_storeStrong((id *)&self->_additionalMetadata, 0);
}

@end
