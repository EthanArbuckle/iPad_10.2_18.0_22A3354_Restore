@implementation CVAFilterDistanceTransform

- (CVAFilterDistanceTransform)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 textureSize:(id *)a6 error:(id *)a7
{
  id v14;
  id v15;
  CVAFilterDistanceTransform *v16;
  NSString *label;
  uint64_t v18;
  MTLTexture *closestSites;
  CVAFilterDistanceTransform *v20;
  void *v22;
  void *v23;
  id v24;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v24 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CVAFilterDistanceTransform;
  v16 = -[CVAFilterDistanceTransform init](&v25, sel_init);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("CVAFilterDistanceTransform.mm"), 35, CFSTR("device is nil"));

    if (v15)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("CVAFilterDistanceTransform.mm"), 36, CFSTR("library is nil"));

    goto LABEL_3;
  }
  if (!v15)
    goto LABEL_10;
LABEL_3:
  label = v16->_label;
  v16->_label = (NSString *)CFSTR("CVAFilterDistanceTransform");

  objc_storeStrong((id *)&v16->_device, a3);
  objc_storeStrong((id *)&v16->_library, a4);
  objc_storeStrong((id *)&v16->_pipelineLibrary, a5);
  sub_1B56A2A64(v16->_device, 24, a6->var0, a6->var1, 0, a7);
  v18 = objc_claimAutoreleasedReturnValue();
  closestSites = v16->_closestSites;
  v16->_closestSites = (MTLTexture *)v18;

  if (v16->_closestSites
    && (sub_1B5674B88((void **)&v16->_closestSitesKernel, v16->_library, v16->_pipelineLibrary, v16->_device, CFSTR("distanceTransformProximalSites"), a7, 0), v16->_closestSitesKernel)&& (sub_1B5674B88((void **)&v16->_distanceTransformKernel, v16->_library, v16->_pipelineLibrary, v16->_device, CFSTR("distanceTransformFromProximalSites"), a7, 0), v16->_distanceTransformKernel))
  {
    v20 = v16;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[3];
  __int128 v29;
  uint64_t v30;
  _QWORD v31[3];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_msgSend(v10, "width");
  if (v12 != -[MTLTexture width](self->_closestSites, "width")
    || (v13 = objc_msgSend(v10, "height"), v13 != -[MTLTexture height](self->_closestSites, "height")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAFilterDistanceTransform.mm"), 73, CFSTR("sourceTexture dimensions do not match"));

  }
  v14 = objc_msgSend(v11, "width");
  if (v14 != -[MTLTexture width](self->_closestSites, "width")
    || (v15 = objc_msgSend(v11, "height"), v15 != -[MTLTexture height](self->_closestSites, "height")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAFilterDistanceTransform.mm"), 75, CFSTR("destinationTexture dimensions do not match"));

  }
  if (objc_msgSend(v10, "pixelFormat") != 13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAFilterDistanceTransform.mm"), 76, CFSTR("sourceTexture pixel format should be R8Uint"));

  }
  if (objc_msgSend(v11, "pixelFormat") != 25)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAFilterDistanceTransform.mm"), 78, CFSTR("destinationTexture pixel format should be R16Float"));

  }
  v16 = objc_msgSend(v10, "width");
  v17 = objc_msgSend(v10, "height");
  objc_msgSend(v9, "computeCommandEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLabel:", CFSTR("_closestSitesKernel"));
  objc_msgSend(v18, "setComputePipelineState:", self->_closestSitesKernel);
  objc_msgSend(v18, "setTexture:atIndex:", v10, 0);
  objc_msgSend(v18, "setTexture:atIndex:", self->_closestSites, 1);
  v19 = (unint64_t)(v16 + 15) >> 4;
  v20 = (unint64_t)(v17 + 15) >> 4;
  v31[0] = v19;
  v31[1] = v20;
  v31[2] = 1;
  v30 = 1;
  v29 = xmmword_1B56AC968;
  objc_msgSend(v18, "dispatchThreadgroups:threadsPerThreadgroup:", v31, &v29);
  objc_msgSend(v18, "endEncoding");
  objc_msgSend(v9, "computeCommandEncoder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setLabel:", CFSTR("_distanceTransformKernel"));
  objc_msgSend(v21, "setComputePipelineState:", self->_distanceTransformKernel);
  objc_msgSend(v21, "setTexture:atIndex:", self->_closestSites, 0);
  objc_msgSend(v21, "setTexture:atIndex:", v11, 1);
  v28[0] = v19;
  v28[1] = v20;
  v28[2] = 1;
  v27 = 1;
  v26 = xmmword_1B56AC968;
  objc_msgSend(v21, "dispatchThreadgroups:threadsPerThreadgroup:", v28, &v26);
  objc_msgSend(v21, "endEncoding");

}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_distanceTransformKernel, 0);
  objc_storeStrong((id *)&self->_closestSitesKernel, 0);
  objc_storeStrong((id *)&self->_closestSites, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
