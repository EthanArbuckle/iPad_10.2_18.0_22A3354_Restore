@implementation DYEAGLFunctionPlayer

- (DYLayerManager)strongLayerManager
{
  return (DYLayerManager *)objc_loadWeakRetained((id *)&self->_layerManager);
}

- (void)newContextInfo
{
  operator new();
}

- (void)initializeNewSharegroupInfoDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DYEAGLFunctionPlayer;
  -[DYEAGLFunctionPlayer initializeNewSharegroupInfoDictionary](&v8, "initializeNewSharegroupInfoDictionary");
  v3 = OBJC_IVAR___DYGLFunctionPlayer__sharegroup_dict;
  v4 = *(void **)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__sharegroup_dict];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx], "sharegroup"));
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("sharegroup"));

  v6 = *(void **)&self->DYGLFunctionPlayer_opaque[v3];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("renderbuffer_drawable_map"));

}

- (id)currentRenderbufferDrawableMap
{
  void *v2;

  if (*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx])
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__sharegroup_dict], "objectForKey:", CFSTR("renderbuffer_drawable_map")));
  else
    v2 = 0;
  return v2;
}

- (void)createEAGLContextWithAPI:(unint64_t)a3 sharegroupID:(unint64_t)a4 contextID:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;

  v12 = a5;
  if (sub_55DC(&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__contextInfoMap], &v12))
  {
    -[DYEAGLFunctionPlayer setCurrentContext:](self, "setCurrentContext:", v12);
    if (!self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__recreateContexts])
      return;
    -[DYEAGLFunctionPlayer deleteCurrentContext](self, "deleteCurrentContext");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__sharegroupMap], "objectForIntKey:", a4));
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("sharegroup")));
    v11 = objc_msgSend(objc_alloc((Class)EAGLContext), "initWithAPI:sharegroup:", a3, v10);

  }
  else
  {
    v11 = objc_msgSend(objc_alloc((Class)EAGLContext), "initWithAPI:", a3);
  }
  -[DYEAGLFunctionPlayer updateCurrentStateWithNewContext:contextID:sharegroupID:](self, "updateCurrentStateWithNewContext:contextID:sharegroupID:", v11, v12, a4);
  *(_QWORD *)(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo] + 104) = a3;

}

- (BOOL)isFrameBoundary
{
  unsigned int v2;

  v2 = **(_DWORD **)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function] + 8190;
  return (v2 < 0xD) & (0x1811u >> v2);
}

- (void)executePlatformFunction
{
  uint64_t v3;
  int *v4;
  unint64_t ***v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  GPUTools::GL *v9;
  uint64_t renderbuffer_binding_enum;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  int v19;
  int v20;
  double v21;
  __n64 v22;
  __n64 v23;
  __n64 v24;
  __n64 v25;
  __n64 v26;
  id *v27;
  unsigned int *v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  _QWORD *v32;
  uint64_t *v33;
  void *v34;
  _QWORD *v35;
  uint64_t v36;
  GPUTools::GL *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  unsigned int v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  BOOL v54;
  uint64_t *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  _QWORD *v70;
  _QWORD *v71;
  id v72;
  objc_super v73;
  _OWORD v74[2];
  int v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t *v78;

  v3 = OBJC_IVAR___DYFunctionPlayer__function;
  v4 = *(int **)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
  v5 = (unint64_t ***)(v4 + 12);
  v6 = *v4;
  v7 = OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo;
  v8 = *(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo];
  switch(*v4)
  {
    case -8192:
    case -8191:
      -[DYEAGLFunctionPlayer createEAGLContextWithAPI:sharegroupID:contextID:](self, "createEAGLContextWithAPI:sharegroupID:contextID:", **((_QWORD **)v4 + 9), **((_QWORD **)v4 + 12), **((_QWORD **)v4 + 6));
      return;
    case -8190:
    case -8179:
    case -8178:
      v9 = (GPUTools::GL *)**((unsigned int **)v4 + 9);
      renderbuffer_binding_enum = GPUTools::GL::dy_get_renderbuffer_binding_enum(v9, a2);
      LODWORD(v74[0]) = 0;
      (*(void (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                        + 832))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], renderbuffer_binding_enum, v74);
      if (LODWORD(v74[0]))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer currentRenderbufferDrawableMap](self, "currentRenderbufferDrawableMap"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", LODWORD(v74[0])));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v12));
        v14 = objc_msgSend(v13, "unsignedLongLongValue");

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layerForID:", v14));

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
        objc_msgSend(v17, "prepareLayerForPresent:", v16);

      }
      switch(v6)
      {
        case -8178:
          objc_msgSend(*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx], "presentRenderbuffer:afterMinimumDuration:", v9, sub_B6E4((uint64_t)(v4 + 24), 0).n64_f64[0]);
          break;
        case -8179:
          objc_msgSend(*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx], "presentRenderbuffer:atTime:", v9, sub_B6E4((uint64_t)(v4 + 24), 0).n64_f64[0]);
          break;
        case -8190:
          objc_msgSend(*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx], "presentRenderbuffer:", v9);
          break;
      }
      return;
    case -8189:
      v36 = **((_QWORD **)v4 + 12);
      if (v36)
      {
        v37 = (GPUTools::GL *)**((unsigned int **)v4 + 9);
        v38 = GPUTools::GL::dy_get_renderbuffer_binding_enum(v37, a2);
        LODWORD(v74[0]) = 0;
        v39 = (*(uint64_t (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                                   + 832))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], v38, v74);
        v40 = DYGetGLGuestAppClient(v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        v42 = objc_msgSend(v41, "traceMode");

        if (v42 != 6)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
          v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "layerForID:", v36));

          objc_msgSend(*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx], "renderbufferStorage:fromDrawable:", v37, v44);
          +[CATransaction flush](CATransaction, "flush");
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer currentRenderbufferDrawableMap](self, "currentRenderbufferDrawableMap"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v36));
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", LODWORD(v74[0])));
          objc_msgSend(v45, "setObject:forKey:", v46, v47);

          goto LABEL_76;
        }
      }
      return;
    case -8188:
      -[DYEAGLFunctionPlayer createEAGLContextWithAPI:sharegroupID:contextID:](self, "createEAGLContextWithAPI:sharegroupID:contextID:", **((_QWORD **)v4 + 9), **((_QWORD **)v4 + 15), **((_QWORD **)v4 + 6));
      v52 = *(_QWORD *)&self->DYGLFunctionPlayer_opaque[v7];
      v54 = 1;
      if (v4[27] == 14)
      {
        v53 = (char *)*((_QWORD *)v4 + 12);
        if (!strstr(v53, "\"EAGLContextPropertyClientRetainRelease\":true")
          || strstr(v53, "\"EAGLContextPropertyVisibleInDebugTools\":true"))
        {
          v54 = 0;
        }
      }
      *(_BYTE *)(v52 + 240) = v54;
      return;
    case -8187:
      v28 = (unsigned int *)*((_QWORD *)v4 + 9);
      goto LABEL_40;
    case -8186:
      if (!*(_DWORD *)(v8 + 112))
        return;
      v29 = DYGetGLGuestAppClient(self);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v31 = objc_msgSend(v30, "traceMode");

      if (v31 == 6)
      {
        objc_msgSend(*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx], "presentRenderbuffer:", 36161);
        return;
      }
      v55 = sub_6608((_QWORD *)(v8 + 120), (unsigned int *)(v8 + 112));
      if ((*(_BYTE *)(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v3] + 4) & 4) != 0)
      {
        if (!v55)
          return;
      }
      else if (!v55)
      {
        __assert_rtn("-[DYEAGLFunctionPlayer executePlatformFunction]", (const char *)&unk_224E1, 0, "iter != ctx_info->fb_info_map.end()");
      }
      v56 = *((unsigned int *)v55 + 5);
      v44 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer currentRenderbufferDrawableMap](self, "currentRenderbufferDrawableMap"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v56));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", v57));

      if (!v58)
        __assert_rtn("-[DYEAGLFunctionPlayer executePlatformFunction]", (const char *)&unk_224E1, 0, "drawable_obj");
      v59 = objc_msgSend(v58, "unsignedLongLongValue");
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "layerForID:", v59));

      if (!v61)
        __assert_rtn("-[DYEAGLFunctionPlayer executePlatformFunction]", (const char *)&unk_224E1, 0, "layer");
      LODWORD(v74[0]) = 0;
      v62 = OBJC_IVAR___DYGLFunctionPlayer__disp;
      v63 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
      (*(void (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                        + 832))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 36007, v74);
      (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v62] + 5328))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v63], 36161, v56);
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
      objc_msgSend(v64, "prepareLayerForPresent:", v61);

      objc_msgSend(*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx], "presentRenderbuffer:", 36161);
      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v62] + 5328))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v63], 36161, LODWORD(v74[0]));
      goto LABEL_75;
    case -8185:
      v78 = **v5;
      v32 = *(_QWORD **)(v8 + 216);
      if (!v32)
        goto LABEL_32;
      do
      {
        while (1)
        {
          v33 = sub_55DC(v32 + 3, (unint64_t *)&v78);
          if (v33)
          {
            sub_66BC(v32 + 3, v33);
            if (!v32[6])
              break;
          }
          v32 = (_QWORD *)*v32;
          if (!v32)
            goto LABEL_32;
        }
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
        objc_msgSend(v34, "deleteLayer:", v32[2]);

        v35 = (_QWORD *)*v32;
        sub_66FC((_QWORD *)(v8 + 200), v32, (uint64_t)v74);
        sub_4F40((uint64_t)v74, 0);
        v32 = v35;
      }
      while (v35);
