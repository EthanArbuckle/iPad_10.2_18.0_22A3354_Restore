@implementation MLComputeDataSource

- (MLComputeDataSource)initWithFeatureProvider:(id)a3 forPrediction:(BOOL)a4 neuralNetworkEngine:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v10;
  void *v11;
  MLComputeDataSource *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  char v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  MLComputeDataSource *v38;
  id *v39;
  uint64_t v40;
  id v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  uint64_t v49;

  v8 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v10 = a5;
  v47.receiver = self;
  v47.super_class = (Class)MLComputeDataSource;
  v38 = -[MLComputeDataSource init](&v47, sel_init);
  if (v38)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = a6;
    objc_msgSend(v10, "modelDescription");
    if (v8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "inputDescriptionsByName");
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "trainingInputDescriptionsByName");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v13;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v14)
    {
      v40 = *(_QWORD *)v44;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v44 != v40)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(obj, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "featureValueForName:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
            if (v39)
            {
              +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Data provided in input: %@ is missing feature value for training input: %@"), v41, v16);
              v32 = (id)objc_claimAutoreleasedReturnValue();
              v18 = 0;
              goto LABEL_38;
            }
            v18 = 0;
            goto LABEL_55;
          }
          objc_msgSend(v10, "modelDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "predictedFeatureName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", v16);

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "lossTargetName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqualToString:", v16);

          }
          else
          {
            v23 = 0;
          }
          if (((v21 | v23) & 1) != 0 || v17)
          {
            v24 = objc_msgSend(v18, "type");
            if (v24 == 4)
            {
              objc_msgSend(v17, "imageConstraint");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v25, "isAllowedValue:error:", v18, v39) & 1) == 0)
              {
                if (v39)
                {
                  objc_msgSend(v17, "imageConstraint");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Image value for %@ does not comply with constraint: %@"), v16, v34);
                  *v39 = (id)objc_claimAutoreleasedReturnValue();

                }
                goto LABEL_54;
              }
              -[MLComputeDataSource dataCHWFromPixelBuffer:channelOrderIsBGR:error:](v38, "dataCHWFromPixelBuffer:channelOrderIsBGR:error:", objc_msgSend(v18, "imageBufferValue"), objc_msgSend(v25, "pixelType") == 30, v39);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v31)
              {
                if (v39)
                {
                  +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Cannot extract data for image feature: %@"), v16);
                  *v39 = (id)objc_claimAutoreleasedReturnValue();
                }
                goto LABEL_54;
              }
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v31, v16);

            }
            else
            {
              if (v24 == 5)
              {
                objc_msgSend(v18, "multiArrayValue");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "shape");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v26
                  || (objc_msgSend(v25, "shape"),
                      v27 = (void *)objc_claimAutoreleasedReturnValue(),
                      v28 = objc_msgSend(v27, "count") == 0,
                      v27,
                      v26,
                      v28))
                {
                  if (v39)
                  {
                    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Data provided for %@ has insufficient shape"), v16);
                    *v39 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  goto LABEL_54;
                }
                objc_msgSend(v17, "multiArrayConstraint");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "isAllowedValue:isNeuralNetworkInputOrOutput:usingRank5Mapping:featureName:error:", v18, 1, objc_msgSend(v10, "ndArrayInterpretation") ^ 1, v16, v39);

                if ((v30 & 1) == 0)
                {
                  if (v39)
                  {
                    objc_msgSend(v17, "multiArrayConstraint");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("MLMultiArray value for %@ does not comply with constraint: %@"), v16, v35);
                    *v39 = (id)objc_claimAutoreleasedReturnValue();

                  }
LABEL_54:

                  goto LABEL_55;
                }
              }
              else
              {
                if ((v21 & 1) == 0)
                {
                  if (v39)
                  {
                    objc_msgSend(obj, "objectForKeyedSubscript:", v16);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Input %@ is not in the expected format, expected: %@"), v16, v33);
                    *v39 = (id)objc_claimAutoreleasedReturnValue();

                  }
                  goto LABEL_55;
                }
                if (objc_msgSend(v18, "type") != 1 && objc_msgSend(v18, "type") != 3
                  || (objc_msgSend(v17, "isAllowedValue:error:", v18, v39) & 1) == 0)
                {
                  if (v39)
                  {
                    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Value for %@ does not comply with constraint in description: %@ (%@)"), v16, v17, *v39);
                    v32 = (id)objc_claimAutoreleasedReturnValue();
                    goto LABEL_38;
                  }
LABEL_55:

                  v12 = 0;
                  goto LABEL_56;
                }
                -[MLComputeDataSource oneHotEncodedDataFromFeatureValue:withNNEngine:error:](v38, "oneHotEncodedDataFromFeatureValue:withNNEngine:error:", v18, v10, v39);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v25)
                {
                  if (v39)
                  {
                    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, *v39, CFSTR("Cannot transform the %@ feature value to one hot encoded format."), v18);
                    v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:
                    *v39 = v32;
                  }
                  goto LABEL_55;
                }
              }
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v25, v16);
            }

          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        if (v14)
          continue;
        break;
      }
    }

    objc_storeStrong((id *)&v38->_dataDictionary, v37);
    v12 = v38;
LABEL_56:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)dataCHWFromPixelBuffer:(__CVBuffer *)a3 channelOrderIsBGR:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v9;

  v6 = a4;
  if (CVPixelBufferLockBaseAddress(a3, 1uLL))
  {
    if (a5)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to lock pixel buffer"));
      v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    if (CVPixelBufferGetPixelFormatType(a3) == 1278226488)
      -[MLComputeDataSource dataCHWFromPixelTypeGray8:error:](self, "dataCHWFromPixelTypeGray8:error:", a3, a5);
    else
      -[MLComputeDataSource dataCHWFromChanneledPixelType:channelOrderIsBGR:error:](self, "dataCHWFromChanneledPixelType:channelOrderIsBGR:error:", a3, v6, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  }
  return v9;
}

