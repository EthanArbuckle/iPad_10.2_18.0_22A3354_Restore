@implementation TKAdaptiveImage

- (TKAdaptiveImage)init
{
  TKAdaptiveImage *v3;
  objc_super v4;
  SEL v5;
  TKAdaptiveImage *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)TKAdaptiveImage;
  v6 = -[TKAdaptiveResourceObject init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
  {
    v6->_quality = 0.850000024;
    v6->_supportsTraits = 1;
    v6->_state = 0;
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  TKAdaptiveImage *v4;

  v4 = self;
  v3 = a2;
  -[TKAdaptiveImage stop](self, "stop");
  v2.receiver = v4;
  v2.super_class = (Class)TKAdaptiveImage;
  -[TKAdaptiveResourceObject dealloc](&v2, sel_dealloc);
}

- (void)tmlDispose
{
  objc_super v2;
  SEL v3;
  TKAdaptiveImage *v4;

  v4 = self;
  v3 = a2;
  -[TKAdaptiveImage stop](self, "stop");
  v2.receiver = v4;
  v2.super_class = (Class)TKAdaptiveImage;
  -[TKAdaptiveResourceObject tmlDispose](&v2, sel_tmlDispose);
}

- (void)setUrl:(id)a3
{
  id location[2];
  TKAdaptiveImage *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_url != location[0] && (-[NSURL isEqual:](v4->_url, "isEqual:", location[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_url, location[0]);
    if (v4->_state)
    {
      -[TKAdaptiveImage stop](v4, "stop");
      -[TKAdaptiveImage start](v4, "start");
    }
  }
  objc_storeStrong(location, 0);
}

- (void)setQuality:(double)a3
{
  double v3;

  v3 = a3;
  if (a3 > 1.0 || a3 <= 0.0)
    v3 = 0.850000024;
  self->_quality = v3;
}

- (void)setState:(unint64_t)a3
{
  BOOL v3;

  self->_state = a3;
  v3 = a3 == 1;
  if ((a3 == 1) != self->_loading)
  {
    -[TKAdaptiveImage willChangeValueForKey:](self, "willChangeValueForKey:");
    self->_loading = v3;
    -[TKAdaptiveImage didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("loading"));
  }
}

- (void)start
{
  id v2;
  NSString *v3;
  BOOL v4;
  int v5;
  id location;
  id v7[2];
  TKAdaptiveImage *v8;

  v8 = self;
  v7[1] = (id)a2;
  if (self->_state != 1 && v8->_state != 2)
  {
    if (v8->_image)
    {
      -[TKAdaptiveImage willChangeValueForKey:](v8, "willChangeValueForKey:");
      objc_storeStrong((id *)&v8->_image, 0);
      -[TKAdaptiveImage didChangeValueForKey:](v8, "didChangeValueForKey:", CFSTR("image"));
    }
    v3 = -[NSURL scheme](v8->_url, "scheme");
    v4 = -[NSString length](v3, "length") != 0;

    if (v4)
    {
      v8->_supportsTraits = 1;
      -[TKAdaptiveImage setState:](v8, "setState:", 1);
      v2 = -[TKAdaptiveImage imageTraitForMetrics](v8, "imageTraitForMetrics");
      -[TKAdaptiveImage loadWithTrait:](v8, "loadWithTrait:");

    }
    else
    {
      v8->_supportsTraits = 0;
      v7[0] = -[NSURL path](v8->_url, "path");
      if (!objc_msgSend(v7[0], "length")
        || ((location = (id)objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:", v7[0])) == 0
          ? (v5 = 0)
          : (-[TKAdaptiveImage didLoadImage:state:](v8, "didLoadImage:state:", location, 2), v5 = 1),
            objc_storeStrong(&location, 0),
            !v5))
      {
        -[TKAdaptiveImage didLoadImage:state:](v8, "didLoadImage:state:", 0, 3);
      }
      objc_storeStrong(v7, 0);
    }
  }
}

- (void)stop
{
  if (self->_state == 1)
  {
    -[TKAdaptiveImage setState:](self, "setState:", 4);
    if (self->_task)
    {
      -[TKNetworkTask cancel](self->_task, "cancel");
      objc_storeStrong((id *)&self->_task, 0);
    }
  }
  else
  {
    -[TKAdaptiveImage setState:](self, "setState:", 4);
  }
}

- (void)loadWithTrait:(id)a3
{
  TKNetworkTask *v3;
  TKNetworkTask *task;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  id v14[3];
  id from;
  uint64_t v16;
  id v17;
  int v18;
  id location[2];
  TKAdaptiveImage *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v20->_supportsTraits && v20->_url)
  {
    if (location[0])
    {
      v17 = -[TKAdaptiveImage url:withTrait:](v20, "url:withTrait:", v20->_url, location[0]);
      if ((objc_msgSend(v17, "isEqual:", v20->_currentURL) & 1) != 0 && v20->_image)
      {
        v18 = 1;
      }
      else
      {
        -[TKAdaptiveImage setState:](v20, "setState:", 1);
        objc_storeStrong((id *)&v20->_currentURL, v17);
        if (v20->_image
          && v20->_currentTrait
          && !-[TKAdaptiveImage_Trait compatibleWithTrait:](v20->_currentTrait, "compatibleWithTrait:", location[0]))
        {
          -[TKAdaptiveImage willChangeValueForKey:](v20, "willChangeValueForKey:");
          objc_storeStrong((id *)&v20->_image, 0);
          -[TKAdaptiveImage didChangeValueForKey:](v20, "didChangeValueForKey:", CFSTR("image"));
        }
        objc_storeStrong((id *)&v20->_currentTrait, location[0]);
        v16 = 0;
        if (-[NSString isEqualToString:](v20->_priority, "isEqualToString:", CFSTR("high")))
        {
          v16 = 1;
        }
        else if (-[NSString isEqualToString:](v20->_priority, "isEqualToString:", CFSTR("low")))
        {
          v16 = -1;
        }
        objc_initWeak(&from, v20);
        v7 = +[TKNetwork shared](TKNetwork, "shared");
        v5 = (id)objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", v17);
        v6 = v16;
        v8 = MEMORY[0x24BDAC760];
        v9 = -1073741824;
        v10 = 0;
        v11 = __33__TKAdaptiveImage_loadWithTrait___block_invoke;
        v12 = &unk_24E099FA0;
        v13 = v17;
        objc_copyWeak(v14, &from);
        v3 = (TKNetworkTask *)(id)objc_msgSend(v7, "downloadImage:priority:completion:", v5, v6, &v8);
        task = v20->_task;
        v20->_task = v3;

        objc_destroyWeak(v14);
        objc_storeStrong(&v13, 0);
        objc_destroyWeak(&from);
        v18 = 0;
      }
      objc_storeStrong(&v17, 0);
    }
    else
    {
      objc_storeStrong((id *)&v20->_currentURL, 0);
      v18 = 1;
    }
  }
  else
  {
    v18 = 1;
  }
  objc_storeStrong(location, 0);
}

void __33__TKAdaptiveImage_loadWithTrait___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v8;
  id v9;
  id WeakRetained;
  char v11;
  id v12;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12 = 0;
  objc_storeStrong(&v12, a3);
  v8 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = (id)objc_msgSend(WeakRetained, "currentURL");
  v11 = objc_msgSend(v8, "isEqual:");

  if ((v11 & 1) != 0)
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = v3;
    if (v12)
      v4 = 3;
    else
      v4 = 2;
    objc_msgSend(v3, "didLoadImage:state:", location[0], v4);

  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)didLoadImage:(id)a3 state:(unint64_t)a4
{
  id location[2];
  TKAdaptiveImage *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_task, 0);
  if (location[0])
  {
    -[TKAdaptiveImage willChangeValueForKey:](v6, "willChangeValueForKey:");
    objc_storeStrong((id *)&v6->_image, location[0]);
    -[TKAdaptiveImage didChangeValueForKey:](v6, "didChangeValueForKey:", CFSTR("image"));
  }
  -[TKAdaptiveImage setState:](v6, "setState:", a4);
  if (a4 == 3)
    -[TKAdaptiveImage emitTMLSignal:withArguments:](v6, "emitTMLSignal:withArguments:", CFSTR("error"), 0);
  objc_storeStrong(location, 0);
}

