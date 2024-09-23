@implementation DYRendererInfo

+ (id)rendererInfoWithGLIContext:(__GLIContextRec *)a3 dispatch:(__GLIFunctionDispatchRec *)a4 api:(int)a5
{
  id result;
  id v9;
  uint64_t v10;
  unsigned int v11;
  id v12;
  __CFString *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t (*v24)(uint64_t, uint64_t, void *, uint64_t);
  int v25;
  double v26;
  double v27;
  _QWORD v28[2];
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v30;
  void *v31;
  __GLIFunctionDispatchRec *v32;
  __GLIContextRec *v33;
  _QWORD v34[2];
  uint64_t (*v35)(uint64_t, uint64_t, void *, uint64_t, uint64_t);
  void *v36;
  __GLIFunctionDispatchRec *v37;
  __GLIContextRec *v38;
  _QWORD v39[6];
  _QWORD v40[2];
  uint64_t (*v41)(uint64_t, uint64_t, void *, uint64_t);
  void *v42;
  __GLIFunctionDispatchRec *v43;
  __GLIContextRec *v44;
  _QWORD v45[2];
  id (*v46)(uint64_t);
  void *v47;
  __GLIFunctionDispatchRec *v48;
  __GLIContextRec *v49;
  unsigned int v50[4];

  result = (id)objc_opt_new();
  if (!result)
    return result;
  v9 = result;
  v10 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v46 = __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke;
  v47 = &__block_descriptor_48_e18___NSString_12__0I8l;
  v48 = a4;
  v49 = a3;
  objc_msgSend(result, "setVersion:", __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke((uint64_t)v45));
  objc_msgSend(v9, "setGlslVersion:", __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke((uint64_t)v45));
  objc_msgSend(v9, "setVendor:", __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke((uint64_t)v45));
  objc_msgSend(v9, "setRenderer:", __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke((uint64_t)v45));
  v11 = a5 - 3;
  if (a5 >= 3)
  {
    if (v11 < 2)
    {
      v50[0] = 0;
      ((void (*)(__GLIContextRec *, uint64_t, unsigned int *))a4->get_integerv)(a3, 33309, v50);
      v17 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", v50[0]);
      if (v50[0])
      {
        v18 = 0;
        do
        {
          v19 = ((uint64_t (*)(__GLIContextRec *, uint64_t, uint64_t))a4->get_stringi)(a3, 7939, v18);
          if (v19)
          {
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", v19, 1);
            objc_msgSend(v17, "addObject:", v20);

          }
          v18 = (v18 + 1);
        }
        while (v18 < v50[0]);
      }
      v16 = v9;
      v15 = (uint64_t)v17;
      goto LABEL_12;
    }
  }
  else
  {
    v12 = (id)((uint64_t (*)(_QWORD *, uint64_t))v46)(v45, 7939);
    if (v12)
    {
      v13 = (__CFString *)objc_msgSend(v12, "mutableCopy");
      CFStringTrimWhitespace(v13);
      v14 = (id)-[__CFString componentsSeparatedByString:](v13, "componentsSeparatedByString:", CFSTR(" "));

      v15 = objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v14);
      v16 = v9;
LABEL_12:
      objc_msgSend(v16, "setExtensions:", v15);
    }
  }
  v21 = (void *)objc_opt_new();
  v22 = (void *)objc_opt_new();
  v23 = (void *)objc_opt_new();
  v39[5] = a3;
  v40[0] = v10;
  v40[1] = 3221225472;
  v24 = __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_2;
  v41 = __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_2;
  v42 = &__block_descriptor_48_e45_v28__0I8__NSMutableDictionary_12__NSString_20l;
  v43 = a4;
  v44 = a3;
  v38 = a3;
  v39[0] = v10;
  v39[1] = 3221225472;
  v39[2] = __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_5;
  v39[3] = &__block_descriptor_48_e48_v36__0I8__NSMutableDictionary_12__NSString_20Q28l;
  v39[4] = a4;
  v33 = a3;
  v34[0] = v10;
  v34[1] = 3221225472;
  v35 = __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_6;
  v36 = &__block_descriptor_48_e48_v36__0I8__NSMutableDictionary_12__NSString_20Q28l;
  v37 = a4;
  v28[0] = v10;
  v28[1] = 3221225472;
  v29 = __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_7;
  v30 = &unk_250D4F2F0;
  v31 = v23;
  v32 = a4;
  switch(a5)
  {
    case 1:
      v50[0] = 0;
      ((void (*)(__GLIContextRec *, uint64_t, unsigned int *))a4->get_integerv)(a3, 3377, v50);
      objc_msgSend(v21, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v50[0]), CFSTR("GL_MAX_LIGHTS"));
      v41((uint64_t)v40, 3378, v21, (uint64_t)CFSTR("GL_MAX_CLIP_PLANES"));
      v41((uint64_t)v40, 3382, v21, (uint64_t)CFSTR("GL_MAX_MODELVIEW_STACK_DEPTH"));
      v41((uint64_t)v40, 3384, v21, (uint64_t)CFSTR("GL_MAX_PROJECTION_STACK_DEPTH"));
      v41((uint64_t)v40, 3385, v21, (uint64_t)CFSTR("GL_MAX_TEXTURE_STACK_DEPTH"));
      v41((uint64_t)v40, 34018, v21, (uint64_t)CFSTR("GL_MAX_TEXTURE_UNITS"));
      v41((uint64_t)v40, 34468, v21, (uint64_t)CFSTR("GL_MAX_VERTEX_UNITS_OES"));
      v41((uint64_t)v40, 34882, v21, (uint64_t)CFSTR("GL_MAX_PALETTE_MATRICES_OES"));
      v35((uint64_t)v34, 2834, v21, (uint64_t)CFSTR("GL_SMOOTH_POINT_SIZE_RANGE"), 2);
      v35((uint64_t)v34, 2850, v21, (uint64_t)CFSTR("GL_SMOOTH_LINE_WIDTH_RANGE"), 2);
      break;
    case 2:
      goto LABEL_17;
    case 3:
      v50[0] = 0;
      ((void (*)(__GLIContextRec *, uint64_t, unsigned int *))a4->get_integerv)(a3, 34921, v50);
      objc_msgSend(v21, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v50[0]), CFSTR("GL_MAX_VERTEX_ATTRIBS"));
      v41((uint64_t)v40, 35658, v21, (uint64_t)CFSTR("GL_MAX_VERTEX_UNIFORM_COMPONENTS"));
      v41((uint64_t)v40, 35371, v21, (uint64_t)CFSTR("GL_MAX_VERTEX_UNIFORM_BLOCKS"));
      v41((uint64_t)v40, 37154, v21, (uint64_t)CFSTR("GL_MAX_VERTEX_OUTPUT_COMPONENTS"));
      v41((uint64_t)v40, 35660, v21, (uint64_t)CFSTR("GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS"));
      v41((uint64_t)v40, 35377, v21, (uint64_t)CFSTR("GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS"));
      v41((uint64_t)v40, 35372, v21, (uint64_t)CFSTR("GL_MAX_GEOMETRY_UNIFORM_BLOCKS"));
      v41((uint64_t)v40, 36319, v21, (uint64_t)CFSTR("GL_MAX_GEOMETRY_UNIFORM_COMPONENTS"));
      v41((uint64_t)v40, 37155, v21, (uint64_t)CFSTR("GL_MAX_GEOMETRY_INPUT_COMPONENTS"));
      v41((uint64_t)v40, 36320, v21, (uint64_t)CFSTR("GL_MAX_GEOMETRY_OUTPUT_VERTICES"));
      v41((uint64_t)v40, 36321, v21, (uint64_t)CFSTR("GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS"));
      v41((uint64_t)v40, 37156, v21, (uint64_t)CFSTR("GL_MAX_GEOMETRY_OUTPUT_COMPONENTS"));
      v41((uint64_t)v40, 35881, v21, (uint64_t)CFSTR("GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS"));
      v41((uint64_t)v40, 35378, v21, (uint64_t)CFSTR("GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS"));
      v41((uint64_t)v40, 35373, v21, (uint64_t)CFSTR("GL_MAX_FRAGMENT_UNIFORM_BLOCKS"));
      v41((uint64_t)v40, 35657, v21, (uint64_t)CFSTR("GL_MAX_FRAGMENT_UNIFORM_COMPONENTS"));
      v41((uint64_t)v40, 37157, v21, (uint64_t)CFSTR("GL_MAX_FRAGMENT_INPUT_COMPONENTS"));
      v41((uint64_t)v40, 35379, v21, (uint64_t)CFSTR("GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS"));
      v41((uint64_t)v40, 34852, v21, (uint64_t)CFSTR("GL_MAX_DRAW_BUFFERS"));
      v41((uint64_t)v40, 36063, v21, (uint64_t)CFSTR("GL_MAX_COLOR_ATTACHMENTS"));
      v41((uint64_t)v40, 35375, v21, (uint64_t)CFSTR("GL_MAX_UNIFORM_BUFFER_BINDINGS"));
      v41((uint64_t)v40, 35376, v21, (uint64_t)CFSTR("GL_MAX_UNIFORM_BLOCK_SIZE"));
      v41((uint64_t)v40, 35374, v21, (uint64_t)CFSTR("GL_MAX_COMBINED_UNIFORM_BLOCKS"));
      v41((uint64_t)v40, 33000, v21, (uint64_t)CFSTR("GL_MAX_ELEMENTS_VERTICES"));
      v41((uint64_t)v40, 33001, v21, (uint64_t)CFSTR("GL_MAX_ELEMENTS_INDICES"));
      v41((uint64_t)v40, 35979, v21, (uint64_t)CFSTR("GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS"));
      v41((uint64_t)v40, 35968, v21, (uint64_t)CFSTR("GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS"));
      v41((uint64_t)v40, 35978, v21, (uint64_t)CFSTR("GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS"));
      v41((uint64_t)v40, 34930, v21, (uint64_t)CFSTR("GL_MAX_TEXTURE_IMAGE_UNITS"));
      v41((uint64_t)v40, 35883, v21, (uint64_t)CFSTR("GL_MAX_TEXTURE_BUFFER_SIZE"));
      v41((uint64_t)v40, 35661, v21, (uint64_t)CFSTR("GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS"));
      v41((uint64_t)v40, 34076, v21, (uint64_t)CFSTR("GL_MAX_CUBE_MAP_TEXTURE_SIZE"));
      v41((uint64_t)v40, 34040, v21, (uint64_t)CFSTR("GL_MAX_RECTANGLE_TEXTURE_SIZE"));
      v41((uint64_t)v40, 32883, v21, (uint64_t)CFSTR("GL_MAX_3D_TEXTURE_SIZE"));
      v41((uint64_t)v40, 35071, v21, (uint64_t)CFSTR("GL_MAX_ARRAY_TEXTURE_LAYERS"));
      v41((uint64_t)v40, 37135, v21, (uint64_t)CFSTR("GL_MAX_DEPTH_TEXTURE_SAMPLES"));
      v41((uint64_t)v40, 37134, v21, (uint64_t)CFSTR("GL_MAX_COLOR_TEXTURE_SAMPLES"));
      v41((uint64_t)v40, 37136, v21, (uint64_t)CFSTR("GL_MAX_INTEGER_SAMPLES"));
      v41((uint64_t)v40, 36183, v21, (uint64_t)CFSTR("GL_MAX_SAMPLES"));
      v41((uint64_t)v40, 36441, v21, (uint64_t)CFSTR("GL_MAX_SAMPLE_MASK_WORDS"));
      v41((uint64_t)v40, 3378, v21, (uint64_t)CFSTR("GL_MAX_CLIP_DISTANCES"));
      v35((uint64_t)v34, 2834, v21, (uint64_t)CFSTR("GL_POINT_SIZE_RANGE"), 2);
      objc_msgSend(v21, "setObject:forKey:", objc_msgSend(v21, "objectForKey:", CFSTR("GL_MAX_CLIP_DISTANCES")), CFSTR("GL_MAX_CLIP_PLANES"));
      break;
    case 4:
      v50[0] = 0;
      ((void (*)(__GLIContextRec *, uint64_t, unsigned int *))a4->get_integerv)(a3, 35375, v50);
      objc_msgSend(v21, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v50[0]), CFSTR("GL_MAX_UNIFORM_BUFFER_BINDINGS"));
      v41((uint64_t)v40, 35376, v21, (uint64_t)CFSTR("GL_MAX_UNIFORM_BLOCK_SIZE"));
      v41((uint64_t)v40, 35371, v21, (uint64_t)CFSTR("GL_MAX_VERTEX_UNIFORM_BLOCKS"));
      v41((uint64_t)v40, 35373, v21, (uint64_t)CFSTR("GL_MAX_FRAGMENT_UNIFORM_BLOCKS"));
      v41((uint64_t)v40, 37154, v21, (uint64_t)CFSTR("GL_MAX_VERTEX_OUTPUT_COMPONENTS"));
      v41((uint64_t)v40, 35657, v21, (uint64_t)CFSTR("GL_MAX_FRAGMENT_UNIFORM_COMPONENTS"));
      v41((uint64_t)v40, 35379, v21, (uint64_t)CFSTR("GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS"));
      v41((uint64_t)v40, 35979, v21, (uint64_t)CFSTR("GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS"));
      v41((uint64_t)v40, 35978, v21, (uint64_t)CFSTR("GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS"));
      v41((uint64_t)v40, 32883, v21, (uint64_t)CFSTR("GL_MAX_3D_TEXTURE_SIZE"));
      v41((uint64_t)v40, 35071, v21, (uint64_t)CFSTR("GL_MAX_ARRAY_TEXTURE_LAYERS"));
      v41((uint64_t)v40, 36063, v21, (uint64_t)CFSTR("GL_MAX_COLOR_ATTACHMENTS"));
      v41((uint64_t)v40, 35374, v21, (uint64_t)CFSTR("GL_MAX_COMBINED_UNIFORM_BLOCKS"));
      v41((uint64_t)v40, 34852, v21, (uint64_t)CFSTR("GL_MAX_DRAW_BUFFERS"));
      v41((uint64_t)v40, 35968, v21, (uint64_t)CFSTR("GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS"));
      v41((uint64_t)v40, 35658, v21, (uint64_t)CFSTR("GL_MAX_VERTEX_UNIFORM_COMPONENTS"));
      v41((uint64_t)v40, 37157, v21, (uint64_t)CFSTR("GL_MAX_FRAGMENT_INPUT_COMPONENTS"));
      v41((uint64_t)v40, 33000, v21, (uint64_t)CFSTR("GL_MAX_ELEMENTS_VERTICES"));
      v41((uint64_t)v40, 33001, v21, (uint64_t)CFSTR("GL_MAX_ELEMENTS_INDICES"));
      v41((uint64_t)v40, 35659, v21, (uint64_t)CFSTR("GL_MAX_VARYING_COMPONENTS"));
      v41((uint64_t)v40, 35076, v21, (uint64_t)CFSTR("GL_MIN_PROGRAM_TEXEL_OFFSET"));
      v41((uint64_t)v40, 35077, v21, (uint64_t)CFSTR("GL_MAX_PROGRAM_TEXEL_OFFSET"));
      v24 = v41;