LABEL_32:
      -[DYEAGLFunctionPlayer deleteCurrentContext](self, "deleteCurrentContext");
      return;
    case -8184:
      goto LABEL_20;
    case -8183:
      v48 = 1.0;
      v49 = 1.0;
      if (*((unsigned __int16 *)v4 + 5) >= 4u)
      {
        v48 = sub_B6E4((uint64_t)(v4 + 24), 0).n64_u64[0];
        v49 = sub_B6E4((uint64_t)(v4 + 30), 0).n64_u64[0];
      }
      *(_QWORD *)&v74[0] = v48;
      *((_QWORD *)&v74[0] + 1) = v49;
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
      objc_msgSend(v50, "setTransform:forLayerID:withScreenToLayerScale:", v4 + 18, sub_D9F8((uint64_t)v5, 0), v74);

      return;
    case -8182:
      v72 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
      objc_msgSend(v72, "setPosition:forLayerID:", v4 + 18, sub_D9F8((uint64_t)v5, 0));
      goto LABEL_46;
    case -8181:
      v72 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
      objc_msgSend(v72, "setAnchorPoint:forLayerID:", v4 + 18, sub_D9F8((uint64_t)v5, 0));
LABEL_46:

      return;
    case -8180:
      v28 = (unsigned int *)*((_QWORD *)v4 + 12);