- (void)tmlObjectCompleted
{
  -[TKAdaptiveImage start](self, "start", a2, self);
}

- (void)adaptiveMetricsDidChange
{
  id v2[2];
  TKAdaptiveImage *v3;

  v3 = self;
  v2[1] = (id)a2;
  if (self->_supportsTraits)
  {
    v2[0] = -[TKAdaptiveImage imageTraitForMetrics](v3, "imageTraitForMetrics");
    -[TKAdaptiveImage loadWithTrait:](v3, "loadWithTrait:", v2[0]);
    objc_storeStrong(v2, 0);
  }
}

+ (id)zeroTrait
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&zeroTrait_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_9);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)zeroTrait_zeroTrait;
}

void __28__TKAdaptiveImage_zeroTrait__block_invoke()
{
  TKAdaptiveImage_Trait *v0;
  void *v1;

  v0 = objc_alloc_init(TKAdaptiveImage_Trait);
  v1 = (void *)zeroTrait_zeroTrait;
  zeroTrait_zeroTrait = (uint64_t)v0;

}

- (id)traits
{
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(id *, void *);
  void *v9;
  id v10;
  id v11[2];
  TKAdaptiveImage *v12;

  v12 = self;
  v11[1] = (id)a2;
  v11[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = (id)-[TKAdaptiveImage tmlChildren](v12, "tmlChildren");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __25__TKAdaptiveImage_traits__block_invoke;
  v9 = &unk_24E099FE8;
  v10 = v11[0];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:");

  v4 = v11[0];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v11, 0);
  return v4;
}

