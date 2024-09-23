@implementation AVTImageValidator

+ ($8452678F12DBC466148836A9D382CAFC)_calculateStatistics:(SEL)a3 withSize:(CGImage *)a4
{
  double height;
  double width;
  size_t v9;
  size_t v10;
  size_t v11;
  void *v12;
  CGColorSpace *DeviceRGB;
  CGContext *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  size_t v26;
  uint64_t v27;
  size_t v28;
  unsigned __int8 *v29;
  size_t i;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  float v38;
  double v39;
  float v40;
  double v41;
  float v42;
  double v43;
  double v44;
  double v45;
  double v46;
  $8452678F12DBC466148836A9D382CAFC *result;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGRect v57;

  height = a5.height;
  width = a5.width;
  v9 = (unint64_t)a5.width;
  v10 = (unint64_t)a5.height;
  v11 = 4 * (unint64_t)a5.width;
  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  v12 = malloc_type_malloc(v11 * (unint64_t)a5.height, 0xDC59A542uLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v14 = CGBitmapContextCreate(v12, v9, v10, 8uLL, v11, DeviceRGB, 0x4001u);
  v57.size.width = (double)(unint64_t)width;
  v57.size.height = (double)(unint64_t)height;
  v57.origin.x = 0.0;
  v57.origin.y = 0.0;
  CGContextDrawImage(v14, v57, a4);
  CGContextRelease(v14);
  CGColorSpaceRelease(DeviceRGB);
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 1;
  do
  {
    v25 = v24;
    v26 = qword_1DCA6A210[v15];
    if (v26 < v10)
    {
      v27 = (uint64_t)v12 + (v11 + 4) * v26 + 3;
      v28 = v26;
      do
      {
        v29 = (unsigned __int8 *)v27;
        for (i = v26; i < v9; v29 += 4 * v26)
        {
          v31 = *(v29 - 3);
          v23 += v31;
          v32 = *(v29 - 2);
          v22 += v32;
          v33 = *(v29 - 1);
          v21 += v33;
          v20 += *v29;
          v19 += (v31 * v31);
          v18 += (v32 * v32);
          v17 += (v33 * v33);
          ++v16;
          i += v26;
        }
        v28 += v26;
        v27 += v11 * v26;
      }
      while (v28 < v10);
    }
    v24 = 0;
    v15 = 1;
  }
  while ((v25 & 1) != 0);
  v34 = 1.0 / (double)v16;
  v35 = (unint64_t)(v34 * (double)v23);
  v36 = (unint64_t)(v34 * (double)v22);
  v37 = (unint64_t)(v34 * (double)v21);
  v38 = fmax(-((double)(v35 * v35) - (double)v19 * v34), 0.0);
  v39 = sqrtf(v38);
  v40 = fmax(-((double)(v36 * v36) - (double)v18 * v34), 0.0);
  v41 = sqrtf(v40);
  v42 = fmax(-((double)(v37 * v37) - (double)v17 * v34), 0.0);
  v43 = sqrtf(v42);
  v55 = 0.0;
  v56 = 0.0;
  v54 = 0.0;
  v51 = 0.0;
  v52 = 0.0;
  v44 = (double)v35 * 0.00392156863;
  v45 = (double)v36 * 0.00392156863;
  v46 = (double)v37 * 0.00392156863;
  __AVT_RGBtoHSV(&v56, &v55, &v54, v44, v45, v46);
  result = ($8452678F12DBC466148836A9D382CAFC *)__AVT_RGBtoHSV(&v53, &v52, &v51, v39 * 0.00392156863, v41 * 0.00392156863, v43 * 0.00392156863);
  if (a4)
    free(v12);
  retstr->var0 = v44;
  retstr->var1 = v45;
  retstr->var2 = v46;
  retstr->var3 = v56;
  v48 = v54;
  retstr->var4 = v55;
  retstr->var5 = v48;
  v49 = v52;
  v50 = v51;
  retstr->var6 = (double)(unint64_t)(v34 * (double)v20) * 0.00392156863;
  retstr->var7 = v50;
  retstr->var8 = v49;
  return result;
}

+ (BOOL)isImageValid:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  if (!v5)
  {
    if (!a4)
    {
      LOBYTE(v6) = 0;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0D00868], "errorWithCode:userInfo:", 606, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = 0;
    goto LABEL_10;
  }
  v6 = objc_opt_class();
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "CGImage", 0, 0, 0, 0, 0, 0);
  objc_msgSend(v7, "size");
  if (v6)
  {
    objc_msgSend((id)v6, "_calculateStatistics:withSize:", v8);
    LOBYTE(v6) = 0.0 > 2.22044605e-16;
    if (!a4)
      goto LABEL_12;
  }
  else if (!a4)
  {
    goto LABEL_12;
  }
  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D00868], "errorWithCode:userInfo:", 605, 0, 0.0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    *a4 = v9;
  }
LABEL_12:

  return v6;
}

+ (id)sharedValidator
{
  if (sharedValidator_onceToken != -1)
    dispatch_once(&sharedValidator_onceToken, &__block_literal_global_17);
  return (id)sharedValidator__validator;
}

void __36__AVTImageValidator_sharedValidator__block_invoke()
{
  AVTImageValidator *v0;
  void *v1;

  v0 = objc_alloc_init(AVTImageValidator);
  v1 = (void *)sharedValidator__validator;
  sharedValidator__validator = (uint64_t)v0;

}

