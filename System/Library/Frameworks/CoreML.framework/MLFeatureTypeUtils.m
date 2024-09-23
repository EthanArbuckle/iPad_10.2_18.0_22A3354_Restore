@implementation MLFeatureTypeUtils

+ (int64_t)featureTypeForObject:(id)a3
{
  id v3;
  int64_t v4;
  CFNumberType Type;
  CFTypeID v6;
  int64_t v7;
  uint64_t v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "type");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      Type = CFNumberGetType((CFNumberRef)v3);
      if ((unint64_t)(Type - 5) >= 0xC)
        v4 = 1;
      else
        v4 = qword_19CB30500[Type - 5];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = 3;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = 5;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v4 = 6;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v4 = 7;
            }
            else if (v3 && (v6 = CFGetTypeID(v3), v6 == CVPixelBufferGetTypeID()))
            {
              v4 = 4;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v9 = 0;
                v7 = +[MLFeatureTypeUtils featureTypeForValuesInArray:error:](MLFeatureTypeUtils, "featureTypeForValuesInArray:error:", v3, &v9);
                if (v9 | (v7 - 1) & 0xFFFFFFFFFFFFFFFDLL)
                  v4 = 0;
                else
                  v4 = 7;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v4 = 8;
                else
                  v4 = 0;
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

+ (int64_t)featureTypeForValuesInArray:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  id *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  objc_opt_class();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v7)
  {
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  v8 = v7;
  v17 = a4;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v19;
LABEL_3:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v19 != v11)
      objc_enumerationMutation(v6);
    v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_17;
    v14 = +[MLFeatureTypeUtils featureTypeForObject:](MLFeatureTypeUtils, "featureTypeForObject:", v13);
    v15 = v14;
    if ((v9 & 1) == 0)
    {
      v9 = 1;
      v10 = v14;
      goto LABEL_17;
    }
    if (v10 != v14)
      break;
    v9 = 1;
LABEL_17:
    if (v8 == ++v12)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        goto LABEL_3;
      goto LABEL_23;
    }
  }
  if ((objc_opt_isKindOfClass() & 1) == 0 && (v10 == 1 && v15 == 2 || v10 == 2 && v15 == 1))
  {
    v9 = 1;
    v10 = 2;
    goto LABEL_17;
  }
  if (!v17)
    goto LABEL_22;
  +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Inconsistent value types in array"));
  v10 = 0;
  *v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v10;
}

+ (id)featureDescriptionWithName:(id)a3 consistentWithFeatureValues:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  __CVBuffer *v26;
  unint64_t v27;
  unint64_t v28;
  MLImageSize *v29;
  size_t Width;
  MLImageSize *v31;
  MLImageSizeConstraint *v32;
  void *v33;
  MLImageSizeConstraint *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  MLSequenceConstraint *v43;
  void *v44;
  void *v45;
  const __CFString *v47;
  __objc2_class *v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  id *v54;
  _QWORD v55[4];
  MLImageSize *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  MLImageSize *v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "count"))
  {
    v54 = a5;
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "type");

    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v13 = v9;
    v52 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    if (v52)
    {
      v49 = a1;
      v14 = 0;
      v15 = *(_QWORD *)v62;
      v50 = *(_QWORD *)v62;
      v51 = v8;
      v53 = v12;
      while (2)
      {
        for (i = 0; i != v52; ++i)
        {
          v17 = v14;
          v18 = v11;
          if (*(_QWORD *)v62 != v15)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v20 = v12;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v58;
LABEL_9:
            v24 = 0;
            while (1)
            {
              if (*(_QWORD *)v58 != v23)
                objc_enumerationMutation(v20);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * v24), "isAllowedValue:error:", v19, 0, v48) & 1) == 0)
                break;
              if (v22 == ++v24)
              {
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
                if (!v22)
                  goto LABEL_15;
                goto LABEL_9;
              }
            }
            if (v54)
            {
              +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Inconsistent value constraints in array"));
              *v54 = (id)objc_claimAutoreleasedReturnValue();
            }

            goto LABEL_36;
          }