LABEL_40:
      v51 = *v28;
      *(_QWORD *)((char *)v74 + 7) = 0;
      *(_QWORD *)&v74[0] = 0;
      GPUTools::GL::DYGetTextureTargetInfo(v51, v74);
      LODWORD(v78) = 0;
      (*(void (**)(_QWORD, _QWORD, unint64_t **))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                                  + 832))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], DWORD1(v74[0]), &v78);
      sub_D254(v8 + 160, (unsigned int *)&v78, &v78);
      return;
    default:
      if ((v6 + 12283) < 2)
        return;
      if (v6 != -12287)
      {
LABEL_20:
        v73.receiver = self;
        v73.super_class = (Class)DYEAGLFunctionPlayer;
        -[DYEAGLFunctionPlayer executePlatformFunction](&v73, "executePlatformFunction");
        return;
      }
      v77 = **((_QWORD **)v4 + 6);
      v18 = **((_QWORD **)v4 + 12);
      v76 = v18;
      if (!v18)
        return;
      v19 = **((unsigned __int8 **)v4 + 15);
      v20 = **((_DWORD **)v4 + 18);
      v21 = 1.0;
      if (*((unsigned __int16 *)v4 + 5) >= 6u)
      {
        v22.n64_u64[0] = sub_B6E4((uint64_t)(v4 + 42), 0).n64_u64[0];
        if (v22.n64_f64[0] == 0.0)
          return;
        v21 = v22.n64_f64[0];
      }
      v23.n64_u64[0] = sub_B6E4((uint64_t)(v4 + 18), 0).n64_u64[0];
      v24.n64_u64[0] = sub_B6E4((uint64_t)(v4 + 18), 1uLL).n64_u64[0];
      v25.n64_u64[0] = sub_B6E4((uint64_t)(v4 + 18), 2uLL).n64_u64[0];
      v26.n64_u64[0] = sub_B6E4((uint64_t)(v4 + 18), 3uLL).n64_u64[0];
      if (v20 <= 35906)
      {
        switch(v20)
        {
          case 32856:
            v27 = (id *)&kEAGLColorFormatRGBA8;
            break;
          case 35446:
            v27 = (id *)&kEAGLColorFormatRGBA_XR10_64BPP;
            break;
          case 35447:
            v27 = (id *)&kEAGLColorFormatSRGBA_XR10_64BPP;
            break;
          default:
            goto LABEL_81;
        }
      }
      else if (v20 > 37873)
      {
        if (v20 == 37874)
        {
          v27 = (id *)&kEAGLColorFormatSRGB_XR10;
        }
        else
        {
          if (v20 != 37881)
            goto LABEL_81;
          v27 = (id *)&kEAGLColorFormatSRGB_XR10_A8_2P;
        }
      }
      else
      {
        if (v20 != 35907)
        {
          if (v20 == 36194)
          {
            v27 = (id *)&kEAGLColorFormatRGB565;
            goto LABEL_69;
          }
LABEL_81:
          dy_abort("unsupported or unknown surface color format: 0x%04X", v20);
          __break(1u);
          return;
        }
        v27 = (id *)&kEAGLColorFormatSRGBA8;
      }
LABEL_69:
      v44 = *v27;
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v19 != 0));
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v65, kEAGLDrawablePropertyRetainedBacking, v44, kEAGLDrawablePropertyColorFormat, 0));

      v66 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
      v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "layerForID:", v18));

      if (v67)
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
        objc_msgSend(v68, "updateLayer:contentRect:contentsScale:properties:", v67, v58, v23.n64_f64[0], v24.n64_f64[0], v25.n64_f64[0], v26.n64_f64[0], v21);

        v61 = (void *)v67;
      }
      else
      {
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "createLayerWithID:contentRect:contentsScale:properties:isCoreAnimationSurface:", v18, v58, 0, v23.n64_f64[0], v24.n64_f64[0], v25.n64_f64[0], v26.n64_f64[0], v21));

        if (!v61)
          __assert_rtn("-[DYEAGLFunctionPlayer executePlatformFunction]", (const char *)&unk_224E1, 0, "layer");
      }
      v70 = sub_55DC((_QWORD *)(v8 + 200), &v76);
      if (!v70)
      {
        memset(v74, 0, sizeof(v74));
        v75 = 1065353216;
        v78 = &v76;
        v71 = sub_D470(v8 + 200, &v76, (uint64_t)&unk_237D1, &v78);
        sub_D6DC((uint64_t)(v71 + 3), (uint64_t *)v74);
        sub_49BC((uint64_t)v74);
        *(_QWORD *)&v74[0] = &v76;
        v70 = sub_D470(v8 + 200, &v76, (uint64_t)&unk_237D1, (_QWORD **)v74);
      }
      sub_D7E0((uint64_t)(v70 + 3), &v77, &v77);
LABEL_75:

LABEL_76:
      return;
  }
}

- (BOOL)shouldExecuteGraphicsFunction
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v19;
  uint64_t v20;
  unsigned int *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int *v25;
  uint64_t *v26;
  GPUTools::GL *v27;
  int v28;
  uint64_t framebuffer_binding_enum;
  _QWORD *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  GPUTools::GL *v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  int v45;
  int v46;
  uint64_t v48;
  uint64_t v49;
  objc_super v50;
  unsigned int *v51;
  uint64_t v52;
  objc_super v53;
  uint64_t v54;
  unsigned int v55;
  unsigned int v56;

  v3 = *(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
  v4 = *(_DWORD *)v3;
  v5 = *(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo];
  if (*(int *)v3 > 839)
  {
    if (v4 > 889)
    {
      if (v4 == 890)
      {
        v6 = *(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
        v7 = *(_QWORD *)(v3 + 96);
        v8 = **(unsigned int **)(v3 + 72);
        v9 = 1610;
      }
      else
      {
        if (v4 != 987)
          goto LABEL_35;
        v6 = *(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
        v7 = *(_QWORD *)(v3 + 96);
        v8 = **(unsigned int **)(v3 + 72);
        v9 = 1617;
      }
    }
    else
    {
      if (v4 == 840)
      {
        DYReserveGLVAOs(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx], *(_QWORD *)(v3 + 96), **(unsigned int **)(v3 + 72));
        return 0;
      }
      if (v4 != 858)
        goto LABEL_35;
      v6 = *(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
      v7 = *(_QWORD *)(v3 + 96);
      v8 = **(unsigned int **)(v3 + 72);
      v9 = 1611;
    }
LABEL_39:
    DYReserveGLObjects(v6, v9, v7, v8);
    return 0;
  }
  if (v4 > 200)
  {
    switch(v4)
    {
      case 201:
        v6 = *(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
        v7 = *(_QWORD *)(v3 + 96);
        v8 = **(unsigned int **)(v3 + 72);
        v9 = 1605;
        goto LABEL_39;
      case 203:
        v6 = *(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
        v7 = *(_QWORD *)(v3 + 96);
        v8 = **(unsigned int **)(v3 + 72);
        v9 = 1608;
        goto LABEL_39;
      case 206:
        v6 = *(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
        v7 = *(_QWORD *)(v3 + 96);
        v8 = **(unsigned int **)(v3 + 72);
        v9 = 1606;
        goto LABEL_39;
      case 207:
        v6 = *(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
        v7 = *(_QWORD *)(v3 + 96);
        v8 = **(unsigned int **)(v3 + 72);
        v9 = 1609;
        goto LABEL_39;
      case 208:
        v6 = *(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
        v7 = *(_QWORD *)(v3 + 96);
        v8 = **(unsigned int **)(v3 + 72);
        v9 = 1600;
        goto LABEL_39;
      default:
        goto LABEL_35;
    }
  }
  if (v4 == 116)
  {
    if ((*(_WORD *)(v3 + 46) & 0x10) == 0)
    {
      DYReserveGLProgram(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx], **(unsigned int **)(v3 + 24));
      return 0;
    }
  }
  else if (v4 == 117)
  {
    if ((*(_WORD *)(v3 + 46) & 0x10) == 0)
    {
      DYReserveGLShader(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx], **(unsigned int **)(v3 + 24), **(unsigned int **)(v3 + 72));
      return 0;
    }
  }
  else if (v4 == 192
         && (objc_msgSend(*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__captureSessionInfo], "guestAppWasLinkedOnApexOrLater") & 1) == 0)
  {
    v10 = **(unsigned int **)(v3 + 96);
    if ((v10 & 0xFFFFFFDF) == 0x8D00)
    {
      v11 = **(unsigned int **)(v3 + 72);
      v12 = v3;
      v13 = **(_DWORD **)(v3 + 144);
      if ((_DWORD)v10 == 36096)
        v14 = 36128;
      else
        v14 = 36096;
      LODWORD(v51) = 0;
      v15 = OBJC_IVAR___DYGLFunctionPlayer__disp;
      v16 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, unsigned int **))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                                                 + 5440))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], v11, v14, 36048, &v51);
      if ((_DWORD)v51 == 36161)
      {
        v56 = 0;
        (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, unsigned int *))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v15]
                                                                                  + 5440))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v16], v11, v14, 36049, &v56);
        if (v56 != v13 && v56 != 0)
        {
          v55 = 0;
          (*(void (**)(_QWORD, uint64_t, unsigned int *))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v15]
                                                                  + 832))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v16], 36007, &v55);
          (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v15] + 5328))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v16], 36161, v56);
          v54 = 0;
          (*(void (**)(_QWORD, uint64_t, uint64_t, char *))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v15]
                                                                   + 5360))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v16], 36161, 36162, (char *)&v54 + 4);
          (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t *))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v15]
                                                                      + 5360))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v16], 36161, 36163, &v54);
          (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v15]
                                                                           + 5352))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v16], 36161, 35056, HIDWORD(v54), v54);
          (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v15]
                                                                            + 5432))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v16], v11, v10, 36161, v56);
          (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v15] + 5328))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v16], 36161, v55);
          return 0;
        }
      }
      v3 = v12;
    }
  }