LABEL_17:
      v24((uint64_t)v40, 34921, v21, (uint64_t)CFSTR("GL_MAX_VERTEX_ATTRIBS"));
      v41((uint64_t)v40, 36347, v21, (uint64_t)CFSTR("GL_MAX_VERTEX_UNIFORM_VECTORS"));
      v41((uint64_t)v40, 36348, v21, (uint64_t)CFSTR("GL_MAX_VARYING_VECTORS"));
      v41((uint64_t)v40, 35661, v21, (uint64_t)CFSTR("GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS"));
      v41((uint64_t)v40, 35660, v21, (uint64_t)CFSTR("GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS"));
      v41((uint64_t)v40, 34930, v21, (uint64_t)CFSTR("GL_MAX_TEXTURE_IMAGE_UNITS"));
      v41((uint64_t)v40, 36349, v21, (uint64_t)CFSTR("GL_MAX_FRAGMENT_UNIFORM_VECTORS"));
      v41((uint64_t)v40, 34076, v21, (uint64_t)CFSTR("GL_MAX_CUBE_MAP_TEXTURE_SIZE"));
      v41((uint64_t)v40, 3408, v21, (uint64_t)CFSTR("GL_SUBPIXEL_BITS"));
      v41((uint64_t)v40, 32936, v21, (uint64_t)CFSTR("GL_SAMPLE_BUFFERS"));
      v41((uint64_t)v40, 32937, v21, (uint64_t)CFSTR("GL_SAMPLES"));
      v35((uint64_t)v34, 33901, v21, (uint64_t)CFSTR("GL_ALIASED_POINT_SIZE_RANGE"), 2);
      v41((uint64_t)v40, 3410, v22, (uint64_t)CFSTR("GL_RED_BITS"));
      v41((uint64_t)v40, 3411, v22, (uint64_t)CFSTR("GL_GREEN_BITS"));
      v41((uint64_t)v40, 3412, v22, (uint64_t)CFSTR("GL_BLUE_BITS"));
      v41((uint64_t)v40, 3413, v22, (uint64_t)CFSTR("GL_ALPHA_BITS"));
      v41((uint64_t)v40, 3414, v22, (uint64_t)CFSTR("GL_DEPTH_BITS"));
      v41((uint64_t)v40, 3415, v22, (uint64_t)CFSTR("GL_STENCIL_BITS"));
      __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_7((uint64_t)v28, 35633, 36336, (uint64_t)CFSTR("GL_VERTEX_SHADERGL_LOW_FLOAT"));
      __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_7((uint64_t)v28, 35633, 36337, (uint64_t)CFSTR("GL_VERTEX_SHADERGL_MEDIUM_FLOAT"));
      __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_7((uint64_t)v28, 35633, 36338, (uint64_t)CFSTR("GL_VERTEX_SHADERGL_HIGH_FLOAT"));
      v29((uint64_t)v28, 35633, 36339, (uint64_t)CFSTR("GL_VERTEX_SHADERGL_LOW_INT"));
      v29((uint64_t)v28, 35633, 36340, (uint64_t)CFSTR("GL_VERTEX_SHADERGL_MEDIUM_INT"));
      v29((uint64_t)v28, 35633, 36341, (uint64_t)CFSTR("GL_VERTEX_SHADERGL_HIGH_INT"));
      v29((uint64_t)v28, 35632, 36336, (uint64_t)CFSTR("GL_FRAGMENT_SHADERGL_LOW_FLOAT"));
      v29((uint64_t)v28, 35632, 36337, (uint64_t)CFSTR("GL_FRAGMENT_SHADERGL_MEDIUM_FLOAT"));
      v29((uint64_t)v28, 35632, 36338, (uint64_t)CFSTR("GL_FRAGMENT_SHADERGL_HIGH_FLOAT"));
      v29((uint64_t)v28, 35632, 36339, (uint64_t)CFSTR("GL_FRAGMENT_SHADERGL_LOW_INT"));
      v29((uint64_t)v28, 35632, 36340, (uint64_t)CFSTR("GL_FRAGMENT_SHADERGL_MEDIUM_INT"));
      v29((uint64_t)v28, 35632, 36341, (uint64_t)CFSTR("GL_FRAGMENT_SHADERGL_HIGH_INT"));
      break;
    default:
      break;
  }
  v41((uint64_t)v40, 3379, v21, (uint64_t)CFSTR("GL_MAX_TEXTURE_SIZE"));
  v41((uint64_t)v40, 34024, v21, (uint64_t)CFSTR("GL_MAX_RENDERBUFFER_SIZE"));
  __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_5((uint64_t)v39, 3386, v21, (uint64_t)CFSTR("GL_MAX_VIEWPORT_DIMS"), 2);
  v35((uint64_t)v34, 33902, v21, (uint64_t)CFSTR("GL_ALIASED_LINE_WIDTH_RANGE"), 2);
  v25 = objc_msgSend((id)objc_msgSend(v9, "extensions"), "containsObject:", CFSTR("GL_EXT_texture_lod_bias"));
  if (v11 < 2 || v25)
  {
    v50[0] = 0;
    ((void (*)(__GLIContextRec *, uint64_t, unsigned int *))a4->get_floatv)(a3, 34045, v50);
    LODWORD(v26) = v50[0];
    objc_msgSend(v21, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v26), CFSTR("GL_MAX_TEXTURE_LOD_BIAS"));
  }
  if (objc_msgSend((id)objc_msgSend(v9, "extensions"), "containsObject:", CFSTR("GL_EXT_texture_filter_anisotropic")))
  {
    v50[0] = 0;
    ((void (*)(__GLIContextRec *, uint64_t, unsigned int *))a4->get_floatv)(a3, 34047, v50);
    LODWORD(v27) = v50[0];
    objc_msgSend(v21, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v27), CFSTR("GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT"));
  }
  if (objc_msgSend((id)objc_msgSend(v9, "extensions"), "containsObject:", CFSTR("GL_EXT_shader_framebuffer_fetch")))v41((uint64_t)v40, 35410, v21, (uint64_t)CFSTR("GL_FRAGMENT_SHADER_DISCARDS_SAMPLES_EXT"));
  if (objc_msgSend((id)objc_msgSend(v9, "extensions"), "containsObject:", CFSTR("GL_APPLE_clip_distance")))
  {
    v41((uint64_t)v40, 3378, v21, (uint64_t)CFSTR("GL_MAX_CLIP_DISTANCES"));
    objc_msgSend(v21, "setObject:forKey:", objc_msgSend(v21, "objectForKey:", CFSTR("GL_MAX_CLIP_DISTANCES")), CFSTR("GL_MAX_CLIP_PLANES"));
  }
  if (v11 < 2
    || (objc_msgSend((id)objc_msgSend(v9, "extensions"), "containsObject:", CFSTR("GL_ARB_sync")) & 1) != 0
    || objc_msgSend((id)objc_msgSend(v9, "extensions"), "containsObject:", CFSTR("GL_APPLE_sync")))
  {
    *(_QWORD *)v50 = 0;
    ((void (*)(__GLIContextRec *, uint64_t, unsigned int *))a4->get_integer64v_sync)(a3, 37137, v50);
    objc_msgSend(v21, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)v50), CFSTR("GL_MAX_SERVER_WAIT_TIMEOUT"));
  }
  v50[0] = 0;
  ((void (*)(__GLIContextRec *, uint64_t, unsigned int *))a4->get_integerv)(a3, 34466, v50);
  __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_5((uint64_t)v39, 34467, v21, (uint64_t)CFSTR("GL_COMPRESSED_TEXTURE_FORMATS"), v50[0]);
  objc_msgSend(v9, "setLimits:", (id)objc_msgSend(v21, "copy"));

  objc_msgSend(v9, "setBitCounts:", (id)objc_msgSend(v22, "copy"));
  objc_msgSend(v9, "setShaderPrecisionsFormats:", (id)objc_msgSend(v23, "copy"));

  while (((unsigned int (*)(__GLIContextRec *))a4->get_error)(a3))
    ;
  return v9;
}

