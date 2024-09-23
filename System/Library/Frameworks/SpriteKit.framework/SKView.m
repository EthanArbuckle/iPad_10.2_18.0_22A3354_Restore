@implementation SKView

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setDynamicRenderBlock:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = MEMORY[0x1DF0CFCB0](a3, a2);
  v5 = *(void **)&self->_checkForDrawables;
  *(_QWORD *)&self->_checkForDrawables = v4;

}

- (void)setShouldCullNonVisibleNodes:(BOOL)shouldCullNonVisibleNodes
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", shouldCullNonVisibleNodes);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");

}

- (BOOL)shouldCullNonVisibleNodes
{
  void *v2;
  char v3;

  -[NSMapTable objectForKeyedSubscript:](self->_touchMap, "objectForKeyedSubscript:", CFSTR("cullNonVisibleNodes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setIgnoresSiblingOrder:(BOOL)ignoresSiblingOrder
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ignoresSiblingOrder);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");

}

- (void)setDisableDepthStencilBuffer:(BOOL)disableDepthStencilBuffer
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", disableDepthStencilBuffer);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");

}

- (BOOL)disableDepthStencilBuffer
{
  void *v2;
  char v3;

  -[NSMapTable valueForKey:](self->_touchMap, "valueForKey:", CFSTR("disableStencilBuffers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)ignoresSiblingOrder
{
  void *v2;
  char v3;

  -[NSMapTable objectForKeyedSubscript:](self->_touchMap, "objectForKeyedSubscript:", CFSTR("ignoresSiblingOrder"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setShowsFPS:(BOOL)showsFPS
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", showsFPS);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");

}

- (BOOL)showsFPS
{
  void *v2;
  char v3;

  -[NSMapTable valueForKey:](self->_touchMap, "valueForKey:", CFSTR("debugDrawStats_FPS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setShowsPhysics:(BOOL)showsPhysics
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", showsPhysics);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");

}

- (BOOL)showsPhysics
{
  void *v2;
  char v3;

  -[NSMapTable valueForKey:](self->_touchMap, "valueForKey:", CFSTR("debugDrawPhysics"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setShowsFields:(BOOL)showsFields
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", showsFields);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");

}

- (BOOL)showsFields
{
  void *v2;
  char v3;

  -[NSMapTable objectForKeyedSubscript:](self->_touchMap, "objectForKeyedSubscript:", CFSTR("debugDrawPhysicsFields"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setShowsQuadCount:(BOOL)showsQuadCount
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", showsQuadCount);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");

}

- (BOOL)showsQuadCount
{
  void *v2;
  char v3;

  -[NSMapTable objectForKeyedSubscript:](self->_touchMap, "objectForKeyedSubscript:", CFSTR("debugDrawStats_QuadCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setShowsNodeCount:(BOOL)showsNodeCount
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", showsNodeCount);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");

}

- (BOOL)showsNodeCount
{
  void *v2;
  char v3;

  -[NSMapTable objectForKeyedSubscript:](self->_touchMap, "objectForKeyedSubscript:", CFSTR("debugDrawStats_NodeCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setShowsDrawCount:(BOOL)showsDrawCount
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", showsDrawCount);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");

}

- (BOOL)showsDrawCount
{
  void *v2;
  char v3;

  -[NSMapTable objectForKeyedSubscript:](self->_touchMap, "objectForKeyedSubscript:", CFSTR("debugDrawStats_DrawCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)set_showsGPUStats:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");

}

- (BOOL)_showsGPUStats
{
  void *v2;
  char v3;

  -[NSMapTable objectForKeyedSubscript:](self->_touchMap, "objectForKeyedSubscript:", CFSTR("debugDrawStats_GPU"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)set_showsCPUStats:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");

}

- (BOOL)_showsCPUStats
{
  void *v2;
  char v3;

  -[NSMapTable objectForKeyedSubscript:](self->_touchMap, "objectForKeyedSubscript:", CFSTR("debugDrawStats_CPU"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)archiveToFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[SKView scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SKView scene](self, "scene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_info");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKView scene](self, "scene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "set_info:", v8);

    }
    -[SKView scene](self, "scene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_info");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKView description](self, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("SKView"));

    -[SKView scene](self, "scene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "archiveToFile:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to archive nil scene"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@"), v14);
  }

  return v14;
}

- (id)captureToFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *renderer;
  int v37;
  int v38;
  std::__shared_weak_count *v39;
  unint64_t *p_shared_owners;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v51;
  std::__shared_weak_count *v52;
  CGRect v53;

  v4 = a3;
  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("skc"));
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v10;
  }
  v11 = v4;
  v12 = v11;
  if ((objc_msgSend(v11, "isAbsolutePath") & 1) == 0)
  {
    objc_msgSend(v6, "stringByAppendingPathComponent:", v11);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByDeletingLastPathComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, 0, 0);

  -[SKView scene](self, "scene");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_24;
  -[SKView scene](self, "scene");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_info");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKView scene](self, "scene");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "set_info:", v19);

  }
  -[SKView scene](self, "scene");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_info");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("SKCapture"));

  -[SKView scene](self, "scene");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_info");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKView description](self, "description");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setValue:forKey:", v25, CFSTR("SKView"));

  -[SKView scene](self, "scene");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_info");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKView bounds](self, "bounds");
  NSStringFromCGRect(v53);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setValue:forKey:", v28, CFSTR("SKView_Bounds"));

  -[SKView scene](self, "scene");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_info");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  SKGetVersionString();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setValue:forKey:", v31, CFSTR("SKVersion"));

  -[SKView scene](self, "scene");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_info");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x1E0CB37E8];
  -[SKView _getViewContentsScale](self, "_getViewContentsScale");
  objc_msgSend(v34, "numberWithFloat:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setValue:forKey:", v35, CFSTR("SKView_ScaleFactor"));

  renderer = self->_renderer;
  if (!renderer)
  {
    -[SKView scene](self, "scene");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "_info");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setValue:forKey:", CFSTR("None"), CFSTR("SKView_ContextType"));
    goto LABEL_21;
  }
  SKCRenderer::getBackingContext((uint64_t)renderer, &v51);
  v37 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v51 + 136))(v51);
  v38 = v37;
  v39 = v52;
  if (v52)
  {
    p_shared_owners = (unint64_t *)&v52->__shared_owners_;
    do
      v41 = __ldaxr(p_shared_owners);
    while (__stlxr(v41 - 1, p_shared_owners));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
      if (v38)
        goto LABEL_16;
LABEL_20:
      -[SKView scene](self, "scene");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "_info");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setValue:forKey:", CFSTR("OpenGL"), CFSTR("SKView_ContextType"));
      goto LABEL_21;
    }
  }
  if (!v37)
    goto LABEL_20;
LABEL_16:
  if (v38 != 1)
    goto LABEL_22;
  -[SKView scene](self, "scene");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "_info");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setValue:forKey:", CFSTR("Metal"), CFSTR("SKView_ContextType"));
LABEL_21:

LABEL_22:
  v44 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initForWritingWithMutableData:", v45);
  objc_msgSend(v46, "setDelegate:", v44);
  objc_msgSend(v46, "setRequiresSecureCoding:", 0);
  -[SKView scene](self, "scene");
  v47 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "encodeObject:forKey:", v47, *MEMORY[0x1E0CB2CD0]);

  objc_msgSend(v46, "finishEncoding");
  LOBYTE(v47) = objc_msgSend(v45, "writeToFile:atomically:", v12, 1);

  if ((v47 & 1) == 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to archive %@ to %@"), self, v12);
    v48 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Archived %@ to %@"), self, v12);
  v48 = objc_claimAutoreleasedReturnValue();
LABEL_25:
  v49 = (void *)v48;
  NSLog(CFSTR("%@"), v48);

  return v49;
}

- (void)debugPrint
{
  id v3;

  NSLog(CFSTR("debugPrint: %p %@"), a2, self, self);
  NSLog(CFSTR("-------------------------------"));
  -[SKView scene](self, "scene");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "debugPrint");

}

+ (Class)layerClass
{
  if (SKGetShouldEnableMetal())
    jet_isMetalSupported();
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)remakeFramebuffer
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  float v9;
  float v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  int v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t texture_2d;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  int v28;
  int v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  unint64_t *v40;
  unint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  uint64_t v45;
  EAGLContext *v46;
  void *v47;
  unsigned int *p_colorRenderBuffer;
  GLuint colorRenderBuffer;
  void *v50;
  char v51;
  uint64_t v52;
  int v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  __int128 v57;
  GLint params[2];
  __int128 v59;
  __int128 v60;

  kdebug_trace();
  *(_QWORD *)&self->_viewFramebufferPixelSize[5] = 0;
  v3 = -[SKView chooseViewRenderer](self, "chooseViewRenderer");
  if (!v3)
  {
    self->_viewFramebufferIsValid = 0;
    kdebug_trace();
    return;
  }
  v4 = (uint64_t)v3;
  if (!self->_framebuffer.__ptr_)
  {
    SKCRenderer::getBackingContext((uint64_t)self->_renderer, &v59);
    v33 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v59 + 112))(v59);
    std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v60, v33);
    std::shared_ptr<jet_buffer_pool>::operator=[abi:ne180100]((uint64_t)&self->_framebuffer, &v60);
    v34 = (std::__shared_weak_count *)*((_QWORD *)&v60 + 1);
    if (*((_QWORD *)&v60 + 1))
    {
      v35 = (unint64_t *)(*((_QWORD *)&v60 + 1) + 8);
      do
        v36 = __ldaxr(v35);
      while (__stlxr(v36 - 1, v35));
      if (!v36)
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
      }
    }
    v37 = (std::__shared_weak_count *)*((_QWORD *)&v59 + 1);
    if (*((_QWORD *)&v59 + 1))
    {
      v38 = (unint64_t *)(*((_QWORD *)&v59 + 1) + 8);
      do
        v39 = __ldaxr(v38);
      while (__stlxr(v39 - 1, v38));
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
      }
    }
  }
  -[SKView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[SKView getRenderOptions](self, "getRenderOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ingnoreMissingWindow"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if ((v8 & 1) == 0)
    {
      self->_viewFramebufferIsValid = 0;
      kdebug_trace();

      return;
    }

  }
  -[SKView _getViewContentsScale](self, "_getViewContentsScale");
  v10 = v9;
  -[SKView bounds](self, "bounds");
  v11 = v10;
  v13 = (v12 * v11);
  -[SKView bounds](self, "bounds");
  v15 = (v14 * v11);
  if (v13 < 2 || v15 <= 1)
  {
    self->_viewFramebufferIsValid = 0;
    kdebug_trace();
    return;
  }
  SKCRenderer::getBackingContext(v4, &v60);
  v17 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v60 + 136))(v60);
  v18 = (std::__shared_weak_count *)*((_QWORD *)&v60 + 1);
  if (*((_QWORD *)&v60 + 1))
  {
    v19 = (unint64_t *)(*((_QWORD *)&v60 + 1) + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  if (v17 == 1)
    -[CAMetalLayer setDrawableSize:](self->_metalLayer, "setDrawableSize:", (double)v13, (double)v15);
  std::shared_ptr<jet_buffer_pool>::reset[abi:ne180100](&self->_frameBufferDepthStencilTexture.__ptr_);
  if (!-[SKView disableDepthStencilBuffer](self, "disableDepthStencilBuffer"))
  {
    SKCRenderer::getBackingContext((uint64_t)self->_renderer, &v59);
    texture_2d = jet_context::create_texture_2d();
    std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v60, texture_2d);
    std::shared_ptr<jet_buffer_pool>::operator=[abi:ne180100]((uint64_t)&self->_frameBufferDepthStencilTexture, &v60);
    v22 = (std::__shared_weak_count *)*((_QWORD *)&v60 + 1);
    if (*((_QWORD *)&v60 + 1))
    {
      v23 = (unint64_t *)(*((_QWORD *)&v60 + 1) + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    v25 = (std::__shared_weak_count *)*((_QWORD *)&v59 + 1);
    if (*((_QWORD *)&v59 + 1))
    {
      v26 = (unint64_t *)(*((_QWORD *)&v59 + 1) + 8);
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
  }
  SKCRenderer::getBackingContext(v4, &v60);
  v28 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v60 + 136))(v60);
  v29 = v28;
  v30 = (std::__shared_weak_count *)*((_QWORD *)&v60 + 1);
  if (!*((_QWORD *)&v60 + 1))
    goto LABEL_34;
  v31 = (unint64_t *)(*((_QWORD *)&v60 + 1) + 8);
  do
    v32 = __ldaxr(v31);
  while (__stlxr(v32 - 1, v31));
  if (!v32)
  {
    ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
    std::__shared_weak_count::__release_weak(v30);
    if (v29)
      goto LABEL_35;
  }
  else
  {
LABEL_34:
    if (v28)
    {
LABEL_35:
      *(_QWORD *)&self->_viewFramebufferPixelSize[5] = __PAIR64__(v15, v13);
      self->_viewFramebufferIsValid = 1;
      return;
    }
  }
  SKCRenderer::getBackingContext(v4, &v59);
  v60 = v59;
  if (*((_QWORD *)&v59 + 1))
  {
    v40 = (unint64_t *)(*((_QWORD *)&v59 + 1) + 8);
    do
      v41 = __ldxr(v40);
    while (__stxr(v41 + 1, v40));
    v42 = (std::__shared_weak_count *)*((_QWORD *)&v59 + 1);
    if (*((_QWORD *)&v59 + 1))
    {
      v43 = (unint64_t *)(*((_QWORD *)&v59 + 1) + 8);
      do
        v44 = __ldaxr(v43);
      while (__stlxr(v44 - 1, v43));
      if (!v44)
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
    }
  }
  -[CAEAGLLayer setContentsScale:](self->_eaglLayer, "setContentsScale:", v11);
  v45 = v60;
  (*(void (**)(_QWORD))(*(_QWORD *)v60 + 360))(v60);
  v46 = (EAGLContext *)objc_claimAutoreleasedReturnValue();
  glContextUse::glContextUse((glContextUse *)&v59, v46);

  if (self->_frameBufferColorTexture.__ptr_)
  {
    glBindRenderbuffer(0x8D41u, self->_colorRenderBuffer);
    (*(void (**)(uint64_t))(*(_QWORD *)v45 + 360))(v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "renderbufferStorage:fromDrawable:", 36161, 0);

    self->_colorRenderBuffer = 0;
    std::shared_ptr<jet_buffer_pool>::reset[abi:ne180100](&self->_frameBufferColorTexture.__ptr_);
  }
  p_colorRenderBuffer = &self->_colorRenderBuffer;
  colorRenderBuffer = self->_colorRenderBuffer;
  if (!colorRenderBuffer)
  {
    glGenRenderbuffers(1, &self->_colorRenderBuffer);
    colorRenderBuffer = *p_colorRenderBuffer;
  }
  glBindRenderbuffer(0x8D41u, colorRenderBuffer);
  (*(void (**)(uint64_t))(*(_QWORD *)v45 + 360))(v45);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "renderbufferStorage:fromDrawable:", 36161, self->_eaglLayer);

  if ((v51 & 1) == 0)
  {
    kdebug_trace();
    self->_viewFramebufferIsValid = 0;
    kdebug_trace();
LABEL_68:
    v53 = 1;
    goto LABEL_69;
  }
  *(_QWORD *)params = 0;
  glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &params[1]);
  glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, params);
  if (!params[1] || !params[0])
  {
    self->_viewFramebufferIsValid = 0;
    kdebug_trace();
    goto LABEL_68;
  }
  if (!self->_frameBufferColorTexture.__ptr_)
  {
    v52 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v45 + 384))(v45, *p_colorRenderBuffer, v13, v15, 3, 1);
    std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v57, v52);
    std::shared_ptr<jet_buffer_pool>::operator=[abi:ne180100]((uint64_t)&self->_frameBufferColorTexture, &v57);
    std::shared_ptr<jet_buffer_pool>::~shared_ptr[abi:ne180100]((uint64_t)&v57);
  }
  v53 = 0;
LABEL_69:
  glContextUse::~glContextUse((glContextUse *)&v59);
  v54 = (std::__shared_weak_count *)*((_QWORD *)&v60 + 1);
  if (*((_QWORD *)&v60 + 1))
  {
    v55 = (unint64_t *)(*((_QWORD *)&v60 + 1) + 8);
    do
      v56 = __ldaxr(v55);
    while (__stlxr(v56 - 1, v55));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
      std::__shared_weak_count::__release_weak(v54);
    }
  }
  if (!v53)
    goto LABEL_35;
}

