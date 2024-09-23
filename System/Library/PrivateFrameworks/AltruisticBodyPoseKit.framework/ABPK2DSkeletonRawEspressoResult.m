@implementation ABPK2DSkeletonRawEspressoResult

- (ABPK2DSkeletonRawEspressoResult)initWithMLImage:(id)a3 originalImageData:(id)a4 heatMapBuffer:(__CVBuffer *)a5 heatMapShape:(__CVBuffer *)a6 heatMapStrides:(int64_t)a7 affinityMapBuffer:affinityMapShape:affinityMapStrides:rotationNeeded:
{
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  id v17;
  id v18;
  ABPK2DSkeletonRawEspressoResult *v19;
  ABPK2DSkeletonRawEspressoResult *v20;
  CVPixelBufferRef v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;

  v25 = v9;
  v26 = v10;
  v23 = v7;
  v24 = v8;
  v17 = a3;
  v18 = a4;
  v27.receiver = self;
  v27.super_class = (Class)ABPK2DSkeletonRawEspressoResult;
  v19 = -[ABPK2DSkeletonRawEspressoResult init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_imageDataForNeuralNetwork, a3);
    objc_storeStrong((id *)&v20->_inputImageData, a4);
    v20->_heatMapBuffer = CVPixelBufferRetain(a5);
    *(_OWORD *)v20->_heatMapShape = v23;
    *(_OWORD *)v20->_heatMapStrides = v24;
    v21 = CVPixelBufferRetain(a6);
    *(_OWORD *)v20->_affinityMapShape = v25;
    *(_OWORD *)v20->_affinityMapStrides = v26;
    v20->_affinityMapBuffer = v21;
    v20->_rotationNeeded = a7;
  }

  return v20;
}

- (ABPK2DSkeletonRawEspressoResult)initWithHeatMapBuffer:(__CVBuffer *)a3 heatMapShape:(__CVBuffer *)a4 heatMapStrides:(int64_t)a5 affinityMapBuffer:affinityMapShape:affinityMapStrides:rotationNeeded:
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  ABPK2DSkeletonRawEspressoResult *v12;
  ABPK2DSkeletonRawEspressoResult *v13;
  ABPKMLImageData *imageDataForNeuralNetwork;
  ABPKImageData *inputImageData;
  CVPixelBufferRef v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;

  v20 = v7;
  v21 = v8;
  v18 = v5;
  v19 = v6;
  v22.receiver = self;
  v22.super_class = (Class)ABPK2DSkeletonRawEspressoResult;
  v12 = -[ABPK2DSkeletonRawEspressoResult init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    imageDataForNeuralNetwork = v12->_imageDataForNeuralNetwork;
    v12->_imageDataForNeuralNetwork = 0;

    inputImageData = v13->_inputImageData;
    v13->_inputImageData = 0;

    v13->_heatMapBuffer = CVPixelBufferRetain(a3);
    *(_OWORD *)v13->_heatMapShape = v18;
    *(_OWORD *)v13->_heatMapStrides = v19;
    v16 = CVPixelBufferRetain(a4);
    *(_OWORD *)v13->_affinityMapShape = v20;
    *(_OWORD *)v13->_affinityMapStrides = v21;
    v13->_affinityMapBuffer = v16;
    v13->_rotationNeeded = a5;
  }
  return v13;
}

- (ABPK2DSkeletonRawEspressoResult)initWithMLImage:(ABPK2DSkeletonRawEspressoResult *)self originalImageData:(SEL)a2 heatMapBuffer:(id)a3 heatMapShape:(id)a4 heatMapStrides:(__CVBuffer *)a5 rotationNeeded:(int64_t)a6
{
  __int128 v6;
  __int128 v7;
  id v13;
  id v14;
  ABPK2DSkeletonRawEspressoResult *v15;
  ABPK2DSkeletonRawEspressoResult *v16;
  CVPixelBufferRef v17;
  __int128 v19;
  __int128 v20;
  objc_super v21;

  v19 = v6;
  v20 = v7;
  v13 = a3;
  v14 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ABPK2DSkeletonRawEspressoResult;
  v15 = -[ABPK2DSkeletonRawEspressoResult init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_imageDataForNeuralNetwork, a3);
    objc_storeStrong((id *)&v16->_inputImageData, a4);
    v17 = CVPixelBufferRetain(a5);
    *(_OWORD *)v16->_heatMapShape = v19;
    *(_OWORD *)v16->_heatMapStrides = v20;
    v16->_affinityMapBuffer = 0;
    v16->_rotationNeeded = a6;
    v16->_heatMapBuffer = v17;
    *(_OWORD *)v16->_affinityMapShape = 0u;
    *(_OWORD *)v16->_affinityMapStrides = 0u;
  }

  return v16;
}

- (ABPK2DSkeletonRawEspressoResult)initWithHeatMapBuffer:(ABPK2DSkeletonRawEspressoResult *)self heatMapShape:(SEL)a2 heatMapStrides:(__CVBuffer *)a3 rotationNeeded:(int64_t)a4
{
  __int128 v4;
  __int128 v5;
  ABPK2DSkeletonRawEspressoResult *v8;
  ABPK2DSkeletonRawEspressoResult *v9;
  ABPKMLImageData *imageDataForNeuralNetwork;
  ABPKImageData *inputImageData;
  CVPixelBufferRef v12;
  __int128 v14;
  __int128 v15;
  objc_super v16;

  v14 = v4;
  v15 = v5;
  v16.receiver = self;
  v16.super_class = (Class)ABPK2DSkeletonRawEspressoResult;
  v8 = -[ABPK2DSkeletonRawEspressoResult init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    imageDataForNeuralNetwork = v8->_imageDataForNeuralNetwork;
    v8->_imageDataForNeuralNetwork = 0;

    inputImageData = v9->_inputImageData;
    v9->_inputImageData = 0;

    v12 = CVPixelBufferRetain(a3);
    *(_OWORD *)v9->_heatMapShape = v14;
    *(_OWORD *)v9->_heatMapStrides = v15;
    v9->_affinityMapBuffer = 0;
    v9->_rotationNeeded = a4;
    v9->_heatMapBuffer = v12;
    *(_OWORD *)v9->_affinityMapShape = 0u;
    *(_OWORD *)v9->_affinityMapStrides = 0u;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_heatMapBuffer);
  CVPixelBufferRelease(self->_affinityMapBuffer);
  v3.receiver = self;
  v3.super_class = (Class)ABPK2DSkeletonRawEspressoResult;
  -[ABPK2DSkeletonRawEspressoResult dealloc](&v3, sel_dealloc);
}

- (ABPKMLImageData)imageDataForNeuralNetwork
{
  return self->_imageDataForNeuralNetwork;
}

- (ABPKImageData)inputImageData
{
  return self->_inputImageData;
}

- (__CVBuffer)heatMapBuffer
{
  return self->_heatMapBuffer;
}

- (__n128)heatMapShape
{
  return a1[3];
}

- (__n128)heatMapStrides
{
  return a1[4];
}

- (__CVBuffer)affinityMapBuffer
{
  return self->_affinityMapBuffer;
}

- (__n128)affinityMapShape
{
  return a1[5];
}

- (__n128)affinityMapStrides
{
  return a1[6];
}

- (int64_t)rotationNeeded
{
  return self->_rotationNeeded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputImageData, 0);
  objc_storeStrong((id *)&self->_imageDataForNeuralNetwork, 0);
}

@end
