@implementation DYMTLCommonFunctionPlayer

- (DYLayerManager)strongLayerManager
{
  return (DYLayerManager *)objc_loadWeakRetained((id *)&self->_layerManager);
}

- (id)layerForID:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[DYMTLCommonFunctionPlayer strongLayerManager](self, "strongLayerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layerForID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[DYMTLCommonFunctionPlayer strongLayerManager](self, "strongLayerManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createLayerWithID:contentRect:contentsScale:properties:isCoreAnimationSurface:", a3, 0, 0, 0.0, 0.0, 1.0, 1.0, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v8 = v6;

  return v8;
}

- (BOOL)_isPresentFunction
{
  int v2;

  v2 = **(_DWORD **)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE39040]);
  return (v2 + 7158) < 3 || (v2 + 16359) < 2 || v2 == -16133;
}

- (BOOL)shouldExecuteGraphicsFunction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[DYMTLCommonFunctionPlayer _isPresentFunction](self, "_isPresentFunction"))
  {
    -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:", *(*(_QWORD ***)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE39040]))[9]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[DYMTLCommonFunctionPlayer strongLayerManager](self, "strongLayerManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "prepareLayerForPresent:", v6);

      -[DYMTLCommonFunctionPlayer strongLayerManager](self, "strongLayerManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applyLayersVisibility");

    }
  }
  return 1;
}

- (void)executePlatformFunction
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  GPUTools::MTL *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  GPUTools::MTL::Utils::DYMTLDeviceDescriptor *v15;
  void **v16;
  void *v17;
  id v18;
  void *v19;
  __n64 v20;
  __n64 v21;
  double v22;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  objc_super v68;
  unint64_t v69;
  GPUTools::MTL *v70;
  void *v71[2];
  void *v72[2];
  __int128 v73;
  void *v74[2];
  void *v75[2];
  __int128 v76;
  void *__p;
  void *v78;
  uint64_t v79;
  _QWORD v80[2];
  _QWORD v81[3];

  v81[2] = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE39040];
  v4 = *(uint64_t *)((char *)&self->super.super.super.isa + v3);
  v6 = v4 + 48;
  v5 = *(_DWORD *)v4;
  if (*(int *)v4 > -7169)
  {
    switch(v5)
    {
      case -7168:
        -[DYMTLCommonFunctionPlayer layerForID:](self, "layerForID:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0));
        v66 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setPresentsWithTransaction:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned int>(*(uint64_t *)((char *)&self->super.super.super.isa + v3) + 72, 0) != 0);
        goto LABEL_10;
      case -7167:
        v69 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0);
        v70 = (GPUTools::MTL *)&v69;
        v18 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong}>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto15CAMetalDrawable}* {__strong}>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_drawableMap, &v69, (uint64_t)&std::piecewise_construct, (_QWORD **)&v70)[3];
        objc_msgSend(v18, "texture");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        DYMTLAddDrawableTextureDescriptor(v19);
        -[DYMTLFunctionPlayer setObject:forKey:](self, "setObject:forKey:", v19, GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.isa + v3) + 24, 0));

        return;
      case -7166:
LABEL_17:
        -[DYMTLCommonFunctionPlayer layerForID:](self, "layerForID:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.isa + v3) + 24, 0);
        v11 = (void *)MEMORY[0x242623ED8]();
        do
        {
          objc_msgSend(v10, "nextDrawable");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        while (!v12);
        v70 = (GPUTools::MTL *)&v69;
        v13 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong}>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto15CAMetalDrawable}* {__strong}>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_drawableMap, &v69, (uint64_t)&std::piecewise_construct, (_QWORD **)&v70);
        objc_storeStrong(v13 + 3, v12);
        v70 = (GPUTools::MTL *)&v69;
        *((_BYTE *)std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_drawableRenderabilityStatusMap, &v69, (uint64_t)&std::piecewise_construct, (_QWORD **)&v70)+ 24) = 1;
        -[DYMTLFunctionPlayer setObject:forKey:](self, "setObject:forKey:", v12, v69);

        objc_autoreleasePoolPop(v11);
        return;
      case -7165:
