@implementation CVAFilterColorAlphaToFgBg

- (CVAFilterColorAlphaToFgBg)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  CVAFilterColorAlphaToFgBg *v13;
  objc_class *v14;
  uint64_t v15;
  NSString *label;
  void *v17;
  MTLComputePipelineState *splitFgBgKernel_rgba;
  void *v19;
  MTLComputePipelineState *splitBgKernel_rgba;
  CVAFilterColorAlphaToFgBg *v21;
  char v23;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CVAFilterColorAlphaToFgBg;
  v13 = -[CVAFilterColorAlphaToFgBg init](&v24, sel_init);
  if (!v13)
    goto LABEL_6;
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = objc_claimAutoreleasedReturnValue();
  label = v13->_label;
  v13->_label = (NSString *)v15;

  v17 = (void *)objc_opt_new();
  v23 = 1;
  objc_msgSend(v17, "setConstantValue:type:withName:", &v23, 53, CFSTR("kWriteForeground"));
  sub_1B5674B88((void **)&v13->_splitFgBgKernel_rgba, v11, v12, v10, CFSTR("splitFgBg_rgba"), a6, v17);
  splitFgBgKernel_rgba = v13->_splitFgBgKernel_rgba;

  if (!splitFgBgKernel_rgba)
    goto LABEL_6;
  v19 = (void *)objc_opt_new();
  v23 = 0;
  objc_msgSend(v19, "setConstantValue:type:withName:", &v23, 53, CFSTR("kWriteForeground"));
  sub_1B5674B88((void **)&v13->_splitBgKernel_rgba, v11, v12, v10, CFSTR("splitFgBg_rgba"), a6, v19);
  splitBgKernel_rgba = v13->_splitBgKernel_rgba;

  if (splitBgKernel_rgba
    && (sub_1B5674B88((void **)&v13->_splitFgKernel_rgba, v11, v12, v10, CFSTR("splitFg_rgba"), a6, 0),
        v13->_splitFgKernel_rgba))
  {
    v21 = v13;
  }
  else
  {
LABEL_6:
    v21 = 0;
  }

  return v21;
}

- (void)encodeToCommandBuffer:(id)a3 srcColorTex:(id)a4 srcAlphaTex:(id)a5 dstForegroundTex:(id)a6 dstBackgroundTex:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  _QWORD v23[3];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_msgSend(v13, "width");
  v18 = objc_msgSend(v13, "height");
  objc_msgSend(v12, "computeCommandEncoder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLabel:", CFSTR("dstForegroundTex ? _splitFgBgKernel_rgba : _splitBgKernel_rgba"));
  v20 = 8;
  if (!v15)
    v20 = 16;
  objc_msgSend(v19, "setComputePipelineState:", *(Class *)((char *)&self->super.isa + v20));
  objc_msgSend(v19, "setTexture:atIndex:", v14, 0);
  objc_msgSend(v19, "setTexture:atIndex:", v13, 1);
  objc_msgSend(v19, "setTexture:atIndex:", v15, 2);
  objc_msgSend(v19, "setTexture:atIndex:", v16, 3);
  v23[0] = (unint64_t)(v17 + 15) >> 4;
  v23[1] = (unint64_t)(v18 + 15) >> 4;
  v23[2] = 1;
  v22 = 1;
  v21 = xmmword_1B56AC968;
  objc_msgSend(v19, "dispatchThreadgroups:threadsPerThreadgroup:", v23, &v21);
  objc_msgSend(v19, "endEncoding");

}

- (void)encodeToCommandBuffer:(id)a3 srcColorTex:(id)a4 srcAlphaTex:(id)a5 dstForegroundTex:(id)a6 normalizedPrimaryCaptureRect:(CGRect)a7 isUnifiedRendering:(BOOL)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  id v20;
  float v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  uint64_t v29;
  _QWORD v30[3];
  _DWORD v31[4];
  BOOL v32;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v32 = a8;
  v21 = x;
  v22 = y;
  *(float *)v31 = v21;
  *(float *)&v31[1] = v22;
  v23 = width;
  v24 = height;
  *(float *)&v31[2] = v23;
  *(float *)&v31[3] = v24;
  v25 = objc_msgSend(v18, "width");
  v26 = objc_msgSend(v18, "height");
  objc_msgSend(v17, "computeCommandEncoder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLabel:", CFSTR("_splitFgKernel_rgba"));
  objc_msgSend(v27, "setComputePipelineState:", self->_splitFgKernel_rgba);
  objc_msgSend(v27, "setTexture:atIndex:", v19, 0);
  objc_msgSend(v27, "setTexture:atIndex:", v18, 1);
  objc_msgSend(v27, "setTexture:atIndex:", v20, 2);
  objc_msgSend(v27, "setBytes:length:atIndex:", v31, 16, 0);
  objc_msgSend(v27, "setBytes:length:atIndex:", &v32, 1, 1);
  v30[0] = (unint64_t)(v25 + 15) >> 4;
  v30[1] = (unint64_t)(v26 + 15) >> 4;
  v30[2] = 1;
  v29 = 1;
  v28 = xmmword_1B56AC968;
  objc_msgSend(v27, "dispatchThreadgroups:threadsPerThreadgroup:", v30, &v28);
  objc_msgSend(v27, "endEncoding");

}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_splitFgKernel_rgba, 0);
  objc_storeStrong((id *)&self->_splitBgKernel_rgba, 0);
  objc_storeStrong((id *)&self->_splitFgBgKernel_rgba, 0);
}

@end
