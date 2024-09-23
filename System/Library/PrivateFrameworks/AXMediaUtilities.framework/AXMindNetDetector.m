@implementation AXMindNetDetector

+ (AXMindNetDetector)detectorWithModelPath:(id)a3 configuration:(id)a4 modelType:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  double v15;
  void *v16;

  v8 = a4;
  +[AXMindNetNetwork networkWithModelPath:configuration:modelType:](AXMindNetNetwork, "networkWithModelPath:configuration:modelType:", a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc((Class)a1);
  objc_msgSend(v8, "nmsThreshold");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;
  objc_msgSend(v8, "filterThresholds");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = v13;
  v16 = (void *)objc_msgSend(v10, "initWithNetwork:nmsThreshold:filterThreshold:", v9, v14, v15);

  return (AXMindNetDetector *)v16;
}

- (AXMindNetDetector)initWithNetwork:(id)a3 nmsThreshold:(float)a4 filterThreshold:(id)a5
{
  id v9;
  id v10;
  AXMindNetDetector *v11;
  AXMindNetDetector *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AXMindNetDetector;
  v11 = -[AXMindNetDetector init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_network, a3);
    v12->_nmsThreshold = a4;
    objc_storeStrong((id *)&v12->_filterThreshold, a5);
  }

  return v12;
}

- (float)threshold
{
  float result;

  -[AXMindNetNetwork threshold](self->_network, "threshold");
  return result;
}

- (void)setThreshold:(float)a3
{
  -[AXMindNetNetwork setThreshold:](self->_network, "setThreshold:");
}

- (id)detect:(id)a3
{
  -[AXMindNetNetwork processCIImage:](self->_network, "processCIImage:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5
{
  return a3;
}

- (float)overlap_threshold
{
  return self->_overlap_threshold;
}

- (void)setOverlap_threshold:(float)a3
{
  self->_overlap_threshold = a3;
}

- (NSArray)filterThreshold
{
  return self->_filterThreshold;
}

- (void)setFilterThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_filterThreshold, a3);
}

- (float)nmsThreshold
{
  return self->_nmsThreshold;
}

- (void)setNmsThreshold:(float)a3
{
  self->_nmsThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterThreshold, 0);
  objc_storeStrong((id *)&self->_network, 0);
}

@end
