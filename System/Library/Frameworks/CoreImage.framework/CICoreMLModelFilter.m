@implementation CICoreMLModelFilter

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[3];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryStillImage");
  v7[1] = CFSTR("CICategoryBuiltIn");
  v7[2] = CFSTR("CICategoryStylize");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v9[1] = CFSTR("12");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.14");
  v8[3] = CFSTR("inputHeadIndex");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeMax");
  v6[0] = &unk_1E2F1B680;
  v6[1] = &unk_1E2F1B698;
  v5[2] = CFSTR("CIAttributeDefault");
  v5[3] = CFSTR("CIAttributeType");
  v6[2] = &unk_1E2F1B680;
  v6[3] = CFSTR("CIAttributeTypeInteger");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v8[4] = CFSTR("inputSoftmaxNormalization");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeMax");
  v4[0] = MEMORY[0x1E0C9AAA0];
  v4[1] = MEMORY[0x1E0C9AAB0];
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeType");
  v4[2] = MEMORY[0x1E0C9AAA0];
  v4[3] = CFSTR("CIAttributeTypeBoolean");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (id)outputImage
{
  int v3;
  NSDictionary *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  NSObject *v17;
  int v18;
  NSDictionary *v19;
  NSDictionary *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  unsigned int v24;
  CGColorSpace *v25;
  uint64_t v26;
  CIImage *inputImage;
  CIImage *v28;
  CIImage *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v33;
  CIImage *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  CIImage *v44;
  uint64_t v45;
  CIImage *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = -[CIImage count](self->inputImage, "count");
    else
      v3 = 0;
  }
  v4 = -[MLModelDescription inputDescriptionsByName](-[MLModel modelDescription](self->inputModel, "modelDescription"), "inputDescriptionsByName");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[NSDictionary allKeys](v4, "allKeys"));
  if (v3 != objc_msgSend(v5, "count"))
  {
    v17 = ci_logger_filter();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CICoreMLModelFilter outputImage].cold.7();
    return 0;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        v12 = -[NSDictionary objectForKey:](-[MLModelDescription inputDescriptionsByName](-[MLModel modelDescription](self->inputModel, "modelDescription"), "inputDescriptionsByName"), "objectForKey:", v11);
        if (!v12 || (v13 = objc_msgSend(v12, "type"), (unint64_t)(v13 - 6) <= 0xFFFFFFFFFFFFFFFDLL))
        {
          v22 = ci_logger_filter();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[CICoreMLModelFilter outputImage].cold.3();
          return 0;
        }
        v14 = v13;
        v15 = channelCountOfName(self->inputModel, v11, 0);
        if (v15 > 4 || ((1 << v15) & 0x1A) == 0)
        {
          v36 = ci_logger_filter();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            -[CICoreMLModelFilter outputImage].cold.4();
          return 0;
        }
        if (v8)
        {
          if (v8 != v14)
          {
            v31 = ci_logger_filter();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              -[CICoreMLModelFilter outputImage].cold.6();
            return 0;
          }
        }
        else
        {
          v8 = v14;
        }
        if (v3 >= 2 && !-[CIImage objectForKey:](self->inputImage, "objectForKey:", v11))
        {
          v35 = ci_logger_filter();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            -[CICoreMLModelFilter outputImage].cold.5((uint64_t)self, v11, v35);
          return 0;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
  v18 = -[NSNumber intValue](self->inputHeadIndex, "intValue");
  v19 = -[MLModelDescription outputDescriptionsByName](-[MLModel modelDescription](self->inputModel, "modelDescription"), "outputDescriptionsByName");
  if (v19 && (v20 = v19, -[NSDictionary count](v19, "count") > v18))
    v21 = -[NSArray objectAtIndex:](-[NSDictionary allKeys](v20, "allKeys"), "objectAtIndex:", v18);
  else
    v21 = 0;
  v23 = objc_msgSend(-[NSDictionary objectForKey:](-[MLModelDescription outputDescriptionsByName](-[MLModel modelDescription](self->inputModel, "modelDescription"), "outputDescriptionsByName"), "objectForKey:", v21), "type");
  v24 = channelCountOfName(self->inputModel, v21, 1);
  if (v23 == 5)
    goto LABEL_43;
  if (v23 != 4)
  {
    v30 = ci_logger_filter();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[CICoreMLModelFilter outputImage].cold.1();
    return 0;
  }
  if (v24 > 4 || ((1 << v24) & 0x1A) == 0)
  {
    v37 = ci_logger_filter();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[CICoreMLModelFilter outputImage].cold.2();
    return 0;
  }
  if (v3 == 1 && v8 == 4)
  {
    v25 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    v26 = objc_msgSend(v5, "anyObject");
    inputImage = self->inputImage;
    v45 = v26;
    v46 = inputImage;
    v28 = process((void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1), self->inputModel, v21, 0, (uint64_t)v25);
    CGColorSpaceRelease(v25);
    return v28;
  }
LABEL_43:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = self->inputImage;
  }
  else
  {
    v33 = objc_msgSend(v5, "anyObject");
    v34 = self->inputImage;
    v43 = v33;
    v44 = v34;
    v29 = (CIImage *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  }
  return process(v29, self->inputModel, v21, -[NSNumber BOOLValue](self->inputSoftmaxNormalization, "BOOLValue"), 0);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (MLModel)inputModel
{
  return self->inputModel;
}

- (void)setInputModel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputHeadIndex
{
  return self->inputHeadIndex;
}

- (void)setInputHeadIndex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputSoftmaxNormalization
{
  return self->inputSoftmaxNormalization;
}

- (void)setInputSoftmaxNormalization:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (void)outputImage
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_3(), "description");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2(&dword_1921E4000, v0, v1, "%{public}@: Number of input CIImages does not match the inputModel input count.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
