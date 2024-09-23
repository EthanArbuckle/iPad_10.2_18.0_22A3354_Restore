@implementation AAUIUpdateMyPhotoRequest

- (AAUIUpdateMyPhotoRequest)initWithAccount:(id)a3 photo:(id)a4 cropRect:(id)a5
{
  id v9;
  id v10;
  id v11;
  AAUIUpdateMyPhotoRequest *v12;
  AAUIUpdateMyPhotoRequest *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AAUIUpdateMyPhotoRequest;
  v12 = -[AAUIUpdateMyPhotoRequest init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    objc_storeStrong((id *)&v13->_photo, a4);
    objc_storeStrong((id *)&v13->_cropRect, a5);
  }

  return v13;
}

- (id)urlString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CFAD58], "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateMyPhotoURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  NSValue *v5;
  uint64_t v6;
  void *v7;
  UIImage *photo;
  void *v9;
  AAUIProfilePictureStore *v10;
  AAUIProfilePictureStore *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v26;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)AAUIUpdateMyPhotoRequest;
  -[AARequest urlRequest](&v27, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", CFSTR("text/plain"), CFSTR("Content-Type"));
  v5 = self->_cropRect;
  +[AAUIUpdateMyPhotoRequest _downsampleImage:fromStartingQuality:toEndingQuality:increment:maxLength:](AAUIUpdateMyPhotoRequest, "_downsampleImage:fromStartingQuality:toEndingQuality:increment:maxLength:", self->_photo, 86016, 1.0, 0.59, 0.2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
  }
  else
  {
    if (v5)
    {
      photo = self->_photo;
      v26 = 0;
      +[AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage:cropRect:fullScreenCropRect:](AAUIUpdateMyPhotoRequest, "_fullScreen2ImageFromImage:cropRect:fullScreenCropRect:", photo, v5, &v26);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (AAUIProfilePictureStore *)v26;
      v11 = v10;
      if (v10)
      {
        v11 = v10;

        v5 = (NSValue *)v11;
      }
    }
    else
    {
      _AAUILogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB4ED000, v12, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest: Both photoData and cropRect are nil i.e photo is nil. Setting the picture as the default monogram.", buf, 2u);
      }

      v11 = objc_alloc_init(AAUIProfilePictureStore);
      -[AAUIProfilePictureStore monogramForCurrentAccount](v11, "monogramForCurrentAccount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0;
    }

    +[AAUIUpdateMyPhotoRequest _downsampleImage:fromStartingQuality:toEndingQuality:increment:maxLength:](AAUIUpdateMyPhotoRequest, "_downsampleImage:fromStartingQuality:toEndingQuality:increment:maxLength:", v9, 86016, 1.0, 0.19, 0.2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "base64EncodedDataWithOptions:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _AAUILogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v29 = v15;
    v30 = 2112;
    v31 = v16;
    _os_log_impl(&dword_1DB4ED000, v14, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest setting HTTPBody to base64 data of length %@ from photo data of length %@", buf, 0x16u);

  }
  objc_msgSend(v4, "setHTTPBody:", v13);
  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "HTTPBody");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v18, "length"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v19, CFSTR("Content-Length"));
  if (v7 && v5)
  {
    -[NSValue CGRectValue](v5, "CGRectValue");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu,%lu,%lu,%lu"), (unint64_t)v22, (unint64_t)v23, (unint64_t)v20, (unint64_t)v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", v24, CFSTR("X-MMe-Setup-Family-Photo"));

  }
  return v4;
}

