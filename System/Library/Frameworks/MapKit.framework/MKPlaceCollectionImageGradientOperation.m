@implementation MKPlaceCollectionImageGradientOperation

- (MKPlaceCollectionImageGradientOperation)initWithUrl:(id)a3 size:(CGSize)a4 contentSizeCategory:(id)a5 name:(id)a6 downloadCache:(id)a7 gradientCache:(id)a8 isRTL:(BOOL)a9 screenScale:(double)a10 cacheId:(id)a11
{
  CGFloat height;
  CGFloat width;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v28;
  id v29;
  objc_super v30;

  height = a4.height;
  width = a4.width;
  v20 = a3;
  v29 = a5;
  v28 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a11;
  v30.receiver = self;
  v30.super_class = (Class)MKPlaceCollectionImageGradientOperation;
  -[MKPlaceCollectionImageGradientOperation self](&v30, sel_self);
  v24 = objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_storeStrong((id *)(v24 + 272), a3);
    *(CGFloat *)(v24 + 328) = width;
    *(CGFloat *)(v24 + 336) = height;
    objc_storeStrong((id *)(v24 + 296), a5);
    objc_storeStrong((id *)(v24 + 280), a6);
    objc_storeWeak((id *)(v24 + 312), v21);
    objc_storeWeak((id *)(v24 + 320), v22);
    *(_BYTE *)(v24 + 248) = a9;
    *(double *)(v24 + 288) = a10;
    objc_storeStrong((id *)(v24 + 304), a11);
    objc_msgSend(v20, "absoluteString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v24, "setName:", v25);

  }
  return (MKPlaceCollectionImageGradientOperation *)v24;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
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
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  CGImage *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;
  CGSize v93;

  v92 = *MEMORY[0x1E0C80C00];
  -[MKPlaceCollectionImageGradientOperation downloadCache](self, "downloadCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionImageGradientOperation url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionImageGradientOperation setSourceImage:](self, "setSourceImage:", v6);

  if (-[MKPlaceCollectionImageGradientOperation isCancelled](self, "isCancelled"))
  {
    MKGetCuratedCollectionsLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[MKPlaceCollectionImageGradientOperation cacheId](self, "cacheId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v89 = v8;
      v9 = "[Step-1]Blurring Operation is cancelled for: %@";
LABEL_8:
      _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_DEBUG, v9, buf, 0xCu);
LABEL_11:

    }
  }
  else
  {
    -[MKPlaceCollectionImageGradientOperation sourceImage](self, "sourceImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = -[MKPlaceCollectionImageGradientOperation isCancelled](self, "isCancelled");
      MKGetCuratedCollectionsLog();
      v7 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
      if (v11)
      {
        if (v12)
        {
          -[MKPlaceCollectionImageGradientOperation cacheId](self, "cacheId");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v89 = v8;
          v9 = "[Step-2]Gradient Operation is cancelled for: %@";
          goto LABEL_8;
        }
      }
      else
      {
        if (v12)
        {
          -[MKPlaceCollectionImageGradientOperation sourceImage](self, "sourceImage");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKPlaceCollectionImageGradientOperation desiredSize](self, "desiredSize");
          NSStringFromCGSize(v93);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v89 = v14;
          v90 = 2112;
          v91 = (uint64_t)v15;
          _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_DEBUG, "Starting gradient for Image: %@ with size: %@", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v7 = objc_claimAutoreleasedReturnValue();
        +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "screenScale");
        v18 = v17;

        if (qword_1ECE2D6E8 != -1)
          dispatch_once(&qword_1ECE2D6E8, &__block_literal_global_53);
        v19 = objc_alloc(MEMORY[0x1E0C9DDC8]);
        -[MKPlaceCollectionImageGradientOperation sourceImage](self, "sourceImage");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v19, "initWithImage:", v20);

        -[MKPlaceCollectionImageGradientOperation desiredSize](self, "desiredSize");
        v23 = v22;
        objc_msgSend(v21, "extent");
        v25 = v23 / v24;
        -[MKPlaceCollectionImageGradientOperation desiredSize](self, "desiredSize");
        v27 = v26;
        objc_msgSend(v21, "extent");
        if (v25 <= v27 / v28)
          v29 = v27 / v28;
        else
          v29 = v25;
        objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CILanczosScaleTransform"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = *MEMORY[0x1E0C9E1F8];
        v87 = v21;
        objc_msgSend(v30, "setValue:forKey:", v21);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setValue:forKey:", v31, *MEMORY[0x1E0C9E268]);

        objc_msgSend(v30, "setValue:forKey:", &unk_1E21584F0, *MEMORY[0x1E0C9E188]);
        v86 = v30;
        objc_msgSend(v30, "outputImage");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "extent");
        v34 = v33;
        v36 = v35 * 0.5;
        -[MKPlaceCollectionImageGradientOperation desiredSize](self, "desiredSize");
        v38 = v36 - v37 * 0.5;
        v39 = v34 * 0.5;
        -[MKPlaceCollectionImageGradientOperation desiredSize](self, "desiredSize");
        v41 = v34 * 0.5 - v40 * 0.5;
        -[MKPlaceCollectionImageGradientOperation desiredSize](self, "desiredSize");
        v43 = v42;
        -[MKPlaceCollectionImageGradientOperation desiredSize](self, "desiredSize");
        v45 = v44;
        v85 = v32;
        objc_msgSend(v32, "imageByClampingToRect:", v38, v41, v43, v44);
        v83 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISmoothLinearGradient"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 0.5, v39);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setValue:forKey:", v47, CFSTR("inputPoint0"));

        objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setValue:forKey:", v48, CFSTR("inputColor0"));

        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 0.5, v39 * 0.66);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setValue:forKey:", v49, CFSTR("inputPoint1"));

        objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.5);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setValue:forKey:", v50, CFSTR("inputColor1"));

        objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISmoothLinearGradient"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 0.5, v39);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setValue:forKey:", v52, CFSTR("inputPoint0"));

        objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setValue:forKey:", v53, CFSTR("inputColor0"));

        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 0.5, v39 * 0.38);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setValue:forKey:", v54, CFSTR("inputPoint1"));

        objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.6);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setValue:forKey:", v55, CFSTR("inputColor1"));

        objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIMultiplyBlendMode"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "outputImage");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setValue:forKey:", v57, v82);

        v84 = v46;
        objc_msgSend(v46, "outputImage");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = *MEMORY[0x1E0C9E190];
        objc_msgSend(v56, "setValue:forKey:", v58, *MEMORY[0x1E0C9E190]);

        if (-[MKPlaceCollectionImageGradientOperation isCancelled](self, "isCancelled"))
        {
          v60 = (void *)v83;
          MKGetCuratedCollectionsLog();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            -[MKPlaceCollectionImageGradientOperation cacheId](self, "cacheId");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v89 = v62;
            _os_log_impl(&dword_18B0B0000, v61, OS_LOG_TYPE_DEBUG, "[Step-3]Gradient Operation is cancelled for: %@", buf, 0xCu);

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISourceAtopCompositing"));
          v61 = objc_claimAutoreleasedReturnValue();
          v81 = v56;
          objc_msgSend(v56, "outputImage");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setValue:forKey:](v61, "setValue:forKey:", v63, v82);

          v60 = (void *)v83;
          -[NSObject setValue:forKey:](v61, "setValue:forKey:", v83, v59);
          -[NSObject outputImage](v61, "outputImage");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = (CGImage *)objc_msgSend((id)_MergedGlobals_3_2, "createCGImage:fromRect:", v38, v41, v43, v45);
          -[MKPlaceCollectionImageGradientOperation blurringCache](self, "blurringCache");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", v65, 0, v18);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKPlaceCollectionImageGradientOperation cacheId](self, "cacheId");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "setObject:forKey:", v67, v68);

          CGImageRelease(v65);
          MKGetCuratedCollectionsLog();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
          {
            -[MKPlaceCollectionImageGradientOperation blurringCache](self, "blurringCache");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            -[MKPlaceCollectionImageGradientOperation blurringCache](self, "blurringCache");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "allObjects");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend(v72, "count");
            *(_DWORD *)buf = 138412546;
            v89 = v70;
            v90 = 2048;
            v91 = v73;
            _os_log_impl(&dword_18B0B0000, v69, OS_LOG_TYPE_DEBUG, "Gradient cache %@ has %ld items.", buf, 0x16u);

          }
          MKGetCuratedCollectionsLog();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "timeIntervalSinceDate:", v7);
            v77 = v76;
            -[MKPlaceCollectionImageGradientOperation blurringCache](self, "blurringCache");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            -[MKPlaceCollectionImageGradientOperation cacheId](self, "cacheId");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "objectForKey:", v79);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v89 = v77;
            v90 = 2112;
            v91 = (uint64_t)v80;
            _os_log_impl(&dword_18B0B0000, v74, OS_LOG_TYPE_DEBUG, "[⌛]Completed applying gradient in: %f seconds. Image: %@", buf, 0x16u);

          }
          v56 = v81;
        }

      }
    }
    else
    {
      MKGetCuratedCollectionsLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        -[MKPlaceCollectionImageGradientOperation url](self, "url");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "absoluteString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v89 = v13;
        _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_ERROR, "[!]Operation shouldn't start unless we have source image. URL: %@", buf, 0xCu);

        goto LABEL_11;
      }
    }
  }

}