id __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke(uint64_t a1)
{
  id result;

  result = (id)(*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 936))(*(_QWORD *)(a1 + 40));
  if (result)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", result, 1);
  return result;
}

uint64_t __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  unsigned int v7;

  v7 = 0;
  (*(void (**)(_QWORD, uint64_t, unsigned int *))(*(_QWORD *)(a1 + 32) + 832))(*(_QWORD *)(a1 + 40), a2, &v7);
  return objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7), a4);
}

uint64_t __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  unsigned int *v8;
  _QWORD *v9;
  uint64_t v10;
  unsigned int v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v8 = (unsigned int *)((char *)v13 - ((4 * a5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_QWORD, uint64_t, unsigned int *))(*(_QWORD *)(a1 + 32) + 832))(*(_QWORD *)(a1 + 40), a2, v8);
  if (a5)
  {
    v9 = (_QWORD *)((char *)v13 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0));
    v10 = a5;
    do
    {
      v11 = *v8++;
      *v9++ = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v11);
      --v10;
    }
    while (v10);
  }
  return objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", (char *)v13 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0), a5), a4);
}

uint64_t __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  int *v8;
  double v9;
  _QWORD *v10;
  uint64_t v11;
  int v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v8 = (int *)((char *)v14 - ((4 * a5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_QWORD, uint64_t, int *))(*(_QWORD *)(a1 + 32) + 824))(*(_QWORD *)(a1 + 40), a2, v8);
  if (a5)
  {
    v10 = (_QWORD *)((char *)v14 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0));
    v11 = a5;
    do
    {
      v12 = *v8++;
      LODWORD(v9) = v12;
      *v10++ = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
      --v11;
    }
    while (v11);
  }
  return objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", (char *)v14 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0), a5), a4);
}