- (void)_ensureRenderer
{
  void *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  int v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  void *v18;
  CAMetalLayer *v19;
  CAMetalLayer *metalLayer;
  uint64_t v21;
  CAEAGLLayer *v22;
  CAEAGLLayer *eaglLayer;
  void *v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  uint64_t v32;
  std::__shared_weak_count *v33;

  if (!self->_renderer)
  {
    v3 = (void *)operator new();
    v32 = 0;
    v33 = 0;
    SKCRenderer::SKCRenderer(v3, &v32);
    self->_renderer = v3;
    v4 = v33;
    if (v33)
    {
      p_shared_owners = (unint64_t *)&v33->__shared_owners_;
      do
        v6 = __ldaxr(p_shared_owners);
      while (__stlxr(v6 - 1, p_shared_owners));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    SKCRenderer::getBackingContext((uint64_t)self->_renderer, &v30);
    v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v30 + 136))(v30);
    v8 = v31;
    if (v31)
    {
      v9 = (unint64_t *)&v31->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    +[SKAnalytics instance](SKAnalytics, "instance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v7 == 1)
    {
      objc_msgSend(v11, "sendAnalyticsDataWithKey:", CFSTR("com.apple.spritekit.metal"));

      SKCRenderer::getBackingContext((uint64_t)self->_renderer, &v28);
      v30 = v28;
      v31 = v29;
      if (v29)
      {
        v13 = (unint64_t *)&v29->__shared_owners_;
        do
          v14 = __ldxr(v13);
        while (__stxr(v14 + 1, v13));
        v15 = v29;
        if (v29)
        {
          v16 = (unint64_t *)&v29->__shared_owners_;
          do
            v17 = __ldaxr(v16);
          while (__stlxr(v17 - 1, v16));
          if (!v17)
          {
            ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
            std::__shared_weak_count::__release_weak(v15);
          }
        }
      }
      (*(void (**)(uint64_t))(*(_QWORD *)v30 + 360))(v30);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKView layer](self, "layer");
      v19 = (CAMetalLayer *)objc_claimAutoreleasedReturnValue();
      metalLayer = self->_metalLayer;
      self->_metalLayer = v19;

      -[SKView _viewScale](self, "_viewScale");
      -[CAMetalLayer setContentsScale:](self->_metalLayer, "setContentsScale:");
      -[CAMetalLayer setDevice:](self->_metalLayer, "setDevice:", v18);
      if ((SKGetPrefersFloatFramebuffer() & 1) != 0)
      {
        v21 = 115;
      }
      else if (SKGetShouldUseExtendedRangeColor())
      {
        if (SKDeviceSupportsExtendedXR10Formats(v18))
          v21 = 550;
        else
          v21 = 80;
      }
      else
      {
        v21 = 80;
      }
      -[CAMetalLayer setPixelFormat:](self->_metalLayer, "setPixelFormat:", v21);
      -[CAMetalLayer setFramebufferOnly:](self->_metalLayer, "setFramebufferOnly:", 1);

      v25 = v31;
      if (v31)
      {
        v26 = (unint64_t *)&v31->__shared_owners_;
        do
          v27 = __ldaxr(v26);
        while (__stlxr(v27 - 1, v26));
        if (!v27)
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
      }
    }
    else
    {
      objc_msgSend(v11, "sendAnalyticsDataWithKey:", CFSTR("com.apple.spritekit.opengl"));

      -[SKView setClearsContextBeforeDrawing:](self, "setClearsContextBeforeDrawing:", 0);
      -[SKView layer](self, "layer");
      v22 = (CAEAGLLayer *)objc_claimAutoreleasedReturnValue();
      eaglLayer = self->_eaglLayer;
      self->_eaglLayer = v22;

      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "nativeScale");
      -[CAEAGLLayer setContentsScale:](self->_eaglLayer, "setContentsScale:");

      -[CAEAGLLayer setOpaque:](self->_eaglLayer, "setOpaque:", 1);
    }
  }
}

- (void)_commonInit
{
  void *v3;
  NSObject *v4;
  OS_dispatch_semaphore *v5;
  OS_dispatch_semaphore *renderSemaphore;
  dispatch_semaphore_t v7;
  void *v8;
  NSMapTable *v9;
  NSMapTable *touchMap;
  void *v11;
  void *v12;
  double v13;
  SKScene *nextScene;
  uint64_t v20;
  void *v21;
  double timePreviousUpdate;
  void *v23;
  void *v24;
  mach_timebase_info info;

  +[SKAnalytics instance](SKAnalytics, "instance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendAnalyticsDataWithKey:", CFSTR("com.apple.spritekit.apps"));

  sk_debug_check_optional();
  kdebug_trace();
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (OS_dispatch_semaphore *)dispatch_queue_create("SKRenderQueue", v4);
  renderSemaphore = self->_renderSemaphore;
  self->_renderSemaphore = v5;

  v7 = dispatch_semaphore_create(1);
  v8 = *(void **)&self->_queuedFrameCount;
  *(_QWORD *)&self->_queuedFrameCount = v7;

  LODWORD(self->_prevVsyncRenderTime) = 0;
  self->_prevRenderTime = -1.0;
  self->_displayLink = (SKDisplayLink *)SKDisplayGetDefaultFramerate(0);
  self->_preferredFramesPerSecond = 1;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  touchMap = self->_touchMap;
  self->_touchMap = v9;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:", v11, CFSTR("debugDrawStats_BGColor"));

  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("debugDisablePresentationTime"));
  -[SKView setShouldCullNonVisibleNodes:](self, "setShouldCullNonVisibleNodes:", 1);
  -[SKView setIgnoresSiblingOrder:](self, "setIgnoresSiblingOrder:", 0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKView set_info:](self, "set_info:", v12);

  if ((SKGetLinkedOnOrAfter() & 1) == 0)
  {
    -[SKView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
    -[SKView setMultipleTouchEnabled:](self, "setMultipleTouchEnabled:", 1);
    -[SKView setContentScaleFactor:](self, "setContentScaleFactor:", 0.0);
  }
  LOBYTE(self->_machTimeTimebase) = SKGetLinkedOnOrAfter();
  if (mach_timebase_info(&info))
  {
    info = (mach_timebase_info)0x100000001;
    v13 = 1.0;
  }
  else
  {
    v13 = (double)(info.numer / info.denom);
  }
  *(double *)&self->_renderQueue = v13;
  self->_viewFramebufferIsValid = 0;
  self->_didRunOnce = 0;
  nextScene = self->_nextScene;
  self->_nextScene = 0;

  __asm { FMOV            V0.4S, #1.0 }
  *(_OWORD *)self->_viewScale = _Q0;
  *(_QWORD *)self->_viewTranslation = 0;
  *(_QWORD *)&self->_viewTranslation[8] = 0;
  -[SKView onInit](self, "onInit");
  -[SKView _ensureRenderer](self, "_ensureRenderer");
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(void **)&self->_prevBackingScaleFactor;
  *(_QWORD *)&self->_prevBackingScaleFactor = v20;

  *(_QWORD *)&self->_prefersLowPowerGPU = 0xBFF0000000000000;
  BYTE1(self->_transition) = 0;
  timePreviousUpdate = self->_timePreviousUpdate;
  self->_timePreviousUpdate = 0.0;

  -[SKView setUpRenderCallback](self, "setUpRenderCallback");
  -[SKView startRenderCallbacks](self, "startRenderCallbacks");
  BYTE2(self->_frameInterval) = -[SKView isPaused](self, "isPaused");
  LOBYTE(self->_frameInterval) = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:selector:name:object:", self, sel_CBApplicationWillResignActive, *MEMORY[0x1E0CEB358], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObserver:selector:name:object:", self, sel_CBApplicationDidBecomeActive, *MEMORY[0x1E0CEB270], 0);

}

- (void)CBApplicationWillResignActive
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[SKView getRenderOptions](self, "getRenderOptions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ignoreBackgroundNotifications"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) == 0)
  {
    BYTE2(self->_frameInterval) = self->_spriteArrayHint;
    -[SKView setPaused:](self, "setPaused:", 1);
    +[SKSoundContext currentContext](SKSoundContext, "currentContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSuspended:", 1);

    LOBYTE(self->_frameInterval) = 1;
  }

}

- (void)CBApplicationDidBecomeActive
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[SKView getRenderOptions](self, "getRenderOptions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ignoreBackgroundNotifications"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) == 0 && LOBYTE(self->_frameInterval))
  {
    LOBYTE(self->_frameInterval) = 0;
    -[SKView setPaused:](self, "setPaused:", BYTE2(self->_frameInterval));
    +[SKSoundContext currentContext](SKSoundContext, "currentContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSuspended:", 0);

  }
}

- (void)renderForTime:(double)a3 shouldBlock:(BOOL)a4
{
  -[SKView _renderSynchronouslyForTime:preRender:postRender:](self, "_renderSynchronouslyForTime:preRender:postRender:", 0, 0, 0.0);
}

- (BOOL)_shouldRenderForTime:(double)a3
{
  return a3 - *(double *)&self->_delegate > (float)(1.0
                                                  / (float)-[SKView _getEffectivePreferredFramesPerSecond](self, "_getEffectivePreferredFramesPerSecond"))* 0.75;
}

- (void)_vsyncRenderForTime:(double)a3 preRender:(id)a4 postRender:(id)a5
{
  id v8;
  id v9;
  void *v10;
  CFTimeInterval v11;
  double *p_prevVsyncRenderTime;
  int v13;
  unsigned int v14;
  BOOL v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD);
  double timePreviousUpdate;
  _QWORD v20[5];
  id v21;
  double v22;
  BOOL v23;
  _QWORD v24[5];
  id v25;
  id v26;
  double v27;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1DF0CFADC]();
  sk_debug_check_optional();
  if (sk_debug_option_exists(CFSTR("preferredFramesPerSecond")))
    -[OS_dispatch_queue setPreferredFramesPerSecond:](self->_updateQueue, "setPreferredFramesPerSecond:", -[SKView _getEffectivePreferredFramesPerSecond](self, "_getEffectivePreferredFramesPerSecond"));
  v11 = CACurrentMediaTime();
  if (v11 - self->_prevRenderTime < 0.0)
    goto LABEL_8;
  *(double *)&self->_delegate = a3;
  self->_prevRenderTime = v11;
  p_prevVsyncRenderTime = &self->_prevVsyncRenderTime;
  do
    v13 = __ldxr((unsigned int *)p_prevVsyncRenderTime);
  while (__stxr(v13 + 1, (unsigned int *)p_prevVsyncRenderTime));
  if (v13 >= 1)
  {
    do
      v14 = __ldxr((unsigned int *)p_prevVsyncRenderTime);
    while (__stxr(v14 - 1, (unsigned int *)p_prevVsyncRenderTime));
LABEL_8:
    kdebug_trace();
    goto LABEL_9;
  }
  if (-[SKView isAsynchronous](self, "isAsynchronous"))
    v15 = BYTE1(self->_transition) != 0;
  else
    v15 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __51__SKView__vsyncRenderForTime_preRender_postRender___block_invoke;
  v24[3] = &unk_1EA4FE3D8;
  v24[4] = self;
  v25 = v8;
  v27 = a3;
  v26 = v9;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __51__SKView__vsyncRenderForTime_preRender_postRender___block_invoke_2;
  v20[3] = &unk_1EA4FE400;
  v20[4] = self;
  v22 = a3;
  v23 = v15;
  v17 = (id)MEMORY[0x1DF0CFCB0](v24);
  v21 = v17;
  v18 = (void (**)(_QWORD))MEMORY[0x1DF0CFCB0](v20);
  timePreviousUpdate = self->_timePreviousUpdate;
  if (timePreviousUpdate == 0.0)
    v18[2](v18);
  else
    dispatch_sync(*(dispatch_queue_t *)&timePreviousUpdate, v18);

LABEL_9:
  objc_autoreleasePoolPop(v10);

}

void __51__SKView__vsyncRenderForTime_preRender_postRender___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  int v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  SKCNode *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  int8x16_t v45;
  int8x16_t v46;
  __n128 v47;
  __n128 v48;
  __n128 v49;
  __n128 v50;
  __n128 v51;
  __n128 v52;
  std::__shared_weak_count *v53;
  unint64_t *p_shared_owners;
  unint64_t v55;
  double v56;
  __n128 v57;
  std::__shared_weak_count *v58;
  uint64_t *v59;
  unint64_t v60;
  uint64_t *v61;
  unint64_t v62;
  uint64_t v63;
  unsigned int *v64;
  unsigned int v65;
  double v66;
  unsigned int *v67;
  unsigned int v68;
  int8x16_t v69;
  uint64_t v70;
  std::__shared_weak_count *v71;
  unint64_t v72;
  std::__shared_weak_count *v73;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(id **)(a1 + 32);
  if (v3[146])
  {
    v4 = objc_msgSend(v3[146], "_usesExplicitRender");
    v3 = *(id **)(a1 + 32);
    if (v4)
    {
      v5 = objc_msgSend(v3[146], "_needsRender");
      v6 = *(_QWORD *)(a1 + 32);
      if ((v5 & 1) == 0 && !*(_QWORD *)(v6 + 1152))
      {
        v67 = (unsigned int *)(v6 + 1256);
        do
          v68 = __ldxr(v67);
        while (__stxr(v68 - 1, v67));
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 1248));
        return;
      }
      objc_msgSend(*(id *)(v6 + 1168), "set_needsRender:", 0);
      v3 = *(id **)(a1 + 32);
    }
  }
  objc_msgSend(v3, "getRenderOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "valueForKey:", CFSTR("requestCapture"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
    {
      objc_msgSend(v8, "valueForKey:", CFSTR("captureTag"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "stringByAppendingPathComponent:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), *(_QWORD *)(a1 + 32));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathComponent:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByDeletingLastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 1, 0, 0);

      objc_msgSend(v16, "stringByAppendingPathExtension:", CFSTR("sks"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19 && (objc_msgSend(v17, "fileExistsAtPath:", v19) & 1) == 0)
        v20 = (id)objc_msgSend(*(id *)(a1 + 32), "captureToFile:", v19);

    }
    objc_msgSend(v8, "valueForKey:", CFSTR("debugLogRenderContent"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    if (v22)
      NSLog(CFSTR("SK: [renderContent] %@"), *(_QWORD *)(a1 + 32));
  }
  v23 = (SKCNode *)objc_msgSend(*(id *)(a1 + 32), "getRootNode");
  SKGetGlobalDefaults();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("kSKMutableTextureExists"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "BOOLValue");

  if (!v23 || ((sk_debug_option_get_BOOL(CFSTR("debugDisableDirtyFlags")) | v26) & 1) != 0)
    goto LABEL_59;
  v27 = SKCNode::matchesAnyFlags(v23, 66, 66);
  v28 = *(id *)(*(_QWORD *)(a1 + 32) + 1168);
  v29 = v28;
  if (v28)
  {
    objc_msgSend(v28, "camera");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      v32 = SKCNode::matchesAnyFlags((SKCNode *)objc_msgSend(v30, "_backingNode"), 2, 2);
      SKCNode::clearDirty((SKCNode *)objc_msgSend(v31, "_backingNode"));
      v27 |= v32;
    }

  }
  v33 = *(id *)(*(_QWORD *)(a1 + 32) + 1160);
  v34 = v33;
  if (v33)
  {
    objc_msgSend(v33, "camera");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      v37 = SKCNode::matchesAnyFlags((SKCNode *)objc_msgSend(v35, "_backingNode"), 2, 2);
      SKCNode::clearDirty((SKCNode *)objc_msgSend(v36, "_backingNode"));
      v27 |= v37;
    }

  }
  if (v27)
  {
LABEL_59:
    if (objc_msgSend(*(id *)(a1 + 32), "hasValidViewFramebuffer"))
    {
      v38 = objc_msgSend(*(id *)(a1 + 32), "chooseViewRenderer");
      if (v38)
      {
        v39 = *(void **)(a1 + 32);
        if (v39)
        {
          objc_msgSend(v39, "nextFramebuffer");
          if (v72)
          {
            v40 = CACurrentMediaTime();
            _perfBeginRender(v40);
            kdebug_trace();
            objc_msgSend(*(id *)(a1 + 32), "frame");
            v42 = v41;
            objc_msgSend(*(id *)(a1 + 32), "frame");
            v44 = v43;
            objc_msgSend(*(id *)(a1 + 32), "getViewport");
            v69 = v45;
            objc_msgSend(*(id *)(a1 + 32), "getViewTransform");
            v47 = (__n128)v46;
            v49 = v48;
            v51 = v50;
            v48.n128_f32[0] = v42;
            v50.n128_f32[0] = v44;
            v46.i64[0] = 0;
            v46.i64[1] = __PAIR64__(v50.n128_u32[0], v48.n128_u32[0]);
            SKCRenderer::render(v38, v23, &v72, 1, v8, *(_QWORD *)(a1 + 32) + 776, *(_QWORD *)(a1 + 32) + 424, 0, &v70, v46, v69, v47, v49, v51, v52, *(double *)(a1 + 56));
            v53 = v71;
            if (v71)
            {
              p_shared_owners = (unint64_t *)&v71->__shared_owners_;
              do
                v55 = __ldaxr(p_shared_owners);
              while (__stlxr(v55 - 1, p_shared_owners));
              if (!v55)
              {
                ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
                std::__shared_weak_count::__release_weak(v53);
              }
            }
            objc_msgSend(*(id *)(a1 + 32), "_endFrameStats");
            kdebug_trace();
            v56 = CACurrentMediaTime();
            v57.n128_f32[0] = _perfEndRender(v56);
            v58 = v73;
            if (v73)
            {
              v59 = &v73->__shared_owners_;
              do
                v60 = __ldaxr((unint64_t *)v59);
              while (__stlxr(v60 - 1, (unint64_t *)v59));
              if (!v60)
              {
                ((void (*)(std::__shared_weak_count *, __n128))v58->__on_zero_shared)(v58, v57);
                std::__shared_weak_count::__release_weak(v58);
              }
            }
            goto LABEL_49;
          }
        }
        else
        {
          v72 = 0;
          v73 = 0;
        }
        if (v73)
        {
          v61 = &v73->__shared_owners_;
          do
            v62 = __ldaxr((unint64_t *)v61);
          while (__stlxr(v62 - 1, (unint64_t *)v61));
          if (!v62)
          {
            ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
            std::__shared_weak_count::__release_weak(v73);
          }
        }
      }
    }
  }
  else
  {
    kdebug_trace();
    objc_msgSend(*(id *)(a1 + 32), "_endFrameStats");
  }
  kdebug_trace();
LABEL_49:

  v63 = *(_QWORD *)(a1 + 48);
  if (v63)
    (*(void (**)(void))(v63 + 16))();
  v64 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 1256);
  do
    v65 = __ldxr(v64);
  while (__stxr(v65 - 1, v64));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 1248));
  kdebug_trace();
  v66 = CACurrentMediaTime();
  _perfMarkCADisplayLinkEnd(v66);
  _perfUpdateStatistics(*(_QWORD *)(a1 + 32) + 776, *(_QWORD *)(a1 + 32) + 424, *(void **)(a1 + 32));
}

