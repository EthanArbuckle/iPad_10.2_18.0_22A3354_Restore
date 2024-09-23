@implementation _CNUILikenessRenderer

- (id)renderedLikenessesForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 workScheduler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  CNUIPRLikenessResolverOptions *v15;
  void *v16;
  CNUIPRLikenessResolverOptions *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = [CNUIPRLikenessResolverOptions alloc];
    objc_msgSend(v10, "color");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CNUIPRLikenessResolverOptions initWithMonogramColor:](v15, "initWithMonogramColor:", v16);

  }
  else
  {
    v17 = 0;
  }

  +[CNUILikenessFingerprint publicFingerprintForContacts:scope:](CNUILikenessFingerprint, "publicFingerprintForContacts:scope:", v13, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNUILikenessRenderer likenessProvidersForContacts:likenessResolverOptions:workScheduler:](self, "likenessProvidersForContacts:likenessResolverOptions:workScheduler:", v13, v17, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CNUILikenessRenderer renderedLikenessesForLikenessProviders:badges:scope:likenessFingerprint:](self, "renderedLikenessesForLikenessProviders:badges:scope:likenessFingerprint:", v19, v12, v10, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v13, "count");
  +[CNUICoreLogProvider likenesses_os_log](CNUICoreLogProvider, "likenesses_os_log");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v21 < 2)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "pointSize");
      v31 = v30;
      objc_msgSend(v10, "pointSize");
      v34 = 134218498;
      v35 = v31;
      v36 = 2048;
      v37 = v32;
      v38 = 2114;
      v39 = v18;
      _os_log_impl(&dword_1DD140000, v23, OS_LOG_TYPE_INFO, "[LikenessRenderer] New request for  rendered likeness {%.2f, %.2f} for: %{public}@", (uint8_t *)&v34, 0x20u);
    }
  }
  else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    -[_CNUILikenessRenderer renderedLikenessesForContacts:withBadges:scope:workScheduler:].cold.1((uint64_t)v18, v23, v24, v25, v26, v27, v28, v29);
  }

  return v20;
}