uint64_t __58__DYRendererInfo_rendererInfoWithGLIContext_dispatch_api___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  unsigned int v9;
  _DWORD v10[3];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(_QWORD, uint64_t, uint64_t, unsigned int *, _DWORD *))(*(_QWORD *)(a1 + 40) + 7008))(*(_QWORD *)(a1 + 48), a2, a3, &v9, v10);
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, CFSTR("range"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10[0]), CFSTR("precision"), 0), a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYRendererInfo)initWithCoder:(id)a3
{
  DYRendererInfo *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)DYRendererInfo;
  v4 = -[DYRendererInfo init](&v18, sel_init);
  if (v4)
  {
    v4->vendor = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vendor"));
    v4->renderer = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("renderer"));
    v4->version = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v4->glslVersion = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("glslVersion"));
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v4->extensions = (NSSet *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("extensions"));
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v4->limits = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0), CFSTR("limits"));
    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v4->bitCounts = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0), CFSTR("bitCounts"));
    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v4->shaderPrecisionsFormats = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0), CFSTR("shaderPrecisionsFormats"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->vendor, CFSTR("vendor"));
  objc_msgSend(a3, "encodeObject:forKey:", self->renderer, CFSTR("renderer"));
  objc_msgSend(a3, "encodeObject:forKey:", self->version, CFSTR("version"));
  objc_msgSend(a3, "encodeObject:forKey:", self->glslVersion, CFSTR("glslVersion"));
  objc_msgSend(a3, "encodeObject:forKey:", self->extensions, CFSTR("extensions"));
  objc_msgSend(a3, "encodeObject:forKey:", self->limits, CFSTR("limits"));
  objc_msgSend(a3, "encodeObject:forKey:", self->bitCounts, CFSTR("bitCounts"));
  objc_msgSend(a3, "encodeObject:forKey:", self->shaderPrecisionsFormats, CFSTR("shaderPrecisionsFormats"));
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYRendererInfo;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ vendor=%@ renderer=%@ version=%@ glsl version=%@\nextensions=%@\nlimits=%@\nbitCounts=%@\nshaderPrecisionsFormats=%@"), -[DYRendererInfo description](&v3, sel_description), self->vendor, self->renderer, self->version, self->glslVersion, self->extensions, self->limits, self->bitCounts, self->shaderPrecisionsFormats);
}