- (id)dataCHWFromPixelTypeGray8:(__CVBuffer *)a3 error:(id *)a4
{
  vImagePixelCount Width;
  vImagePixelCount Height;
  void *v8;
  vImage_Error v9;
  void *v10;
  vImage_Buffer dest;
  vImage_Buffer src;

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  src.height = Height;
  src.width = Width;
  src.data = CVPixelBufferGetBaseAddress(a3);
  src.rowBytes = CVPixelBufferGetBytesPerRow(a3);
  v8 = malloc_type_malloc(4 * Width * Height, 0xC819E1EuLL);
  dest.data = v8;
  dest.height = Height;
  dest.width = Width;
  dest.rowBytes = 4 * Width;
  v9 = vImageConvert_Planar8toPlanarF(&src, &dest, 255.0, 0.0, 0);
  if (v9)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to convert planar8 to planarF: Code=%@"), v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    free(v8);
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, 4 * Width * Height, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)dataCHWFromChanneledPixelType:(__CVBuffer *)a3 channelOrderIsBGR:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  vImagePixelCount Width;
  size_t v9;
  char *v10;
  void *v11;
  vImage_Error v12;
  void *v13;
  vImage_Buffer blue;
  vImage_Buffer green;
  vImage_Buffer red;
  vImage_Buffer alpha;
  vImage_Buffer src;
  __int128 maxFloat;
  _QWORD minFloat[3];

  v6 = a4;
  minFloat[2] = *MEMORY[0x1E0C80C00];
  Width = CVPixelBufferGetWidth(a3);
  src.height = CVPixelBufferGetHeight(a3);
  src.width = Width;
  src.data = CVPixelBufferGetBaseAddress(a3);
  src.rowBytes = CVPixelBufferGetBytesPerRow(a3);
  v9 = 3 * 4 * Width * src.height;
  v10 = (char *)malloc_type_malloc(v9, 0x78DF4184uLL);
  v11 = malloc_type_malloc(4 * Width * src.height, 0x990100E6uLL);
  alpha.data = v10;
  alpha.height = src.height;
  alpha.width = Width;
  alpha.rowBytes = 4 * Width;
  red.data = &v10[4 * src.height * Width];
  red.height = src.height;
  red.width = Width;
  red.rowBytes = 4 * Width;
  green.data = &v10[8 * src.height * Width];
  green.height = src.height;
  green.width = Width;
  green.rowBytes = 4 * Width;
  blue.data = v11;
  blue.height = src.height;
  blue.width = Width;
  blue.rowBytes = 4 * Width;
  minFloat[0] = 0;
  minFloat[1] = 0;
  maxFloat = xmmword_19CB39A00;
  if (v6)
    v12 = vImageConvert_ARGB8888toPlanarF(&src, &alpha, &red, &green, &blue, (const float *)&maxFloat, (const float *)minFloat, 0);
  else
    v12 = vImageConvert_ARGB8888toPlanarF(&src, &blue, &alpha, &red, &green, (const float *)&maxFloat, (const float *)minFloat, 0);
  if (v12)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to convert ARGB8888 to PlanarF: Code=%@"), v13);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    free(v11);
    free(v10);
    return 0;
  }
  else
  {
    free(v11);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v10, v9, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)oneHotEncodedDataFromFeatureValue:(id)a3 withNNEngine:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  MLMultiArray *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  MLMultiArray *v21;
  void *v22;
  void *v23;
  uint64_t i;
  void *v25;
  MLMultiArray *v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "classLabels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || !objc_msgSend(v9, "count"))
  {
    if (a5)
    {
      +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Failed to derive valid training input from class label"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v17 = 0;
      *a5 = v16;
      goto LABEL_31;
    }
LABEL_24:
    v17 = 0;
    goto LABEL_31;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v8, "classLabelToIndexMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "int64Value"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (objc_msgSend(v7, "type") != 3)
  {
    if (a5)
    {
      +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Predicted class is not in expected format"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    goto LABEL_24;
  }
  objc_msgSend(v8, "classLabelToIndexMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v18 = (void *)v15;

  if (v18)
  {
    v19 = objc_msgSend(v10, "count");
    if (objc_msgSend(v8, "classifierOutputIsSigmoidOutput"))
      v20 = 1;
    else
      v20 = v19;
    v21 = [MLMultiArray alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MLMultiArray initWithShape:dataType:error:](v21, "initWithShape:dataType:error:", v23, 65568, a5);

    if (v17)
    {
      if (v20 >= 1)
      {
        for (i = 0; i != v20; ++i)
          -[MLMultiArray setObject:atIndexedSubscript:](v17, "setObject:atIndexedSubscript:", &unk_1E3DA1D38, i);
      }
      if (objc_msgSend(v8, "classifierOutputIsSigmoidOutput"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1 - objc_msgSend(v18, "intValue"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLMultiArray setObject:atIndexedSubscript:](v17, "setObject:atIndexedSubscript:", v25, 0);

      }
      else
      {
        -[MLMultiArray setObject:atIndexedSubscript:](v17, "setObject:atIndexedSubscript:", &unk_1E3DA1D48, (int)objc_msgSend(v18, "intValue"));
      }
      v26 = v17;
    }
    else if (a5)
    {
      +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Failed to copy over input multi array"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (a5)
  {
    +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Invalid class label %@ provided as input"), v7);
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

LABEL_31:
  return v17;
}

- (NSDictionary)dataDictionary
{
  return self->_dataDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDictionary, 0);
}

@end
