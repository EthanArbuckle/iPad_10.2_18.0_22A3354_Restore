@implementation CIAffineClamp

+ (id)customAttributes
{
  uint64_t v2;
  CGAffineTransform v4;
  _QWORD v5[3];
  _QWORD v6[3];
  _QWORD v7[4];
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  memset(&v4, 0, sizeof(v4));
  CGAffineTransformMakeScale(&v4, 0.4, 0.4);
  v2 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", MEMORY[0x1E0C9BAA8], "{CGAffineTransform=dddddd}");
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryTileEffect");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v9[1] = CFSTR("6");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.4");
  v8[3] = CFSTR("inputTransform");
  v5[0] = CFSTR("CIAttributeType");
  v5[1] = CFSTR("CIAttributeDefault");
  v6[0] = CFSTR("CIAttributeTypeTransform");
  v6[1] = v2;
  v5[2] = CFSTR("CIAttributeIdentity");
  v6[2] = v2;
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
}

- (id)outputImage
{
  NSValue *inputTransform;
  const char *v4;
  __int128 v5;
  __int128 v6;
  _BOOL4 IsInfinite;
  CIImage *inputImage;
  __int128 *v9;
  CIImage *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CGRect v31;

  if (!self->inputImage)
    return 0;
  inputTransform = self->inputTransform;
  if (!inputTransform)
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v25 = *MEMORY[0x1E0C9BAA8];
    v26 = v5;
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && -[NSValue count](inputTransform, "count") == 6)
      {
        objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 0), "doubleValue");
        *(_QWORD *)&v25 = v12;
        objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 1), "doubleValue");
        *((_QWORD *)&v25 + 1) = v13;
        objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 2), "doubleValue");
        *(_QWORD *)&v26 = v14;
        objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 3), "doubleValue");
        *((_QWORD *)&v26 + 1) = v15;
        objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 4), "doubleValue");
        *(_QWORD *)&v27 = v16;
        objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 5), "doubleValue");
        *((_QWORD *)&v27 + 1) = v17;
        goto LABEL_11;
      }
      goto LABEL_20;
    }
    v29 = 0u;
    v30 = 0u;
    v28 = 0u;
    -[NSValue transformStruct](inputTransform, "transformStruct");
    v25 = 0u;
    v26 = 0u;
    v6 = 0u;
LABEL_10:
    v27 = v6;
    goto LABEL_11;
  }
  v4 = -[NSValue objCType](inputTransform, "objCType");
  if (strcmp(v4, "{CGAffineTransform=dddddd}") && strcmp(v4, "{?=dddddd}"))
  {
LABEL_20:
    v18 = ci_logger_filter();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CIAffineClamp outputImage].cold.1((uint64_t)self, v18);
    return 0;
  }
  -[NSValue getValue:size:](inputTransform, "getValue:size:", &v25, 48);
LABEL_11:
  if (fabs(*(double *)&v25 * *((double *)&v26 + 1) - *((double *)&v25 + 1) * *(double *)&v26) < 0.0016)
  {
    v25 = 0u;
    v26 = 0u;
  }
  -[CIImage extent](self->inputImage, "extent");
  IsInfinite = CGRectIsInfinite(v31);
  inputImage = self->inputImage;
  if (IsInfinite)
  {
    v22 = v25;
    v23 = v26;
    v24 = v27;
    v9 = &v22;
    v10 = inputImage;
  }
  else
  {
    -[CIImage extent](inputImage, "extent");
    v10 = -[CIImage imageByClampingToRect:](inputImage, "imageByClampingToRect:");
    v19 = v25;
    v20 = v26;
    v21 = v27;
    v9 = &v19;
  }
  return -[CIImage imageByApplyingTransform:](v10, "imageByApplyingTransform:", v9, v19, v20, v21, v22, v23, v24);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSValue)inputTransform
{
  return self->inputTransform;
}

- (void)setInputTransform:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (void)outputImage
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = objc_msgSend((id)objc_opt_class(), "description");
  _os_log_error_impl(&dword_1921E4000, a2, OS_LOG_TYPE_ERROR, "%{public}@: inputTransfom is not a valid object.", (uint8_t *)&v3, 0xCu);
}

@end