LABEL_35:
  if (!*(_BYTE *)(v5 + 240))
  {
    v53.receiver = self;
    v53.super_class = (Class)DYEAGLFunctionPlayer;
    return -[DYEAGLFunctionPlayer shouldExecuteGraphicsFunction](&v53, "shouldExecuteGraphicsFunction");
  }
  if (v4 <= 126)
  {
    if (v4 == 17)
    {
      v45 = **(_DWORD **)(v3 + 96);
      if (v45)
      {
        v46 = **(_DWORD **)(v3 + 72);
        if (v46 == 36160 || v46 == 36009)
          *(_DWORD *)(v5 + 112) = v45;
      }
    }
    else if (v4 == 121)
    {
      v23 = v3;
      v24 = **(unsigned int **)(v3 + 72);
      if ((_DWORD)v24)
      {
        v25 = *(unsigned int **)(v23 + 96);
        do
        {
          if (*v25 == *(_DWORD *)(v5 + 112))
            *(_DWORD *)(v5 + 112) = 0;
          v26 = sub_6608((_QWORD *)(v5 + 120), v25);
          if (v26)
            sub_66BC((_QWORD *)(v5 + 120), v26);
          ++v25;
          --v24;
        }
        while (v24);
      }
    }
  }
  else
  {
    switch(v4)
    {
      case 825:
        if (**(_DWORD **)(v3 + 96) == 35449)
        {
          v27 = (GPUTools::GL *)**(unsigned int **)(v3 + 72);
          v28 = **(_DWORD **)(v3 + 120);
          v56 = 0;
          framebuffer_binding_enum = GPUTools::GL::dy_get_framebuffer_binding_enum(v27, a2);
          (*(void (**)(_QWORD, uint64_t, unsigned int *))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                                  + 832))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], framebuffer_binding_enum, &v56);
          v51 = &v56;
          v30 = sub_DAF0(v5 + 120, &v56, (uint64_t)&unk_237D1, &v51);
          *((_DWORD *)v30 + 6) = v28;
          if (*((_DWORD *)v30 + 5))
          {
            v31 = v30;
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer currentRenderbufferDrawableMap](self, "currentRenderbufferDrawableMap"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v31 + 5)));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v33));

            v35 = objc_msgSend(v34, "unsignedLongLongValue");
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "layerForID:", v35));

            -[DYEAGLFunctionPlayer _transformCoreAnimationLayer:rotated:](self, "_transformCoreAnimationLayer:rotated:", v37, v28 == 35453);
          }
        }
        break;
      case 194:
        v38 = (GPUTools::GL *)**(unsigned int **)(v3 + 72);
        v39 = **(unsigned int **)(v3 + 120);
        v56 = **(_DWORD **)(v3 + 144);
        if (sub_6608((_QWORD *)(v5 + 160), &v56))
        {
          v41 = GPUTools::GL::dy_get_framebuffer_binding_enum(v38, v40);
          v55 = 0;
          v42 = OBJC_IVAR___DYGLFunctionPlayer__disp;
          v43 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
          (*(void (**)(_QWORD, uint64_t, unsigned int *))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                                  + 832))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], v41, &v55);
          if (v55)
          {
            v51 = &v55;
            v44 = sub_DAF0(v5 + 120, &v55, (uint64_t)&unk_237D1, &v51);
            if (!*((_DWORD *)v44 + 5))
              -[DYEAGLFunctionPlayer _createIOSurfaceReplacementForFramebuffer:](self, "_createIOSurfaceReplacementForFramebuffer:", (char *)v44 + 20);
            HIDWORD(v54) = 0;
            (*(void (**)(_QWORD, uint64_t, char *))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v42] + 832))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v43], 36007, (char *)&v54 + 4);
            (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v42] + 5328))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v43], 36161, *((unsigned int *)v44 + 5));
            v51 = 0;
            v52 = 0;
            (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t *))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v42]
                                                                        + 5360))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v43], 36161, 36162, &v52);
            (*(void (**)(_QWORD, uint64_t, uint64_t, char *))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v42]
                                                                     + 5360))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v43], 36161, 36163, (char *)&v52 + 4);
            (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v42] + 5328))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v43], 36161, HIDWORD(v54));
            (*(void (**)(_QWORD))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v42] + 720))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v43]);
            LODWORD(v49) = 0;
            BYTE5(v48) = *((_DWORD *)v44 + 6) == 35453;
            BYTE4(v48) = 0;
            LODWORD(v48) = -1;
            -[DYEAGLFunctionPlayer drawTexture:target:framebuffer:bounds:clearBits:modulateColor:enableBlend:rotated:texBlitProgram:](self, "drawTexture:target:framebuffer:bounds:clearBits:modulateColor:enableBlend:rotated:texBlitProgram:", v56, v39, v55, v51, v52, 0, v48, v49);
            return 0;
          }
        }
        break;
      case 127:
        v19 = v3;
        v20 = **(unsigned int **)(v3 + 72);
        if ((_DWORD)v20)
        {
          v21 = *(unsigned int **)(v19 + 96);
          do
          {
            v22 = sub_6608((_QWORD *)(v5 + 160), v21);
            if (v22)
              sub_66BC((_QWORD *)(v5 + 160), v22);
            ++v21;
            --v20;
          }
          while (v20);
        }
        break;
    }
  }
  v50.receiver = self;
  v50.super_class = (Class)DYEAGLFunctionPlayer;
  return -[DYEAGLFunctionPlayer shouldExecuteGraphicsFunction](&v50, "shouldExecuteGraphicsFunction");
}

