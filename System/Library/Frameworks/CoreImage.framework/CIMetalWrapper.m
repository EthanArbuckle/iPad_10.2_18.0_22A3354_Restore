@implementation CIMetalWrapper

- (CIMetalWrapper)init
{
  CIMetalWrapper *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CIMetalWrapper;
  v2 = -[CIMetalWrapper init](&v4, sel_init);
  if (v2)
    v2->_dict = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  return v2;
}

- (void)dealloc
{
  NSMutableDictionary *dict;
  objc_super v4;

  dict = self->_dict;
  if (dict)

  v4.receiver = self;
  v4.super_class = (Class)CIMetalWrapper;
  -[CIFilter dealloc](&v4, sel_dealloc);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (a3 && a4)
  {
    if (objc_msgSend(a4, "isEqualToString:", CFSTR("inputFilterName")))
      self->inputFilterName = (NSString *)a3;
    else
      -[NSMutableDictionary setValue:forKey:](self->_dict, "setValue:forKey:", a3, a4);
  }
}

- (id)inputKeys
{
  if (self->inputFilterName)
    return -[CIFilter inputKeys](+[CIFilter filterWithName:](CIFilter, "filterWithName:"), "inputKeys");
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (id)attributes
{
  if (self->inputFilterName)
    return -[CIFilter attributes](+[CIFilter filterWithName:](CIFilter, "filterWithName:"), "attributes");
  else
    return (id)MEMORY[0x1E0C9AA70];
}

- (id)dummyImagesForImages:(id)a3
{
  void *v4;
  CIColor *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  uint64_t v13;
  void *v14;
  CIImage *v15;
  uint64_t v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v5 = +[CIColor whiteColor](CIColor, "whiteColor");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    v9 = *MEMORY[0x1E0C9D5E0];
    v10 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(a3);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v13);
        v15 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", v5);
        objc_msgSend(v14, "extent");
        v39.origin.x = v9;
        v39.origin.y = v10;
        v39.size.width = v11;
        v39.size.height = v12;
        if (!CGRectEqualToRect(v36, v39))
        {
          objc_msgSend(v14, "extent");
          v15 = -[CIImage imageByCroppingToRect:](v15, "imageByCroppingToRect:");
        }
        v16 = objc_msgSend(v14, "properties");
        objc_msgSend(v14, "extent");
        v40.origin.x = v9;
        v40.origin.y = v10;
        v40.size.width = v11;
        v40.size.height = v12;
        if (!CGRectEqualToRect(v37, v40))
        {
          -[CIImage extent](v15, "extent");
          v18 = v17;
          v20 = v19;
          v22 = v21;
          v24 = v23;
          objc_msgSend(v14, "extent");
          v41.origin.x = v25;
          v41.origin.y = v26;
          v41.size.width = v27;
          v41.size.height = v28;
          v38.origin.x = v18;
          v38.origin.y = v20;
          v38.size.width = v22;
          v38.size.height = v24;
          if (!CGRectEqualToRect(v38, v41))
          {
            objc_msgSend(v14, "extent");
            v15 = -[CIImage imageByCroppingToRect:](v15, "imageByCroppingToRect:");
          }
        }
        if (v16)
          v15 = -[CIImage imageBySettingPropertiesNoCopy:](v15, "imageBySettingPropertiesNoCopy:", v16);
        if (objc_msgSend(v14, "colorSpace"))
        {
          if (CGColorSpaceGetModel((CGColorSpaceRef)objc_msgSend(v14, "colorSpace")) == kCGColorSpaceModelRGB)
            v15 = -[CIImage imageByTaggingWithColorSpace:](v15, "imageByTaggingWithColorSpace:", objc_msgSend(v14, "colorSpace"));
        }
        objc_msgSend(v4, "addObject:", v15);
        ++v13;
      }
      while (v7 != v13);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }
  return v4;
}

- (id)outputImage
{
  NSString **p_inputFilterName;
  NSString *inputFilterName;
  CIFilter *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSString *v24;
  id v25;
  uint64_t v26;
  void *v27;
  CIImage *v28;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSString **v47;
  void *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  _QWORD v59[4];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  p_inputFilterName = &self->inputFilterName;
  inputFilterName = self->inputFilterName;
  if (!inputFilterName)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v5 = +[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", inputFilterName, self->_dict);
  if (!v5)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v6 = -[CIFilter outputImage](v5, "outputImage");
  if (v6)
  {
    v46 = (void *)v6;
    v47 = p_inputFilterName;
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v48 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v8 = (void *)-[NSMutableDictionary allKeys](self->_dict, "allKeys");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v55 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
          v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v7, "addObject:", v14);
            objc_msgSend(v48, "addObject:", v13);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      }
      while (v10);
    }
    v45 = v7;
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v16 = (void *)-[NSMutableDictionary allKeys](self->_dict, "allKeys");
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v51 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
          v22 = -[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", v21);
          if (v22)
          {
            v23 = v22;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, v21);
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      }
      while (v18);
    }
    v24 = *v47;
    v58[0] = CFSTR("filterName");
    v58[1] = CFSTR("filterParameters");
    v59[0] = v24;
    v59[1] = v15;
    v58[2] = CFSTR("inputImages");
    v25 = -[CIMetalWrapper dummyImagesForImages:](self, "dummyImagesForImages:", v45);
    v58[3] = CFSTR("inputImageKeys");
    v59[2] = v25;
    v59[3] = v48;
    v26 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 4);
    v49 = 0;
    v27 = v46;
    objc_msgSend(v46, "extent");
    v28 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CIMetalProcessor, "applyWithExtent:inputs:arguments:error:", v45, v26, &v49);
    if (!v28)
    {
      v38 = ci_logger_api();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[CIMetalWrapper outputImage].cold.2((uint64_t)v47, v38, v39, v40, v41, v42, v43, v44);
      return v27;
    }
    return +[CIImage imageForRenderingWithMetal:orNonMetal:](CIImage, "imageForRenderingWithMetal:orNonMetal:", v46, v28);
  }
  else
  {
    v31 = ci_logger_api();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[CIMetalWrapper outputImage].cold.1((uint64_t)p_inputFilterName, v31, v32, v33, v34, v35, v36, v37);
    return +[CIImage emptyImage](CIImage, "emptyImage");
  }
}

- (NSMutableDictionary)_dict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)set_dict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)inputFilterName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputFilterName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void)outputImage
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a2, a3, "Unable to create Metal wrapper image for filter %{public}@; will not render on OpenGL/OpenCL based CIContexts.",
    a5,
    a6,
    a7,
    a8,
    2u);
}

@end
