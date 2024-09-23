@implementation INUIPortableImageLoaderHelper

- (void)loadImageSizeFromData:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:", v5);
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "size");
      v6[2](v6, 0);
    }
    else
    {
      v9 = (void *)*MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        v13 = v9;
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 136315650;
        v17 = "-[INUIPortableImageLoaderHelper loadImageSizeFromData:completion:]";
        v18 = 2114;
        v19 = v15;
        v20 = 2048;
        v21 = objc_msgSend(v5, "length");
        _os_log_error_impl(&dword_1DC055000, v13, OS_LOG_TYPE_ERROR, "%s Failed to load image size from data: %{public}@, %lu bytes", (uint8_t *)&v16, 0x20u);

      }
      v10 = *MEMORY[0x1E0C9D820];
      v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CBD458], 6003, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(id, _QWORD), void *, double, double))v6[2])(v6, v12, v10, v11);

    }
  }

}

- (void)loadImageDataFromBundle:(id)a3 withImageName:(id)a4 accessSpecifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, uint64_t, id, double, double);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  UIImage *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  unint64_t v69;
  _QWORD v70[4];
  id v71;
  double v72;
  double v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  _QWORD v77[3];

  v77[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, uint64_t, id, double, double))a6;
  if (!v13)
    goto LABEL_31;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CBD930], "accessSpecifierWithNoAccess");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v10, "bundleType") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 44.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[INUIPortableImageLoaderHelper traitCollection](self, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "userInterfaceStyle") == 1)
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", v11, v14);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "imageWithTintColor:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "size");
    v35 = v34;
    objc_msgSend(v33, "size");
    if (v35 < v36)
      v35 = v36;
    v37 = objc_alloc(MEMORY[0x1E0CEA610]);
    v38 = (void *)MEMORY[0x1E0CEA618];
    -[INUIPortableImageLoaderHelper traitCollection](self, "traitCollection");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "formatForTraitCollection:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v37, "initWithSize:format:", v40, v35, v35);

    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __98__INUIPortableImageLoaderHelper_loadImageDataFromBundle_withImageName_accessSpecifier_completion___block_invoke;
    v70[3] = &unk_1EA43A438;
    v71 = v33;
    v72 = v35;
    v73 = v35;
    v42 = v33;
    objc_msgSend(v41, "imageWithActions:", v70);
    v30 = (UIImage *)objc_claimAutoreleasedReturnValue();

    v29 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v10, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_9;
  v17 = (void *)MEMORY[0x1E0CA5890];
  objc_msgSend(v10, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleProxyForIdentifier:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "bundleURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
LABEL_9:
    objc_msgSend(v10, "bundlePath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v23 = *MEMORY[0x1E0CBD458];
  v64 = *MEMORY[0x1E0CB2938];
  v76 = *MEMORY[0x1E0CB2938];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Loader client does not have sufficient permissions to load bundle image %@ %@"), v11, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v23;
  v26 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 6010, v25);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v21);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v12, "accessLevel");
  if (v28 == 1)
  {
    v43 = (void *)MEMORY[0x1E0CA5890];
    objc_msgSend(v12, "associatedAppBundleIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bundleProxyForIdentifier:", v44);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "bundleURL");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v62 = v29;
    if (!v29)
      goto LABEL_20;
    v69 = 2;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "bundleURL");
    v66 = v26;
    v68 = 0;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v69, v46, v29, &v68);
    v29 = v68;

    v26 = v66;
    if (v69 >= 2)
    {
LABEL_20:
      v47 = v27;
      v48 = v26;
      v49 = v26;

      v29 = v49;
      v26 = v48;
      v27 = v47;
    }

    if (v29)
      goto LABEL_13;
LABEL_22:
    v67 = v26;
    v50 = (void *)MEMORY[0x1E0CEA638];
    -[INUIPortableImageLoaderHelper traitCollection](self, "traitCollection");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "imageNamed:inBundle:compatibleWithTraitCollection:", v11, v27, v51);
    v30 = (UIImage *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v29 = 0;
    }
    else
    {
      v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v74 = v64;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load image from bundle %@"), v21);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v53;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v65, 6000, v54);

      v30 = 0;
    }
    v26 = v67;
    goto LABEL_26;
  }
  if (v28)
    goto LABEL_22;
  v29 = v26;
  if (!v29)
    goto LABEL_22;
LABEL_13:
  v30 = 0;
LABEL_26:

LABEL_27:
  -[UIImage size](v30, "size");
  v56 = v55;
  v58 = v57;
  v59 = -[UIImage renderingMode](v30, "renderingMode");
  if (v59 == 2)
    v60 = 2;
  else
    v60 = v59 == 1;
  UIImagePNGRepresentation(v30);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2](v13, v61, v60, v29, v56, v58);

LABEL_31:
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INUIPortableImageLoaderHelper traitCollection](self, "traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("traitCollection"));

}

- (INUIPortableImageLoaderHelper)initWithCoder:(id)a3
{
  id v4;
  INUIPortableImageLoaderHelper *v5;
  uint64_t v6;
  UITraitCollection *traitCollection;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INUIPortableImageLoaderHelper;
  v5 = -[INUIPortableImageLoaderHelper init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("traitCollection"));
    v6 = objc_claimAutoreleasedReturnValue();
    traitCollection = v5->_traitCollection;
    v5->_traitCollection = (UITraitCollection *)v6;

  }
  return v5;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

uint64_t __98__INUIPortableImageLoaderHelper_loadImageDataFromBundle_withImageName_accessSpecifier_completion___block_invoke(uint64_t a1)
{
  double v2;
  CGFloat v3;
  double v4;
  void *v5;
  CGRect v7;
  CGRect v8;

  objc_msgSend(*(id *)(a1 + 32), "size");
  v3 = v2 + -14.0;
  objc_msgSend(*(id *)(a1 + 32), "size");
  v7.size.height = v4 + -14.0;
  v5 = *(void **)(a1 + 32);
  v7.origin.x = (*(double *)(a1 + 40) - v3) * 0.5;
  v7.origin.y = (*(double *)(a1 + 48) - (v4 + -14.0)) * 0.5;
  v7.size.width = v3;
  v8 = CGRectIntegral(v7);
  return objc_msgSend(v5, "drawInRect:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
