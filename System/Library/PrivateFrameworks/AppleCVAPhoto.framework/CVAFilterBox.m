@implementation CVAFilterBox

- (CVAFilterBox)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 textureSize:(id *)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  CVAFilterBox *v16;
  CVAFilterBox *v17;
  objc_class *v18;
  uint64_t v19;
  NSString *label;
  void **p_device;
  void **p_library;
  __int128 v23;
  void **p_pipelineLibrary;
  uint64_t v25;
  MTLTexture *boxIntermediateTexture_rgba;
  uint64_t v27;
  MTLTexture *boxIntermediateTexture_r;
  CVAFilterBox *v29;
  void **p_box_float_pass_horiz_kernel;
  __CFString *v32;
  void *v33;
  void **p_box_float4_pass_horiz_kernel;
  __CFString *v35;
  void *v36;
  void **p_box_normValid_float_pass_vert_kernel;
  __CFString *v38;
  void *v39;
  void **p_box_norm_float_pass_vert_kernel;
  __CFString *v41;
  void *v42;
  void **p_box_float_pass_vert_kernel;
  __CFString *v44;
  void *v45;
  void **p_box_normValid_float4_pass_vert_kernel;
  __CFString *v47;
  void *v48;
  void **p_box_norm_float4_pass_vert_kernel;
  __CFString *v50;
  void *v51;
  void **p_box_float4_pass_vert_kernel;
  __CFString *v53;
  void *v54;
  objc_super v55;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v55.receiver = self;
  v55.super_class = (Class)CVAFilterBox;
  v16 = -[CVAFilterBox init](&v55, sel_init);
  v17 = v16;
  if (v16)
  {
    p_box_float_pass_horiz_kernel = (void **)&v16->_box_float_pass_horiz_kernel;
    v32 = CFSTR("box_float_pass_horiz");
    v33 = 0;
    p_box_float4_pass_horiz_kernel = (void **)&v16->_box_float4_pass_horiz_kernel;
    v35 = CFSTR("box_float4_pass_horiz");
    v36 = 0;
    p_box_normValid_float_pass_vert_kernel = (void **)&v16->_box_normValid_float_pass_vert_kernel;
    v38 = CFSTR("box_normValid_float_pass_vert");
    v39 = 0;
    p_box_norm_float_pass_vert_kernel = (void **)&v16->_box_norm_float_pass_vert_kernel;
    v41 = CFSTR("box_norm_float_pass_vert");
    v42 = 0;
    p_box_float_pass_vert_kernel = (void **)&v16->_box_float_pass_vert_kernel;
    v44 = CFSTR("box_float_pass_vert");
    v45 = 0;
    p_box_normValid_float4_pass_vert_kernel = (void **)&v16->_box_normValid_float4_pass_vert_kernel;
    v47 = CFSTR("box_normValid_float4_pass_vert");
    v48 = 0;
    p_box_norm_float4_pass_vert_kernel = (void **)&v16->_box_norm_float4_pass_vert_kernel;
    v50 = CFSTR("box_norm_float4_pass_vert");
    v51 = 0;
    p_box_float4_pass_vert_kernel = (void **)&v16->_box_float4_pass_vert_kernel;
    v53 = CFSTR("box_float4_pass_vert");
    v54 = 0;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = objc_claimAutoreleasedReturnValue();
    label = v17->_label;
    v17->_label = (NSString *)v19;

    p_device = (void **)&v17->_device;
    objc_storeStrong((id *)&v17->_device, a3);
    p_library = (void **)&v17->_library;
    objc_storeStrong((id *)&v17->_library, a4);
    v23 = *(_OWORD *)&a6->var0;
    v17->_textureSize.depth = a6->var2;
    *(_OWORD *)&v17->_textureSize.width = v23;
    p_pipelineLibrary = (void **)&v17->_pipelineLibrary;
    objc_storeStrong((id *)&v17->_pipelineLibrary, a5);
    sub_1B56A2A64(v17->_device, 115, a6->var0, a6->var1, 0, a7);
    v25 = objc_claimAutoreleasedReturnValue();
    boxIntermediateTexture_rgba = v17->_boxIntermediateTexture_rgba;
    v17->_boxIntermediateTexture_rgba = (MTLTexture *)v25;

    sub_1B56A2A64(v17->_device, 25, a6->var0, a6->var1, 0, a7);
    v27 = objc_claimAutoreleasedReturnValue();
    boxIntermediateTexture_r = v17->_boxIntermediateTexture_r;
    v17->_boxIntermediateTexture_r = (MTLTexture *)v27;

    if (!v17->_boxIntermediateTexture_rgba)
      goto LABEL_13;
    if (!v17->_boxIntermediateTexture_r)
      goto LABEL_13;
    sub_1B5674B88(p_box_float_pass_horiz_kernel, *p_library, *p_pipelineLibrary, *p_device, v32, a7, v33);
    if (!p_box_float_pass_horiz_kernel)
      goto LABEL_13;
    sub_1B5674B88(p_box_float4_pass_horiz_kernel, *p_library, *p_pipelineLibrary, *p_device, v35, a7, v36);
    if (p_box_float4_pass_horiz_kernel
      && (sub_1B5674B88(p_box_normValid_float_pass_vert_kernel, *p_library, *p_pipelineLibrary, *p_device, v38, a7, v39),
          p_box_normValid_float_pass_vert_kernel)
      && (sub_1B5674B88(p_box_norm_float_pass_vert_kernel, *p_library, *p_pipelineLibrary, *p_device, v41, a7, v42),
          p_box_norm_float_pass_vert_kernel)
      && (sub_1B5674B88(p_box_float_pass_vert_kernel, *p_library, *p_pipelineLibrary, *p_device, v44, a7, v45),
          p_box_float_pass_vert_kernel)
      && (sub_1B5674B88(p_box_normValid_float4_pass_vert_kernel, *p_library, *p_pipelineLibrary, *p_device, v47, a7, v48), p_box_normValid_float4_pass_vert_kernel)&& (sub_1B5674B88(p_box_norm_float4_pass_vert_kernel, *p_library, *p_pipelineLibrary, *p_device, v50, a7, v51), p_box_norm_float4_pass_vert_kernel)&& (sub_1B5674B88(p_box_float4_pass_vert_kernel, *p_library, *p_pipelineLibrary, *p_device, v53, a7, v54), p_box_float4_pass_vert_kernel))
    {
      v29 = v17;
    }
    else
    {
LABEL_13:
      v29 = 0;
    }
    sub_1B5674E20((id *)&p_box_float_pass_horiz_kernel);
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (void)encodeToCommandBuffer:(id)a3 inTexture:(id)a4 outTexture:(id)a5 radius:(unint64_t)a6 normalize:(int64_t)a7
{
  int v8;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;

  v8 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (__PAIR128__(objc_msgSend(v14, "height"), objc_msgSend(v14, "width")) != *(_OWORD *)&self->_textureSize.width)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAFilterBox.mm"), 108, CFSTR("Texture dimension is not expected (%zux%zu) != (%zux%zu)"), objc_msgSend(v14, "width"), objc_msgSend(v14, "height"), self->_textureSize.width, self->_textureSize.height);

  }
  if (objc_msgSend(v15, "width") != self->_textureSize.width
    || objc_msgSend(v15, "height") != self->_textureSize.height)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAFilterBox.mm"), 114, CFSTR("Texture dimension is not expected (%zux%zu) != (%zux%zu)"), objc_msgSend(v15, "width"), objc_msgSend(v15, "height"), self->_textureSize.width, self->_textureSize.height);

  }
  if (objc_msgSend(v14, "pixelFormat") != 10
    && objc_msgSend(v14, "pixelFormat") != 25
    && objc_msgSend(v14, "pixelFormat") != 55
    && objc_msgSend(v14, "pixelFormat") != 70
    && objc_msgSend(v14, "pixelFormat") != 115
    && objc_msgSend(v14, "pixelFormat") != 125)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAFilterBox.mm"), 121, CFSTR("Bad input pixel format (%lu) for encodeBoxFilterToBuffer"), objc_msgSend(v14, "pixelFormat"));

  }
  if (objc_msgSend(v15, "pixelFormat") != 10
    && objc_msgSend(v15, "pixelFormat") != 25
    && objc_msgSend(v15, "pixelFormat") != 55
    && objc_msgSend(v15, "pixelFormat") != 70
    && objc_msgSend(v15, "pixelFormat") != 115
    && objc_msgSend(v15, "pixelFormat") != 125)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAFilterBox.mm"), 127, CFSTR("Bad output pixel format (%lu) for encodeBoxFilterToBuffer"), objc_msgSend(v15, "pixelFormat"));

  }
  if (objc_msgSend(v14, "pixelFormat") == 55)
  {
    if (a7)
    {
LABEL_31:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAFilterBox.mm"), 135, CFSTR("Unsupported input pixel format (%lu) and normalization type (%ld) for encodeBoxFilterToBuffer"), objc_msgSend(v14, "pixelFormat"), a7);

    }
  }
  else
  {
    v16 = objc_msgSend(v14, "pixelFormat");
    if (a7 && v16 == 125)
      goto LABEL_31;
  }
  v25 = v8;
  if (objc_msgSend(v14, "pixelFormat") == 70 || objc_msgSend(v14, "pixelFormat") == 115)
  {
    v17 = 56;
  }
  else
  {
    v18 = objc_msgSend(v14, "pixelFormat");
    v17 = 64;
    if (v18 == 125)
      v17 = 56;
  }
  v19 = *(id *)((char *)&self->super.isa + v17);
  -[CVAFilterBox encodeBoxHorizontalToCommandBuffer:configBuffer:source:destination:](self, "encodeBoxHorizontalToCommandBuffer:configBuffer:source:destination:", v13, &v25, v14, v19);
  -[CVAFilterBox encodeBoxVerticalToCommandBuffer:configBuffer:source:destination:normalize:](self, "encodeBoxVerticalToCommandBuffer:configBuffer:source:destination:normalize:", v13, &v25, v19, v15, a7);

}

