@implementation ISGenerationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISGenerationRequest)init
{
  ISGenerationRequest *v2;
  void *v3;
  void *v5;
  unint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ISGenerationRequest;
  v2 = -[ISGenerationRequest init](&v7, sel_init);
  if (v2)
  {
    v5 = 0;
    v6 = 0;
    objc_msgSend(MEMORY[0x1E0CA5900], "_is_getSequenceNumber:andUUID:", &v6, &v5);
    v3 = v5;
    v2->_lsDatabaseSequenceNumber = v6;
    objc_storeStrong((id *)&v2->_lsDatabaseUUID, v3);
  }
  return v2;
}

- (ISGenerationRequest)initWithCoder:(id)a3
{
  id v4;
  ISGenerationRequest *v5;
  uint64_t v6;
  ISImageDescriptor *imageDescriptor;
  uint64_t v8;
  ISConcreteIcon *icon;
  uint64_t v10;
  NSUUID *lsDatabaseUUID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ISGenerationRequest;
  v5 = -[ISGenerationRequest init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageDescriptor"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageDescriptor = v5->_imageDescriptor;
    v5->_imageDescriptor = (ISImageDescriptor *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
    v8 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (ISConcreteIcon *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lsDatabaseUUID"));
    v10 = objc_claimAutoreleasedReturnValue();
    lsDatabaseUUID = v5->_lsDatabaseUUID;
    v5->_lsDatabaseUUID = (NSUUID *)v10;

    v5->_lsDatabaseSequenceNumber = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("lsDatabaseSequenceNumber"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  ISImageDescriptor *imageDescriptor;
  id v5;

  imageDescriptor = self->_imageDescriptor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", imageDescriptor, CFSTR("imageDescriptor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lsDatabaseUUID, CFSTR("lsDatabaseUUID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_lsDatabaseSequenceNumber, CFSTR("lsDatabaseSequenceNumber"));

}

- (ISConcreteIcon)icon
{
  return (ISConcreteIcon *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIcon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (ISImageDescriptor)imageDescriptor
{
  return (ISImageDescriptor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImageDescriptor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSUUID)lsDatabaseUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLsDatabaseUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)lsDatabaseSequenceNumber
{
  return self->_lsDatabaseSequenceNumber;
}

- (void)setLsDatabaseSequenceNumber:(unint64_t)a3
{
  self->_lsDatabaseSequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lsDatabaseUUID, 0);
  objc_storeStrong((id *)&self->_imageDescriptor, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

- (id)_decorationRecipeKeyFromTypeIdentifier:(id)a3 position:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  __objc2_class *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  id v16;
  void *v17;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.icon-decoration.emboss"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "conformsToType:", v7);

  if (v8)
  {
    v9 = ISCenterEmbossRecipe;
LABEL_9:
    v16 = objc_alloc_init(v9);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.icon-decoration-position.trailing-bottom"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "conformsToType:", v10);

  if (v11)
  {
    v9 = ISTrailingStatusBadgeRecipe;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.icon-decoration-position.leading-bottom"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "conformsToType:", v12);

  if (v13)
  {
    v9 = ISLeadingStatusBadgeRecipe;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.icon-decoration.system"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "conformsToType:", v14);

  if (v15)
  {
    v9 = ISGenericRecipe;
    goto LABEL_9;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.icon-decoration.folderbadge")) && a4 != 3)
  {
    v17 = 0;
    goto LABEL_11;
  }
  v16 = (id)objc_opt_new();
LABEL_10:
  v17 = v16;
LABEL_11:

  return v17;
}

- (id)generateImage
{
  return -[ISGenerationRequest generateImageReturningRecordIdentifiers:](self, "generateImageReturningRecordIdentifiers:", 0);
}

- (id)generateImageReturningRecordIdentifiers:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char isKindOfClass;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  uint64_t v65;
  void *v66;
  BOOL v67;
  void *v68;
  ISCompositor *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  BOOL v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  BOOL v92;
  char v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  uint64_t v106;
  NSObject *v107;
  _BOOL4 v109;
  ISCompositorElement *v110;
  void *v111;
  void *v112;
  id *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  ISCompositor *v120;
  ISGenerationRequest *v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  const __CFString *v126;
  uint64_t v127;
  const __CFString *v128;
  void *v129;
  const __CFString *v130;
  void *v131;
  uint8_t v132[128];
  uint8_t buf[4];
  void *v134;
  __int16 v135;
  void *v136;
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  -[ISGenerationRequest imageDescriptor](self, "imageDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v121 = self;
  -[ISGenerationRequest icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _ISDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v134 = v7;
    v135 = 2112;
    v136 = v6;
    _os_log_impl(&dword_1AA928000, v8, OS_LOG_TYPE_INFO, "ISA_GENERATEING_IMAGE for %@ : %@", buf, 0x16u);
  }

  if (v6)
  {
    _ISPrepareISIconSignpostLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_enabled(v9);

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ISA_GENERATEING_IMAGE for %@ : %@");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v11, v7, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_eventPrepareISIconSignpost:message:", v6, v12);

    }
  }
  objc_msgSend(v7, "makeResourceProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "resolveIconResource");
    objc_msgSend(v14, "configureProviderFromDescriptor:", v6);
    v120 = objc_alloc_init(ISCompositor);
    objc_msgSend(v14, "customRecipe");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v14, "customRecipe");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = v14;
    }
    v18 = v16;
    +[ISRecipeFactory factoryWithDescriptor:resourceProvider:](ISRecipeFactory, "factoryWithDescriptor:resourceProvider:", v6, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "recipe");
    v20 = objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "isGenericProvider")
      && (objc_msgSend(v6, "shape") == 5 || objc_msgSend(v6, "shape") == 6))
    {
      v21 = (void *)MEMORY[0x1E0D3A7C8];
      objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "imageBagWithResourcesNamed:fromBundle:", CFSTR("AppClipDefaultIcon"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setIconResource:", v23);

    }
    if (objc_msgSend(v6, "shape") == 5
      || objc_msgSend(v6, "shape") == 6
      || (objc_msgSend(v14, "suggestedRecipe"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v24,
          (isKindOfClass & 1) != 0))
    {
      -[ISCompositor setRenderingMode:](v120, "setRenderingMode:", 2);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISCompositor setRenderingMode:](v120, "setRenderingMode:", 2);
    -[ISGenerationRequest iconSpecificationFromRecipe:](v121, "iconSpecificationFromRecipe:", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v28 = v27;
    v30 = v29;
    objc_msgSend(v6, "scale");
    objc_msgSend(v26, "imageSpecificationForSize:scale:", v28, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "size");
    v34 = v33;
    objc_msgSend(v26, "maxSize");
    v111 = v26;
    if (v34 == v35 && (objc_msgSend(v32, "size"), v37 = v36, objc_msgSend(v26, "maxSize"), v37 == v38))
    {
      objc_msgSend(v32, "scale");
      v40 = v39;
      objc_msgSend(v26, "maxScale");
      v109 = v40 == v41;
    }
    else
    {
      v109 = 0;
    }
    v113 = a3;
    v114 = v32;
    objc_msgSend(v14, "iconResource");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v43 = objc_opt_isKindOfClass();

    if ((v43 & 1) != 0)
    {
      objc_msgSend(v14, "iconResource");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "updateDescriptorWithImageDescriptor:", v6);

    }
    v118 = v6;
    v119 = v14;
    v115 = (void *)v20;
    v112 = v18;
    v110 = -[ISCompositorElement initWithRecipe:resourceProvider:]([ISCompositorElement alloc], "initWithRecipe:resourceProvider:", v20, v18);
    -[ISCompositor addElement:](v120, "addElement:");
    v45 = (void *)objc_opt_new();
    objc_msgSend(v7, "decorations");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObjectsFromArray:", v46);

    objc_msgSend(MEMORY[0x1E0CA5898], "coreTypesBundleRecord");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "bundleIdentifier");
    v116 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordWithIdentifier:", CFSTR("com.apple.icon-decoration.system"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = 0u;
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    v48 = v45;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v122, v132, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v123;
      do
      {
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v123 != v51)
            objc_enumerationMutation(v48);
          v53 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * i);
          v54 = objc_msgSend(v53, "identifierKind");
          if (v54 == 1)
          {
            objc_msgSend(v53, "position");
            v57 = (void *)objc_opt_new();
            v71 = (void *)MEMORY[0x1E0CA5898];
            objc_msgSend(v53, "identifier");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v72, 1, 0);
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            +[ISResourceProvider resourceWithRecord:options:](ISResourceProvider, "resourceWithRecord:options:", v66, 0);
            v73 = objc_claimAutoreleasedReturnValue();
            v68 = (void *)v73;
            if (v57)
              v74 = v73 == 0;
            else
              v74 = 1;
            if (!v74)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v68, "updateDescriptorWithImageDescriptor:", v118);
              v128 = CFSTR("kISPrimaryResourceKey");
              v129 = v68;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              -[ISCompositor addElementWithRecipe:resources:](v120, "addElementWithRecipe:resources:", v57, v75);

            }
            goto LABEL_59;
          }
          if (v54 == 3)
          {
            objc_msgSend(v53, "identifier");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[ISGenerationRequest _decorationRecipeKeyFromTypeIdentifier:position:](v121, "_decorationRecipeKeyFromTypeIdentifier:position:", v64, objc_msgSend(v53, "position"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v53, "compositorResource");
            v65 = objc_claimAutoreleasedReturnValue();
            v66 = (void *)v65;
            if (v57)
              v67 = v65 == 0;
            else
              v67 = 1;
            if (v67)
              goto LABEL_60;
            v126 = CFSTR("kISPrimaryResourceKey");
            v127 = v65;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = v120;
            v70 = v57;
LABEL_58:
            -[ISCompositor addElementWithRecipe:resources:](v69, "addElementWithRecipe:resources:", v70, v68);
LABEL_59:

            goto LABEL_60;
          }
          if (v54 != 2)
            continue;
          objc_msgSend(v119, "decorationResources");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "uuid");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "objectForKeyedSubscript:", v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v57)
          {
            v58 = (void *)MEMORY[0x1E0CA5928];
            objc_msgSend(v53, "identifier");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "typeRecordWithIdentifier:", v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v60, "conformsToTypeRecord:", v117)
              && (objc_msgSend(v60, "declaringBundleRecord"),
                  v61 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v61, "bundleIdentifier"),
                  v62 = (void *)objc_claimAutoreleasedReturnValue(),
                  v63 = objc_msgSend(v62, "isEqualToString:", v116),
                  v62,
                  v61,
                  !v63))
            {
              v57 = 0;
            }
            else
            {
              +[ISResourceProvider resourceWithRecord:options:](ISResourceProvider, "resourceWithRecord:options:", v60, 0);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
            }

          }
          objc_msgSend(v53, "identifier");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          -[ISGenerationRequest _decorationRecipeKeyFromTypeIdentifier:position:](v121, "_decorationRecipeKeyFromTypeIdentifier:position:", v76, objc_msgSend(v53, "position"));
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          if (v66 && v57)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v57, "updateDescriptorWithImageDescriptor:", v118);
            v130 = CFSTR("kISPrimaryResourceKey");
            v131 = v57;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = v120;
            v70 = v66;
            goto LABEL_58;
          }