void __51__SKView__vsyncRenderForTime_preRender_postRender___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  unsigned int *v3;
  unsigned int v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  SKCStats *v14;
  double v15;
  double v16;
  double v17;
  SKCStats v18;

  v2 = dispatch_time(0, 0);
  if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 1248), v2))
  {
    v3 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 1256);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 - 1, v3));
    kdebug_trace();
  }
  else
  {
    kdebug_trace();
    SKCStats::SKCStats(&v18);
    v5 = *(_QWORD *)(a1 + 32) + 776;
    v6 = *(_OWORD *)&v18.frameCount;
    v7 = *(_OWORD *)&v18.baseTime;
    *(_OWORD *)(v5 + 8) = *(_OWORD *)&v18.frameBeginTime;
    *(_OWORD *)(v5 + 24) = v7;
    *(_OWORD *)(v5 + 40) = v6;
    v8 = *(_OWORD *)&v18.update.duration;
    v9 = *(_OWORD *)&v18.physics.duration;
    v10 = *(_OWORD *)&v18.constraints.beginTime;
    *(_OWORD *)(v5 + 56) = *(_OWORD *)&v18.clientUpdate.duration;
    *(_OWORD *)(v5 + 104) = v10;
    *(_OWORD *)(v5 + 88) = v9;
    *(_OWORD *)(v5 + 72) = v8;
    v11 = *(_OWORD *)&v18.render.duration;
    v12 = *(_OWORD *)&v18.render.nodeTraversalCount;
    v13 = *(_QWORD *)&v18.render.passCount;
    *(_OWORD *)(v5 + 120) = *(_OWORD *)&v18.constraints.constraintCount;
    *(_QWORD *)(v5 + 168) = v13;
    *(_OWORD *)(v5 + 152) = v12;
    *(_OWORD *)(v5 + 136) = v11;
    SKCStats::~SKCStats(&v18);
    v14 = (SKCStats *)(*(_QWORD *)(a1 + 32) + 776);
    v15 = CACurrentMediaTime();
    SKCStats::beginFrame(v14, v15);
    v16 = CACurrentMediaTime();
    _perfMarkCADisplayLinkStart(v16);
    if (sk_debug_get_optional())
      kdebug_trace();
    v17 = *(double *)(a1 + 48);
    if (v17 <= 0.0)
      v17 = CACurrentMediaTime();
    objc_msgSend(*(id *)(a1 + 32), "_update:", v17);
    objc_msgSend(*(id *)(a1 + 32), "notifyWillRenderContent");
    kdebug_trace();
    if (*(_BYTE *)(a1 + 56))
      dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 1240), *(dispatch_block_t *)(a1 + 40));
    else
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)_renderSynchronouslyForTime:(double)a3 preRender:(id)a4 postRender:(id)a5 withMTLScheduleHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  double timePreviousUpdate;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  double v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1DF0CFADC]();
  *(double *)&self->_delegate = a3;
  kdebug_trace();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __82__SKView__renderSynchronouslyForTime_preRender_postRender_withMTLScheduleHandler___block_invoke;
  v19[3] = &unk_1EA4FE428;
  v19[4] = self;
  v23 = a3;
  v14 = v10;
  v20 = v14;
  v15 = v12;
  v21 = v15;
  v16 = v11;
  v22 = v16;
  v17 = (void (**)(_QWORD))MEMORY[0x1DF0CFCB0](v19);
  timePreviousUpdate = self->_timePreviousUpdate;
  if (timePreviousUpdate == 0.0)
    v17[2](v17);
  else
    dispatch_sync(*(dispatch_queue_t *)&timePreviousUpdate, v17);

  objc_autoreleasePoolPop(v13);
}

intptr_t __82__SKView__renderSynchronouslyForTime_preRender_postRender_withMTLScheduleHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  SKCStats *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _OWORD *v26;
  int8x16_t v27;
  int8x16_t v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  __n128 v34;
  void *v35;
  int v36;
  std::__shared_weak_count *v37;
  unint64_t *p_shared_owners;
  unint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  double frameBeginTime;
  unint64_t *v44;
  unint64_t v45;
  uint64_t v46;
  int8x16_t v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  SKCStats v51;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 1248), 0xFFFFFFFFFFFFFFFFLL);
  SKCStats::SKCStats(&v51);
  v2 = *(_QWORD *)(a1 + 32) + 776;
  v3 = *(_OWORD *)&v51.frameCount;
  v4 = *(_OWORD *)&v51.baseTime;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)&v51.frameBeginTime;
  *(_OWORD *)(v2 + 24) = v4;
  *(_OWORD *)(v2 + 40) = v3;
  v5 = *(_OWORD *)&v51.update.duration;
  v6 = *(_OWORD *)&v51.physics.duration;
  v7 = *(_OWORD *)&v51.constraints.beginTime;
  *(_OWORD *)(v2 + 56) = *(_OWORD *)&v51.clientUpdate.duration;
  *(_OWORD *)(v2 + 104) = v7;
  *(_OWORD *)(v2 + 88) = v6;
  *(_OWORD *)(v2 + 72) = v5;
  v8 = *(_OWORD *)&v51.render.duration;
  v9 = *(_OWORD *)&v51.render.nodeTraversalCount;
  v10 = *(_QWORD *)&v51.render.passCount;
  *(_OWORD *)(v2 + 120) = *(_OWORD *)&v51.constraints.constraintCount;
  *(_QWORD *)(v2 + 168) = v10;
  *(_OWORD *)(v2 + 152) = v9;
  *(_OWORD *)(v2 + 136) = v8;
  SKCStats::~SKCStats(&v51);
  v11 = (SKCStats *)(*(_QWORD *)(a1 + 32) + 776);
  v12 = CACurrentMediaTime();
  SKCStats::beginFrame(v11, v12);
  v13 = *(double *)(a1 + 64);
  if (v13 <= 0.0)
    v13 = CACurrentMediaTime();
  objc_msgSend(*(id *)(a1 + 32), "_update:", v13);
  objc_msgSend(*(id *)(a1 + 32), "notifyWillRenderContent");
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(void))(v14 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "getRenderOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "valueForKey:", CFSTR("debugLogRenderContent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (v18)
      NSLog(CFSTR("SK: [renderContent] %@"), *(_QWORD *)(a1 + 32));
  }
  v19 = objc_msgSend(*(id *)(a1 + 32), "hasValidViewFramebuffer");
  if (!v19)
  {
    v41 = 0;
    v42 = 0;
    goto LABEL_32;
  }
  v20 = objc_msgSend(*(id *)(a1 + 32), "chooseViewRenderer");
  if (!v20)
  {
    v42 = 0;
    v41 = 1;
    goto LABEL_32;
  }
  v21 = *(void **)(a1 + 32);
  if (v21)
  {
    objc_msgSend(v21, "nextFramebuffer");
    if (v51._vptr$SKCStats)
    {
      objc_msgSend(*(id *)(a1 + 32), "frame");
      v23 = v22;
      objc_msgSend(*(id *)(a1 + 32), "frame");
      v25 = v24;
      v26 = (_OWORD *)objc_msgSend(*(id *)(a1 + 32), "getRootNode");
      objc_msgSend(*(id *)(a1 + 32), "getViewport");
      v48 = v27;
      objc_msgSend(*(id *)(a1 + 32), "getViewTransform");
      v29 = (__n128)v28;
      v31 = v30;
      v33 = v32;
      v30.n128_f32[0] = v23;
      v32.n128_f32[0] = v25;
      v28.i64[0] = 0;
      v28.i64[1] = __PAIR64__(v32.n128_u32[0], v30.n128_u32[0]);
      SKCRenderer::render(v20, v26, (unint64_t *)&v51, 1, v16, *(_QWORD *)(a1 + 32) + 776, *(_QWORD *)(a1 + 32) + 424, *(void **)(a1 + 48), &v49, v28, v48, v29, v31, v33, v34, *(double *)(a1 + 64));
      if (v16)
      {
        objc_msgSend(v16, "valueForKey:", CFSTR("waitOnRenderFence"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "BOOLValue");

        if (v36)
        {
          if (v49)
            (*(void (**)(uint64_t))(*(_QWORD *)v49 + 8))(v49);
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "_endFrameStats");
      v37 = v50;
      if (v50)
      {
        p_shared_owners = (unint64_t *)&v50->__shared_owners_;
        do
          v39 = __ldaxr(p_shared_owners);
        while (__stlxr(v39 - 1, p_shared_owners));
        if (!v39)
        {
          ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
          std::__shared_weak_count::__release_weak(v37);
        }
      }
      v40 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    v51._vptr$SKCStats = 0;
    v51.frameBeginTime = 0.0;
  }
  v40 = 1;
LABEL_26:
  frameBeginTime = v51.frameBeginTime;
  if (!*(_QWORD *)&v51.frameBeginTime)
    goto LABEL_30;
  v44 = (unint64_t *)(*(_QWORD *)&v51.frameBeginTime + 8);
  do
    v45 = __ldaxr(v44);
  while (__stlxr(v45 - 1, v44));
  if (!v45)
  {
    (*(void (**)(double))(**(_QWORD **)&frameBeginTime + 16))(COERCE_DOUBLE(*(_QWORD *)&frameBeginTime));
    std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&frameBeginTime);
    if (!v40)
      goto LABEL_34;
  }
  else
  {
LABEL_30:
    if (!v40)
      goto LABEL_34;
  }
  v41 = 0;
  v42 = 1;
LABEL_32:
  if (*(_QWORD *)(a1 + 48))
  {
    NSLog(CFSTR("SKView: failed to schedule handler. SKView.hasValidViewFramebuffer - %d, renderer is nil - %d, fb is nil - %d."), v19, v41, v42);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
LABEL_34:

  v46 = *(_QWORD *)(a1 + 56);
  if (v46)
    (*(void (**)(void))(v46 + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 1248));
}

- (void)_renderSynchronouslyForTime:(double)a3 preRender:(id)a4 postRender:(id)a5
{
  -[SKView _renderSynchronouslyForTime:preRender:postRender:withMTLScheduleHandler:](self, "_renderSynchronouslyForTime:preRender:postRender:withMTLScheduleHandler:", a4, a5, 0, a3);
}

- (void)_renderToIOSurfaceID:(unsigned int)a3 scaleFactor:(float)a4 asynchronous:(BOOL)a5 preRender:(id)a6 postRender:(id)a7
{
  -[SKView _renderToIOSurfaceID:scaleFactor:asynchronous:waitOnFence:preRender:postRender:](self, "_renderToIOSurfaceID:scaleFactor:asynchronous:waitOnFence:preRender:postRender:", *(_QWORD *)&a3, a5, 0, a6, a7);
}

- (void)_renderToIOSurfaceID:(unsigned int)a3 scaleFactor:(float)a4 asynchronous:(BOOL)a5 waitOnFence:(BOOL)a6 preRender:(id)a7 postRender:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  uint64_t v11;
  void (**v13)(_QWORD);
  void (**v14)(_QWORD);
  void *v15;
  __IOSurface *v16;
  __IOSurface *v17;
  size_t Width;
  size_t Height;
  size_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  uint64_t texture_2d;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  int8x16_t v35;
  int8x16_t v36;
  __n128 v37;
  __n128 v38;
  __n128 v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  _OWORD *v52;
  SKCRenderer *v53;
  uint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  uint64_t v58;
  std::__shared_weak_count *v59;
  uint64_t v60;
  std::__shared_weak_count *v61;
  _QWORD block[5];
  void (**v63)(_QWORD);
  void (**v64)(_QWORD);
  int v65;

  v9 = a6;
  v10 = a5;
  v11 = *(_QWORD *)&a3;
  v13 = (void (**)(_QWORD))a7;
  v14 = (void (**)(_QWORD))a8;
  v15 = (void *)MEMORY[0x1DF0CFADC]();
  kdebug_trace();
  if (v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__SKView__renderToIOSurfaceID_scaleFactor_asynchronous_waitOnFence_preRender_postRender___block_invoke;
    block[3] = &unk_1EA4FE450;
    block[4] = self;
    v63 = v13;
    v65 = v11;
    v64 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)&self->_queuedFrameCount, 0xFFFFFFFFFFFFFFFFLL);
    if (v13)
      v13[2](v13);
    if ((_DWORD)v11)
    {
      -[SKView _ensureRenderer](self, "_ensureRenderer");
      v16 = IOSurfaceLookup(v11);
      v17 = v16;
      if (v16)
      {
        Width = IOSurfaceGetWidth(v16);
        Height = IOSurfaceGetHeight(v17);
        if ((_DWORD)Width)
        {
          v20 = Height;
          if ((_DWORD)Height)
          {
            if (!self->_didRunOnce)
            {
              self->_didRunOnce = 1;
              -[SKView runOnce](self, "runOnce");
            }
            v53 = -[SKView chooseViewRenderer](self, "chooseViewRenderer");
            if (v53)
            {
              v52 = -[SKView getRootNode](self, "getRootNode");
              SKCRenderer::getBackingContext((uint64_t)v53, &v58);
              v21 = (*(uint64_t (**)(uint64_t, uint64_t, size_t, size_t, uint64_t, _QWORD))(*(_QWORD *)v58 + 32))(v58, v11, Width, v20, 4, 0);
              std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v60, v21);
              v22 = v59;
              if (v59)
              {
                p_shared_owners = (unint64_t *)&v59->__shared_owners_;
                do
                  v24 = __ldaxr(p_shared_owners);
                while (__stlxr(v24 - 1, p_shared_owners));
                if (!v24)
                {
                  ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
                  std::__shared_weak_count::__release_weak(v22);
                }
              }
              SKCRenderer::getBackingContext((uint64_t)v53, &v56);
              texture_2d = jet_context::create_texture_2d();
              std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v58, texture_2d);
              v26 = v57;
              if (v57)
              {
                v27 = (unint64_t *)&v57->__shared_owners_;
                do
                  v28 = __ldaxr(v27);
                while (__stlxr(v28 - 1, v27));
                if (!v28)
                {
                  ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
                  std::__shared_weak_count::__release_weak(v26);
                }
              }
              SKCRenderer::getBackingContext((uint64_t)v53, &v54);
              v29 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v54 + 112))(v54);
              std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v56, v29);
              v30 = v55;
              if (v55)
              {
                v31 = (unint64_t *)&v55->__shared_owners_;
                do
                  v32 = __ldaxr(v31);
                while (__stlxr(v32 - 1, v31));
                if (!v32)
                {
                  ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
                  std::__shared_weak_count::__release_weak(v30);
                }
              }
              v33 = v56;
              *(_QWORD *)(v56 + 16) = v60;
              v34 = v58;
              *(_QWORD *)(v33 + 208) = v58;
              v35.i64[0] = 0;
              v35.i64[1] = __PAIR64__(v20, Width);
              *(_QWORD *)(v33 + 232) = v34;
              v36.i64[0] = 0;
              v36.u64[1] = (unint64_t)vcvt_f32_u32((uint32x2_t)__PAIR64__(v20, Width));
              v37 = *(__n128 *)MEMORY[0x1E0C83FF0];
              v38 = *(__n128 *)(MEMORY[0x1E0C83FF0] + 16);
              v37.n128_u32[0] = 1.0;
              v38.n128_u32[1] = -1.0;
              v39 = *(__n128 *)(MEMORY[0x1E0C83FF0] + 32);
              v39.n128_u32[2] = 1.0;
              SKCRenderer::render((uint64_t)v53, v52, &v56, 0, 0, 0, 0, 0, &v54, v36, v35, v37, v38, v39, *(__n128 *)(MEMORY[0x1E0C83FF0] + 48), 0.0);
              if (v9 && v54)
                (*(void (**)(uint64_t))(*(_QWORD *)v54 + 8))(v54);
              v40 = v55;
              if (v55)
              {
                v41 = (unint64_t *)&v55->__shared_owners_;
                do
                  v42 = __ldaxr(v41);
                while (__stlxr(v42 - 1, v41));
                if (!v42)
                {
                  ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
                  std::__shared_weak_count::__release_weak(v40);
                }
              }
              v43 = v57;
              if (v57)
              {
                v44 = (unint64_t *)&v57->__shared_owners_;
                do
                  v45 = __ldaxr(v44);
                while (__stlxr(v45 - 1, v44));
                if (!v45)
                {
                  ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
                  std::__shared_weak_count::__release_weak(v43);
                }
              }
              v46 = v59;
              if (v59)
              {
                v47 = (unint64_t *)&v59->__shared_owners_;
                do
                  v48 = __ldaxr(v47);
                while (__stlxr(v48 - 1, v47));
                if (!v48)
                {
                  ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
                  std::__shared_weak_count::__release_weak(v46);
                }
              }
              v49 = v61;
              if (v61)
              {
                v50 = (unint64_t *)&v61->__shared_owners_;
                do
                  v51 = __ldaxr(v50);
                while (__stlxr(v51 - 1, v50));
                if (!v51)
                {
                  ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
                  std::__shared_weak_count::__release_weak(v49);
                }
              }
            }
          }
        }
        CFRelease(v17);
      }
    }
    if (v14)
      v14[2](v14);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)&self->_queuedFrameCount);
  }
  objc_autoreleasePoolPop(v15);

}