- (id)loadingPlaceholderForContactCount:(unint64_t)a3 scope:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  const __CFString *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  unint64_t v38;

  v6 = a4;
  v7 = +[CNUIPRLikenessResolver maxContacts](CNUIPRLikenessResolver, "maxContacts");
  if (v7 >= a3)
    v8 = a3;
  else
    v8 = v7;
  v9 = v6;
  objc_msgSend(v9, "pointSize");
  if (v8 <= 1)
  {
    v11 = 27.0;
    if (v10 >= 40.0)
      v11 = dbl_1DD1C8C70[v10 < 60.0];
  }
  else
  {
    v11 = 45.0;
  }
  objc_msgSend(v9, "pointSize");
  if (v11 == v12)
  {
    v13 = v9;
  }
  else
  {
    objc_msgSend(v9, "scale");
    v15 = v14;
    objc_msgSend(v9, "strokeWidth");
    v17 = v16;
    v18 = objc_msgSend(v9, "strokeColor");
    v19 = objc_msgSend(v9, "rightToLeft");
    v20 = objc_msgSend(v9, "style");
    v21 = objc_msgSend(v9, "backgroundStyle");
    objc_msgSend(v9, "color");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "maskedAvatarIndices");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUILikenessRenderingScope renderingScopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:](CNUILikenessRenderingScope, "renderingScopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:", v18, v19, v20, v21, v22, v23, v11, v11, v15, v17);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  v24 = (void *)MEMORY[0x1E0CB3940];
  v25 = v13;
  if (objc_msgSend(v25, "style") == 1)
    v26 = CFSTR("RR_");
  else
    v26 = &stru_1EA606688;
  objc_msgSend(v25, "pointSize");
  v28 = v27;
  if (v8 < 2)
  {

    objc_msgSend(v24, "stringWithFormat:", CFSTR("LoadingPlaceholder_%@%.2f%@"), v26, v28, &stru_1EA606688, v35);
  }
  else
  {
    v29 = objc_msgSend(v25, "rightToLeft");

    v30 = CFSTR("_RTL");
    if (!v29)
      v30 = &stru_1EA606688;
    objc_msgSend(v24, "stringWithFormat:", CFSTR("LoadingPlaceholderGroup_%@%.2f%@%@"), v26, v28, v30, &stru_1EA606688);
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __65___CNUILikenessRenderer_loadingPlaceholderForContactCount_scope___block_invoke;
  v36[3] = &unk_1EA603300;
  v37 = v9;
  v38 = v8;
  v36[4] = self;
  v32 = v9;
  +[CNUIImageProvider imageForResource:template:onCacheMiss:](CNUIImageProvider, "imageForResource:template:onCacheMiss:", v31, 0, v36);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (CNUIPRLikenessResolver)likenessResolver
{
  return self->_likenessResolver;
}

+ (id)renderedLikenessesForProviders:(id)a3 likenessBadgeProviders:(id)a4 scope:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  CGImageRef *v13;
  size_t v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  void *v19;
  double v20;
  id v21;
  CGColorSpace *DeviceRGB;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGContext *v29;
  uint64_t v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t i;
  void *v37;
  double v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  size_t v43;
  void *v44;
  uint64_t j;
  void *v46;
  double v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  CGImage *Image;
  double v53;
  id v54;
  CGFloat v56;
  uint64_t v57;
  CGImageRef *v58;
  uint64_t *v59;
  id v60;
  uint64_t *v61;
  id v62;
  CGRect v63;
  CGAffineTransform v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v62 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "count");
  MEMORY[0x1E0C80A78]();
  v13 = (CGImageRef *)((char *)&v57 - v12);
  if (v11 >= 0x200)
    v14 = 512;
  else
    v14 = v11;
  bzero((char *)&v57 - v12, v14);
  v63.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  objc_msgSend(v9, "pointSize");
  v16 = v15;
  v18 = v17;
  v63.size.width = v15;
  v63.size.height = v17;
  if (v10)
  {
    if (v10 == 1 && (*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scale");
      *v13 = (CGImageRef)objc_msgSend(a1, "cgImageForLikenessProvider:pointSize:scale:style:alwaysUsePointSize:", v19, objc_msgSend(v9, "style"), 1, v16, v18, v20);

      v21 = v9;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      objc_msgSend(v21, "scale");
      v24 = v23;
      objc_msgSend(v21, "pointSize");
      v26 = v25;
      v28 = v27;
      CGAffineTransformMakeScale(&v64, v24, v24);
      v29 = CNUIBitmapContextCreate(llround(v28 * v64.c + v64.a * v26), llround(v28 * v64.d + v64.b * v26), DeviceRGB);
      v30 = objc_msgSend(v21, "style");
      if (v30)
      {
        if (v30 == 1)
        {
          objc_msgSend(v21, "strokeWidth");
          CNUIDrawRoundedRectImagesInRects(v29, (CGColor *)objc_msgSend(v21, "strokeColor"), 1, v13, &v63, v24, v31);
        }
      }
      else
      {
        objc_msgSend(v21, "strokeWidth");
        CNUIDrawCircularImagesInRects(v29, (CGColor *)objc_msgSend(v21, "strokeColor"), 1, v13, &v63, v24, v56);
      }
      Image = CGBitmapContextCreateImage(v29);
      CGColorSpaceRelease(DeviceRGB);
      CGContextRelease(v29);
      if (Image)
        Image = (CGImage *)CFAutorelease(Image);

      goto LABEL_27;
    }
    v59 = &v57;
    +[CNUISnowglobeUtilities sizeForImageAtIndex:inRect:forItemCount:scope:](CNUISnowglobeUtilities, "sizeForImageAtIndex:inRect:forItemCount:scope:", 0, 2, v9, *(_OWORD *)&v63.origin, v16, v18);
    v33 = v32;
    v35 = v34;
    for (i = 0; i != v10; ++i)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scale");
      v13[i] = (CGImageRef)objc_msgSend(a1, "cgImageForLikenessProvider:pointSize:scale:style:alwaysUsePointSize:", v37, objc_msgSend(v9, "style"), 1, v33, v35, v38);

    }
    v57 = v10;
    v58 = v13;
    v60 = v8;
  }
  else
  {
    v57 = 0;
    v58 = v13;
    v59 = &v57;
    v60 = v8;
    v33 = *MEMORY[0x1E0C9D820];
    v35 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v39 = objc_msgSend(v62, "count", v57, v58, v59);
  v61 = &v57;
  MEMORY[0x1E0C80A78]();
  v42 = (char *)&v57 - v41;
  if (v40 >= 0x200)
    v43 = 512;
  else
    v43 = v40;
  bzero((char *)&v57 - v41, v43);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v39);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    for (j = 0; j != v39; ++j)
    {
      objc_msgSend(v62, "objectAtIndexedSubscript:", j);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scale");
      *(_QWORD *)&v42[8 * j] = objc_msgSend(a1, "cgImageForLikenessProvider:pointSize:scale:style:alwaysUsePointSize:", v46, objc_msgSend(v9, "style"), 1, v33, v35, v47);
      v48 = v46;
      if (objc_msgSend(v48, "conformsToProtocol:", &unk_1F03D1F08))
        v49 = v48;
      else
        v49 = 0;
      v50 = v49;

      if (v50)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v50, "badgeType"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v51);

      }
      else
      {
        objc_msgSend(v44, "addObject:", &unk_1EA61C388);
      }

    }
  }
  Image = +[CNUISnowglobeUtilities imageForAvatarImages:badgeImages:badgeTypes:rect:itemCount:scope:](CNUISnowglobeUtilities, "imageForAvatarImages:badgeImages:badgeTypes:rect:itemCount:scope:", v58, v42, v44, v57, v9, *(_OWORD *)&v63.origin, v16, v18);

  v8 = v60;