- (unint64_t)_generateDrawableId
{
  unordered_set<unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<unsigned long long>> *p_ioSurfaceDrawableIdSet;
  unint64_t *i;
  unint64_t v5;

  p_ioSurfaceDrawableIdSet = &self->_ioSurfaceDrawableIdSet;
  for (i = &self->_nextIOSurfaceDrawableId;
        sub_55DC(p_ioSurfaceDrawableIdSet, i);
  v5 = *i;
  sub_DD1C((uint64_t)p_ioSurfaceDrawableIdSet, &v5, &v5);
  *i = ((unsigned __int16)*(_DWORD *)i + 1) & 0xFFF;
  return v5;
}

- (void)_destroyDrawableId:(unint64_t)a3
{
  unint64_t v3;

  v3 = a3;
  sub_DF34(&self->_ioSurfaceDrawableIdSet.__table_.__bucket_list_.__ptr_.__value_, &v3);
}

- (void)_createIOSurfaceReplacementForFramebuffer:(FramebufferInfo *)a3
{
  _DWORD **v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  FramebufferInfo *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;

  v5 = *(_DWORD ***)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
  v6 = *v5[9];
  v7 = *v5[15];
  v8 = *v5[18];
  v9 = (v8 + 1000000);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer currentRenderbufferDrawableMap](self, "currentRenderbufferDrawableMap"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v9));
  v31 = v6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));

  v13 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  v14 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  if (v12)
  {
    v15 = 0;
  }
  else
  {
    v37 = 0;
    v36 = 0;
    v30 = v10;
    (*(void (**)(_QWORD, uint64_t, char *))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                    + 832))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 32873, (char *)&v37 + 4);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v13] + 40))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v14], 3553, v8);
    (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t *))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v13]
                                                                        + 1000))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v14], v7, 0, 4096, &v37);
    (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t, int *))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v13]
                                                                    + 1000))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v14], v7, 0, 4097, &v36);
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v13] + 40))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v14], 3553, HIDWORD(v37));
    v16 = -[DYEAGLFunctionPlayer _generateDrawableId](self, "_generateDrawableId");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v9));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__captureSessionInfo], "deviceInfo"));
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v27 = a3;
    v28 = v19;
    if (v19)
    {
      objc_msgSend(v19, "mainScreenDescriptor");
      v20 = HIDWORD(v34);
      v21 = v35;
      v22 = v34;
    }
    else
    {
      v20 = 0;
      v21 = 0;
      v22 = 0;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layerForID:", v16));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v24, kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat, 0));

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "createLayerWithID:contentRect:contentsScale:properties:isCoreAnimationSurface:", v16, v25, 1, 0.0, 0.0, (double)(v22 / v21), (double)(v20 / v21), (float)v21));

    a3 = v27;
    v12 = 0;
    v10 = v30;
    -[DYEAGLFunctionPlayer _transformCoreAnimationLayer:rotated:](self, "_transformCoreAnimationLayer:rotated:", v15, v27->var1 == 35453);
    v32 = 0;
    (*(void (**)(_QWORD, uint64_t, unsigned int *))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v13] + 832))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v14], 36007, &v32);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v13] + 5328))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v14], 36161, v9);
    objc_msgSend(*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx], "renderbufferStorage:fromDrawable:", 36161, v15);
    +[CATransaction flush](CATransaction, "flush");
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v13] + 5328))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v14], 36161, v32);

  }
  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v13]
                                                                    + 5432))(*(_QWORD *)&self->DYGLFunctionPlayer_opaque[v14], v31, 36064, 36161, v9);
  a3->var0 = v9;

}