intptr_t __89__SKView__renderToIOSurfaceID_scaleFactor_asynchronous_waitOnFence_preRender_postRender___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __IOSurface *v3;
  __IOSurface *v4;
  unsigned int Width;
  unsigned int Height;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t texture_2d;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  int8x16_t v29;
  int8x16_t v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  uint64_t v46;
  __int128 v48;
  uint32x2_t v49;
  uint64_t v50;
  std::__shared_weak_count *v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  uint64_t v58;
  std::__shared_weak_count *v59;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 1248), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  if (*(_DWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_ensureRenderer");
    v3 = IOSurfaceLookup(*(_DWORD *)(a1 + 56));
    if (v3)
    {
      v4 = v3;
      Width = IOSurfaceGetWidth(v3);
      Height = IOSurfaceGetHeight(v4);
      *(_QWORD *)&v7 = __PAIR64__(Height, Width);
      v8 = Width;
      v48 = v7;
      v9 = Height;
      if (Width)
        v10 = Height == 0;
      else
        v10 = 1;
      if (!v10)
      {
        v11 = *(_BYTE **)(a1 + 32);
        if (!v11[1081])
        {
          v11[1081] = 1;
          objc_msgSend(*(id *)(a1 + 32), "runOnce");
          v11 = *(_BYTE **)(a1 + 32);
        }
        v12 = objc_msgSend(v11, "chooseViewRenderer", v48);
        if (v12)
        {
          v13 = v12;
          v14 = (_OWORD *)objc_msgSend(*(id *)(a1 + 32), "getRootNode");
          SKCRenderer::getBackingContext(v13, &v56);
          v15 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)v56 + 32))(v56, *(unsigned int *)(a1 + 56), v8, v9, 4, 0);
          std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v58, v15);
          v16 = v57;
          if (v57)
          {
            p_shared_owners = (unint64_t *)&v57->__shared_owners_;
            do
              v18 = __ldaxr(p_shared_owners);
            while (__stlxr(v18 - 1, p_shared_owners));
            if (!v18)
            {
              ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
              std::__shared_weak_count::__release_weak(v16);
            }
          }
          SKCRenderer::getBackingContext(v13, &v54);
          texture_2d = jet_context::create_texture_2d();
          std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v56, texture_2d);
          v20 = v55;
          if (v55)
          {
            v21 = (unint64_t *)&v55->__shared_owners_;
            do
              v22 = __ldaxr(v21);
            while (__stlxr(v22 - 1, v21));
            if (!v22)
            {
              ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
              std::__shared_weak_count::__release_weak(v20);
            }
          }
          SKCRenderer::getBackingContext(v13, &v52);
          v23 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v52 + 112))(v52);
          std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v54, v23);
          v24 = v53;
          if (v53)
          {
            v25 = (unint64_t *)&v53->__shared_owners_;
            do
              v26 = __ldaxr(v25);
            while (__stlxr(v26 - 1, v25));
            if (!v26)
            {
              ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
              std::__shared_weak_count::__release_weak(v24);
            }
          }
          v27 = v54;
          *(_QWORD *)(v54 + 16) = v58;
          v28 = v56;
          *(_QWORD *)(v27 + 208) = v56;
          *(_QWORD *)(v27 + 232) = v28;
          v29.i64[0] = 0;
          v29.u64[1] = (unint64_t)v49;
          v30.i64[0] = 0;
          v30.u64[1] = (unint64_t)vcvt_f32_u32(v49);
          v31 = *(__n128 *)MEMORY[0x1E0C83FF0];
          v32 = *(__n128 *)(MEMORY[0x1E0C83FF0] + 16);
          v31.n128_u32[0] = 1.0;
          v32.n128_u32[1] = -1.0;
          v33 = *(__n128 *)(MEMORY[0x1E0C83FF0] + 32);
          v33.n128_u32[2] = 1.0;
          SKCRenderer::render(v13, v14, &v54, 0, 0, 0, 0, 0, &v50, v30, v29, v31, v32, v33, *(__n128 *)(MEMORY[0x1E0C83FF0] + 48), 0.0);
          v34 = v51;
          if (v51)
          {
            v35 = (unint64_t *)&v51->__shared_owners_;
            do
              v36 = __ldaxr(v35);
            while (__stlxr(v36 - 1, v35));
            if (!v36)
            {
              ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
              std::__shared_weak_count::__release_weak(v34);
            }
          }
          v37 = v55;
          if (v55)
          {
            v38 = (unint64_t *)&v55->__shared_owners_;
            do
              v39 = __ldaxr(v38);
            while (__stlxr(v39 - 1, v38));
            if (!v39)
            {
              ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
              std::__shared_weak_count::__release_weak(v37);
            }
          }
          v40 = v57;
          if (v57)
          {
            v41 = (unint64_t *)&v57->__shared_owners_;
            do
              v42 = __ldaxr(v41);
            while (__stlxr(v42 - 1, v41));
            if (!v42)
            {
              ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
              std::__shared_weak_count::__release_weak(v40);
            }
          }
          v43 = v59;
          if (v59)
          {
            v44 = (unint64_t *)&v59->__shared_owners_;
            do
              v45 = __ldaxr(v44);
            while (__stlxr(v45 - 1, v44));
            if (!v45)
            {
              ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
              std::__shared_weak_count::__release_weak(v43);
            }
          }
        }
      }
      CFRelease(v4);
    }
  }
  v46 = *(_QWORD *)(a1 + 48);
  if (v46)
    (*(void (**)(void))(v46 + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 1248));
}

- (void)_dispatchRenderToIOSurfaceID:(unsigned int)a3 async:(BOOL)a4 onQueue:(id)a5 waitOnFence:(BOOL)a6 preRender:(id)a7 postRender:(id)a8
{
  _BOOL4 v10;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  unsigned int v21;
  _QWORD block[5];
  id v23;
  id v24;
  unsigned int v25;

  v10 = a4;
  v13 = a5;
  v14 = a7;
  v15 = a8;
  v16 = (void *)MEMORY[0x1DF0CFADC]();
  kdebug_trace();
  if (v13 && v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__SKView__dispatchRenderToIOSurfaceID_async_onQueue_waitOnFence_preRender_postRender___block_invoke;
    block[3] = &unk_1EA4FE450;
    block[4] = self;
    v23 = v14;
    v25 = a3;
    v24 = v15;
    dispatch_async(v13, block);

    v17 = v23;
LABEL_6:

    goto LABEL_7;
  }
  if (v13)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __86__SKView__dispatchRenderToIOSurfaceID_async_onQueue_waitOnFence_preRender_postRender___block_invoke_2;
    v18[3] = &unk_1EA4FE450;
    v18[4] = self;
    v19 = v14;
    v21 = a3;
    v20 = v15;
    dispatch_sync(v13, v18);

    v17 = v19;
    goto LABEL_6;
  }
LABEL_7:
  objc_autoreleasePoolPop(v16);

}

intptr_t __86__SKView__dispatchRenderToIOSurfaceID_async_onQueue_waitOnFence_preRender_postRender___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __IOSurface *v3;
  __IOSurface *v4;
  unsigned int Width;
  unsigned int Height;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t texture_2d;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  int8x16_t v29;
  int8x16_t v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  uint64_t v46;
  __int128 v48;
  uint32x2_t v49;
  uint64_t v50;
  std::__shared_weak_count *v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  uint64_t v58;
  std::__shared_weak_count *v59;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 1248), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  if (*(_DWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_ensureRenderer");
    v3 = IOSurfaceLookup(*(_DWORD *)(a1 + 56));
    if (v3)
    {
      v4 = v3;
      Width = IOSurfaceGetWidth(v3);
      Height = IOSurfaceGetHeight(v4);
      *(_QWORD *)&v7 = __PAIR64__(Height, Width);
      v8 = Width;
      v48 = v7;
      v9 = Height;
      if (Width)
        v10 = Height == 0;
      else
        v10 = 1;
      if (!v10)
      {
        v11 = *(_BYTE **)(a1 + 32);
        if (!v11[1081])
        {
          v11[1081] = 1;
          objc_msgSend(*(id *)(a1 + 32), "runOnce");
          v11 = *(_BYTE **)(a1 + 32);
        }
        v12 = objc_msgSend(v11, "chooseViewRenderer", v48);
        if (v12)
        {
          v13 = v12;
          v14 = (_OWORD *)objc_msgSend(*(id *)(a1 + 32), "getRootNode");
          SKCRenderer::getBackingContext(v13, &v56);
          v15 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)v56 + 32))(v56, *(unsigned int *)(a1 + 56), v8, v9, 4, 0);
          std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v58, v15);
          v16 = v57;
          if (v57)
          {
            p_shared_owners = (unint64_t *)&v57->__shared_owners_;
            do
              v18 = __ldaxr(p_shared_owners);
            while (__stlxr(v18 - 1, p_shared_owners));
            if (!v18)
            {
              ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
              std::__shared_weak_count::__release_weak(v16);
            }
          }
          SKCRenderer::getBackingContext(v13, &v54);
          texture_2d = jet_context::create_texture_2d();
          std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v56, texture_2d);
          v20 = v55;
          if (v55)
          {
            v21 = (unint64_t *)&v55->__shared_owners_;
            do
              v22 = __ldaxr(v21);
            while (__stlxr(v22 - 1, v21));
            if (!v22)
            {
              ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
              std::__shared_weak_count::__release_weak(v20);
            }
          }
          SKCRenderer::getBackingContext(v13, &v52);
          v23 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v52 + 112))(v52);
          std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v54, v23);
          v24 = v53;
          if (v53)
          {
            v25 = (unint64_t *)&v53->__shared_owners_;
            do
              v26 = __ldaxr(v25);
            while (__stlxr(v26 - 1, v25));
            if (!v26)
            {
              ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
              std::__shared_weak_count::__release_weak(v24);
            }
          }
          v27 = v54;
          *(_QWORD *)(v54 + 16) = v58;
          v28 = v56;
          *(_QWORD *)(v27 + 208) = v56;
          *(_QWORD *)(v27 + 232) = v28;
          v29.i64[0] = 0;
          v29.u64[1] = (unint64_t)v49;
          v30.i64[0] = 0;
          v30.u64[1] = (unint64_t)vcvt_f32_u32(v49);
          v31 = *(__n128 *)MEMORY[0x1E0C83FF0];
          v32 = *(__n128 *)(MEMORY[0x1E0C83FF0] + 16);
          v31.n128_u32[0] = 1.0;
          v32.n128_u32[1] = -1.0;
          v33 = *(__n128 *)(MEMORY[0x1E0C83FF0] + 32);
          v33.n128_u32[2] = 1.0;
          SKCRenderer::render(v13, v14, &v54, 0, 0, 0, 0, 0, &v50, v30, v29, v31, v32, v33, *(__n128 *)(MEMORY[0x1E0C83FF0] + 48), 0.0);
          v34 = v51;
          if (v51)
          {
            v35 = (unint64_t *)&v51->__shared_owners_;
            do
              v36 = __ldaxr(v35);
            while (__stlxr(v36 - 1, v35));
            if (!v36)
            {
              ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
              std::__shared_weak_count::__release_weak(v34);
            }
          }
          v37 = v55;
          if (v55)
          {
            v38 = (unint64_t *)&v55->__shared_owners_;
            do
              v39 = __ldaxr(v38);
            while (__stlxr(v39 - 1, v38));
            if (!v39)
            {
              ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
              std::__shared_weak_count::__release_weak(v37);
            }
          }
          v40 = v57;
          if (v57)
          {
            v41 = (unint64_t *)&v57->__shared_owners_;
            do
              v42 = __ldaxr(v41);
            while (__stlxr(v42 - 1, v41));
            if (!v42)
            {
              ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
              std::__shared_weak_count::__release_weak(v40);
            }
          }
          v43 = v59;
          if (v59)
          {
            v44 = (unint64_t *)&v59->__shared_owners_;
            do
              v45 = __ldaxr(v44);
            while (__stlxr(v45 - 1, v44));
            if (!v45)
            {
              ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
              std::__shared_weak_count::__release_weak(v43);
            }
          }
        }
      }
      CFRelease(v4);
    }
  }
  v46 = *(_QWORD *)(a1 + 48);
  if (v46)
    (*(void (**)(void))(v46 + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 1248));
}