- (AVTImageValidator)init
{
  AVTImageValidatorConfiguration *v3;
  void *v4;
  AVTImageValidator *v5;

  v3 = objc_alloc_init(AVTImageValidatorConfiguration);
  -[AVTImageValidatorConfiguration setShouldCheckForDuplicateImages:](v3, "setShouldCheckForDuplicateImages:", 1);
  -[AVTImageValidatorConfiguration setShouldCheckForTransparentImages:](v3, "setShouldCheckForTransparentImages:", 1);
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AVTImageValidator initWithConfiguration:environment:](self, "initWithConfiguration:environment:", v3, v4);

  return v5;
}

- (AVTImageValidator)initWithConfiguration:(id)a3 environment:(id)a4
{
  id v7;
  id v8;
  AVTImageValidator *v9;
  AVTImageValidator *v10;
  uint64_t v11;
  NSMutableDictionary *fileNameToImageHashesMap;
  uint64_t v13;
  NSMutableDictionary *imageHashesToFileNameMap;
  uint64_t v15;
  NSMutableDictionary *imageHashesToAvatarDataHashesMap;
  void (**v17)(_QWORD, _QWORD);
  uint64_t v18;
  OS_dispatch_queue *duplicateValidationQueue;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)AVTImageValidator;
  v9 = -[AVTImageValidator init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    fileNameToImageHashesMap = v10->_fileNameToImageHashesMap;
    v10->_fileNameToImageHashesMap = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    imageHashesToFileNameMap = v10->_imageHashesToFileNameMap;
    v10->_imageHashesToFileNameMap = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    imageHashesToAvatarDataHashesMap = v10->_imageHashesToAvatarDataHashesMap;
    v10->_imageHashesToAvatarDataHashesMap = (NSMutableDictionary *)v15;

    objc_msgSend(v8, "serialQueueProvider");
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v17)[2](v17, "com.apple.AvatarUI.AVTImageValidator");
    v18 = objc_claimAutoreleasedReturnValue();
    duplicateValidationQueue = v10->_duplicateValidationQueue;
    v10->_duplicateValidationQueue = (OS_dispatch_queue *)v18;

  }
  return v10;
}

- (BOOL)validateImageIsNotTransparent:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  char v9;

  v6 = a3;
  -[AVTImageValidator configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldCheckForTransparentImages");

  if (v8)
    v9 = objc_msgSend((id)objc_opt_class(), "isImageValid:error:", v6, a4);
  else
    v9 = 1;

  return v9;
}

- (BOOL)validateImageDataIsNotDuplicate:(id)a3 forFileName:(id)a4 avatarDataHash:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  id v15;
  BOOL v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[AVTImageValidator configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldCheckForDuplicateImages");

  if (v12)
  {
    if (!v8)
    {
      v16 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v8, "avt_SHA256");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTImageValidator duplicateValidationQueue](self, "duplicateValidationQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __80__AVTImageValidator_validateImageDataIsNotDuplicate_forFileName_avatarDataHash___block_invoke;
    v18[3] = &unk_1EA51EA70;
    v18[4] = self;
    v19 = v13;
    v20 = v9;
    v21 = v10;
    v15 = v13;
    dispatch_sync(v14, v18);

  }
  v16 = 1;
LABEL_6:

  return v16;
}

void __80__AVTImageValidator_validateImageDataIsNotDuplicate_forFileName_avatarDataHash___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "imageHashesToFileNameMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 48));
  if (!v6
    || (v3 & 1) != 0
    || *(_QWORD *)(a1 + 56)
    && (objc_msgSend(*(id *)(a1 + 32), "imageHashesToAvatarDataHashesMap"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        LODWORD(v4) = objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", v5),
        v5,
        (_DWORD)v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "nts_addHash:forKey:avatarDataHash:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

- (void)nts_addHash:(id)a3 forKey:(id)a4 avatarDataHash:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v8 = a5;
  v9 = a3;
  -[AVTImageValidator fileNameToImageHashesMap](self, "fileNameToImageHashesMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AVTImageValidator imageHashesToFileNameMap](self, "imageHashesToFileNameMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v11);

    -[AVTImageValidator imageHashesToAvatarDataHashesMap](self, "imageHashesToAvatarDataHashesMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v11);

  }
  -[AVTImageValidator imageHashesToFileNameMap](self, "imageHashesToFileNameMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, v9);

  -[AVTImageValidator imageHashesToAvatarDataHashesMap](self, "imageHashesToAvatarDataHashesMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, v9);

}

- (OS_dispatch_queue)duplicateValidationQueue
{
  return self->_duplicateValidationQueue;
}

- (void)setDuplicateValidationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_duplicateValidationQueue, a3);
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (AVTImageValidatorConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSMutableDictionary)fileNameToImageHashesMap
{
  return self->_fileNameToImageHashesMap;
}

- (void)setFileNameToImageHashesMap:(id)a3
{
  objc_storeStrong((id *)&self->_fileNameToImageHashesMap, a3);
}

- (NSMutableDictionary)imageHashesToAvatarDataHashesMap
{
  return self->_imageHashesToAvatarDataHashesMap;
}

- (void)setImageHashesToAvatarDataHashesMap:(id)a3
{
  objc_storeStrong((id *)&self->_imageHashesToAvatarDataHashesMap, a3);
}

- (NSMutableDictionary)imageHashesToFileNameMap
{
  return self->_imageHashesToFileNameMap;
}

- (void)setImageHashesToFileNameMap:(id)a3
{
  objc_storeStrong((id *)&self->_imageHashesToFileNameMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageHashesToFileNameMap, 0);
  objc_storeStrong((id *)&self->_imageHashesToAvatarDataHashesMap, 0);
  objc_storeStrong((id *)&self->_fileNameToImageHashesMap, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_duplicateValidationQueue, 0);
}

@end