void __25__TKAdaptiveImage_traits__block_invoke(id *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1[4], "addObject:", location[0]);
  objc_storeStrong(location, 0);
}

- (id)imageTraitForMetrics
{
  id v2;
  id *v4;
  id obj;
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  id v10;
  id v11;
  id *location;
  uint64_t *v13;
  id v14;
  id v15;
  id *v16;
  id v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  _QWORD v24[2];
  id v25;
  uint64_t v26;
  uint64_t *v27;
  int v28;
  int v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  SEL v33;
  TKAdaptiveImage *v34;

  v16 = (id *)&v34;
  v34 = self;
  v33 = a2;
  v26 = 0;
  v27 = &v26;
  v28 = 838860800;
  v29 = 48;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = (id)objc_msgSend((id)objc_opt_class(), "zeroTrait");
  v17 = +[TKAdaptiveResourceManager traitCollection](TKAdaptiveResourceManager, "traitCollection");
  v25 = v17;
  v15 = -[TKAdaptiveImage traits](v34, "traits");
  v14 = v15;
  v13 = &v19;
  v19 = MEMORY[0x24BDAC760];
  v20 = -1073741824;
  v21 = 0;
  v22 = __39__TKAdaptiveImage_imageTraitForMetrics__block_invoke;
  v23 = &unk_24E09A010;
  location = (id *)v24;
  v24[0] = v25;
  v24[1] = &v26;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", &v19);

  v10 = (id)v27[5];
  v11 = (id)objc_opt_class();
  v9 = (id)objc_msgSend(v11, "zeroTrait");
  v2 = v9;
  v8 = v10 != v2;

  if (v8)
  {
    v16[1] = (id)v27[5];
    v18 = 1;
  }
  else
  {
    if (*((_QWORD *)*v16 + 5))
    {
      v7 = (id)objc_msgSend(*((id *)*v16 + 5), "absoluteString");
      v6 = v7;
      NSLog(CFSTR("AdaptiveImage: no matching trait for %@"), v6);

    }
    v16[1] = 0;
    v18 = 1;
  }
  obj = 0;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v25, obj);
  v4 = (id *)&v26;
  _Block_object_dispose(&v26, 8);
  objc_storeStrong(v4 + 5, obj);
  return v16[1];
}

void __39__TKAdaptiveImage_imageTraitForMetrics__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = objc_msgSend(location[0], "horizontalSizeClass");
  if (v4 == objc_msgSend(*(id *)(a1 + 32), "horizontalSizeClass") || !objc_msgSend(location[0], "horizontalSizeClass"))
  {
    v2 = objc_msgSend(location[0], "verticalSizeClass");
    if ((v2 == objc_msgSend(*(id *)(a1 + 32), "verticalSizeClass") || !objc_msgSend(location[0], "verticalSizeClass"))
      && (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "horizontalSizeClass")
       || !objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "verticalSizeClass")))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), location[0]);
    }
  }
  objc_storeStrong(location, 0);
}