LABEL_14:
        -[DYMTLCommonFunctionPlayer layerForID:](self, "layerForID:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0));
        v66 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setPixelFormat:", GPUTools::FD::Argument::ViewAsScalarArray<MTLPixelFormat>(v4 + 72, 0));
        goto LABEL_10;
      case -7164:
        -[DYMTLCommonFunctionPlayer layerForID:](self, "layerForID:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0));
        v66 = (id)objc_claimAutoreleasedReturnValue();
        v20.n64_u64[0] = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 0).n64_u64[0];
        v21.n64_u64[0] = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 1uLL).n64_u64[0];
        v22 = *(double *)(MEMORY[0x24BDBF148] + 8);
        if (*MEMORY[0x24BDBF148] == v20.n64_f64[0] && v22 == v21.n64_f64[0])
        {
          objc_msgSend(v66, "bounds", *MEMORY[0x24BDBF148], v21.n64_f64[0], v22);
          v25 = v24;
          objc_msgSend(v66, "contentsScale");
          v27 = v26;
          objc_msgSend(v66, "bounds");
          v29 = v28;
          objc_msgSend(v66, "contentsScale");
          v20.n64_f64[0] = v25 * v27;
          v21.n64_f64[0] = v29 * v30;
        }
        objc_msgSend(v66, "setDrawableSize:", v20.n64_f64[0], v21.n64_f64[0], v22);
        goto LABEL_10;
      case -7163:
