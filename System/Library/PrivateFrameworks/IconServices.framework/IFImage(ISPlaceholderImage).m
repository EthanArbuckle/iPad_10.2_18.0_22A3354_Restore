@implementation IFImage(ISPlaceholderImage)

+ (NSObject)_placeholderImageWithImageDescriptor:()ISPlaceholderImage markAsPlaceholder:fallbackTypeID:referenceIcon:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  ISCompositor *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  uint8_t buf[4];
  NSObject *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  const __CFString *v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  +[ISStaticResources sharedInstance](ISStaticResources, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fallbackResourceForHint:descriptor:referenceObj:", v10, v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "digest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    v18 = v17;
    objc_msgSend(v9, "size");
    v20 = v19;
    objc_msgSend(v9, "scale");
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@,%.1f,%.1f,%.f"), v16, v18, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[ISStaticResources sharedInstance](ISStaticResources, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_findStaticImageWithKey:", v22);
    v24 = objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      +[ISRecipeFactory factoryWithDescriptor:](ISRecipeFactory, "factoryWithDescriptor:", v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "genericTaggedRecipe");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = objc_alloc_init(ISCompositor);
      if (objc_msgSend(v9, "shape") == 5 || objc_msgSend(v9, "shape") == 6)
        -[ISCompositor setRenderingMode:](v27, "setRenderingMode:", 2);
      v47 = CFSTR("kISPrimaryResourceKey");
      v48[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISCompositor addElementWithRecipe:resources:](v27, "addElementWithRecipe:resources:", v26, v28);

      objc_msgSend(v9, "size");
      v30 = v29;
      v32 = v31;
      objc_msgSend(v9, "scale");
      -[ISCompositor imageForSize:scale:](v27, "imageForSize:scale:", v30, v32, v33);
      v24 = objc_claimAutoreleasedReturnValue();
      if (!v24)
      {

        goto LABEL_16;
      }
      +[ISStaticResources sharedInstance](ISStaticResources, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "_addStaticImage:withKey:", v24, v22);

    }
    if (-[NSObject CGImage](v24, "CGImage"))
    {
      if (a4)
      {
        v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7D8]), "initWithImage:", v24);

        v24 = v35;
      }
      -[NSObject setValidationFlags:](v24, "setValidationFlags:", -[NSObject validationFlags](v24, "validationFlags") | 2);
      v24 = v24;
      v36 = v24;
LABEL_19:

      goto LABEL_20;
    }
LABEL_16:
    _ISDefaultLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138413058;
      v40 = v24;
      v41 = 2112;
      v42 = v10;
      v43 = 2112;
      v44 = v9;
      v45 = 2112;
      v46 = v11;
      _os_log_fault_impl(&dword_1AA928000, v37, OS_LOG_TYPE_FAULT, "Failed to create placeholder image. Image: %@. Fallback type: %@. Descriptor: %@. Icon: %@", buf, 0x2Au);
    }

    v36 = 0;
    goto LABEL_19;
  }
  _ISDefaultLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    +[IFImage(ISPlaceholderImage) _placeholderImageWithImageDescriptor:markAsPlaceholder:fallbackTypeID:referenceIcon:].cold.1((uint64_t)v10, v24);
  v36 = 0;
LABEL_20:

  return v36;
}

+ (void)_placeholderImageWithImageDescriptor:()ISPlaceholderImage markAsPlaceholder:fallbackTypeID:referenceIcon:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1AA928000, a2, OS_LOG_TYPE_FAULT, "Failed to create placeholder resource. Fallback type: %@", (uint8_t *)&v2, 0xCu);
}

@end