- (id)descriptionForBugReport
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ | %@ | %@ | %@"), self->version, self->glslVersion, self->renderer, self->vendor);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYRendererInfo;
  -[DYRendererInfo dealloc](&v3, sel_dealloc);
}

+ (BOOL)_rangeIsSupported:(id)a3 supportedRange:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = objc_msgSend(a3, "count");
  if (v6 == objc_msgSend(a4, "count"))
  {
    if (!objc_msgSend(a3, "count"))
      return 1;
    v7 = 0;
    while (1)
    {
      v8 = objc_msgSend(a3, "objectAtIndex:", 0);
      v9 = objc_msgSend(a3, "objectAtIndex:", 1);
      v10 = (void *)objc_msgSend(a4, "objectAtIndex:", 0);
      v11 = (void *)objc_msgSend(a4, "objectAtIndex:", 1);
      if (objc_msgSend(v10, "compare:", v8) == 1 || objc_msgSend(v11, "compare:", v9) == -1)
        break;
      v7 += 2;
      if (v7 >= objc_msgSend(a3, "count"))
        return 1;
    }
  }
  return 0;
}

+ (BOOL)_dimensionsAreSupported:(id)a3 supportedDimensions:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  BOOL v9;

  v6 = objc_msgSend(a3, "count");
  if (v6 != objc_msgSend(a4, "count"))
    return 0;
  if (!objc_msgSend(a3, "count"))
    return 1;
  v7 = 0;
  do
  {
    v8 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v7), "compare:", objc_msgSend(a4, "objectAtIndex:", v7));
    v9 = v8 != 1;
    if (v8 == 1)
      break;
    ++v7;
  }
  while (v7 < objc_msgSend(a3, "count"));
  return v9;
}