intptr_t __86__SKView__dispatchRenderToIOSurfaceID_async_onQueue_waitOnFence_preRender_postRender___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  __IOSurface *v3;
  __IOSurface *v4;
  unsigned int Width;
  unsigned int Height;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t texture_2d;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  int8x16_t v29;
  int8x16_t v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  uint64_t v46;
  __int128 v48;
  uint32x2_t v49;
  uint64_t v50;
  std::__shared_weak_count *v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  uint64_t v58;
  std::__shared_weak_count *v59;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 1248), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  if (*(_DWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_ensureRenderer");
    v3 = IOSurfaceLookup(*(_DWORD *)(a1 + 56));
    if (v3)
    {
      v4 = v3;
      Width = IOSurfaceGetWidth(v3);
      Height = IOSurfaceGetHeight(v4);
      *(_QWORD *)&v7 = __PAIR64__(Height, Width);
      v8 = Width;
      v48 = v7;
      v9 = Height;
      if (Width)
        v10 = Height == 0;
      else
        v10 = 1;
      if (!v10)
      {
        v11 = *(_BYTE **)(a1 + 32);
        if (!v11[1081])
        {
          v11[1081] = 1;
          objc_msgSend(*(id *)(a1 + 32), "runOnce");
          v11 = *(_BYTE **)(a1 + 32);
        }
        v12 = objc_msgSend(v11, "chooseViewRenderer", v48);
        if (v12)
        {
          v13 = v12;
          v14 = (_OWORD *)objc_msgSend(*(id *)(a1 + 32), "getRootNode");
          SKCRenderer::getBackingContext(v13, &v56);
          v15 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)v56 + 32))(v56, *(unsigned int *)(a1 + 56), v8, v9, 4, 0);
          std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v58, v15);
          v16 = v57;
          if (v57)
          {
            p_shared_owners = (unint64_t *)&v57->__shared_owners_;
            do
              v18 = __ldaxr(p_shared_owners);
            while (__stlxr(v18 - 1, p_shared_owners));
            if (!v18)
            {
              ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
              std::__shared_weak_count::__release_weak(v16);
            }
          }
          SKCRenderer::getBackingContext(v13, &v54);
          texture_2d = jet_context::create_texture_2d();
          std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v56, texture_2d);
          v20 = v55;
          if (v55)
          {
            v21 = (unint64_t *)&v55->__shared_owners_;
            do
              v22 = __ldaxr(v21);
            while (__stlxr(v22 - 1, v21));
            if (!v22)
            {
              ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
              std::__shared_weak_count::__release_weak(v20);
            }
          }
          SKCRenderer::getBackingContext(v13, &v52);
          v23 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v52 + 112))(v52);
          std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v54, v23);
          v24 = v53;
          if (v53)
          {
            v25 = (unint64_t *)&v53->__shared_owners_;
            do
              v26 = __ldaxr(v25);
            while (__stlxr(v26 - 1, v25));
            if (!v26)
            {
              ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
              std::__shared_weak_count::__release_weak(v24);
            }
          }
          v27 = v54;
          *(_QWORD *)(v54 + 16) = v58;
          v28 = v56;
          *(_QWORD *)(v27 + 208) = v56;
          *(_QWORD *)(v27 + 232) = v28;
          v29.i64[0] = 0;
          v29.u64[1] = (unint64_t)v49;
          v30.i64[0] = 0;
          v30.u64[1] = (unint64_t)vcvt_f32_u32(v49);
          v31 = *(__n128 *)MEMORY[0x1E0C83FF0];
          v32 = *(__n128 *)(MEMORY[0x1E0C83FF0] + 16);
          v31.n128_u32[0] = 1.0;
          v32.n128_u32[1] = -1.0;
          v33 = *(__n128 *)(MEMORY[0x1E0C83FF0] + 32);
          v33.n128_u32[2] = 1.0;
          SKCRenderer::render(v13, v14, &v54, 0, 0, 0, 0, 0, &v50, v30, v29, v31, v32, v33, *(__n128 *)(MEMORY[0x1E0C83FF0] + 48), 0.0);
          v34 = v51;
          if (v51)
          {
            v35 = (unint64_t *)&v51->__shared_owners_;
            do
              v36 = __ldaxr(v35);
            while (__stlxr(v36 - 1, v35));
            if (!v36)
            {
              ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
              std::__shared_weak_count::__release_weak(v34);
            }
          }
          v37 = v55;
          if (v55)
          {
            v38 = (unint64_t *)&v55->__shared_owners_;
            do
              v39 = __ldaxr(v38);
            while (__stlxr(v39 - 1, v38));
            if (!v39)
            {
              ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
              std::__shared_weak_count::__release_weak(v37);
            }
          }
          v40 = v57;
          if (v57)
          {
            v41 = (unint64_t *)&v57->__shared_owners_;
            do
              v42 = __ldaxr(v41);
            while (__stlxr(v42 - 1, v41));
            if (!v42)
            {
              ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
              std::__shared_weak_count::__release_weak(v40);
            }
          }
          v43 = v59;
          if (v59)
          {
            v44 = (unint64_t *)&v59->__shared_owners_;
            do
              v45 = __ldaxr(v44);
            while (__stlxr(v45 - 1, v44));
            if (!v45)
            {
              ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
              std::__shared_weak_count::__release_weak(v43);
            }
          }
        }
      }
      CFRelease(v4);
    }
  }
  v46 = *(_QWORD *)(a1 + 48);
  if (v46)
    (*(void (**)(void))(v46 + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 1248));
}

- (void)overrideMetalCommandQueue:(id)a3
{
  id v4;
  void *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *lpsrc;
  std::__shared_weak_count *v15;
  void *v16;
  std::__shared_weak_count *v17;

  v4 = a3;
  SKCRenderer::getBackingContext((uint64_t)self->_renderer, &lpsrc);
  if (lpsrc && (v5 = __dynamic_cast(lpsrc, MEMORY[0x1E0D3F0B8], MEMORY[0x1E0D3F0C0], 0)) != 0)
  {
    v16 = v5;
    v17 = v15;
    if (v15)
    {
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  v8 = v15;
  if (v15)
  {
    v9 = (unint64_t *)&v15->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (v16)
    jet_context_Metal::override_Metal_render_state();
  v11 = v17;
  if (v17)
  {
    v12 = (unint64_t *)&v17->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

}

- (void)setAsynchronous:(BOOL)asynchronous
{
  _BOOL4 v3;
  id v4;

  v3 = asynchronous;
  -[SKView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setPresentsWithTransaction:", !v3);

}

- (BOOL)isAsynchronous
{
  void *v2;
  int v3;

  -[SKView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "presentsWithTransaction") ^ 1;
  else
    LOBYTE(v3) = 1;

  return v3;
}

- (void)set_usesAsyncUpdateQueue:(BOOL)a3
{
  BYTE1(self->_transition) = a3;
}

- (BOOL)_usesAsyncUpdateQueue
{
  return BYTE1(self->_transition);
}

- (void)setUpRenderCallback
{
  OS_dispatch_queue *updateQueue;
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, double);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  updateQueue = self->_updateQueue;
  self->_updateQueue = 0;

  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __29__SKView_setUpRenderCallback__block_invoke;
  v10 = &unk_1EA4FE478;
  objc_copyWeak(&v11, &location);
  v4 = objc_loadWeakRetained(&location);
  +[SKDisplayLink displayLinkWithDisplay:handler:client:](SKDisplayLink, "displayLinkWithDisplay:handler:client:", 0, &v7, v4);
  v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  v6 = self->_updateQueue;
  self->_updateQueue = v5;

  -[OS_dispatch_queue setPreferredFramesPerSecond:](self->_updateQueue, "setPreferredFramesPerSecond:", -[SKView _getEffectivePreferredFramesPerSecond](self, "_getEffectivePreferredFramesPerSecond", v7, v8, v9, v10));
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __29__SKView_setUpRenderCallback__block_invoke(uint64_t a1, double a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;
  id v8;
  char v9;
  void *v10;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v6 = objc_msgSend(WeakRetained, "_shouldRenderForTime:", a2);
    v5 = v10;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v10, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7
        || (objc_opt_respondsToSelector() & 1) == 0
        || (v8 = objc_loadWeakRetained(v3),
            v9 = objc_msgSend(v7, "view:shouldRenderAtTime:", v8, a2),
            v8,
            (v9 & 1) != 0))
      {
        objc_msgSend(v10, "_vsyncRenderForTime:preRender:postRender:", 0, 0, a2);
      }

      v5 = v10;
    }
  }

}

- (void)startRenderCallbacks
{
  -[OS_dispatch_queue setPaused:](self->_updateQueue, "setPaused:", 0);
}

- (void)stopRenderCallbacks
{
  -[OS_dispatch_queue setPaused:](self->_updateQueue, "setPaused:", 1);
}

- (BOOL)_renderUpdateEnabled
{
  OS_dispatch_queue *updateQueue;

  updateQueue = self->_updateQueue;
  if (updateQueue)
    LOBYTE(updateQueue) = -[OS_dispatch_queue isPaused](updateQueue, "isPaused") ^ 1;
  return (char)updateQueue;
}

- (void)set_renderUpdateEnabled:(BOOL)a3
{
  if (a3)
    -[SKView startRenderCallbacks](self, "startRenderCallbacks");
  else
    -[SKView stopRenderCallbacks](self, "stopRenderCallbacks");
}

- (void)_endFrameStats
{
  SKCStats *p_frameStats;
  double v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  SKCStats v13;

  p_frameStats = &self->_frameStats;
  v4 = CACurrentMediaTime();
  SKCStats::endFrame(p_frameStats, v4);
  SKCStats::operator+=((uint64_t)&self->_nextStats, (uint64_t)p_frameStats);
  if (self->_nextStats.currentTime - self->_nextStats.baseTime > 1.0)
  {
    v5 = *(_OWORD *)&self->_nextStats.frameCount;
    v6 = *(_OWORD *)&self->_nextStats.baseTime;
    *(_OWORD *)&self->_currentStats.frameBeginTime = *(_OWORD *)&self->_nextStats.frameBeginTime;
    *(_OWORD *)&self->_currentStats.baseTime = v6;
    *(_OWORD *)&self->_currentStats.frameCount = v5;
    v7 = *(_OWORD *)&self->_nextStats.update.duration;
    v8 = *(_OWORD *)&self->_nextStats.physics.duration;
    v9 = *(_OWORD *)&self->_nextStats.constraints.beginTime;
    *(_OWORD *)&self->_currentStats.clientUpdate.duration = *(_OWORD *)&self->_nextStats.clientUpdate.duration;
    *(_OWORD *)&self->_currentStats.constraints.beginTime = v9;
    *(_OWORD *)&self->_currentStats.physics.duration = v8;
    *(_OWORD *)&self->_currentStats.update.duration = v7;
    v10 = *(_OWORD *)&self->_nextStats.render.duration;
    v11 = *(_OWORD *)&self->_nextStats.render.nodeTraversalCount;
    v12 = *(_QWORD *)&self->_nextStats.render.passCount;
    *(_OWORD *)&self->_currentStats.constraints.constraintCount = *(_OWORD *)&self->_nextStats.constraints.constraintCount;
    *(_QWORD *)&self->_currentStats.render.passCount = v12;
    *(_OWORD *)&self->_currentStats.render.nodeTraversalCount = v11;
    *(_OWORD *)&self->_currentStats.render.duration = v10;
    SKCStats::SKCStats(&v13);
    *(_OWORD *)&self->_nextStats.constraints.constraintCount = *(_OWORD *)&v13.constraints.constraintCount;
    *(_OWORD *)&self->_nextStats.render.duration = *(_OWORD *)&v13.render.duration;
    *(_OWORD *)&self->_nextStats.render.nodeTraversalCount = *(_OWORD *)&v13.render.nodeTraversalCount;
    *(_QWORD *)&self->_nextStats.render.passCount = *(_QWORD *)&v13.render.passCount;
    *(_OWORD *)&self->_nextStats.clientUpdate.duration = *(_OWORD *)&v13.clientUpdate.duration;
    *(_OWORD *)&self->_nextStats.update.duration = *(_OWORD *)&v13.update.duration;
    *(_OWORD *)&self->_nextStats.physics.duration = *(_OWORD *)&v13.physics.duration;
    *(_OWORD *)&self->_nextStats.constraints.beginTime = *(_OWORD *)&v13.constraints.beginTime;
    *(_OWORD *)&self->_nextStats.frameBeginTime = *(_OWORD *)&v13.frameBeginTime;
    *(_OWORD *)&self->_nextStats.baseTime = *(_OWORD *)&v13.baseTime;
    *(_OWORD *)&self->_nextStats.frameCount = *(_OWORD *)&v13.frameCount;
    SKCStats::~SKCStats(&v13);
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  id v20;
  id v21;
  id *v22;
  id *v23;
  id v24;
  char *v25;
  char **v26;
  BOOL v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  char **v38;
  char *v39[2];
  id *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v28 = v6;
  if (!BYTE4(self->_transition) && *(_QWORD *)&self->_paused)
  {
    v39[0] = 0;
    v39[1] = 0;
    v30 = v7;
    v38 = v39;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v9);
          v37 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v37, "hash", v28));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(void **)&self->_paused;
          objc_msgSend(v37, "locationInNode:", v14);
          objc_msgSend(v14, "nodeAtPoint:recursive:", 1);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          v32 = v15;
          if (v15)
          {
            while ((objc_msgSend(v15, "isUserInteractionEnabled") & 1) == 0)
            {
              objc_msgSend(v32, "parent");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v32;
              v32 = v16;

              v15 = v32;
              if (!v32)
                goto LABEL_14;
            }
            if (v32)
            {
              objc_msgSend(*(id *)&self->_prevBackingScaleFactor, "setObject:forKey:", v32, v13);
              v40 = &v32;
              v18 = std::__tree<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::__map_value_compare<SKNode * {__strong},std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::less<SKNode * {__strong}>,true>,std::allocator<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>>>::__emplace_unique_key_args<SKNode * {__strong},std::piecewise_construct_t const&,std::tuple<SKNode * const {__strong}&>,std::tuple<>>((uint64_t **)&v38, (unint64_t *)&v32, (uint64_t)&std::piecewise_construct, &v40);
              std::vector<UITouch * {__strong}>::push_back[abi:ne180100]((char **)v18 + 5, &v37);

            }
          }
LABEL_14:

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v10);
    }

    v19 = (uint64_t *)v38;
    if (v38 != v39)
    {
      do
      {
        v20 = (id)v19[4];
        v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v22 = (id *)v19[5];
        v23 = (id *)v19[6];
        while (v22 != v23)
        {
          v24 = *v22;
          objc_msgSend(v21, "addObject:", v24);

          ++v22;
        }
        objc_msgSend(v20, "touchesBegan:withEvent:", v21, v30);

        v25 = (char *)v19[1];
        if (v25)
        {
          do
          {
            v26 = (char **)v25;
            v25 = *(char **)v25;
          }
          while (v25);
        }
        else
        {
          do
          {
            v26 = (char **)v19[2];
            v27 = *v26 == (char *)v19;
            v19 = (uint64_t *)v26;
          }
          while (!v27);
        }
        v19 = (uint64_t *)v26;
      }
      while (v26 != v39);
    }
    std::__tree<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::__map_value_compare<SKNode * {__strong},std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::less<SKNode * {__strong}>,true>,std::allocator<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>>>::destroy((uint64_t)&v38, v39[0]);
    v6 = v28;
    v8 = v30;
  }
  v31.receiver = self;
  v31.super_class = (Class)SKView;
  -[SKView touchesBegan:withEvent:](&v31, sel_touchesBegan_withEvent_, v6, v8, v28);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t *v14;
  uint64_t *v15;
  id v16;
  id v17;
  id *v18;
  id *v19;
  id v20;
  char *v21;
  char **v22;
  BOOL v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  char **v34;
  char *v35[2];
  id *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v24 = v6;
  if (!BYTE4(self->_transition) && *(_QWORD *)&self->_paused)
  {
    v35[0] = 0;
    v35[1] = 0;
    v26 = v7;
    v34 = v35;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v9);
          v33 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v33, "hash", v24));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)&self->_prevBackingScaleFactor, "objectForKey:", v13);
          v28 = (id)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            v36 = &v28;
            v14 = std::__tree<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::__map_value_compare<SKNode * {__strong},std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::less<SKNode * {__strong}>,true>,std::allocator<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>>>::__emplace_unique_key_args<SKNode * {__strong},std::piecewise_construct_t const&,std::tuple<SKNode * const {__strong}&>,std::tuple<>>((uint64_t **)&v34, (unint64_t *)&v28, (uint64_t)&std::piecewise_construct, &v36);
            std::vector<UITouch * {__strong}>::push_back[abi:ne180100]((char **)v14 + 5, &v33);

          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v10);
    }

    v15 = (uint64_t *)v34;
    if (v34 != v35)
    {
      do
      {
        v16 = (id)v15[4];
        v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v18 = (id *)v15[5];
        v19 = (id *)v15[6];
        while (v18 != v19)
        {
          v20 = *v18;
          objc_msgSend(v17, "addObject:", v20);

          ++v18;
        }
        objc_msgSend(v16, "touchesMoved:withEvent:", v17, v26);

        v21 = (char *)v15[1];
        if (v21)
        {
          do
          {
            v22 = (char **)v21;
            v21 = *(char **)v21;
          }
          while (v21);
        }
        else
        {
          do
          {
            v22 = (char **)v15[2];
            v23 = *v22 == (char *)v15;
            v15 = (uint64_t *)v22;
          }
          while (!v23);
        }
        v15 = (uint64_t *)v22;
      }
      while (v22 != v35);
    }
    std::__tree<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::__map_value_compare<SKNode * {__strong},std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::less<SKNode * {__strong}>,true>,std::allocator<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>>>::destroy((uint64_t)&v34, v35[0]);
    v6 = v24;
    v8 = v26;
  }
  v27.receiver = self;
  v27.super_class = (Class)SKView;
  -[SKView touchesMoved:withEvent:](&v27, sel_touchesMoved_withEvent_, v6, v8, v24);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t *v14;
  uint64_t *v15;
  id v16;
  id v17;
  id *v18;
  id *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  char *v26;
  char **v27;
  BOOL v28;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  char **v44;
  char *v45[2];
  id *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v29 = v6;
  if (!BYTE4(self->_transition) && *(_QWORD *)&self->_paused)
  {
    v45[0] = 0;
    v45[1] = 0;
    v31 = v7;
    v44 = v45;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v40 != v11)
            objc_enumerationMutation(v9);
          v43 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v43, "hash", v29));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)&self->_prevBackingScaleFactor, "objectForKey:", v13);
          v38 = (id)objc_claimAutoreleasedReturnValue();
          if (v38)
          {
            v46 = &v38;
            v14 = std::__tree<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::__map_value_compare<SKNode * {__strong},std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::less<SKNode * {__strong}>,true>,std::allocator<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>>>::__emplace_unique_key_args<SKNode * {__strong},std::piecewise_construct_t const&,std::tuple<SKNode * const {__strong}&>,std::tuple<>>((uint64_t **)&v44, (unint64_t *)&v38, (uint64_t)&std::piecewise_construct, &v46);
            std::vector<UITouch * {__strong}>::push_back[abi:ne180100]((char **)v14 + 5, &v43);

          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v10);
    }

    v15 = (uint64_t *)v44;
    v8 = v31;
    if (v44 != v45)
    {
      do
      {
        v32 = (id)v15[4];
        v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v19 = (id *)v15[5];
        v18 = (id *)v15[6];
        while (v19 != v18)
        {
          v20 = *v19;
          objc_msgSend(v17, "addObject:", v20);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "hash"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v21);

          ++v19;
        }
        objc_msgSend(v32, "touchesEnded:withEvent:", v17, v31);
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v22 = v16;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v35;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v35 != v24)
                objc_enumerationMutation(v22);
              objc_msgSend(*(id *)&self->_prevBackingScaleFactor, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), v29);
            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
          }
          while (v23);
        }

        v26 = (char *)v15[1];
        if (v26)
        {
          do
          {
            v27 = (char **)v26;
            v26 = *(char **)v26;
          }
          while (v26);
        }
        else
        {
          do
          {
            v27 = (char **)v15[2];
            v28 = *v27 == (char *)v15;
            v15 = (uint64_t *)v27;
          }
          while (!v28);
        }
        v15 = (uint64_t *)v27;
        v8 = v31;
      }
      while (v27 != v45);
    }
    std::__tree<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::__map_value_compare<SKNode * {__strong},std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::less<SKNode * {__strong}>,true>,std::allocator<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>>>::destroy((uint64_t)&v44, v45[0]);
    v6 = v29;
  }
  v33.receiver = self;
  v33.super_class = (Class)SKView;
  -[SKView touchesEnded:withEvent:](&v33, sel_touchesEnded_withEvent_, v6, v8, v29);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t *v14;
  uint64_t *v15;
  id v16;
  id v17;
  id *v18;
  id *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  char *v26;
  char **v27;
  BOOL v28;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  char **v44;
  char *v45[2];
  id *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v29 = v6;
  if (!BYTE4(self->_transition) && *(_QWORD *)&self->_paused)
  {
    v45[0] = 0;
    v45[1] = 0;
    v31 = v7;
    v44 = v45;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v40 != v11)
            objc_enumerationMutation(v9);
          v43 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v43, "hash", v29));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)&self->_prevBackingScaleFactor, "objectForKey:", v13);
          v38 = (id)objc_claimAutoreleasedReturnValue();
          if (v38)
          {
            v46 = &v38;
            v14 = std::__tree<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::__map_value_compare<SKNode * {__strong},std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::less<SKNode * {__strong}>,true>,std::allocator<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>>>::__emplace_unique_key_args<SKNode * {__strong},std::piecewise_construct_t const&,std::tuple<SKNode * const {__strong}&>,std::tuple<>>((uint64_t **)&v44, (unint64_t *)&v38, (uint64_t)&std::piecewise_construct, &v46);
            std::vector<UITouch * {__strong}>::push_back[abi:ne180100]((char **)v14 + 5, &v43);

          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v10);
    }

    v15 = (uint64_t *)v44;
    v8 = v31;
    if (v44 != v45)
    {
      do
      {
        v32 = (id)v15[4];
        v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v19 = (id *)v15[5];
        v18 = (id *)v15[6];
        while (v19 != v18)
        {
          v20 = *v19;
          objc_msgSend(v17, "addObject:", v20);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "hash"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v21);

          ++v19;
        }
        objc_msgSend(v32, "touchesCancelled:withEvent:", v17, v31);
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v22 = v16;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v35;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v35 != v24)
                objc_enumerationMutation(v22);
              objc_msgSend(*(id *)&self->_prevBackingScaleFactor, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), v29);
            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
          }
          while (v23);
        }

        v26 = (char *)v15[1];
        if (v26)
        {
          do
          {
            v27 = (char **)v26;
            v26 = *(char **)v26;
          }
          while (v26);
        }
        else
        {
          do
          {
            v27 = (char **)v15[2];
            v28 = *v27 == (char *)v15;
            v15 = (uint64_t *)v27;
          }
          while (!v28);
        }
        v15 = (uint64_t *)v27;
        v8 = v31;
      }
      while (v27 != v45);
    }
    std::__tree<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::__map_value_compare<SKNode * {__strong},std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::less<SKNode * {__strong}>,true>,std::allocator<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>>>::destroy((uint64_t)&v44, v45[0]);
    v6 = v29;
  }
  v33.receiver = self;
  v33.super_class = (Class)SKView;
  -[SKView touchesCancelled:withEvent:](&v33, sel_touchesCancelled_withEvent_, v6, v8, v29);

}