- (unsigned)_loadShaderWithType:(unsigned int)a3 source:(const char *)a4 dispatcher:(Dispatcher *)a5
{
  uint64_t v6;
  void *v7;
  int size;
  int size_4;
  const char *v11;

  v11 = a4;
  v6 = DYCreatePrivateGLShader(*(_QWORD *)a5->var0);
  if ((_DWORD)v6)
  {
    size_4 = 0;
    ((void (*)(_QWORD, _QWORD, uint64_t, const char **, _QWORD))a5->var1->shader_source_ARB)(*((_QWORD *)a5->var0 + 2), v6, 1, &v11, 0);
    ((void (*)(_QWORD, _QWORD))a5->var1->compile_shader_ARB)(*((_QWORD *)a5->var0 + 2), v6);
    ((void (*)(_QWORD, uint64_t, uint64_t, int *))a5->var1->get_shaderiv)(*((_QWORD *)a5->var0 + 2), v6, 35713, &size_4);
    if (!size_4)
    {
      size = 0;
      ((void (*)(_QWORD, uint64_t, uint64_t, int *))a5->var1->get_shaderiv)(*((_QWORD *)a5->var0 + 2), v6, 35716, &size);
      if (size >= 2)
      {
        v7 = malloc_type_malloc(size, 0x7586B1F5uLL);
        ((void (*)(_QWORD, uint64_t, _QWORD, _QWORD, void *))a5->var1->get_shader_info_log)(*((_QWORD *)a5->var0 + 2), v6, size, 0, v7);
        free(v7);
      }
      ((void (*)(_QWORD, _QWORD))a5->var1->delete_object_ARB)(*((_QWORD *)a5->var0 + 2), v6);
      LODWORD(v6) = 0;
    }
  }
  return v6;
}

- (BOOL)_linkProgram:(GLSLObject)a3 dispatcher:(Dispatcher *)a4
{
  uint64_t v5;
  void *v6;
  int size;
  int size_4;

  v5 = *(_QWORD *)&a3.var0;
  size_4 = 0;
  ((void (*)(_QWORD, _QWORD))a4->var1->link_program_ARB)(*((_QWORD *)a4->var0 + 2), a3.var0);
  ((void (*)(_QWORD, uint64_t, uint64_t, int *))a4->var1->get_programiv)(*((_QWORD *)a4->var0 + 2), v5, 35714, &size_4);
  if (!size_4)
  {
    size = 0;
    ((void (*)(_QWORD, uint64_t, uint64_t, int *))a4->var1->get_programiv)(*((_QWORD *)a4->var0 + 2), v5, 35716, &size);
    if (size >= 2)
    {
      v6 = malloc_type_malloc(size, 0x7AE92E80uLL);
      ((void (*)(_QWORD, uint64_t, _QWORD, _QWORD, void *))a4->var1->get_program_info_log)(*((_QWORD *)a4->var0 + 2), v5, size, 0, v6);
      free(v6);
    }
  }
  return size_4 != 0;
}

- (unsigned)_loadSimpleProgramWithVertexSource:(const char *)a3 fragmentSource:(const char *)a4 link:(BOOL)a5 dispatcher:(Dispatcher *)a6
{
  _BOOL4 v7;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  __GLIFunctionDispatchRec *var1;
  uint64_t v16;

  v7 = a5;
  v10 = -[DYEAGLFunctionPlayer _loadShaderWithType:source:dispatcher:](self, "_loadShaderWithType:source:dispatcher:", 35633, a3, a6);
  if (!v10)
    return 0;
  v11 = v10;
  v12 = -[DYEAGLFunctionPlayer _loadShaderWithType:source:dispatcher:](self, "_loadShaderWithType:source:dispatcher:", 35632, a4, a6);
  if (!v12)
  {
    ((void (*)(_QWORD, _QWORD))a6->var1->delete_object_ARB)(*((_QWORD *)a6->var0 + 2), v11);
    return 0;
  }
  v13 = v12;
  v14 = DYCreatePrivateGLProgram(*(_QWORD *)a6->var0);
  var1 = a6->var1;
  v16 = *((_QWORD *)a6->var0 + 2);
  if (!v14)
  {
    ((void (*)(uint64_t, _QWORD))var1->delete_object_ARB)(v16, v11);
    ((void (*)(_QWORD, _QWORD))a6->var1->delete_object_ARB)(*((_QWORD *)a6->var0 + 2), v13);
    return v14;
  }
  ((void (*)(uint64_t, _QWORD, _QWORD))var1->attach_object_ARB)(v16, v14, v11);
  ((void (*)(_QWORD, _QWORD, _QWORD))a6->var1->attach_object_ARB)(*((_QWORD *)a6->var0 + 2), v14, v13);
  ((void (*)(_QWORD, _QWORD))a6->var1->delete_object_ARB)(*((_QWORD *)a6->var0 + 2), v11);
  ((void (*)(_QWORD, _QWORD))a6->var1->delete_object_ARB)(*((_QWORD *)a6->var0 + 2), v13);
  if (v7 && !-[DYEAGLFunctionPlayer _linkProgram:dispatcher:](self, "_linkProgram:dispatcher:", v14, a6))
  {
    ((void (*)(_QWORD, _QWORD))a6->var1->delete_object_ARB)(*((_QWORD *)a6->var0 + 2), v14);
    return 0;
  }
  return v14;
}