- (BOOL)_supportsLimits:(id)a3
{
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__DYRendererInfo__supportsLimits___block_invoke;
  v5[3] = &unk_250D4F318;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__DYRendererInfo__supportsLimits___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t result;
  void *v9;
  void *v10;
  DYRendererInfo *v11;
  SEL v12;
  id v13;

  result = objc_msgSend(a2, "isEqualToString:", CFSTR("GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT"));
  if ((result & 1) == 0)
  {
    v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", a2);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      result = objc_msgSend(v9, "compare:", a3);
      if (result != -1)
        return result;
      goto LABEL_4;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = (void *)objc_msgSend((id)objc_opt_class(), "description");
      objc_msgSend(a2, "cStringUsingEncoding:", 1);
      objc_msgSend(v10, "cStringUsingEncoding:", 1);
      v11 = (DYRendererInfo *)dy_abort();
      return -[DYRendererInfo _supportsGLVersion:](v11, v12, v13);
    }
    if (objc_msgSend(a2, "hasSuffix:", CFSTR("RANGE")))
    {
      result = objc_msgSend((id)objc_opt_class(), "_rangeIsSupported:supportedRange:", a3, v9);
      if ((result & 1) != 0)
        return result;
LABEL_4:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
      return result;
    }
    if (objc_msgSend(a2, "hasSuffix:", CFSTR("DIMS")))
    {
      result = objc_msgSend((id)objc_opt_class(), "_dimensionsAreSupported:supportedDimensions:", a3, v9);
      if ((result & 1) == 0)
        goto LABEL_4;
    }
    else
    {
      result = objc_msgSend(a3, "isEqualToArray:", v9);
      if ((result & 1) == 0)
        goto LABEL_4;
    }
  }
  return result;
}