- (id)url:(id)a3 withTrait:(id)a4
{
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  id v53;
  double quality;
  id v55;
  id v56;
  double v57;
  int v59;
  id v60;
  id v61;
  double v62;
  id v63;
  double v64;
  id v65;
  __int128 v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  uint64_t v75;
  __int128 v76;
  double v77;
  double v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  uint64_t v83;
  uint64_t v84;
  double v85;
  uint64_t v86;
  __int128 v87;
  double v88;
  double v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  __int128 v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  id v102;
  id location[2];
  TKAdaptiveImage *v104;
  id v105;
  double v106;
  double v107;
  uint64_t v108;
  uint64_t v109;

  v104 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v102 = 0;
  objc_storeStrong(&v102, a4);
  objc_msgSend(v102, "size");
  *(double *)&v101 = v4;
  *((double *)&v101 + 1) = v5;
  if (__CGSizeEqualToSize_0(v4, v5, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8)))
  {
    v100 = 0;
    if ((objc_msgSend(v102, "useReadableWidth") & 1) != 0)
    {
      +[TKAdaptiveResourceManager readableContentSize](TKAdaptiveResourceManager, "readableContentSize");
      v98 = v6;
      v99 = v7;
    }
    else
    {
      +[TKAdaptiveResourceManager size](TKAdaptiveResourceManager, "size");
      v96 = v6;
      v97 = v8;
    }
    v100 = v6;
    objc_msgSend(v102, "relativeSize");
    v93 = v9;
    v94 = v10;
    objc_msgSend(v102, "relativeSize");
    v91 = v11;
    v92 = v12;
    CGSizeMake_0();
    *(_QWORD *)&v95 = v13;
    *((_QWORD *)&v95 + 1) = v14;
    v101 = v95;
  }
  v108 = *((_QWORD *)&v101 + 1);
  v109 = v101;
  CGSizeMake_0();
  *(_QWORD *)&v90 = v15;
  *((_QWORD *)&v90 + 1) = v16;
  v101 = v90;
  objc_msgSend(v102, "maxSize");
  v88 = v17;
  v89 = v18;
  if (!__CGSizeEqualToSize_0(v17, v18, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8)))
  {
    objc_msgSend(v102, "maxSize");
    v85 = v19;
    v86 = v20;
    if (*(double *)&v101 >= v19)
    {
      objc_msgSend(v102, "maxSize", *(double *)&v101);
      v83 = v21;
      v84 = v22;
    }
    objc_msgSend(v102, "maxSize");
    v81 = v23;
    v82 = v24;
    if (*((double *)&v101 + 1) >= v24)
    {
      objc_msgSend(v102, "maxSize", *((double *)&v101 + 1));
      v79 = v25;
      v80 = v26;
    }
    CGSizeMake_0();
    *(_QWORD *)&v87 = v27;
    *((_QWORD *)&v87 + 1) = v28;
    v101 = v87;
  }
  objc_msgSend(v102, "minSize");
  v77 = v29;
  v78 = v30;
  if (!__CGSizeEqualToSize_0(v29, v30, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8)))
  {
    objc_msgSend(v102, "minSize");
    v74 = v31;
    v75 = v32;
    if (*(double *)&v101 <= v31)
    {
      objc_msgSend(v102, "minSize", *(double *)&v101);
      v72 = v33;
      v73 = v34;
    }
    objc_msgSend(v102, "minSize");
    v70 = v35;
    v71 = v36;
    if (*((double *)&v101 + 1) <= v36)
    {
      objc_msgSend(v102, "minSize", *((double *)&v101 + 1));
      v68 = v37;
      v69 = v38;
    }
    CGSizeMake_0();
    *(_QWORD *)&v76 = v39;
    *((_QWORD *)&v76 + 1) = v40;
    v101 = v76;
  }
  v56 = +[TKAdaptiveResourceManager traitCollection](TKAdaptiveResourceManager, "traitCollection");
  objc_msgSend(v56, "displayScale");
  v57 = v41;

  v67 = v57;
  if (v57 == 0.0)
  {
    v55 = (id)objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen", v57);
    objc_msgSend(v55, "scale");
    v67 = v42;

  }
  v107 = *(double *)&v101 * v67;
  v106 = *((double *)&v101 + 1) * v67;
  CGSizeMake_0();
  *(_QWORD *)&v66 = v43;
  *((_QWORD *)&v66 + 1) = v44;
  v101 = v66;
  v65 = v104->_backgroundColor;
  if (v65)
  {
    v64 = 0.0;
    objc_msgSend(v65, "getRed:green:blue:alpha:", 0, 0, 0, &v64);
    v45 = v64;
    if (v64 == 0.0)
      objc_storeStrong(&v65, 0);
  }
  else
  {
    v65 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");

  }
  v63 = (id)objc_msgSend(v102, "url", v45);
  if (!v63)
    objc_storeStrong(&v63, location[0]);
  v62 = 0.0;
  objc_msgSend(v102, "quality");
  if (v46 == 0.0)
  {
    quality = v104->_quality;
  }
  else
  {
    objc_msgSend(v102, "quality");
    quality = v47;
  }
  v62 = quality;
  v61 = +[TKAdaptiveImageAPI getService:](TKAdaptiveImageAPI, "getService:", v104->_service);
  if (!v61
    || ((v53 = v63,
         objc_msgSend(v102, "crop"),
         (v60 = objc_retainAutoreleasedReturnValue((id)(*((uint64_t (**)(id, id, id, double, double, double, double, double, double, double))v61
                                                        + 2))(v61, v53, v65, *(double *)&v101, *((double *)&v101 + 1), v48, v49, v50, v51, v62))) == 0)? (v59 = 0): (v105 = v60, v59 = 1), objc_storeStrong(&v60, 0), !v59))
  {
    v105 = v63;
  }
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v63, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(&v102, 0);
  objc_storeStrong(location, 0);
  return v105;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)priority
{
  return self->_priority;
}

- (void)setPriority:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (double)quality
{
  return self->_quality;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)loading
{
  return self->_loading;
}

- (NSURL)currentURL
{
  return self->_currentURL;
}

- (void)setCurrentURL:(id)a3
{
  objc_storeStrong((id *)&self->_currentURL, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentURL, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_currentTrait, 0);
}

@end