LABEL_20:
        -[DYMTLCommonFunctionPlayer layerForID:](self, "layerForID:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((*(unsigned __int16 **)((char *)&self->super.super.super.isa + v3))[5] < 3u)
        {
          v17 = 0;
        }
        else
        {
          -[DYFunctionPlayer processArguments](self, "processArguments");
          __p = 0;
          v78 = 0;
          v79 = 0;
          *(_OWORD *)v71 = 0u;
          *(_OWORD *)v72 = 0u;
          v73 = 0u;
          *(_OWORD *)v74 = 0u;
          *(_OWORD *)v75 = 0u;
          v76 = 0u;
          GPUTools::MTL::Utils::MakeDYMTLDeviceDescriptor(**(GPUTools::MTL::Utils ***)((char *)&self->super.super._executePlatformSEL + (int)*MEMORY[0x24BE39008]), &v70, v15);
          if (SHIBYTE(v72[0]) >= 0)
            v16 = v71;
          else
            v16 = (void **)v71[0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          GPUTools::MTL::DispatchSetCaptureVersion(v70);
          if (__p)
          {
            v78 = __p;
            operator delete(__p);
          }
          if (SHIBYTE(v76) < 0)
            operator delete(v75[1]);
          if (SHIBYTE(v75[0]) < 0)
            operator delete(v74[0]);
          if (SHIBYTE(v73) < 0)
            operator delete(v72[1]);
          if (SHIBYTE(v72[0]) < 0)
            operator delete(v71[0]);
        }
        -[DYMTLFunctionPlayer deviceForID:withDeviceName:](self, "deviceForID:withDeviceName:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v4 + 72, 0), v17);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setDevice:", v65);

        return;
      case -7162:
        -[DYMTLCommonFunctionPlayer layerForID:](self, "layerForID:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0));
        v66 = (id)objc_claimAutoreleasedReturnValue();
        v31 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 0).n64_f64[0];
        v32 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 1uLL).n64_f64[0];
        v33 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 2uLL).n64_f64[0];
        v34 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 3uLL).n64_f64[0];
        v35 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 96, 0).n64_f64[0];
        -[DYMTLCommonFunctionPlayer strongLayerManager](self, "strongLayerManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "updateLayer:contentRect:contentsScale:properties:", v66, 0, v31, v32, v33, v34, v35);

        goto LABEL_10;
      case -7161:
        v69 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0);
        std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__erase_unique<unsigned long long>(&self->_drawableMap.__table_.__bucket_list_.__ptr_.__value_, &v69);
        -[DYMTLFunctionPlayer removeObjectForKey:](self, "removeObjectForKey:", v69);
        v70 = (GPUTools::MTL *)&v69;
        *((_BYTE *)std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_drawableRenderabilityStatusMap, &v69, (uint64_t)&std::piecewise_construct, (_QWORD **)&v70)+ 24) = 0;
        return;
      case -7160:
        -[DYMTLCommonFunctionPlayer layerForID:](self, "layerForID:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0));
        v66 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setFramebufferOnly:", GPUTools::FD::Argument::ViewAsScalarArray<BOOL>(v4 + 72, 0));
        goto LABEL_10;
      case -7159:
        -[DYMTLCommonFunctionPlayer layerForID:](self, "layerForID:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 0).n64_f64[0];
        v39 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 1uLL).n64_f64[0];
        v40 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 2uLL).n64_f64[0];
        v67 = (id)GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 3uLL).n64_u64[0];
        v41 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 96, 0).n64_f64[0];
        v42 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 120, 0).n64_u64[0];
        v43 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 120, 1uLL).n64_u64[0];
        v44 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 120, 2uLL).n64_u64[0];
        v45 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 120, 3uLL).n64_u64[0];
        v46 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v4 + 144, 0);
        v47 = GPUTools::FD::Argument::ViewAsScalarArray<long long>(v4 + 168, 0);
        v80[0] = CFSTR("styleMask");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v80[1] = CFSTR("windowLevel");
        v81[0] = v48;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v81[1] = v49;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        -[DYMTLCommonFunctionPlayer strongLayerManager](self, "strongLayerManager");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "updateLayer:contentRect:contentsScale:properties:windowRect:", v37, v50, v38, v39, v40, *(double *)&v67, v41, v42, v43, v44, v45);

        return;
      case -7158:
        v69 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0);
        v70 = (GPUTools::MTL *)&v69;
        v52 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong}>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto15CAMetalDrawable}* {__strong}>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_drawableMap, &v69, (uint64_t)&std::piecewise_construct, (_QWORD **)&v70)[3];
        if (v52)
        {
          -[DYMTLCommonFunctionPlayer strongLayerManager](self, "strongLayerManager");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "layer");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "prepareLayerForPresent:", v54);

          -[DYMTLCommonFunctionPlayer strongLayerManager](self, "strongLayerManager");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "applyLayersVisibility");

          objc_msgSend(v52, "present");
        }
        goto LABEL_54;
      case -7157:
        v69 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0);
        v70 = (GPUTools::MTL *)&v69;
        v52 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong}>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto15CAMetalDrawable}* {__strong}>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_drawableMap, &v69, (uint64_t)&std::piecewise_construct, (_QWORD **)&v70)[3];
        if (v52)
        {
          -[DYMTLCommonFunctionPlayer strongLayerManager](self, "strongLayerManager");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "layer");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "prepareLayerForPresent:", v57);

          -[DYMTLCommonFunctionPlayer strongLayerManager](self, "strongLayerManager");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "applyLayersVisibility");

          objc_msgSend(v52, "presentAtTime:", GPUTools::FD::Argument::ViewAsScalarArray<double>(*(uint64_t *)((char *)&self->super.super.super.isa + v3) + 72, 0).n64_f64[0]);
        }
        goto LABEL_54;
      case -7156:
        v69 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0);
        v70 = (GPUTools::MTL *)&v69;
        v52 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong}>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto15CAMetalDrawable}* {__strong}>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_drawableMap, &v69, (uint64_t)&std::piecewise_construct, (_QWORD **)&v70)[3];
        if (v52)
        {
          -[DYMTLCommonFunctionPlayer strongLayerManager](self, "strongLayerManager");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "layer");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "prepareLayerForPresent:", v60);

          -[DYMTLCommonFunctionPlayer strongLayerManager](self, "strongLayerManager");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "applyLayersVisibility");

          objc_msgSend(v52, "presentAfterMinimumDuration:", GPUTools::FD::Argument::ViewAsScalarArray<double>(*(uint64_t *)((char *)&self->super.super.super.isa + v3) + 72, 0).n64_f64[0]);
        }