- (BOOL)_supportsGLVersion:(id)a3
{
  float v4;
  float v5;
  float v6;

  objc_msgSend(-[NSArray objectAtIndex:](-[NSString componentsSeparatedByString:](self->version, "componentsSeparatedByString:", CFSTR(" ")), "objectAtIndex:", 2), "floatValue");
  v5 = v4;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" ")), "objectAtIndex:", 2), "floatValue");
  return v6 <= v5 && SLODWORD(v6) == SLODWORD(v5);
}

- (BOOL)_supportsGLSLVersion:(id)a3
{
  float v4;
  float v5;
  float v6;

  objc_msgSend(-[NSArray objectAtIndex:](-[NSString componentsSeparatedByString:](self->glslVersion, "componentsSeparatedByString:", CFSTR(" ")), "objectAtIndex:", 4), "floatValue");
  v5 = v4;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" ")), "objectAtIndex:", 4), "floatValue");
  return v6 <= v5;
}

- (BOOL)supportsCapabilitiesOfRenderer:(id)a3
{
  if (!a3)
    __assert_rtn("-[DYRendererInfo supportsCapabilitiesOfRenderer:]", (const char *)&unk_23C65FE76, 0, "rendererInfo");
  return -[DYRendererInfo _supportsGLVersion:](self, "_supportsGLVersion:", objc_msgSend(a3, "version"))
      && (!self->glslVersion
       || -[DYRendererInfo _supportsGLSLVersion:](self, "_supportsGLSLVersion:", objc_msgSend(a3, "glslVersion")))
      && objc_msgSend((id)objc_msgSend(a3, "extensions"), "isSubsetOfSet:", self->extensions)
      && -[DYRendererInfo _supportsLimits:](self, "_supportsLimits:", objc_msgSend(a3, "limits"));
}

- (NSString)vendor
{
  return self->vendor;
}

- (void)setVendor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)renderer
{
  return self->renderer;
}

- (void)setRenderer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)version
{
  return self->version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)glslVersion
{
  return self->glslVersion;
}

- (void)setGlslVersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSSet)extensions
{
  return self->extensions;
}

- (void)setExtensions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSDictionary)limits
{
  return self->limits;
}

- (void)setLimits:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSDictionary)bitCounts
{
  return self->bitCounts;
}

- (void)setBitCounts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSDictionary)shaderPrecisionsFormats
{
  return self->shaderPrecisionsFormats;
}

- (void)setShaderPrecisionsFormats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