LABEL_15:

          if (v19)
          {
            v25 = objc_msgSend(v19, "isUndefined");
            if (v18 != objc_msgSend(v19, "type"))
            {
              if (v54)
              {
                v47 = CFSTR("Inconsistent value types in array");
                goto LABEL_46;
              }
LABEL_36:

              v45 = 0;
              v8 = v51;
              v12 = v53;
              goto LABEL_41;
            }
            v11 = v18;
            v14 = v25 | v17;
            switch(objc_msgSend(v19, "type"))
            {
              case 4:
                if (!objc_msgSend(v19, "imageBufferValue"))
                  break;
                v26 = (__CVBuffer *)objc_msgSend(v19, "imageBufferValue");
                v27 = +[MLImageConstraint imagePixelTypeFromOSType:](MLImageConstraint, "imagePixelTypeFromOSType:", CVPixelBufferGetPixelFormatType(v26));
                if (!v27)
                {
                  if (v54)
                  {
                    v47 = CFSTR("Image found with unsupported pixel type");
LABEL_46:
                    +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", v47, v48);
                    *v54 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  goto LABEL_36;
                }
                v28 = v27;
                v29 = [MLImageSize alloc];
                Width = CVPixelBufferGetWidth(v26);
                v31 = -[MLImageSize initWithPixelsWide:pixelsHigh:](v29, "initWithPixelsWide:pixelsHigh:", Width, CVPixelBufferGetHeight(v26));
                v32 = [MLImageSizeConstraint alloc];
                v65 = v31;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = -[MLImageSizeConstraint initWithEnumeratedImageSizes:](v32, "initWithEnumeratedImageSizes:", v33);

                v48 = MLImageConstraint;
                +[MLImageConstraint constraintWithPixelsWide:pixelsHigh:pixelType:sizeConstraint:](MLImageConstraint, "constraintWithPixelsWide:pixelsHigh:pixelType:sizeConstraint:", -[MLImageSize pixelsWide](v31, "pixelsWide"), -[MLImageSize pixelsHigh](v31, "pixelsHigh"), v28, v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if (v35)
                  objc_msgSend(v20, "addObject:", v35);

LABEL_25:
LABEL_29:

                break;
              case 5:
                v48 = MLMultiArrayConstraint;
                objc_msgSend(v19, "multiArrayValue");
                v31 = (MLImageSize *)objc_claimAutoreleasedReturnValue();
                -[MLImageSize shape](v31, "shape");
                v34 = (MLImageSizeConstraint *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "multiArrayValue");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                +[MLMultiArrayConstraint constraintWithShape:dataType:](MLMultiArrayConstraint, "constraintWithShape:dataType:", v34, objc_msgSend(v36, "dataType"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "addObject:", v37);

                goto LABEL_25;
              case 7:
                objc_msgSend(v19, "sequenceValue");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "values");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = (__objc2_class *)objc_msgSend(v39, "count");

                objc_msgSend(v51, "stringByAppendingString:", CFSTR(".values"));
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "sequenceValue");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "featureValues");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "featureDescriptionWithName:consistentWithFeatureValues:error:", v40, v42, v54);
                v31 = (MLImageSize *)objc_claimAutoreleasedReturnValue();

                if (!v31)
                  goto LABEL_36;
                v43 = -[MLSequenceConstraint initWithValueDescription:countRange:]([MLSequenceConstraint alloc], "initWithValueDescription:countRange:", v31, v48, 1);
                objc_msgSend(v20, "addObject:", v43);

                goto LABEL_29;
              case 8:
                objc_msgSend(v19, "internalStateValue");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v55[0] = MEMORY[0x1E0C809B0];
                v55[1] = 3221225472;
                v55[2] = __83__MLFeatureTypeUtils_featureDescriptionWithName_consistentWithFeatureValues_error___block_invoke;
                v55[3] = &unk_1E3D66670;
                v56 = (MLImageSize *)v20;
                objc_msgSend(v44, "internalGetMultiArrayWithHandler:", v55);

                v31 = v56;
                goto LABEL_29;
              default:
                break;
            }
          }
          else
          {
            v14 = 1;
            v11 = v18;
          }
          v12 = v53;
          v15 = v50;
        }
        v8 = v51;
        v52 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
        if (v52)
          continue;
        break;
      }
    }
    else
    {
      LOBYTE(v14) = 0;
    }

    +[MLFeatureDescription featureDescriptionWithName:type:optional:constraints:](MLFeatureDescription, "featureDescriptionWithName:type:optional:constraints:", v8, v11, v14 & 1, v12);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_41:

  }
  else if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Cannot form description from nothing"));
    v45 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = 0;
  }

  return v45;
}

+ (id)featureValuesWithConsistentTypeFromArray:(id)a3 error:(id *)a4
{
  id v5;
  int64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  id *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = 0;
  v6 = +[MLFeatureTypeUtils featureTypeForValuesInArray:error:](MLFeatureTypeUtils, "featureTypeForValuesInArray:error:", v5, &v26);
  v7 = v26;
  if (v7)
  {
    v8 = v7;
    if (a4)
    {
      v8 = objc_retainAutorelease(v7);
      v9 = 0;
      *a4 = v8;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v20 = a4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          v21 = 0;
          +[MLFeatureValue featureValueOfType:fromObject:error:](MLFeatureValue, "featureValueOfType:fromObject:error:", v6, v16, &v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v21;
          if (v18)
          {
            v8 = v18;
            if (v20)
              *v20 = objc_retainAutorelease(v18);

            v9 = 0;
            goto LABEL_17;
          }
          objc_msgSend(v10, "addObject:", v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v13)
          continue;
        break;
      }
    }

    v9 = v10;
    v8 = 0;
LABEL_17:

  }
  return v9;
}

+ (id)descriptionForType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 >= 9)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v8 = CFSTR("value");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "exceptionWithName:reason:userInfo:", CFSTR("UnknownValue"), CFSTR("Illegal value in MLFeatureType enum"), v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v7);
  }
  return off_1E3D666B8[a3];
}

+ (BOOL)canShapeArrayBePromotedFrom:(id)a3 to:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__MLFeatureTypeUtils_canShapeArrayBePromotedFrom_to___block_invoke;
  v18[3] = &unk_1E3D66698;
  v19 = v8;
  v10 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v18);

  v13 = v9;
  v14 = 3221225472;
  v15 = __53__MLFeatureTypeUtils_canShapeArrayBePromotedFrom_to___block_invoke_2;
  v16 = &unk_1E3D66698;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = v17;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v13);

  LOBYTE(v6) = objc_msgSend(v10, "isEqualToArray:", v11, v13, v14, v15, v16);
  return (char)v6;
}

void __53__MLFeatureTypeUtils_canShapeArrayBePromotedFrom_to___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "integerValue") != 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __53__MLFeatureTypeUtils_canShapeArrayBePromotedFrom_to___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "integerValue") != 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __83__MLFeatureTypeUtils_featureDescriptionWithName_consistentWithFeatureValues_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "shape");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dataType");

  +[MLStateConstraint constraintWithBufferShape:dataType:](MLStateConstraint, "constraintWithBufferShape:dataType:", v6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

}

@end