- (void)encodeBoxHorizontalToCommandBuffer:(id)a3 configBuffer:(const BoxFilterConfig *)a4 source:(id)a5 destination:(id)a6
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[3];

  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "pixelFormat");
  if (v14 > 69)
  {
    if (v14 == 70 || v14 == 115 || v14 == 125)
    {
      objc_msgSend(v13, "setLabel:", CFSTR("_box_float4_pass_horiz_kernel"));
      v15 = 80;
      goto LABEL_10;
    }
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAFilterBox.mm"), 186, CFSTR("Bad output pixel format (%lu) for encodeBoxFilterToBuffer"), objc_msgSend(v11, "pixelFormat"));

    goto LABEL_11;
  }
  if (v14 != 10 && v14 != 25 && v14 != 55)
    goto LABEL_12;
  objc_msgSend(v13, "setLabel:", CFSTR("_box_float_pass_horiz_kernel"));
  v15 = 72;
LABEL_10:
  objc_msgSend(v13, "setComputePipelineState:", *(Class *)((char *)&self->super.isa + v15));
LABEL_11:
  objc_msgSend(v13, "setTexture:atIndex:", v11, 0);
  objc_msgSend(v13, "setTexture:atIndex:", v12, 1);
  objc_msgSend(v13, "setBytes:length:atIndex:", a4, 4, 0);
  v19[0] = (unint64_t)(objc_msgSend(v11, "width") + 15) >> 4;
  v19[1] = (unint64_t)(objc_msgSend(v11, "height") + 15) >> 4;
  v19[2] = 1;
  v18 = 1;
  v17 = xmmword_1B56AC968;
  objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", v19, &v17);
  objc_msgSend(v13, "endEncoding");

}

