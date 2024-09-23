@implementation NUGainMapClearFilter

- (id)outputImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _OWORD v31[3];
  __int128 v32;
  __int128 v33;
  __int128 v34;

  -[NUGainMapClearFilter inputGainMap](self, "inputGainMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NUGainMapClearFilter inputMatte](self, "inputMatte");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[NUGainMapClearFilter inputInvertMatte](self, "inputInvertMatte");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "BOOLValue");

      if (v7)
      {
        __asm { FMOV            V3.4S, #1.0 }
        objc_msgSend(v5, "_imageByApplyingColorMatrixRed:green:blue:bias:", COERCE_DOUBLE(3212836864), -0.0078125, 0.0, *(double *)&_Q3);
        v13 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v13;
      }
      v33 = 0u;
      v34 = 0u;
      v32 = 0u;
      objc_msgSend(v5, "extent");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      objc_msgSend(v3, "extent");
      NUCGAffineTransformByMappingFromRectToRect((uint64_t)&v32, v15, v17, v19, v21, v22, v23, v24, v25);
      v31[0] = v32;
      v31[1] = v33;
      v31[2] = v34;
      objc_msgSend(v5, "imageByApplyingTransform:", v31);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C9DD70], "componentMultiply");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "applyWithForeground:background:", v26, v3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "_imageByRenderingToIntermediate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C9DDC8], "blackImage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "extent");
      objc_msgSend(v26, "imageByCroppingToRect:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (CIImage)inputGainMap
{
  return self->_inputGainMap;
}

- (void)setInputGainMap:(id)a3
{
  objc_storeStrong((id *)&self->_inputGainMap, a3);
}

- (CIImage)inputMatte
{
  return self->_inputMatte;
}

- (void)setInputMatte:(id)a3
{
  objc_storeStrong((id *)&self->_inputMatte, a3);
}

- (NSNumber)inputInvertMatte
{
  return self->_inputInvertMatte;
}

- (void)setInputInvertMatte:(id)a3
{
  objc_storeStrong((id *)&self->_inputInvertMatte, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputInvertMatte, 0);
  objc_storeStrong((id *)&self->_inputMatte, 0);
  objc_storeStrong((id *)&self->_inputGainMap, 0);
}

@end