- (CGPoint)convertPoint:(CGPoint)point toScene:(SKScene *)scene
{
  double v4;
  double v5;
  CGPoint result;

  *(_QWORD *)&v4 = CGPointConvertFromViewToScene(self, scene, point).n128_u64[0];
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)point fromScene:(SKScene *)scene
{
  double v4;
  double v5;
  CGPoint result;

  *(_QWORD *)&v4 = CGPointConvertFromSceneToView(scene, self, point).n128_u64[0];
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  OS_dispatch_queue *updateQueue;
  OS_dispatch_queue *v6;
  SKCRenderer *renderer;
  void *v8;
  objc_super v9;

  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB358], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB270], 0);

  -[SKView stopRenderCallbacks](self, "stopRenderCallbacks");
  updateQueue = self->_updateQueue;
  if (updateQueue)
  {
    -[OS_dispatch_queue invalidate](updateQueue, "invalidate");
    v6 = self->_updateQueue;
    self->_updateQueue = 0;

  }
  renderer = (SKCRenderer *)self->_renderer;
  if (renderer)
  {
    SKCRenderer::~SKCRenderer(renderer);
    MEMORY[0x1DF0CF560]();
  }
  v8 = *(void **)&self->_paused;
  if (v8)
    objc_msgSend(v8, "removeAllActions");
  v9.receiver = self;
  v9.super_class = (Class)SKView;
  -[SKView dealloc](&v9, sel_dealloc);
}

- (double)alphaValue
{
  double result;

  result = 0.0;
  if (!BYTE1(self->_frameInterval))
    return 1.0;
  return result;
}

- (BOOL)isOpaque
{
  return BYTE1(self->_frameInterval) == 0;
}

- (BOOL)allowsTransparency
{
  return BYTE1(self->_frameInterval);
}

- (void)setAllowsTransparency:(BOOL)allowsTransparency
{
  void *v4;
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  BYTE1(self->_frameInterval) = allowsTransparency;
  -[SKView setOpaque:](self, "setOpaque:", !allowsTransparency);
  -[SKView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = BYTE1(self->_frameInterval) == 0;
    -[SKView layer](self, "layer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOpaque:", v5);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v9, "CGColor");
    -[SKView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

  }
}

- (void)presentScene:(SKScene *)scene
{
  void *v5;
  void *v6;
  char v7;
  id *p_paused;
  void *v9;
  id v10;
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
  SKScene *v22;
  SKScene *nextScene;
  SKScene *v24;

  v24 = scene;
  -[SKView getRenderOptions](self, "getRenderOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ignoreBackgroundNotifications"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) == 0)
    -[SKView setPaused:](self, "setPaused:", 0);
  BYTE4(self->_transition) = 1;
  p_paused = (id *)&self->_paused;
  v9 = *(void **)&self->_paused;
  if (v9)
  {
    objc_msgSend(v9, "_willMoveFromView:", self);
    v10 = *p_paused;
    *p_paused = 0;

  }
  v11 = *(void **)&self->_prevBackingScaleFactor;
  if (v11)
    objc_msgSend(v11, "removeAllObjects");
  if (v24)
  {
    if (-[SKScene scaleMode](v24, "scaleMode") == SKSceneScaleModeResizeFill)
    {
      -[SKView bounds](self, "bounds");
      v13 = v12;
      v15 = v14;
      -[SKScene size](v24, "size");
      v17 = v16;
      v19 = v18;
      -[SKScene size](v24, "size");
      if (v21 != v13 || v20 != v15)
      {
        -[SKScene setSize:](v24, "setSize:", v13, v15);
        -[SKScene didChangeSize:](v24, "didChangeSize:", v17, v19);
      }
    }
  }
  objc_storeStrong((id *)&self->_paused, scene);
  v22 = self->_scene;
  self->_scene = 0;

  nextScene = self->_nextScene;
  self->_nextScene = 0;

  -[SKScene setPaused:](v24, "setPaused:", LOBYTE(self->_spriteArrayHint));
  objc_msgSend(*p_paused, "_didMoveToView:", self);
  self->_needsInitialUpdate = 1;
  BYTE4(self->_transition) = 0;

}

- (void)presentScene:(SKScene *)scene transition:(SKTransition *)transition
{
  SKTransition *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  SKScene *v18;
  SKScene *nextScene;
  SKScene *v20;

  v20 = scene;
  v7 = transition;
  if (!v20 || !v7)
    goto LABEL_9;
  if (-[SKScene scaleMode](v20, "scaleMode") == SKSceneScaleModeResizeFill)
  {
    -[SKView bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    -[SKScene size](v20, "size");
    v13 = v12;
    v15 = v14;
    -[SKScene size](v20, "size");
    if (v17 != v9 || v16 != v11)
    {
      -[SKScene setSize:](v20, "setSize:", v9, v11);
      -[SKScene didChangeSize:](v20, "didChangeSize:", v13, v15);
    }
  }
  if (*(_QWORD *)&self->_paused)
  {
    BYTE4(self->_transition) = 1;
    objc_storeStrong((id *)&self->_scene, scene);
    -[SKScene setPaused:](self->_scene, "setPaused:", LOBYTE(self->_spriteArrayHint));
    -[SKScene _didMoveToView:](self->_scene, "_didMoveToView:", self);
    self->_needsInitialUpdate = 1;
    v18 = (SKScene *)-[SKTransition copy](v7, "copy");
    nextScene = self->_nextScene;
    self->_nextScene = v18;

    *(_DWORD *)(-[SKNode _backingNode](self->_nextScene, "_backingNode") + 720) = 0;
    *(_DWORD *)(-[SKNode _backingNode](self->_nextScene, "_backingNode") + 584) = 0;
  }
  else
  {
LABEL_9:
    -[SKView presentScene:](self, "presentScene:", v20);
  }

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKView;
  -[SKView layoutSubviews](&v6, sel_layoutSubviews);
  -[SKView _reshape](self, "_reshape");
  -[SKView getRenderOptions](self, "getRenderOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ignoreRenderSyncInLayoutSubviews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) == 0)
    -[SKView _renderSynchronouslyForTime:preRender:postRender:](self, "_renderSynchronouslyForTime:preRender:postRender:", 0, 0, 0.0);

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKView;
  -[SKView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SKView _reshape](self, "_reshape");
}

- (void)_reshape
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v15;
  double v16;

  kdebug_trace();
  -[SKView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = *(void **)&self->_paused;
  if (v7 && objc_msgSend(v7, "scaleMode") == 3)
  {
    objc_msgSend(*(id *)&self->_paused, "size");
    v9 = v8;
    v11 = v10;
    objc_msgSend(*(id *)&self->_paused, "size");
    if (v13 != v4 || v12 != v6)
    {
      objc_msgSend(*(id *)&self->_paused, "setSize:", v4, v6);
      objc_msgSend(*(id *)&self->_paused, "didChangeSize:", v9, v11);
    }
  }
  -[SKView _getViewContentsScale](self, "_getViewContentsScale");
  v16 = v15;
  if (*(_QWORD *)&self->_viewFramebufferPixelSize[5] != (v4 * v16)
    || HIDWORD(*(_QWORD *)&self->_viewFramebufferPixelSize[5]) != (v6 * v16))
  {
    self->_viewFramebufferIsValid = 0;
  }
}

- (SKScene)scene
{
  return (SKScene *)*(id *)&self->_paused;
}

- (void)_update:(double)a3
{
  BOOL *p_needsInitialUpdate;
  float v6;
  uint64_t v7;
  SKScene *scene;
  uint64_t v9;
  _BOOL8 v10;
  SKScene *nextScene;
  uint64_t v12;
  float *v13;
  float v14;
  float v15;
  BOOL *p_paused;
  SKScene *v17;
  SKScene *v18;
  void *v19;
  id v20;
  void *v21;
  SKScene *v22;
  SKScene *v23;
  SKScene *v24;

  if (!LOBYTE(self->_spriteArrayHint) || (p_needsInitialUpdate = &self->_needsInitialUpdate, self->_needsInitialUpdate))
  {
    v6 = a3 - skCurrentTime();
    if (v6 < 0.0)
      return;
    if (v6 <= 1.0)
    {
      skSetTime(a3);
      goto LABEL_15;
    }
    v7 = *(_QWORD *)&self->_paused;
    scene = self->_scene;
    if (v7)
    {
      v9 = objc_msgSend(*(id *)&self->_paused, "isPaused");
      objc_msgSend(*(id *)&self->_paused, "setPaused:", 1);
      if (scene)
      {
LABEL_7:
        v10 = -[SKNode isPaused](self->_scene, "isPaused");
        -[SKScene setPaused:](self->_scene, "setPaused:", 1);
LABEL_11:
        skSetTime(a3);
        if (v7)
        {
          objc_msgSend(*(id *)&self->_paused, "setPaused:", 0);
          objc_msgSend(*(id *)&self->_paused, "setPaused:", v9);
        }
        if (scene)
        {
          -[SKScene setPaused:](self->_scene, "setPaused:", 0);
          -[SKScene setPaused:](self->_scene, "setPaused:", v10);
        }
LABEL_15:
        nextScene = self->_nextScene;
        if (nextScene)
        {
          v12 = -[SKNode _backingNode](nextScene, "_backingNode");
          *(float *)(v12 + 584) = *(float *)(v12 + 584) + v6;
          v13 = -[SKNode _backingNode](self->_nextScene, "_backingNode");
          v14 = *(float *)(-[SKNode _backingNode](self->_nextScene, "_backingNode") + 584);
          v13[180] = v14 / *(float *)(-[SKNode _backingNode](self->_nextScene, "_backingNode") + 580);
          v15 = *(float *)(-[SKNode _backingNode](self->_nextScene, "_backingNode") + 584);
          if (v15 >= *(float *)(-[SKNode _backingNode](self->_nextScene, "_backingNode") + 580))
          {
            if (*(_BYTE *)(-[SKNode _backingNode](self->_nextScene, "_backingNode") + 576))
              objc_msgSend(*(id *)&self->_paused, "setPaused:", 0);
            p_paused = &self->_paused;
            objc_msgSend(*(id *)&self->_paused, "_willMoveFromView:", self);
            objc_storeStrong((id *)&self->_paused, self->_scene);
            v17 = self->_scene;
            self->_scene = 0;

            BYTE4(self->_transition) = 0;
            if (*(_BYTE *)(-[SKNode _backingNode](self->_nextScene, "_backingNode") + 577))
              objc_msgSend(*(id *)p_paused, "setPaused:", 0);
            v18 = self->_nextScene;
            self->_nextScene = 0;

            v19 = *(void **)&self->_prevBackingScaleFactor;
            if (v19)
              objc_msgSend(v19, "removeAllObjects");
            if (*(_QWORD *)p_paused)
              SKCNode::setDirty((SKCNode *)objc_msgSend(*(id *)p_paused, "_backingNode"));
          }
        }
        v20 = *(id *)&self->_paused;
        v21 = v20;
        if (v20 && (objc_msgSend(v20, "isPaused") & 1) == 0)
        {
          if (!objc_msgSend(v21, "_usesExplicitUpdate"))
          {
LABEL_30:
            objc_msgSend(v21, "_update:", a3);
            BYTE3(self->_transition) = 0;
            goto LABEL_31;
          }
          if (objc_msgSend(v21, "_needsUpdate"))
          {
            objc_msgSend(v21, "set_needsUpdate:", 0);
            goto LABEL_30;
          }
        }
LABEL_31:
        v22 = self->_scene;
        v23 = v22;
        if (v22 && !-[SKNode isPaused](v22, "isPaused"))
        {
          if (!-[SKScene _usesExplicitUpdate](v23, "_usesExplicitUpdate"))
          {
LABEL_36:
            -[SKScene _update:](v23, "_update:", a3);
            BYTE3(self->_transition) = 0;
            goto LABEL_37;
          }
          if (-[SKScene _needsUpdate](v23, "_needsUpdate"))
          {
            -[SKScene set_needsUpdate:](v23, "set_needsUpdate:", 0);
            goto LABEL_36;
          }
        }
LABEL_37:

        p_needsInitialUpdate = &self->_needsInitialUpdate;
        if (self->_needsInitialUpdate)
        {
          v24 = self->_nextScene;
          if (v24)
          {
            if (*(_BYTE *)(-[SKNode _backingNode](v24, "_backingNode") + 576))
              objc_msgSend(*(id *)&self->_paused, "setPaused:", 1);
            if (*(_BYTE *)(-[SKNode _backingNode](self->_nextScene, "_backingNode") + 577))
              -[SKScene setPaused:](self->_scene, "setPaused:", 1);
          }
        }
        goto LABEL_43;
      }
    }
    else
    {
      v9 = 0;
      if (scene)
        goto LABEL_7;
    }
    v10 = 0;
    goto LABEL_11;
  }
LABEL_43:
  *p_needsInitialUpdate = 0;
}

- (SKTexture)textureFromNode:(SKNode *)node
{
  -[SKView textureFromNode:withOptions:](self, "textureFromNode:withOptions:", node, 0);
  return (SKTexture *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)textureFromNode:(id)a3 withOptions:(id)a4
{
  id v6;
  NSDictionary *v7;
  char **v8;
  float v9;
  void *v10;

  v6 = a3;
  v7 = (NSDictionary *)a4;
  -[SKView _ensureRenderer](self, "_ensureRenderer");
  v8 = (char **)objc_msgSend(v6, "_backingNode");
  -[SKView _getViewContentsScale](self, "_getViewContentsScale");
  SKCRenderer::textureFromNode((SKCRenderer *)self->_renderer, v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (SKView)initWithFrame:(CGRect)a3
{
  SKView *v3;
  SKView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKView;
  v3 = -[SKView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SKView _commonInit](v3, "_commonInit");
  return v4;
}

- (SKView)initWithCoder:(id)a3
{
  id v4;
  SKView *v5;
  SKView *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SKView;
  v5 = -[SKView initWithCoder:](&v17, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[SKView _commonInit](v5, "_commonInit");
    if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_version")) >= 1)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v18[0] = objc_opt_class();
      v18[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v8);

      objc_msgSend(v4, "allowedClasses");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unionSet:", v9);

      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("_info"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKView set_info:](v6, "set_info:", v10);

      objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("_frame"));
      -[SKView setFrame:](v6, "setFrame:");
      -[SKView setPreferredFramesPerSecond:](v6, "setPreferredFramesPerSecond:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_preferredFramesPerSecond")));
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_paused")))
        -[SKView setPaused:](v6, "setPaused:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_paused")));
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_asynchronous")))
        -[SKView setAsynchronous:](v6, "setAsynchronous:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_asynchronous")));
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_allowsTransparency")))
        -[SKView setAllowsTransparency:](v6, "setAllowsTransparency:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_allowsTransparency")));
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_ignoresSiblingOrder")))
        -[SKView setIgnoresSiblingOrder:](v6, "setIgnoresSiblingOrder:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_ignoresSiblingOrder")));
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_shouldCullNonVisibleNodes")))
        -[SKView setShouldCullNonVisibleNodes:](v6, "setShouldCullNonVisibleNodes:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldCullNonVisibleNodes")));
      -[SKView _info](v6, "_info");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11 == 0;

      if (!v12)
      {
        -[SKView _info](v6, "_info");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", CFSTR("_ib_SceneName"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 && objc_msgSend(v14, "length"))
        {
          +[SKNode nodeWithFileNamed:](SKScene, "nodeWithFileNamed:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
LABEL_20:
            -[SKView presentScene:](v6, "presentScene:", v15);

            goto LABEL_21;
          }
        }
        else
        {

        }
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_scene"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
  }
