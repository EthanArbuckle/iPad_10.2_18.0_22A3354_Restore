@implementation NUNAegirOffscreen

- (NUNAegirOffscreen)initWithDevice:(id)a3 width:(int)a4 height:(int)a5 texture0:(id)a6 texture1:(id)a7 loadAction:(unint64_t)a8 clearColor0:(id)a9 clearColor1:(id)a10
{
  double var3;
  double var2;
  double var1;
  double var0;
  double v14;
  double v15;
  double v16;
  double v17;
  id v23;
  id v24;
  NUNAegirOffscreen *v25;
  NUNAegirOffscreen *v26;
  id v27;
  id v28;
  MTLRenderPassDescriptor *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  MTLRenderPassDescriptor *renderPassDescriptor;
  objc_super v36;

  var3 = a10.var3;
  var2 = a10.var2;
  var1 = a10.var1;
  var0 = a10.var0;
  v14 = a9.var3;
  v15 = a9.var2;
  v16 = a9.var1;
  v17 = a9.var0;
  v23 = a6;
  v24 = a7;
  v36.receiver = self;
  v36.super_class = (Class)NUNAegirOffscreen;
  v25 = -[NUNAegirOffscreen init](&v36, sel_init);
  v26 = v25;
  if (v25)
  {
    v25->_width = a4;
    v25->_height = a5;
    v27 = v23;
    v28 = v24;
    v29 = (MTLRenderPassDescriptor *)objc_opt_new();
    -[MTLRenderPassDescriptor colorAttachments](v29, "colorAttachments");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v27)
    {
      objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setClearColor:", v17, v16, v15, v14);
      objc_msgSend(v32, "setStoreAction:", 1);
      objc_msgSend(v32, "setLoadAction:", a8);
      objc_msgSend(v32, "setTexture:", v27);

    }
    if (v28)
    {
      objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setClearColor:", var0, var1, var2, var3);
      objc_msgSend(v33, "setStoreAction:", 1);
      objc_msgSend(v33, "setLoadAction:", a8);
      objc_msgSend(v33, "setTexture:", v28);

    }
    renderPassDescriptor = v26->_renderPassDescriptor;
    v26->_renderPassDescriptor = v29;

  }
  return v26;
}

- (NUNAegirOffscreen)initWithDevice:(id)a3 width:(int)a4 height:(int)a5 pixelFormat0:(unint64_t)a6 pixelFormat1:(unint64_t)a7 mipmaps:(int)a8 loadAction:(unint64_t)a9 clearColor0:(id)a10 clearColor1:(id)a11
{
  uint64_t v14;
  uint64_t v15;
  double var3;
  double var2;
  double var1;
  double var0;
  double v20;
  double v21;
  double v22;
  double v23;
  id v25;
  void *v26;
  void *v27;
  NUNAegirOffscreen *v28;

  v14 = *(_QWORD *)&a5;
  v15 = *(_QWORD *)&a4;
  var3 = a11.var3;
  var2 = a11.var2;
  var1 = a11.var1;
  var0 = a11.var0;
  v20 = a10.var3;
  v21 = a10.var2;
  v22 = a10.var1;
  v23 = a10.var0;
  v25 = a3;
  _NUNAegirCreateTexture(v25, v15, v14, a8, a6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  _NUNAegirCreateTexture(v25, v15, v14, a8, a7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[NUNAegirOffscreen initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:](self, "initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:", v25, v15, v14, v26, v27, a9, v23, v22, v21, v20, var0, var1, var2, var3);

  return v28;
}

- (MTLTexture)texture0
{
  void *v2;
  void *v3;
  void *v4;

  -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDescriptor, "colorAttachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "texture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTLTexture *)v4;
}

- (void)setTexture0:(id)a3
{
  MTLRenderPassDescriptor *renderPassDescriptor;
  id v4;
  void *v5;
  id v6;

  renderPassDescriptor = self->_renderPassDescriptor;
  v4 = a3;
  -[MTLRenderPassDescriptor colorAttachments](renderPassDescriptor, "colorAttachments");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTexture:", v4);

}

- (MTLTexture)texture1
{
  void *v2;
  void *v3;
  void *v4;

  -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDescriptor, "colorAttachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "texture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTLTexture *)v4;
}

- (void)setTexture1:(id)a3
{
  MTLRenderPassDescriptor *renderPassDescriptor;
  id v4;
  void *v5;
  id v6;

  renderPassDescriptor = self->_renderPassDescriptor;
  v4 = a3;
  -[MTLRenderPassDescriptor colorAttachments](renderPassDescriptor, "colorAttachments");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTexture:", v4);

}

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (MTLRenderPassDescriptor)renderPassDescriptor
{
  return self->_renderPassDescriptor;
}

- (void)setRenderPassDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_renderPassDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
}

@end