- (void)encodeBoxVerticalToCommandBuffer:(id)a3 configBuffer:(const BoxFilterConfig *)a4 source:(id)a5 destination:(id)a6 normalize:(int64_t)a7
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _QWORD v18[3];

  v12 = a5;
  v13 = a6;
  objc_msgSend(a3, "computeCommandEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "pixelFormat") == 10
    || objc_msgSend(v12, "pixelFormat") == 25
    || objc_msgSend(v12, "pixelFormat") == 55)
  {
    if (a7 == 1)
    {
      objc_msgSend(v14, "setLabel:", CFSTR("_box_norm_float_pass_vert_kernel"));
      v15 = 96;
    }
    else if (a7 == 2)
    {
      objc_msgSend(v14, "setLabel:", CFSTR("_box_normValid_float_pass_vert_kernel"));
      v15 = 88;
    }
    else
    {
      objc_msgSend(v14, "setLabel:", CFSTR("_box_float_pass_vert_kernel"));
      v15 = 104;
    }
  }
  else if (a7 == 1)
  {
    objc_msgSend(v14, "setLabel:", CFSTR("_box_norm_float4_pass_vert_kernel"));
    v15 = 120;
  }
  else if (a7 == 2)
  {
    objc_msgSend(v14, "setLabel:", CFSTR("_box_normValid_float4_pass_vert_kernel"));
    v15 = 112;
  }
  else
  {
    objc_msgSend(v14, "setLabel:", CFSTR("_box_float4_pass_vert_kernel"));
    v15 = 128;
  }
  objc_msgSend(v14, "setComputePipelineState:", *(Class *)((char *)&self->super.isa + v15));
  objc_msgSend(v14, "setTexture:atIndex:", v12, 0);
  objc_msgSend(v14, "setTexture:atIndex:", v13, 1);
  objc_msgSend(v14, "setBytes:length:atIndex:", a4, 4, 0);
  v18[0] = (unint64_t)(objc_msgSend(v12, "width") + 15) >> 4;
  v18[1] = (unint64_t)(objc_msgSend(v12, "height") + 15) >> 4;
  v18[2] = 1;
  v17 = 1;
  v16 = xmmword_1B56AC968;
  objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", v18, &v16);
  objc_msgSend(v14, "endEncoding");

}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_box_float4_pass_vert_kernel, 0);
  objc_storeStrong((id *)&self->_box_norm_float4_pass_vert_kernel, 0);
  objc_storeStrong((id *)&self->_box_normValid_float4_pass_vert_kernel, 0);
  objc_storeStrong((id *)&self->_box_float_pass_vert_kernel, 0);
  objc_storeStrong((id *)&self->_box_norm_float_pass_vert_kernel, 0);
  objc_storeStrong((id *)&self->_box_normValid_float_pass_vert_kernel, 0);
  objc_storeStrong((id *)&self->_box_float4_pass_horiz_kernel, 0);
  objc_storeStrong((id *)&self->_box_float_pass_horiz_kernel, 0);
  objc_storeStrong((id *)&self->_boxIntermediateTexture_r, 0);
  objc_storeStrong((id *)&self->_boxIntermediateTexture_rgba, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
