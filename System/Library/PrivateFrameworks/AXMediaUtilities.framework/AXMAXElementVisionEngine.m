@implementation AXMAXElementVisionEngine

- (AXMAXElementVisionEngine)initWithIdentifier:(id)a3
{
  AXMAXElementVisionEngine *v3;
  AXMScreenCaptureNode *v4;
  AXMImageNode *v5;
  AXMTextDetectorNode *v6;
  AXMIconClassDetectorNode *v7;
  AXMBrailleEdgesDetectorNode *v8;
  AXMAXElementDetectorNode *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AXMAXElementVisionEngine;
  v3 = -[AXMVisionEngine initWithIdentifier:](&v11, sel_initWithIdentifier_, a3);
  -[AXMVisionEngine setMaximumQueueSize:](v3, "setMaximumQueueSize:", 10);
  if (v3)
  {
    if (-[AXMVisionEngine canAddSourceNodeClass:](v3, "canAddSourceNodeClass:", objc_opt_class()))
    {
      v4 = -[AXMVisionEngineNode initWithIdentifier:]([AXMScreenCaptureNode alloc], "initWithIdentifier:", CFSTR("screenCapture"));
      -[AXMVisionEngine addSourceNode:](v3, "addSourceNode:", v4);
      -[AXMAXElementVisionEngine setCaptureNode:](v3, "setCaptureNode:", v4);

    }
    if (-[AXMVisionEngine canAddSourceNodeClass:](v3, "canAddSourceNodeClass:", objc_opt_class()))
    {
      v5 = -[AXMVisionEngineNode initWithIdentifier:]([AXMImageNode alloc], "initWithIdentifier:", CFSTR("image"));
      -[AXMVisionEngine addSourceNode:](v3, "addSourceNode:", v5);
      -[AXMAXElementVisionEngine setImageNode:](v3, "setImageNode:", v5);

    }
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v6 = -[AXMVisionEngineNode initWithIdentifier:]([AXMTextDetectorNode alloc], "initWithIdentifier:", CFSTR("text"));
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v6);
      -[AXMAXElementVisionEngine setTextDetector:](v3, "setTextDetector:", v6);

    }
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v7 = -[AXMMobileAssetEvaluationNode initWithIdentifier:]([AXMIconClassDetectorNode alloc], "initWithIdentifier:", CFSTR("iconClass"));
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v7);
      -[AXMAXElementVisionEngine setIconClassDetector:](v3, "setIconClassDetector:", v7);

    }
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v8 = -[AXMVisionEngineNode initWithIdentifier:]([AXMBrailleEdgesDetectorNode alloc], "initWithIdentifier:", CFSTR("brailleEdges"));
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v8);
      -[AXMAXElementVisionEngine setBrailleEdgeDetector:](v3, "setBrailleEdgeDetector:", v8);

    }
    if (-[AXMVisionEngine canAddEvaluationNodeClass:](v3, "canAddEvaluationNodeClass:", objc_opt_class()))
    {
      v9 = -[AXMMobileAssetEvaluationNode initWithIdentifier:]([AXMAXElementDetectorNode alloc], "initWithIdentifier:", CFSTR("axElement"));
      -[AXMVisionEngine addEvaluationNode:](v3, "addEvaluationNode:", v9);
      -[AXMAXElementVisionEngine setAxElementDetector:](v3, "setAxElementDetector:", v9);

    }
  }
  return v3;
}

- (AXMScreenCaptureNode)captureNode
{
  return (AXMScreenCaptureNode *)objc_loadWeakRetained((id *)&self->_captureNode);
}

- (void)setCaptureNode:(id)a3
{
  objc_storeWeak((id *)&self->_captureNode, a3);
}

- (AXMImageNode)imageNode
{
  return (AXMImageNode *)objc_loadWeakRetained((id *)&self->_imageNode);
}

- (void)setImageNode:(id)a3
{
  objc_storeWeak((id *)&self->_imageNode, a3);
}

- (AXMTextDetectorNode)textDetector
{
  return (AXMTextDetectorNode *)objc_loadWeakRetained((id *)&self->_textDetector);
}

- (void)setTextDetector:(id)a3
{
  objc_storeWeak((id *)&self->_textDetector, a3);
}

- (AXMIconClassDetectorNode)iconClassDetector
{
  return (AXMIconClassDetectorNode *)objc_loadWeakRetained((id *)&self->_iconClassDetector);
}

- (void)setIconClassDetector:(id)a3
{
  objc_storeWeak((id *)&self->_iconClassDetector, a3);
}

- (AXMAXElementDetectorNode)axElementDetector
{
  return (AXMAXElementDetectorNode *)objc_loadWeakRetained((id *)&self->_axElementDetector);
}

- (void)setAxElementDetector:(id)a3
{
  objc_storeWeak((id *)&self->_axElementDetector, a3);
}

- (AXMBrailleEdgesDetectorNode)brailleEdgeDetector
{
  return (AXMBrailleEdgesDetectorNode *)objc_loadWeakRetained((id *)&self->_brailleEdgeDetector);
}

- (void)setBrailleEdgeDetector:(id)a3
{
  objc_storeWeak((id *)&self->_brailleEdgeDetector, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_brailleEdgeDetector);
  objc_destroyWeak((id *)&self->_axElementDetector);
  objc_destroyWeak((id *)&self->_iconClassDetector);
  objc_destroyWeak((id *)&self->_textDetector);
  objc_destroyWeak((id *)&self->_imageNode);
  objc_destroyWeak((id *)&self->_captureNode);
}

@end
