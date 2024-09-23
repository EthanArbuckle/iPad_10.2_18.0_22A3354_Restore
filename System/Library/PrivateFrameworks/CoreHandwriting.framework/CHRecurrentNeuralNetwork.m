@implementation CHRecurrentNeuralNetwork

- (CHRecurrentNeuralNetwork)initWithModelName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHRecurrentNeuralNetwork *v10;
  uint64_t v11;
  NSString *modelName;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CHRecurrentNeuralNetwork;
  v10 = -[CHRecurrentNeuralNetwork init](&v14, sel_init);
  if (v10)
  {
    objc_msgSend_stringByDeletingPathExtension(v4, v5, v6, v7, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    modelName = v10->_modelName;
    v10->_modelName = (NSString *)v11;

  }
  return v10;
}

- (id)normalizedDrawing:(id)a3 targetHeight:(double)a4 minimumDrawingSize:(CGSize)a5 interpolationDistance:(double)a6 outScaleFactor:(double *)a7 outputPointMap:(void *)a8
{
  double height;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  void *v24;

  height = a5.height;
  v13 = a3;
  objc_msgSend_averageCharacterHeightEstimation_minChunkHeight_(v13, v14, v15, v16, v17, v18, 5.0, height * 0.5);
  if (v22 <= height)
    v22 = height;
  v23 = a4 / v22;
  objc_msgSend_normalizedDrawing_scaleFactor_interpolationDistance_outputPointMap_(CHRecurrentNeuralNetwork, v19, (uint64_t)v13, (uint64_t)a8, v20, v21, v23, a6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (a7)
    *a7 = v23;

  return v24;
}

+ (id)normalizedDrawing:(id)a3 scaleFactor:(double)a4 interpolationDistance:(double)a5 outputPointMap:(void *)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  v9 = a3;
  objc_msgSend_bounds(v9, v10, v11, v12, v13, v14);
  objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v9, v17, v18, v19, v20, v21, -v15, -v16, a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_drawingSpatiallyResampled_outputPointMap_(v22, v23, (uint64_t)a6, v24, v25, v26, a5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelName, 0);
}

@end