LABEL_54:
        v70 = (GPUTools::MTL *)&v69;
        *((_BYTE *)std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_drawableRenderabilityStatusMap, &v69, (uint64_t)&std::piecewise_construct, (_QWORD **)&v70)+ 24) = 0;

        return;
      case -7155:
        -[DYMTLCommonFunctionPlayer strongLayerManager](self, "strongLayerManager");
        v66 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setInterfaceOrientation:", GPUTools::FD::Argument::ViewAsScalarArray<int>(v4 + 72, 0));
        goto LABEL_10;
      default:
        switch(v5)
        {
          case -6656:
            goto LABEL_14;
          case -6655:
            goto LABEL_17;
          case -6654:
            goto LABEL_20;
          case -6653:
            -[DYMTLCommonFunctionPlayer layerForID:](self, "layerForID:", GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0));
            v66 = (id)objc_claimAutoreleasedReturnValue();
            v62 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 0).n64_f64[0];
            v63 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 72, 1uLL).n64_f64[0];
            -[DYMTLCommonFunctionPlayer strongLayerManager](self, "strongLayerManager");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "updateLayer:contentRect:contentsScale:properties:windowRect:", v66, 0, 0.0, 0.0, v62, v63, 1.0, 0, 0, 0x4059000000000000, 0x4059000000000000);

            objc_msgSend(v66, "setDrawableSize:", v62, v63);
            objc_msgSend(v66, "setFramebufferOnly:", 0);
            goto LABEL_10;
          default:
            goto LABEL_15;
        }
    }
  }
  switch(v5)
  {
    case -8183:
      v7 = COERCE_GPUTOOLS_MTL_(1.0);
      v8 = 1.0;
      if (*(unsigned __int16 *)(v4 + 10) >= 4u)
      {
        v7 = (GPUTools::MTL *)GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 96, 0).n64_u64[0];
        v8 = GPUTools::FD::Argument::ViewAsScalarArray<double>(v4 + 120, 0).n64_u64[0];
      }
      v70 = v7;
      v71[0] = (void *)v8;
      -[DYMTLCommonFunctionPlayer strongLayerManager](self, "strongLayerManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTransform:forLayerID:withScreenToLayerScale:", v4 + 72, GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0), &v70);

      break;
    case -8182:
      -[DYMTLCommonFunctionPlayer strongLayerManager](self, "strongLayerManager");
      v66 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setPosition:forLayerID:", v4 + 72, GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0));
      goto LABEL_10;
    case -8181:
      -[DYMTLCommonFunctionPlayer strongLayerManager](self, "strongLayerManager");
      v66 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setAnchorPoint:forLayerID:", v4 + 72, GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v6, 0));
LABEL_10:

      return;
    default:
LABEL_15:
      v68.receiver = self;
      v68.super_class = (Class)DYMTLCommonFunctionPlayer;
      -[DYMTLFunctionPlayer executePlatformFunction](&v68, sel_executePlatformFunction);
      break;
  }
}

- (BOOL)isFrameBoundary
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYMTLCommonFunctionPlayer;
  return -[DYMTLFunctionPlayer isFrameBoundary](&v3, sel_isFrameBoundary);
}

- (DYLayerManager)layerManager
{
  return (DYLayerManager *)objc_loadWeakRetained((id *)&self->_layerManager);
}

- (void)setLayerManager:(id)a3
{
  objc_storeWeak((id *)&self->_layerManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layerManager);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_drawableRenderabilityStatusMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_drawableMap);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 1592) = 0u;
  *(_OWORD *)((char *)self + 1608) = 0u;
  *((_DWORD *)self + 406) = 1065353216;
  *((_OWORD *)self + 102) = 0u;
  *((_OWORD *)self + 103) = 0u;
  *((_DWORD *)self + 416) = 1065353216;
  return self;
}

@end
