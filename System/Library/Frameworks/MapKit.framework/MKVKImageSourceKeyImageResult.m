@implementation MKVKImageSourceKeyImageResult

- (MKVKImageSourceKeyImageResult)initWithParameters:(id)a3
{
  id v5;
  MKVKImageSourceKeyImageResult *v6;
  MKVKImageSourceKeyImageResult *v7;
  NSMutableArray *v8;
  NSMutableArray *triedKeys;
  NSMutableArray *v10;
  NSMutableArray *mutableFullBleedColors;
  NSMutableArray *v12;
  NSMutableArray *mutableImages;
  NSMutableSet *v14;
  NSMutableSet *imageDatas;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MKVKImageSourceKeyImageResult;
  v6 = -[MKVKImageSourceKeyImageResult init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parameters, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    triedKeys = v7->_triedKeys;
    v7->_triedKeys = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableFullBleedColors = v7->_mutableFullBleedColors;
    v7->_mutableFullBleedColors = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableImages = v7->_mutableImages;
    v7->_mutableImages = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    imageDatas = v7->_imageDatas;
    v7->_imageDatas = v14;

    v7->_sameFullBleedColors = 1;
  }

  return v7;
}

- (NSArray)fullBleedColors
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableFullBleedColors, "copy");
}

- (NSArray)images
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableImages, "copy");
}

- (void)addFullBleedColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    if (self->_sameFullBleedColors && -[NSMutableArray count](self->_mutableFullBleedColors, "count"))
    {
      -[NSMutableArray lastObject](self->_mutableFullBleedColors, "lastObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      self->_sameFullBleedColors = objc_msgSend(v5, "isEqual:", v6);

    }
    -[NSMutableArray addObject:](self->_mutableFullBleedColors, "addObject:", v6);
    v4 = v6;
  }

}

- (MKVKImageSourceCalculationParameters)parameters
{
  return self->_parameters;
}

- (BOOL)hasSameFullBleedColors
{
  return self->_sameFullBleedColors;
}

- (NSMutableArray)triedKeys
{
  return self->_triedKeys;
}

- (void)setTriedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_triedKeys, a3);
}

- (NSMutableArray)mutableImages
{
  return self->_mutableImages;
}

- (void)setMutableImages:(id)a3
{
  objc_storeStrong((id *)&self->_mutableImages, a3);
}

- (NSMutableSet)imageDatas
{
  return self->_imageDatas;
}

- (void)setImageDatas:(id)a3
{
  objc_storeStrong((id *)&self->_imageDatas, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDatas, 0);
  objc_storeStrong((id *)&self->_mutableImages, 0);
  objc_storeStrong((id *)&self->_triedKeys, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_mutableFullBleedColors, 0);
}

@end