+ (id)_downsampleImage:(id)a3 fromStartingQuality:(double)a4 toEndingQuality:(double)a5 increment:(double)a6 maxLength:(unint64_t)a7
{
  UIImage *v11;
  __int128 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v11 = (UIImage *)a3;
  if (a4 > a5)
  {
    v13 = 0;
    *(_QWORD *)&v12 = 138412546;
    v20 = v12;
    do
    {
      v14 = v13;
      UIImageJPEGRepresentation(v11, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      _AAUILogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "length"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v20;
        v22 = v16;
        v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_1DB4ED000, v15, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest compressed image to quality %@ down to length %@", buf, 0x16u);

      }
      if (objc_msgSend(v13, "length") <= a7)
        break;
      a4 = a4 - a6;
    }
    while (a4 > a5);
    if (objc_msgSend(v13, "length", v20) <= a7)
    {
      if (v13)
        goto LABEL_15;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v13 = 0;
  if (objc_msgSend(0, "length") > a7)
LABEL_11:

LABEL_12:
  _AAUILogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    +[AAUIUpdateMyPhotoRequest _downsampleImage:fromStartingQuality:toEndingQuality:increment:maxLength:].cold.1(v18);

  v13 = 0;
LABEL_15:

  return v13;
}

+ (id)_fullScreen2ImageFromImage:(id)a3 cropRect:(id)a4 fullScreenCropRect:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  NSObject *v27;
  void *v28;
  double v29;
  double v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  double v35;
  double v36;
  NSObject *v37;
  void *v38;
  double v39;
  double v40;
  NSObject *v41;
  void *v42;
  double v43;
  void *v44;
  NSObject *v45;
  void *v46;
  double v47;
  double v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  double v53;
  double v54;
  NSObject *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  NSObject *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  id v71;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  uint8_t buf[4];
  id v79;
  __int16 v80;
  id v81;
  uint64_t v82;
  CGSize v83;

  v82 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _AAUILogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v7, "size");
    objc_msgSend(v10, "valueWithCGSize:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v79 = v11;
    v80 = 2112;
    v81 = v8;
    _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage: of size %@ cropRect: %@", buf, 0x16u);

  }
  if (v8)
  {
    objc_msgSend(v8, "CGRectValue");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
  }
  else
  {
    objc_msgSend(v7, "size");
    v17 = v20;
    objc_msgSend(v7, "size");
    v19 = v21;
    v13 = 0.0;
    v15 = 0.0;
  }
  _AAUILogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v13, v15, v17, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v79 = v23;
    _os_log_impl(&dword_1DB4ED000, v22, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage using importantArea %@", buf, 0xCu);

  }
  _AAUILogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  v75 = v13;
  v76 = v17;
  v73 = v15;
  v74 = v19;
  if (v17 / v19 <= 0.666666667)
  {
    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17 / v19);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v79 = v44;
      _os_log_impl(&dword_1DB4ED000, v24, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage detected narrow importantAreaAspectRatio %@", buf, 0xCu);

    }
    v77 = 960.0 / v19;
    _AAUILogSystem();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v77);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v79 = v46;
      _os_log_impl(&dword_1DB4ED000, v45, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage using scale %@", buf, 0xCu);

    }
    objc_msgSend(v7, "size");
    if (v19 * 0.666666667 >= v47)
      v48 = v47;
    else
      v48 = v19 * 0.666666667;
    v43 = v13 - floor((v48 - v17) * 0.5);
    _AAUILogSystem();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v43, v15, v48, v19);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v79 = v50;
      _os_log_impl(&dword_1DB4ED000, v49, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage got preliminary sourcePortionOfBaseImage %@", buf, 0xCu);

    }
    if (v43 < 0.0)
    {
      _AAUILogSystem();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, v15, v48, v19);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v79 = v52;
        _os_log_impl(&dword_1DB4ED000, v51, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage constrained sourcePortionOfBaseImage left => %@", buf, 0xCu);

      }
      v43 = 0.0;
    }
    objc_msgSend(v7, "size");
    if (v48 + v43 > v53)
    {
      objc_msgSend(v7, "size");
      v43 = v54 - v48;
      _AAUILogSystem();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v43, v15, v48, v19);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v79 = v56;
        _os_log_impl(&dword_1DB4ED000, v55, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage constrained sourcePortionOfBaseImage right => %@", buf, 0xCu);

      }
    }
    v40 = 960.0;
    v39 = floor(v48 * 960.0 / v19);
    _AAUILogSystem();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v40 = 960.0;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v39, 960.0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v79 = v57;
      _os_log_impl(&dword_1DB4ED000, v41, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage using contextSize %@", buf, 0xCu);

    }
  }
  else
  {
    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17 / v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v79 = v26;
      _os_log_impl(&dword_1DB4ED000, v24, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage detected squat importantAreaAspectRatio %@", buf, 0xCu);

    }
    v77 = 640.0 / v17;
    _AAUILogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v77);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v79 = v28;
      _os_log_impl(&dword_1DB4ED000, v27, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage using scale %@", buf, 0xCu);

    }
    objc_msgSend(v7, "size");
    if (v17 / 0.666666667 >= v29)
      v30 = v29;
    else
      v30 = v17 / 0.666666667;
    v15 = v15 - floor((v30 - v19) * 0.5);
    _AAUILogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v13, v15, v17, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v79 = v32;
      _os_log_impl(&dword_1DB4ED000, v31, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage got preliminary sourcePortionOfBaseImage %@", buf, 0xCu);

    }
    if (v15 < 0.0)
    {
      _AAUILogSystem();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v13, 0.0, v17, v30);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v79 = v34;
        _os_log_impl(&dword_1DB4ED000, v33, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage constrained sourcePortionOfBaseImage top => %@", buf, 0xCu);

      }
      v15 = 0.0;
    }
    objc_msgSend(v7, "size");
    if (v30 + v15 > v35)
    {
      objc_msgSend(v7, "size");
      v15 = v36 - v30;
      _AAUILogSystem();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v13, v15, v17, v30);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v79 = v38;
        _os_log_impl(&dword_1DB4ED000, v37, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage constrained sourcePortionOfBaseImage bottom => %@", buf, 0xCu);

      }
    }
    v39 = 640.0;
    v40 = floor(v30 * 640.0 / v17);
    _AAUILogSystem();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v39 = 640.0;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 640.0, v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v79 = v42;
      _os_log_impl(&dword_1DB4ED000, v41, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage using contextSize %@", buf, 0xCu);

    }
    v43 = v13;
  }

  v58 = -(v43 * v77);
  objc_msgSend(v7, "size");
  v60 = v77 * v59;
  v61 = -(v15 * v77);
  objc_msgSend(v7, "size");
  v63 = v77 * v62;
  _AAUILogSystem();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v58, v61, v60, v63);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v79 = v65;
    _os_log_impl(&dword_1DB4ED000, v64, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage using drawRect %@", buf, 0xCu);

  }
  v83.width = v39;
  v83.height = v40;
  UIGraphicsBeginImageContext(v83);
  objc_msgSend(v7, "drawInRect:", v58, v61, v60, v63);
  UIGraphicsGetImageFromCurrentImageContext();
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  _AAUILogSystem();
  v67 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    v68 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v66, "size");
    objc_msgSend(v68, "valueWithCGSize:");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v79 = v69;
    _os_log_impl(&dword_1DB4ED000, v67, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage created fullScreen2Image with size %@", buf, 0xCu);

  }
  if (v8 && a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", ceil((v75 - v43) * v77), ceil((v73 - v15) * v77), floor(v76 * v77), floor(v74 * v77));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    _AAUILogSystem();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      v71 = *a5;
      *(_DWORD *)buf = 138412290;
      v79 = v71;
      _os_log_impl(&dword_1DB4ED000, v70, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage created fullScreenCropRect %@", buf, 0xCu);
    }

  }
  return v66;
}

- (UIImage)photo
{
  return self->_photo;
}

- (NSValue)cropRect
{
  return self->_cropRect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropRect, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

+ (void)_downsampleImage:(os_log_t)log fromStartingQuality:toEndingQuality:increment:maxLength:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "AAUIUpdateMyPhotoRequest we tried to compress and failed to get a small enough image.", v1, 2u);
}

@end