- (void)drawTexture:(unsigned int)a3 target:(unsigned int)a4 framebuffer:(unsigned int)a5 bounds:(IntegerRect)a6 clearBits:(unsigned int)a7 modulateColor:(unsigned int)a8 enableBlend:(BOOL)a9 rotated:(BOOL)a10 texBlitProgram:(unsigned int)a11
{
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  char *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t var1;
  uint64_t var0;
  uint64_t var3;
  uint64_t var2;
  __n128 v29;
  void *v30;
  uint64_t *v31;
  double *v32;
  float v33;
  float v34;
  id v35;
  __n128 v40;
  id v41;
  id v42;
  GPUTools::GL *v43;
  int v44;
  _BYTE v45[21];
  int v46;
  double v47;
  double v48;
  id **v49;
  uint64_t v50;
  id *v51;
  void (**v52)(_QWORD, _QWORD);
  uint64_t v53;
  uint64_t v54;
  float v55;
  unint64_t v56;
  float v57;

  if ((byte_2AC50 & 1) == 0)
  {
    qword_2ABF0 = 2;
    qword_2ABF8 = (uint64_t)"attribute highp vec2 inVertex;                             \n"
                           "attribute highp vec2 inTexCoord;                           \n"
                           "attribute highp vec4 inColor;                              \n"
                           "                                                           \n"
                           "varying highp vec2 vTexCoord;                              \n"
                           "varying highp vec4 vColor;                                 \n"
                           "                                                           \n"
                           "void main() {                                              \n"
                           "    vTexCoord = inTexCoord;                                \n"
                           "    vColor = inColor;                                      \n"
                           "    gl_Position = vec4(inVertex, 0.0, 1.0);                \n"
                           "}                                                          \n";
    qword_2AC00 = (uint64_t)"uniform sampler2D tex2D;                                   \n"
                           "varying lowp vec2 vTexCoord;                               \n"
                           "varying lowp vec4 vColor;                                  \n"
                           "                                                           \n"
                           "void main() {                                              \n"
                           "    gl_FragColor = texture2D(tex2D, vTexCoord) * vColor;   \n"
                           "}                                                          \n";
    unk_2AC08 = 2;
    qword_2AC10 = (uint64_t)"attribute highp vec2 inVertex;                             \n"
                           "attribute highp vec2 inTexCoord;                           \n"
                           "attribute highp vec4 inColor;                              \n"
                           "                                                           \n"
                           "varying highp vec2 vTexCoord;                              \n"
                           "varying highp vec4 vColor;                                 \n"
                           "                                                           \n"
                           "void main() {                                              \n"
                           "    vTexCoord = inTexCoord;                                \n"
                           "    vColor = inColor;                                      \n"
                           "    gl_Position = vec4(inVertex, 0.0, 1.0);                \n"
                           "}                                                          \n";
    unk_2AC18 = "uniform sampler2D tex2D;                                   \n"
                "varying lowp vec2 vTexCoord;                               \n"
                "varying lowp vec4 vColor;                                  \n"
                "                                                           \n"
                "void main() {                                              \n"
                "    gl_FragColor = texture2D(tex2D, vTexCoord).rrrr * vColor;  \n"
                "}                                                          \n";
    qword_2AC20 = 3;
    unk_2AC28 = "#version 300 es                                            \n"
                "in vec2 inVertex;                                          \n"
                "in vec2 inTexCoord;                                        \n"
                "in vec4 inColor;                                           \n"
                "                                                           \n"
                "out vec2 vTexCoord;                                        \n"
                "out vec4 vColor;                                           \n"
                "                                                           \n"
                "void main() {                                              \n"
                "    vTexCoord = inTexCoord;                                \n"
                "    vColor = inColor;                                      \n"
                "    gl_Position = vec4(inVertex, 0.0, 1.0);                \n"
                "}                                                          \n";
    qword_2AC30 = (uint64_t)"#version 300 es                                            \n"
                           "uniform highp isampler2D tex2D;                            \n"
                           "uniform highp vec2 range;                                  \n"
                           "in lowp vec2 vTexCoord;                                    \n"
                           "in lowp vec4 vColor;                                       \n"
                           "                                                           \n"
                           "out highp vec4 fragData;                                   \n"
                           "                                                           \n"
                           "void main() {                                              \n"
                           "   highp vec4 texel = vec4(texture(tex2D, vTexCoord));           \n"
                           "   fragData = (texel - range.x) / range.y;                 \n"
                           "   fragData = clamp(fragData, 0.0, 1.0);                   \n"
                           "   fragData *= vColor;                                     \n"
                           "}                                                          \n";
    unk_2AC38 = 3;
    qword_2AC40 = (uint64_t)"#version 300 es                                            \n"
                           "in vec2 inVertex;                                          \n"
                           "in vec2 inTexCoord;                                        \n"
                           "in vec4 inColor;                                           \n"
                           "                                                           \n"
                           "out vec2 vTexCoord;                                        \n"
                           "out vec4 vColor;                                           \n"
                           "                                                           \n"
                           "void main() {                                              \n"
                           "    vTexCoord = inTexCoord;                                \n"
                           "    vColor = inColor;                                      \n"
                           "    gl_Position = vec4(inVertex, 0.0, 1.0);                \n"
                           "}                                                          \n";
    unk_2AC48 = "#version 300 es                                            \n"
                "uniform highp usampler2D tex2D;                            \n"
                "uniform highp vec2 range;                                  \n"
                "in lowp vec2 vTexCoord;                                    \n"
                "in lowp vec4 vColor;                                       \n"
                "                                                           \n"
                "out highp vec4 fragData;                                   \n"
                "                                                           \n"
                "void main() {                                              \n"
                "   highp vec4 texel = vec4(texture(tex2D, vTexCoord));     \n"
                "   fragData = (texel - range.x) / range.y;                 \n"
                "   fragData = clamp(fragData, 0.0, 1.0);                   \n"
                "   fragData *= vColor;                                     \n"
                "}                                                          \n";
    byte_2AC50 = 1;
  }
  v12 = OBJC_IVAR___DYGLFunctionPlayer__sharegroup_dict;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__sharegroup_dict], "objectForKey:", CFSTR("tex_blit_ctx"), *(_QWORD *)&a4));
  if (!v13)
  {
    v14 = *(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
    v15 = objc_alloc((Class)EAGLContext);
    v16 = objc_msgSend(v14, "API");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sharegroup"));
    v18 = objc_msgSend(v15, "initWithAPI:sharegroup:", v16, v17);

    objc_msgSend(*(id *)&self->DYGLFunctionPlayer_opaque[v12], "setObject:forKey:", v18, CFSTR("tex_blit_ctx"));
    v35 = v18;
    sub_485C(&v41, v18);
    v51 = &v41;
    v52 = *(void (***)(_QWORD, _QWORD))&v45[4];
    v19 = (char *)objc_msgSend(v14, "API");
    v20 = v51[2];
    if (v19 == (_BYTE *)&dword_0 + 1)
    {
      ((void (**)(id, uint64_t))v52)[72](v20, 3553);
      ((void (**)(id, uint64_t))v52)[73](v51[2], 32884);
      ((void (*)(id, uint64_t, uint64_t, _QWORD, void *))v52[334])(v51[2], 2, 5126, 0, &unk_23850);
    }
    else
    {
      ((void (**)(id, _QWORD))v52)[512](v20, 0);
      ((void (*)(id, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, void *))v52[511])(v51[2], 0, 2, 5126, 0, 0, &unk_23850);
      v21 = 0;
      v22 = &qword_2AC00;
      do
      {
        if ((unint64_t)objc_msgSend(v14, "API", v35) >= *(v22 - 2))
        {
          v23 = -[DYEAGLFunctionPlayer _loadSimpleProgramWithVertexSource:fragmentSource:link:dispatcher:](self, "_loadSimpleProgramWithVertexSource:fragmentSource:link:dispatcher:", *(v22 - 1), *v22, 0, &v51);
          ((void (*)(id, _QWORD, _QWORD, const char *))v52[630])(v51[2], v23, 0, "inVertex");
          ((void (*)(id, _QWORD, uint64_t, const char *))v52[630])(v51[2], v23, 1, "inTexCoord");
          ((void (*)(id, _QWORD, uint64_t, const char *))v52[630])(v51[2], v23, 2, "inColor");
          -[DYEAGLFunctionPlayer _linkProgram:dispatcher:](self, "_linkProgram:dispatcher:", v23, &v51);
          dword_2AC64[v21] = ((uint64_t (*)(id, _QWORD, const char *))v52[625])(v51[2], v23, "range");
          dword_2AC54[v21] = v23;
        }
        ++v21;
        v22 += 3;
      }
      while (v21 != 4);
    }
    ((void (*)(id, uint64_t, uint64_t))v52[7])(v51[2], 1, 771);

    v13 = v35;
  }
  sub_485C(&v51, v13);
  v24 = v54;
  v49 = &v51;
  v50 = v54;
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v54 + 40))(v53, 3553, 0);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v24 + 40))(v53, 3553, a3);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v24 + 5376))(v53, 36160, 0);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v24 + 5376))(v53, 36160, a5);
  if (a7)
    (*(void (**)(uint64_t, _QWORD))(v24 + 80))(v53, a7);
  if (a10)
    var1 = a6.var1;
  else
    var1 = a6.var0;
  if (a10)
    var0 = a6.var0;
  else
    var0 = a6.var1;
  if (a10)
    var3 = a6.var3;
  else
    var3 = a6.var2;
  if (a10)
    var2 = a6.var2;
  else
    var2 = a6.var3;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 2680))(v53, var1, var0, var3, var2);
  if (a9)
    v29 = ((__n128 (*)(uint64_t, uint64_t))*(_QWORD *)(v24 + 576))(v53, 3042);
  v55 = (float)HIBYTE(a8) / 255.0;
  v29.n128_u64[0] = (unint64_t)vdiv_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(a8), (uint32x2_t)0xFFFFFFF8FFFFFFF0), (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u));
  v40 = v29;
  v56 = v29.n128_u64[0];
  v57 = (float)a8 / 255.0;
  if (a10)
    v30 = &unk_23890;
  else
    v30 = &unk_23870;
  v31 = &v53;
  if (objc_msgSend(v13, "API", v35) == (char *)&dword_0 + 1)
  {
    (*(void (**)(uint64_t, float, __n128, float, float))(v24 + 296))(v53, (float)HIBYTE(a8) / 255.0, v40, v40.n128_f32[1], (float)a8 / 255.0);
    (*(void (**)(uint64_t, uint64_t))(v24 + 584))(v53, 32888);
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, void *))(v24 + 2312))(v53, 2, 5126, 0, v30);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, float *))(v24 + 4024))(v53, 2, &v55);
    (*(void (**)(uint64_t, uint64_t))(v24 + 4096))(v53, 1);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, void *))(v24 + 4088))(v53, 1, 2, 5126, 0, 0, v30);
    (*(void (**)(uint64_t, _QWORD))(v24 + 4800))(v53, dword_2AC54[a11]);
    if ((a11 & 0xFFFFFFFE) == 2)
    {
      v47 = 0.0;
      v48 = 0.0;
      v46 = 0;
      (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, int *))(v24 + 1000))(v53, 3553, 0, 4099, &v46);
      v41 = 0;
      v42 = 0;
      v44 = 0;
      v43 = 0;
      *(_OWORD *)v45 = 0x100000001uLL;
      *(_QWORD *)&v45[13] = 0;
      GPUTools::GL::GetImageInfo(&v49, 4, 3553, 0, &v41);
      GPUTools::GL::RangeForUnpackedType((GPUTools::GL *)HIDWORD(v43), &v48, &v47, v32);
      v33 = v48;
      v34 = v47 - v48;
      (*(void (**)(id *, _QWORD, float, float))(v50 + 4824))(v49[2], dword_2AC64[a11], v33, v34);
      v24 = v50;
      v31 = (uint64_t *)(v49 + 2);
    }
  }
  (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(v24 + 520))(*v31, 5, 0, 4);
  if (a9)
    (*(void (**)(id *, uint64_t))(v50 + 504))(v49[2], 3042);
  (*(void (**)(id *))(v50 + 712))(v49[2]);

}