LABEL_60:

        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v122, v132, 16);
      }
      while (v50);
    }

    v77 = v114;
    objc_msgSend(v114, "size");
    v79 = v78;
    v81 = v80;
    v6 = v118;
    objc_msgSend(v118, "size");
    v83 = v82;
    objc_msgSend(v118, "size");
    if (v83 == v84)
    {
      v85 = v115;
      if (v81 != v79)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v114, "size");
          v87 = v86;
          objc_msgSend(v114, "size");
          v89 = v88;
          objc_msgSend(v114, "size");
          v92 = v87 <= v89;
          if (v87 > v89)
            v81 = v90;
          else
            v81 = v91;
          if (v92)
            v79 = v91;
          else
            v79 = v90;
        }
      }
    }
    else
    {
      v85 = v115;
    }
    objc_opt_class();
    v93 = objc_opt_isKindOfClass();
    v94 = round(v79 * 1.18);
    v95 = round(v81 * 1.18);
    if ((v93 & 1) != 0)
      v96 = v94;
    else
      v96 = v79;
    if ((v93 & 1) != 0)
      v97 = v95;
    else
      v97 = v81;
    objc_msgSend(v114, "scale");
    -[ISCompositor imageForSize:scale:](v120, "imageForSize:scale:", v96, v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "minimumSize");
    objc_msgSend(v99, "setMinimumSize:");
    objc_msgSend(v99, "setIconSize:", v79, v81);
    objc_msgSend(v99, "bitmapData");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_alloc(MEMORY[0x1E0D3A7C0]);
    objc_msgSend(v119, "validationToken");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v101, "initWithData:uuid:validationToken:", v100, 0, v102);

    objc_msgSend(v17, "setLargest:", v109);
    if (v113)
    {
      objc_msgSend(v119, "sourceRecordIdentifiers");
      v103 = objc_claimAutoreleasedReturnValue();
      if (v103
        && (v104 = (void *)v103,
            objc_msgSend(v119, "sourceRecordIdentifiers"),
            v105 = (void *)objc_claimAutoreleasedReturnValue(),
            v106 = objc_msgSend(v105, "count"),
            v105,
            v104,
            v106))
      {
        objc_msgSend(v119, "sourceRecordIdentifiers");
        *v113 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        _ISDefaultLog();
        v107 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v134 = v119;
          v135 = 2112;
          v136 = v7;
          _os_log_impl(&dword_1AA928000, v107, OS_LOG_TYPE_DEFAULT, "Resource provider %@ for %@ has no record identifiers", buf, 0x16u);
        }

      }
      v77 = v114;
      v85 = v115;
    }

    v14 = v119;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)iconSpecificationFromRecipe:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "iconSpecification");
  else
    objc_msgSend(MEMORY[0x1E0D3A7B8], "defaultIconSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