void __47__MKPlaceCollectionImageGradientOperation_main__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C9DD90];
  v1 = *MEMORY[0x1E0C9E110];
  v6[0] = *MEMORY[0x1E0C9DFB8];
  v6[1] = v1;
  v7[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "contextWithOptions:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_MergedGlobals_3_2;
  _MergedGlobals_3_2 = v4;

}

- (UIImage)sourceImage
{
  return self->_sourceImage;
}

- (void)setSourceImage:(id)a3
{
  objc_storeStrong((id *)&self->_sourceImage, a3);
}

- (UIImage)blurredImage
{
  return self->_blurredImage;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (CGSize)desiredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_desiredSize.width;
  height = self->_desiredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDesiredSize:(CGSize)a3
{
  self->_desiredSize = a3;
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void)setDebugName:(id)a3
{
  objc_storeStrong((id *)&self->_debugName, a3);
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
  objc_storeStrong((id *)&self->_contentSizeCategory, a3);
}

- (NSString)cacheId
{
  return self->_cacheId;
}

- (void)setCacheId:(id)a3
{
  objc_storeStrong((id *)&self->_cacheId, a3);
}

- (NSCache)downloadCache
{
  return (NSCache *)objc_loadWeakRetained((id *)&self->_downloadCache);
}

- (void)setDownloadCache:(id)a3
{
  objc_storeWeak((id *)&self->_downloadCache, a3);
}

- (NSCache)blurringCache
{
  return (NSCache *)objc_loadWeakRetained((id *)&self->_blurringCache);
}

- (void)setBlurringCache:(id)a3
{
  objc_storeWeak((id *)&self->_blurringCache, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_blurringCache);
  objc_destroyWeak((id *)&self->_downloadCache);
  objc_storeStrong((id *)&self->_cacheId, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_blurredImage, 0);
  objc_storeStrong((id *)&self->_sourceImage, 0);
}

@end