- (void)_transformCoreAnimationLayer:(id)a3 rotated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  CGFloat v9;
  __int128 v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  CGAffineTransform v22;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__captureSessionInfo], "deviceInfo"));
  v8 = v7;
  v19 = 0.0;
  v20 = 0;
  v21 = 0;
  if (v7)
  {
    objc_msgSend(v7, "mainScreenDescriptor");
    v9 = v19;
  }
  else
  {
    v9 = 0.0;
  }
  v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v18.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v18.c = v10;
  *(_OWORD *)&v18.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&v17.a = *(_OWORD *)&v18.a;
  *(_OWORD *)&v17.c = v10;
  *(_OWORD *)&v17.tx = *(_OWORD *)&v18.tx;
  CGAffineTransformRotate(&v18, &v17, v9);
  v16 = v18;
  CGAffineTransformScale(&v22, &v16, 1.0, -1.0);
  v18 = v22;
  if (v4)
  {
    v15 = v18;
    CGAffineTransformScale(&v22, &v15, -1.0, -1.0);
    v18 = v22;
  }
  v12 = HIDWORD(v20);
  v11 = v21;
  v13 = v20;
  sub_A508((uint64_t)&v22, 1, 1);
  v14 = v18;
  objc_msgSend(v6, "setAffineTransform:", &v14);
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, (double)(v13 / v11), (double)(v12 / v11));
  sub_A5D0((uint64_t)&v22);

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
  sub_49BC((uint64_t)&self->_ioSurfaceDrawableIdSet);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 1112) = 0u;
  *(_OWORD *)((char *)self + 1128) = 0u;
  *((_DWORD *)self + 286) = 1065353216;
  return self;
}

@end