LABEL_27:
  CGImageGetWidth(Image);
  CGImageGetHeight(Image);
  objc_msgSend(v9, "scale");
  v54 = (id)-[objc_class imageWithCGImage:scale:orientation:](NSClassFromString(CFSTR("UIImage")), "imageWithCGImage:scale:orientation:", Image, 0, v53);

  return v54;
}

+ (CGImage)cgImageForLikenessProvider:(id)a3 pointSize:(CGSize)a4 scale:(double)a5 style:(unint64_t)a6 alwaysUsePointSize:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  id v12;
  uint64_t v13;
  CGImage *v14;
  void *v15;
  id v16;
  CGImageRef v17;

  v7 = a7;
  height = a4.height;
  width = a4.width;
  v12 = a3;
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = objc_msgSend(v12, "_cnui_imageForSize:scale:", width, height, a5);
LABEL_6:
    v14 = (CGImage *)v13;
    goto LABEL_20;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = objc_msgSend(v12, "_cnui_image");
    goto LABEL_6;
  }
  if (a6 == 1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "_cnui_roundedRectImageForSize:scale:", width, height, a5);
      goto LABEL_6;
    }
  }
  else if (!a6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = objc_msgSend(v12, "_cnui_circularImageForSize:scale:", width, height, a5);
    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "_cnui_likenessForSize:scale:", width, height, a5);
  else
    objc_msgSend(v12, "_cnui_likeness");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "snapshotWithSize:scale:options:", 0, width, height, a5);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = CGImageRetain((CGImageRef)objc_msgSend(v16, "CGImage"));
  if (v17)
    v14 = (CGImage *)CFAutorelease(v17);
  else
    v14 = 0;

LABEL_20:
  return v14;
}