LABEL_21:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKView;
  -[SKView encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("_version"));
  -[SKView frame](self, "frame");
  objc_msgSend(v4, "encodeCGRect:forKey:", CFSTR("_frame"));
  -[SKView _info](self, "_info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_info"));

  -[SKView scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_scene"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SKView preferredFramesPerSecond](self, "preferredFramesPerSecond"), CFSTR("_preferredFramesPerSecond"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SKView isPaused](self, "isPaused"), CFSTR("_paused"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SKView isAsynchronous](self, "isAsynchronous"), CFSTR("_asynchronous"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SKView allowsTransparency](self, "allowsTransparency"), CFSTR("_allowsTransparency"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SKView ignoresSiblingOrder](self, "ignoresSiblingOrder"), CFSTR("_ignoresSiblingOrder"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SKView shouldCullNonVisibleNodes](self, "shouldCullNonVisibleNodes"), CFSTR("_shouldCullNonVisibleNodes"));

}

- (BOOL)isEqualToView:(id)a3
{
  SKView *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  NSInteger v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  CGRect v29;
  CGRect v30;

  v4 = (SKView *)a3;
  if (self == v4)
    goto LABEL_14;
  v5 = -[SKView isPaused](self, "isPaused");
  if (v5 == -[SKView isPaused](v4, "isPaused"))
  {
    v6 = -[SKView isAsynchronous](self, "isAsynchronous");
    if (v6 == -[SKView isAsynchronous](v4, "isAsynchronous"))
    {
      v7 = -[SKView allowsTransparency](self, "allowsTransparency");
      if (v7 == -[SKView allowsTransparency](v4, "allowsTransparency"))
      {
        v8 = -[SKView ignoresSiblingOrder](self, "ignoresSiblingOrder");
        if (v8 == -[SKView ignoresSiblingOrder](v4, "ignoresSiblingOrder"))
        {
          v9 = -[SKView shouldCullNonVisibleNodes](self, "shouldCullNonVisibleNodes");
          if (v9 == -[SKView shouldCullNonVisibleNodes](v4, "shouldCullNonVisibleNodes"))
          {
            v10 = -[SKView preferredFramesPerSecond](self, "preferredFramesPerSecond");
            if (v10 == -[SKView preferredFramesPerSecond](v4, "preferredFramesPerSecond"))
            {
              -[SKView frame](self, "frame");
              v12 = v11;
              v14 = v13;
              v16 = v15;
              v18 = v17;
              -[SKView frame](v4, "frame");
              v30.origin.x = v19;
              v30.origin.y = v20;
              v30.size.width = v21;
              v30.size.height = v22;
              v29.origin.x = v12;
              v29.origin.y = v14;
              v29.size.width = v16;
              v29.size.height = v18;
              if (CGRectEqualToRect(v29, v30))
              {
                -[SKView scene](self, "scene");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (v23)
                {

LABEL_13:
                  -[SKView scene](self, "scene");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SKView scene](v4, "scene");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v26, "isEqualToNode:", v27);

                  goto LABEL_15;
                }
                -[SKView scene](v4, "scene");
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                if (v25)
                  goto LABEL_13;
LABEL_14:
                v24 = 1;
                goto LABEL_15;
              }
            }
          }
        }
      }
    }
  }
  v24 = 0;
LABEL_15:

  return v24;
}

- (void)setFrameInterval:(NSInteger)frameInterval
{
  self->_preferredFramesPerSecond = frameInterval;
  -[OS_dispatch_queue setPreferredFramesPerSecond:](self->_updateQueue, "setPreferredFramesPerSecond:", -[SKView _getEffectivePreferredFramesPerSecond](self, "_getEffectivePreferredFramesPerSecond"));
}

- (NSInteger)frameInterval
{
  return self->_preferredFramesPerSecond;
}

- (void)setPreferredFrameRate:(float)preferredFrameRate
{
  -[SKView setPreferredFramesPerSecond:](self, "setPreferredFramesPerSecond:", (uint64_t)preferredFrameRate);
}

- (float)preferredFrameRate
{
  return (float)-[SKView preferredFramesPerSecond](self, "preferredFramesPerSecond");
}

- (void)setPreferredFramesPerSecond:(NSInteger)preferredFramesPerSecond
{
  self->_displayLink = (SKDisplayLink *)preferredFramesPerSecond;
  -[OS_dispatch_queue setPreferredFramesPerSecond:](self->_updateQueue, "setPreferredFramesPerSecond:", -[SKView _getEffectivePreferredFramesPerSecond](self, "_getEffectivePreferredFramesPerSecond"));
}

- (NSInteger)preferredFramesPerSecond
{
  return (NSInteger)self->_displayLink;
}

- (unint64_t)_getEffectivePreferredFramesPerSecond
{
  float v3;

  if (sk_debug_option_exists(CFSTR("preferredFramesPerSecond")))
    v3 = sk_debug_option_get_float(CFSTR("preferredFramesPerSecond"));
  else
    v3 = (float)(unint64_t)((unint64_t)self->_displayLink / self->_preferredFramesPerSecond);
  return (unint64_t)fmaxf(v3, 1.0);
}

- (void)renderToIOSurfaceID:(unsigned int)a3 withScaleFactor:(double)a4
{
  *(float *)&a4 = a4;
  -[SKView _renderToIOSurfaceID:scaleFactor:asynchronous:preRender:postRender:](self, "_renderToIOSurfaceID:scaleFactor:asynchronous:preRender:postRender:", *(_QWORD *)&a3, 0, 0, 0, a4);
}

- (SKTexture)textureFromNode:(SKNode *)node crop:(CGRect)crop
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  SKNode *v9;
  char **v10;
  float v11;
  float v12;
  NSDictionary *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  _QWORD v18[2];
  CGRect v19;
  CGRect v20;
  CGRect v21;

  height = crop.size.height;
  width = crop.size.width;
  y = crop.origin.y;
  x = crop.origin.x;
  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = node;
  -[SKView _ensureRenderer](self, "_ensureRenderer");
  v10 = -[SKNode _backingNode](v9, "_backingNode");
  -[SKView _getViewContentsScale](self, "_getViewContentsScale");
  v12 = v11;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  if (CGRectIsEmpty(v19)
    || (v20.origin.x = x, v20.origin.y = y, v20.size.width = width, v20.size.height = height, CGRectIsInfinite(v20)))
  {
    v13 = 0;
  }
  else
  {
    v17 = CFSTR("textureFromNodeCropRect");
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    NSStringFromCGRect(v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  }
  SKCRenderer::textureFromNode((SKCRenderer *)self->_renderer, v10, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKTexture *)v15;
}

- (void)chooseViewRenderer
{
  return self->_renderer;
}

- (shared_ptr<jet_framebuffer>)nextFramebuffer
{
  jet_framebuffer **v2;
  jet_framebuffer **v3;
  SKView *v4;
  jet_texture *ptr;
  shared_ptr<jet_framebuffer> *p_framebuffer;
  jet_framebuffer *v7;
  int v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  double v17;
  void *v18;
  double v19;
  uint64_t v20;
  shared_ptr<jet_texture> *p_frameBufferColorTexture;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  jet_framebuffer *v25;
  __shared_weak_count *cntrl;
  unint64_t *v27;
  unint64_t v28;
  jet_framebuffer *v29;
  __shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  shared_ptr<jet_framebuffer> result;

  v3 = v2;
  if (self->_viewFramebufferIsValid)
  {
    v4 = self;
    ptr = self->_frameBufferDepthStencilTexture.__ptr_;
    p_framebuffer = &self->_framebuffer;
    v7 = self->_framebuffer.__ptr_;
    *((_QWORD *)v7 + 26) = ptr;
    *((_QWORD *)v7 + 29) = ptr;
    SKCRenderer::getBackingContext((uint64_t)-[SKView chooseViewRenderer](self, "chooseViewRenderer"), &v38);
    self = (SKView *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v38 + 136))(v38);
    v8 = (int)self;
    v9 = (std::__shared_weak_count *)*((_QWORD *)&v38 + 1);
    if (*((_QWORD *)&v38 + 1))
    {
      v10 = (unint64_t *)(*((_QWORD *)&v38 + 1) + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    if (v8 == 1)
    {
      SKCRenderer::getBackingContext((uint64_t)v4->_renderer, &v37);
      v38 = v37;
      if (*((_QWORD *)&v37 + 1))
      {
        v12 = (unint64_t *)(*((_QWORD *)&v37 + 1) + 8);
        do
          v13 = __ldxr(v12);
        while (__stxr(v13 + 1, v12));
        v14 = (std::__shared_weak_count *)*((_QWORD *)&v37 + 1);
        if (*((_QWORD *)&v37 + 1))
        {
          v15 = (unint64_t *)(*((_QWORD *)&v37 + 1) + 8);
          do
            v16 = __ldaxr(v15);
          while (__stlxr(v16 - 1, v15));
          if (!v16)
          {
            ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
            std::__shared_weak_count::__release_weak(v14);
          }
        }
      }
      if (sk_debug_get_optional())
        kdebug_trace();
      v17 = CACurrentMediaTime();
      _perfStartRequestDrawable(v17);
      if (LOBYTE(v4->_machTimeTimebase)
        && (-[CAMetalLayer isDrawableAvailable](v4->_metalLayer, "isDrawableAvailable") & 1) == 0)
      {
        v33 = mach_approximate_time();
        if ((unint64_t)(*(double *)&v4->_renderQueue
                              * (double)(v33 - -[SKView nextFramebuffer]::lastLoggingTimeCheckForDrawables)) >= 0x12A05F201)
        {
          -[SKView nextFramebuffer]::lastLoggingTimeCheckForDrawables = v33;
          NSLog(CFSTR("SKView: no drawables available for rendering. Skipping this frame."));
        }
        kdebug_trace();
        *((_QWORD *)p_framebuffer->__ptr_ + 2) = 0;
        std::shared_ptr<jet_buffer_pool>::reset[abi:ne180100](&v4->_frameBufferColorTexture.__ptr_);
        *v3 = 0;
        v3[1] = 0;
      }
      else
      {
        -[CAMetalLayer nextDrawable](v4->_metalLayer, "nextDrawable");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CACurrentMediaTime();
        _perfEndRequestDrawable(v19);
        if (sk_debug_get_optional())
          kdebug_trace();
        if (v18)
        {
          v20 = (*(uint64_t (**)(_QWORD, void *))(*(_QWORD *)v38 + 416))(v38, v18);
          std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v37, v20);
          p_frameBufferColorTexture = &v4->_frameBufferColorTexture;
          std::shared_ptr<jet_buffer_pool>::operator=[abi:ne180100]((uint64_t)p_frameBufferColorTexture, &v37);
          v22 = (std::__shared_weak_count *)*((_QWORD *)&v37 + 1);
          if (*((_QWORD *)&v37 + 1))
          {
            v23 = (unint64_t *)(*((_QWORD *)&v37 + 1) + 8);
            do
              v24 = __ldaxr(v23);
            while (__stlxr(v24 - 1, v23));
            if (!v24)
            {
              ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
              std::__shared_weak_count::__release_weak(v22);
            }
          }
          v25 = p_framebuffer->__ptr_;
          *((_QWORD *)v25 + 2) = p_frameBufferColorTexture->__ptr_;
          cntrl = p_framebuffer->__cntrl_;
          *v3 = v25;
          v3[1] = (jet_framebuffer *)cntrl;
          if (cntrl)
          {
            v27 = (unint64_t *)((char *)cntrl + 8);
            do
              v28 = __ldxr(v27);
            while (__stxr(v28 + 1, v27));
          }
        }
        else
        {
          kdebug_trace();
          *((_QWORD *)p_framebuffer->__ptr_ + 2) = 0;
          std::shared_ptr<jet_buffer_pool>::reset[abi:ne180100](&v4->_frameBufferColorTexture.__ptr_);
          *v3 = 0;
          v3[1] = 0;
        }

      }
      v34 = (std::__shared_weak_count *)*((_QWORD *)&v38 + 1);
      if (*((_QWORD *)&v38 + 1))
      {
        v35 = (unint64_t *)(*((_QWORD *)&v38 + 1) + 8);
        do
          v36 = __ldaxr(v35);
        while (__stlxr(v36 - 1, v35));
        if (!v36)
        {
          ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
          std::__shared_weak_count::__release_weak(v34);
        }
      }
    }
    else
    {
      v29 = p_framebuffer->__ptr_;
      *((_QWORD *)v29 + 2) = v4->_frameBufferColorTexture.__ptr_;
      v30 = p_framebuffer->__cntrl_;
      *v3 = v29;
      v3[1] = (jet_framebuffer *)v30;
      if (v30)
      {
        v31 = (unint64_t *)((char *)v30 + 8);
        do
          v32 = __ldxr(v31);
        while (__stxr(v32 + 1, v31));
      }
    }
  }
  else
  {
    *v2 = 0;
    v2[1] = 0;
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (jet_framebuffer *)self;
  return result;
}

- (void)getRootNode
{
  SKScene *v3;
  SKScene *v4;
  SKScene *nextScene;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;

  -[SKView scene](self, "scene");
  v3 = (SKScene *)objc_claimAutoreleasedReturnValue();
  v4 = self->_scene;
  nextScene = v3;
  if (self->_nextScene)
  {
    v6 = -[SKNode _backingNode](self->_nextScene, "_backingNode");
    v6[74] = -[SKNode _backingNode](v3, "_backingNode");
    v7 = -[SKNode _backingNode](self->_nextScene, "_backingNode");
    v7[75] = -[SKNode _backingNode](v4, "_backingNode");
    SKCNode::recomputeFlags((SKCNode *)-[SKNode _backingNode](self->_nextScene, "_backingNode"), 1);
    nextScene = self->_nextScene;
  }
  v8 = -[SKNode _backingNode](nextScene, "_backingNode");

  return v8;
}

- (double)getViewport
{
  objc_msgSend(a1, "frame");
  objc_msgSend(a1, "_getViewContentsScale");
  return 0.0;
}

- (double)getViewTransform
{
  unint64_t v2;
  float64_t v3;
  float64x2_t v4;
  float32x2_t v5;
  __int128 v11;
  float32x4_t v12;
  float32x4_t v13;
  int8x16_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  unint64_t v20;
  __int128 v23;
  float32x4_t v24;
  float32x4_t v25;
  __int128 v26;
  _OWORD v27[4];

  objc_msgSend((id)a1, "frame");
  v2 = 0;
  v4.f64[1] = v3;
  v5 = vdiv_f32(*(float32x2_t *)(a1 + 976), vcvt_f32_f64(v4));
  __asm { FMOV            V1.2S, #1.0 }
  *(float32x2_t *)&v11 = vsub_f32(_D1, vadd_f32(v5, v5));
  v12 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32);
  v13 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
  v14 = (int8x16_t)v13;
  v14.i32[2] = 0;
  v15 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
  v16 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
  *((_QWORD *)&v11 + 1) = vextq_s8(v14, v14, 8uLL).u64[0];
  v17 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
  v17.i32[0] = *(_OWORD *)(a1 + 960);
  v18 = v16;
  v18.i32[1] = HIDWORD(*(_QWORD *)(a1 + 960));
  v19 = v12;
  v19.i32[2] = 1.0;
  v23 = *MEMORY[0x1E0C83FF0];
  v24 = v16;
  v25 = v12;
  v26 = v11;
  do
  {
    v27[v2 / 0x10] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, COERCE_FLOAT(*(__int128 *)((char *)&v23 + v2))), v18, *(float32x2_t *)((char *)&v23 + v2), 1), v19, *(float32x4_t *)((char *)&v23 + v2), 2), v13, *(float32x4_t *)((char *)&v23 + v2), 3);
    v2 += 16;
  }
  while (v2 != 64);
  v20 = 0;
  __asm { FMOV            V4.4S, #-1.0 }
  _Q4.i32[2] = 0;
  _Q4.i32[3] = v13.i32[3];
  v23 = v27[0];
  v24 = (float32x4_t)v27[1];
  v25 = (float32x4_t)v27[2];
  v26 = v27[3];
  do
  {
    v27[v20 / 0x10] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v15, COERCE_FLOAT(*(__int128 *)((char *)&v23 + v20))), v16, *(float32x2_t *)((char *)&v23 + v20), 1), v12, *(float32x4_t *)((char *)&v23 + v20), 2), _Q4, *(float32x4_t *)((char *)&v23 + v20), 3);
    v20 += 16;
  }
  while (v20 != 64);
  return *(double *)v27;
}

