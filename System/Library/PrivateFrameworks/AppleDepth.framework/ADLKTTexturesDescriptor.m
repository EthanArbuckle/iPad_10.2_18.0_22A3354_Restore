@implementation ADLKTTexturesDescriptor

- (id)initForSupportedSizes:(id)a3 config:(id *)a4
{
  id v6;
  ADLKTTexturesDescriptor *v7;
  ADLKTTexturesDescriptor *v8;
  id var1;
  __int128 v10;
  uint64_t v11;
  ADImageDescriptor *inputDescriptor;
  uint64_t v13;
  ADImageDescriptor *shiftmapDescriptor;
  NSArray *v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int i;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  NSArray *featuresDescriptors;
  NSArray *v32;
  NSArray *derivitivesDescriptors;
  NSArray *v34;
  NSArray *pyramidsDescriptors;
  id v37;
  $9F5C386A951B3C504AD39AFD20B040BC *v38;
  NSArray *v39;
  NSArray *v40;
  objc_super v41;

  v6 = a3;
  v41.receiver = self;
  v41.super_class = (Class)ADLKTTexturesDescriptor;
  v7 = -[ADLKTTexturesDescriptor init](&v41, sel_init);
  v8 = v7;
  if (v7)
  {
    var1 = a4->var1;
    v7->_scales = a4->var0;
    v7->_opticalFlowConfig.scales = a4->var0;
    objc_storeStrong((id *)&v7->_opticalFlowConfig.nwarpings, var1);
    v10 = *(_OWORD *)&a4->var2;
    *(_QWORD *)&v8->_opticalFlowConfig.nlreg_sigma_c = *(_QWORD *)&a4->var6;
    *(_OWORD *)&v8->_opticalFlowConfig.useNonLocalRegularization = v10;
    objc_msgSend(MEMORY[0x24BE05FC0], "descriptorForSupportedSizes:pixelFormat:", v6, 1111970369);
    v11 = objc_claimAutoreleasedReturnValue();
    inputDescriptor = v8->_inputDescriptor;
    v8->_inputDescriptor = (ADImageDescriptor *)v11;

    objc_msgSend(MEMORY[0x24BE05FC0], "descriptorForSupportedSizes:pixelFormat:", v6, 843264104);
    v13 = objc_claimAutoreleasedReturnValue();
    shiftmapDescriptor = v8->_shiftmapDescriptor;
    v8->_shiftmapDescriptor = (ADImageDescriptor *)v13;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v8->_scales);
    v40 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v38 = a4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v8->_scales);
    v39 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v8->_scales);
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v37 = v6;
    v16 = (void *)objc_msgSend(v6, "mutableCopy");
    if (v8->_scales)
    {
      v17 = 0;
      v18 = 0;
      do
      {
        objc_msgSend(MEMORY[0x24BE05FC0], "descriptorForSupportedSizes:pixelFormat:", v16, 1380401729);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray setObject:atIndexedSubscript:](v15, "setObject:atIndexedSubscript:", v19, v17);

        objc_msgSend(MEMORY[0x24BE05FC0], "descriptorForSupportedSizes:pixelFormat:", v16, 843264104);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray setObject:atIndexedSubscript:](v40, "setObject:atIndexedSubscript:", v20, v17);

        objc_msgSend(MEMORY[0x24BE05FC0], "descriptorForSupportedSizes:pixelFormat:", v16, 1380411457);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray setObject:atIndexedSubscript:](v39, "setObject:atIndexedSubscript:", v21, v17);

        for (i = 0; objc_msgSend(v16, "count") > (unint64_t)i; ++i)
        {
          objc_msgSend(v16, "objectAtIndexedSubscript:", i);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "size");
          +[ADLKTOpticalFlow getNextPyramidLevelSize:](ADLKTOpticalFlow, "getNextPyramidLevelSize:");
          v25 = v24;
          v27 = v26;

          v28 = (void *)MEMORY[0x24BE05FC8];
          objc_msgSend(v16, "objectAtIndexedSubscript:", i);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "createWithSize:andLayout:", objc_msgSend(v29, "layout"), v25, v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:atIndexedSubscript:", v30, i);

        }
        v17 = ++v18;
      }
      while (v8->_scales > v18);
    }
    featuresDescriptors = v8->_featuresDescriptors;
    v8->_featuresDescriptors = v40;
    v32 = v40;

    derivitivesDescriptors = v8->_derivitivesDescriptors;
    v8->_derivitivesDescriptors = v39;
    v34 = v39;

    pyramidsDescriptors = v8->_pyramidsDescriptors;
    v8->_pyramidsDescriptors = v15;

    v6 = v37;
    a4 = v38;
  }

  return v8;
}

- (CGSize)inputSizeForLayout:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  -[ADImageDescriptor sizeForLayout:](self->_inputDescriptor, "sizeForLayout:", a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (unint64_t)scales
{
  return self->_scales;
}

- (ADImageDescriptor)inputDescriptor
{
  return self->_inputDescriptor;
}

- (NSArray)pyramidsDescriptors
{
  return self->_pyramidsDescriptors;
}

- (NSArray)featuresDescriptors
{
  return self->_featuresDescriptors;
}

- (NSArray)derivitivesDescriptors
{
  return self->_derivitivesDescriptors;
}

- (ADImageDescriptor)shiftmapDescriptor
{
  return self->_shiftmapDescriptor;
}

- ($9F5C386A951B3C504AD39AFD20B040BC)opticalFlowConfig
{
  NSMutableArray *nwarpings;
  $9F5C386A951B3C504AD39AFD20B040BC *result;

  nwarpings = self->_opticalFlowConfig.nwarpings;
  retstr->var0 = self->_opticalFlowConfig.scales;
  result = nwarpings;
  retstr->var1 = result;
  *(_OWORD *)&retstr->var2 = *(_OWORD *)&self->_opticalFlowConfig.useNonLocalRegularization;
  *(_QWORD *)&retstr->var6 = *(_QWORD *)&self->_opticalFlowConfig.nlreg_sigma_c;
  return result;
}

- (void).cxx_destruct
{

  objc_storeStrong((id *)&self->_shiftmapDescriptor, 0);
  objc_storeStrong((id *)&self->_derivitivesDescriptors, 0);
  objc_storeStrong((id *)&self->_featuresDescriptors, 0);
  objc_storeStrong((id *)&self->_pyramidsDescriptors, 0);
  objc_storeStrong((id *)&self->_inputDescriptor, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end