- (id)renderedLikenessesForLikenessProviders:(id)a3 badges:(id)a4 scope:(id)a5 likenessFingerprint:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  _CNUILikenessRenderer *v22;
  id v23;
  id v24;
  uint64_t v25;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v14 = objc_opt_class();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __97___CNUILikenessRenderer_renderedLikenessesForLikenessProviders_badges_scope_likenessFingerprint___block_invoke;
  v20[3] = &unk_1EA6032B0;
  v24 = v11;
  v25 = v14;
  v21 = v12;
  v22 = self;
  v23 = v10;
  v15 = v11;
  v16 = v10;
  v17 = v12;
  objc_msgSend(v13, "map:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)likenessProvidersForContacts:(id)a3 likenessResolverOptions:(id)a4 workScheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  id v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "_cn_take:", +[CNUIPRLikenessResolver maxContacts](CNUIPRLikenessResolver, "maxContacts"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92___CNUILikenessRenderer_likenessProvidersForContacts_likenessResolverOptions_workScheduler___block_invoke;
  v19[3] = &unk_1EA603240;
  v19[4] = self;
  v20 = v8;
  v21 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "_cn_map:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D13AE8];
  -[_CNUILikenessRenderer schedulerProvider](self, "schedulerProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "combineLatest:resultScheduler:schedulerProvider:", v14, v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (id)likenessProvidersForBadges:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v3, "_cn_map:", &__block_literal_global_3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (id)descriptorForRequiredKeys
{
  return +[CNUIPRLikenessResolver descriptorForRequiredKeys](CNUIPRLikenessResolver, "descriptorForRequiredKeys");
}

- (id)renderedLikenessesForContacts:(id)a3 scope:(id)a4 workScheduler:(id)a5
{
  return -[_CNUILikenessRenderer renderedLikenessesForContacts:withBadges:scope:workScheduler:](self, "renderedLikenessesForContacts:withBadges:scope:workScheduler:", a3, 0, a4, a5);
}

- (id)renderedLoadingPlaceholderForContactCount:(unint64_t)a3 provider:(id)a4 scope:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  if (a3 <= 1)
    v9 = 1;
  else
    v9 = a3;
  if (a3 >= 2 && +[CNUISnowglobeUtilities enableGroupPhoto](CNUISnowglobeUtilities, "enableGroupPhoto"))
    v9 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "_cn_arrayWithObject:count:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "renderedLikenessesForProviders:likenessBadgeProviders:scope:", v10, MEMORY[0x1E0C9AA60], v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (_CNUILikenessRenderer)initWithLikenessResolver:(id)a3 schedulerProvider:(id)a4
{
  id v7;
  id v8;
  _CNUILikenessRenderer *v9;
  _CNUILikenessRenderer *v10;
  _CNUILikenessRenderer *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNUILikenessRenderer;
  v9 = -[_CNUILikenessRenderer init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_likenessResolver, a3);
    objc_storeStrong((id *)&v10->_schedulerProvider, a4);
    v11 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_likenessResolver, 0);
}

- (void)setLookupOptions:(unint64_t)a3
{
  -[CNUIPRLikenessResolver setLookupOptions:](self->_likenessResolver, "setLookupOptions:", a3);
}

- (id)renderedLikenessForBadge:(id)a3 scope:(id)a4 workScheduler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CNUILikenessRenderer likenessProvidersForBadges:workScheduler:](self, "likenessProvidersForBadges:workScheduler:", v12, v9, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CNUILikenessRenderer renderedLikenessForBadgeProvider:scope:](self, "renderedLikenessForBadgeProvider:scope:", v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)likenessProvidersForBadges:(id)a3 workScheduler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  _CNUILikenessRenderer *v19;
  id v20;

  v6 = a4;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __66___CNUILikenessRenderer_likenessProvidersForBadges_workScheduler___block_invoke;
  v18 = &unk_1EA603268;
  v19 = self;
  v20 = v6;
  v7 = v6;
  objc_msgSend(a3, "_cn_map:", &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D13AE8];
  -[_CNUILikenessRenderer schedulerProvider](self, "schedulerProvider", v15, v16, v17, v18, v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "combineLatest:resultScheduler:schedulerProvider:", v8, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithResult:", MEMORY[0x1E0C9AA60]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "onEmpty:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)renderedLikenessForBadgeProvider:(id)a3 scope:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v5 = a4;
  v6 = a3;
  v7 = objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64___CNUILikenessRenderer_renderedLikenessForBadgeProvider_scope___block_invoke;
  v11[3] = &unk_1EA6032D8;
  v12 = v5;
  v13 = v7;
  v8 = v5;
  objc_msgSend(v6, "map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)renderedBasicMonogramFromString:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  -[_CNUILikenessRenderer likenessResolver](self, "likenessResolver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "basicMonogramObservableFromString:color:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63___CNUILikenessRenderer_renderedBasicMonogramFromString_scope___block_invoke;
  v15[3] = &unk_1EA603328;
  v16 = v6;
  v17 = v8;
  v12 = v6;
  objc_msgSend(v11, "map:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)renderedBasicMonogramForString:(id)a3 color:(id)a4 scope:(id)a5 prohibitedSources:(int64_t)a6
{
  char v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  Class PRLikenessClass;
  void *v15;
  void *v16;
  CNUIPRLikenessProvider *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];

  v6 = a6;
  v25[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
    goto LABEL_5;
  -[objc_class monogram](getPRMonogramClass(), "monogram");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v10);
  if (v11)
    objc_msgSend(v13, "setMonogramColor:", v11);
  PRLikenessClass = getPRLikenessClass();
  objc_msgSend(v13, "dataRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class monogramWithRecipe:staticRepresentation:](PRLikenessClass, "monogramWithRecipe:staticRepresentation:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[CNUIPRLikenessProvider initWithPRLikeness:]([CNUIPRLikenessProvider alloc], "initWithPRLikeness:", v16);
  v18 = (void *)objc_opt_class();
  v25[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "renderedLikenessesForProviders:likenessBadgeProviders:scope:", v19, MEMORY[0x1E0C9AA60], v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_5:
    if ((v6 & 4) != 0)
    {
      v20 = 0;
    }
    else
    {
      -[_CNUILikenessRenderer likenessResolver](self, "likenessResolver");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "placeholderProviderFactory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "placeholderProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[_CNUILikenessRenderer renderedLoadingPlaceholderForContactCount:provider:scope:](self, "renderedLoadingPlaceholderForContactCount:provider:scope:", 1, v23, v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v20;
}

- (unint64_t)lookupOptions
{
  return self->_lookupOptions;
}

- (void)renderedLikenessesForContacts:(uint64_t)a3 withBadges:(uint64_t)a4 scope:(uint64_t)a5 workScheduler:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD140000, a2, a3, "[LikenessRenderer] New request for group rendered likeness for: %{public}@", a5, a6, a7, a8, 2u);
}

@end