- (id)getRenderOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)-[NSMapTable mutableCopy](self->_touchMap, "mutableCopy");
  sk_get_debug_options();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("_client"));

  if (sk_debug_option_get_BOOL(CFSTR("debugDrawStats_PreferredFPS")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SKView _getEffectivePreferredFramesPerSecond](self, "_getEffectivePreferredFramesPerSecond"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("_preferredFramesPerSecond"));

  }
  return v3;
}

- (BOOL)hasValidViewFramebuffer
{
  if (self->_viewFramebufferIsValid)
    return 1;
  -[SKView remakeFramebuffer](self, "remakeFramebuffer");
  return self->_viewFramebufferIsValid;
}

- (void)notifyWillRenderContent
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  SKScene *scene;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  if (!self->_didRunOnce)
  {
    self->_didRunOnce = 1;
    -[SKView runOnce](self, "runOnce");
  }
  -[SKView willRenderContent](self, "willRenderContent");
  v3 = *(void **)&self->_paused;
  if (!v3)
    goto LABEL_7;
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)&self->_paused;
  if (!v4)
    goto LABEL_7;
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  v3 = *(void **)&self->_paused;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v3, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "willRenderContentForScene:", *(_QWORD *)&self->_paused);

  }
  else
  {
LABEL_7:
    objc_msgSend(v3, "willRenderContent");
  }
  scene = self->_scene;
  if (!scene)
    goto LABEL_12;
  -[SKScene delegate](scene, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  scene = self->_scene;
  if (!v9)
    goto LABEL_12;
  -[SKScene delegate](scene, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  scene = self->_scene;
  if ((v11 & 1) != 0)
  {
    -[SKScene delegate](scene, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "willRenderContentForScene:", self->_scene);

  }
  else
  {
LABEL_12:
    -[SKScene willRenderContent](scene, "willRenderContent");
  }
  -[SKView _renderContent](self, "_renderContent");
}

- (NSMutableDictionary)options
{
  return (NSMutableDictionary *)self->_touchMap;
}

- (double)_viewScale
{
  return *(float *)self->_viewScale;
}

- (void)set_viewScale:(double)a3
{
  __int128 v4;
  void *v5;
  id v6;

  *(float *)&a3 = a3;
  *(_QWORD *)&v4 = vdupq_lane_s32(*(int32x2_t *)&a3, 0).u64[0];
  *((_QWORD *)&v4 + 1) = *(_QWORD *)&self->_viewScale[8];
  *(_OWORD *)self->_viewScale = v4;
  -[SKView scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SKView scene](self, "scene");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setDirty");

  }
}

- (CGPoint)_viewTranslation
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vcvtq_f64_f32(*(float32x2_t *)self->_viewTranslation);
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (void)set_viewTranslation:(CGPoint)a3
{
  CGFloat y;
  __int128 v5;
  void *v6;
  id v7;

  y = a3.y;
  *(float32x2_t *)&v5 = vcvt_f32_f64((float64x2_t)a3);
  *((_QWORD *)&v5 + 1) = vextq_s8(*(int8x16_t *)self->_viewTranslation, *(int8x16_t *)self->_viewTranslation, 8uLL).u64[0];
  *(_OWORD *)self->_viewTranslation = v5;
  -[SKView scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SKView scene](self, "scene");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setDirty");

  }
}

- (id)snapshot
{
  id v3;
  void *v4;
  void *v5;
  CGImage *v6;
  void *v7;

  -[SKView scene](self, "scene");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SKView scene](self, "scene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKView frame](self, "frame");
    -[SKView textureFromNode:crop:](self, "textureFromNode:crop:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (CGImage *)objc_msgSend(v5, "CGImage");
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
      CGImageRelease(v6);
    }
    else
    {
      v7 = 0;
    }
    v3 = v7;

  }
  return v3;
}

- (float)_getViewContentsScale
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;

  -[SKView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "nativeScale");
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nativeScale");
    v5 = v7;

  }
  return v5;
}

- (BOOL)isPaused
{
  return (BOOL)self->_spriteArrayHint;
}

- (void)setPaused:(BOOL)paused
{
  void *v4;
  SKScene *scene;

  if (LOBYTE(self->_spriteArrayHint) != paused)
  {
    LOBYTE(self->_spriteArrayHint) = paused;
    if (LOBYTE(self->_frameInterval))
    {
      BYTE2(self->_frameInterval) = paused;
      *(_DWORD *)&paused = LOBYTE(self->_spriteArrayHint);
    }
    if (paused)
      -[SKView stopRenderCallbacks](self, "stopRenderCallbacks");
    else
      -[SKView startRenderCallbacks](self, "startRenderCallbacks");
    v4 = *(void **)&self->_paused;
    if (v4)
      objc_msgSend(v4, "setPaused:", LOBYTE(self->_spriteArrayHint));
    scene = self->_scene;
    if (scene)
      -[SKScene setPaused:](scene, "setPaused:", LOBYTE(self->_spriteArrayHint));
  }
}

- (double)_fps
{
  int frameCount;
  double result;
  float v4;

  frameCount = self->_currentStats.frameCount;
  result = 1.0;
  if (frameCount >= 2)
  {
    v4 = self->_currentStats.frameBeginTime - self->_currentStats.baseTime;
    if (v4 > 0.0)
      return (float)((float)(frameCount - 1) / v4);
  }
  return result;
}

- (int)_spriteRenderCount
{
  return self->_frameStats.render.nodeRenderCount;
}

- (int)_spriteSubmitCount
{
  return self->_frameStats.render.nodeTraversalCount;
}

- (id)_getPerformanceStats
{
  id v3;
  SKCStats *p_frameStats;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  p_frameStats = &self->_frameStats;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_frameStats.render.sknodeTraversalCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("nodeCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", p_frameStats->render.drawCallCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("drawCallCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", p_frameStats->render.quadCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("quadCount"));

  return v3;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[9];
  _QWORD v18[2];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18[1] = *MEMORY[0x1E0C80C00];
  -[SKView scene](self, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __27__SKView_focusItemsInRect___block_invoke;
  v17[3] = &unk_1EA4FE4A0;
  v17[4] = self;
  *(double *)&v17[5] = x;
  *(double *)&v17[6] = y;
  *(double *)&v17[7] = width;
  *(double *)&v17[8] = height;
  objc_msgSend(v8, "_descendantsWithPredicate:", v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("zPosition"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingDescriptors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)SKView;
  -[SKView focusItemsInRect:](&v16, sel_focusItemsInRect_, x, y, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

BOOL __27__SKView_focusItemsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  _BOOL8 v12;
  CGRect v14;

  v3 = a2;
  objc_msgSend(v3, "_convertFrameToView:", *(_QWORD *)(a1 + 32));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (objc_msgSend(v3, "_isEligibleForFocus"))
  {
    v14.origin.x = v5;
    v14.origin.y = v7;
    v14.size.width = v9;
    v14.size.height = v11;
    v12 = CGRectIntersectsRect(*(CGRect *)(a1 + 40), v14);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (int64_t)_preferredFocusMovementStyle
{
  return 2;
}

+ (id)debugHierarchyAdditionalGroupingIDs
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.SpriteKit.SKScene");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.SpriteKit.SKScene")))
  {
    objc_msgSend(v7, "scene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "scene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)debugHierarchyPropertyDescriptions
{
  const CFDictionaryKeyCallBacks *v2;
  const CFDictionaryValueCallBacks *v3;
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  __CFDictionary *v8;
  __CFDictionary *v9;
  void *v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9AEB8];
  v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("allowsTransparency"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("b"));
  v12[0] = Mutable;
  v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("asynchronous"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("b"));
  v12[1] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("delegate"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v12[2] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("ignoresSiblingOrder"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("b"));
  v12[3] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("paused"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v8, CFSTR("propertyFormat"), CFSTR("b"));
  v12[4] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("preferredFramesPerSecond"));
  CFDictionaryAddValue(v9, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("b"));
  v12[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  NSString *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  id v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (NSString *)v8;
  if (-[NSString length](v10, "length"))
  {
    NSSelectorFromString(v10);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = v10;
      if (v11)
      {
LABEL_4:
        objc_msgSend(v9, "valueForKey:", v11);
        a6 = (id *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
    }
    else
    {
      if (-[NSString length](v10, "length") < 2)
      {
        -[NSString uppercaseString](v10, "uppercaseString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[NSString substringToIndex:](v10, "substringToIndex:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uppercaseString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString substringFromIndex:](v10, "substringFromIndex:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingString:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(CFSTR("is"), "stringByAppendingString:", v15);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      NSSelectorFromString(v16);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = v16;
      else
        v11 = 0;

      if (v11)
        goto LABEL_4;
    }
  }
  if (a6)
  {
    v17 = v9;
    v18 = v10;
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v17);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = &stru_1EA5021F8;
    }
    if (v18)
      v20 = v18;
    else
      v20 = &stru_1EA5021F8;
    v21 = v20;
    v26[0] = CFSTR("propertyName");
    v26[1] = CFSTR("objectDescription");
    v27[0] = v21;
    v27[1] = v19;
    v26[2] = CFSTR("errorDescription");
    v27[2] = &stru_1EA5021F8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_retainAutorelease(v23);
    *a6 = v24;

    v11 = 0;
    a6 = 0;
  }
  else
  {
    v11 = 0;
  }
LABEL_21:

  return a6;
}

- (NSObject)delegate
{
  return objc_loadWeakRetained(&self->__layerBackedRenderer);
}

- (void)setDelegate:(NSObject *)delegate
{
  objc_storeWeak(&self->__layerBackedRenderer, delegate);
}

- (CGSize)pixelSize
{
  double height;
  Class isa;
  CGSize result;

  height = self->_pixelSize.height;
  isa = self[1].super.super.super.isa;
  result.height = *(double *)&isa;
  result.width = height;
  return result;
}

- (void)_layerBackedRenderer
{
  return self->__info;
}

- (void)set_layerBackedRenderer:(void *)a3
{
  self->__info = (NSMutableDictionary *)a3;
}

- (NSMutableDictionary)_info
{
  return *(NSMutableDictionary **)&self->_physicsDebugStrokeWidth;
}

- (void)set_info:(id)a3
{
  objc_storeStrong((id *)&self->_physicsDebugStrokeWidth, a3);
}

- (double)physicsDebugStrokeWidth
{
  return self->_pixelSize.width;
}

- (void)setPhysicsDebugStrokeWidth:(double)a3
{
  self->_pixelSize.width = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicsDebugStrokeWidth, 0);
  objc_destroyWeak(&self->__layerBackedRenderer);
  objc_storeStrong((id *)&self->_queuedFrameCount, 0);
  objc_storeStrong((id *)&self->_renderSemaphore, 0);
  objc_storeStrong((id *)&self->_checkForDrawables, 0);
  objc_storeStrong((id *)&self->_prevBackingScaleFactor, 0);
  objc_storeStrong((id *)&self->_touchMap, 0);
  objc_storeStrong((id *)&self->_viewRenderOptions, 0);
  objc_storeStrong((id *)&self->_paused, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_nextScene, 0);
  objc_storeStrong((id *)&self->_timePreviousUpdate, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_eaglLayer, 0);
  objc_storeStrong((id *)&self->_metalLayer, 0);
  std::shared_ptr<jet_buffer_pool>::~shared_ptr[abi:ne180100]((uint64_t)&self->_renderFence);
  std::shared_ptr<jet_buffer_pool>::~shared_ptr[abi:ne180100]((uint64_t)&self->_frameBufferDepthStencilTexture);
  std::shared_ptr<jet_buffer_pool>::~shared_ptr[abi:ne180100]((uint64_t)&self->_frameBufferColorTexture);
  std::shared_ptr<jet_buffer_pool>::~shared_ptr[abi:ne180100]((uint64_t)&self->_framebuffer);
  SKCStats::~SKCStats(&self->_frameStats);
  SKCStats::~SKCStats(&self->_nextStats);
  SKCStats::~SKCStats(&self->_currentStats);
}

- (id).cxx_construct
{
  SKCStats::SKCStats(&self->_currentStats);
  SKCStats::SKCStats(&self->_nextStats);
  SKCStats::SKCStats(&self->_frameStats);
  self->_framebuffer.__ptr_ = 0;
  self->_framebuffer.__cntrl_ = 0;
  self->_frameBufferColorTexture.__ptr_ = 0;
  self->_frameBufferColorTexture.__cntrl_ = 0;
  self->_frameBufferDepthStencilTexture.__ptr_ = 0;
  self->_frameBufferDepthStencilTexture.__cntrl_ = 0;
  self->_renderFence.__ptr_ = 0;
  self->_renderFence.__cntrl_ = 0;
  return self;
}

@end
