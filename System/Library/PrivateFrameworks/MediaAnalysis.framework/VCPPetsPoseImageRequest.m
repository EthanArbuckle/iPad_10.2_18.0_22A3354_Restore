@implementation VCPPetsPoseImageRequest

- (VCPPetsPoseImageRequest)init
{
  uint8_t v4[16];

  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Not implemented, please use initWithOptions", v4, 2u);
  }

  return 0;
}

- (VCPPetsPoseImageRequest)initWithOptions:(id)a3
{
  id v4;
  VCPPetsPoseImageRequest *v5;
  VCPPetsPoseImageRequest *v6;
  int maxNumPets;
  VCPImagePetsKeypointsAnalyzer *v8;
  VCPImagePetsKeypointsAnalyzer *analyzer;
  VCPImagePetsKeypointsAnalyzer *v10;
  VCPPetsPoseImageRequest *v11;
  VCPPetsPoseImageRequest *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VCPPetsPoseImageRequest;
  v5 = -[VCPRequest initWithOptions:](&v14, sel_initWithOptions_, v4);
  v6 = v5;
  if (v5)
  {
    maxNumPets = v5->super._maxNumPets;
    if (maxNumPets <= 0)
      maxNumPets = 2;
    v5->super._maxNumPets = maxNumPets;
    v8 = -[VCPImagePetsKeypointsAnalyzer initWithMaxNumRegions:forceCPU:sharedModel:]([VCPImagePetsKeypointsAnalyzer alloc], "initWithMaxNumRegions:forceCPU:sharedModel:", v5->super._maxNumPets, v5->super._useCPUOnly, 0);
    analyzer = v6->_analyzer;
    v6->_analyzer = v8;

    v10 = v6->_analyzer;
    if (v10)
      -[VCPImagePetsKeypointsAnalyzer preferredInputFormat:height:format:](v10, "preferredInputFormat:height:format:", &v6->_preferredWidth, &v6->_preferredHeight, &v6->_preferredFormat);
  }
  if (v6->_analyzer)
    v11 = v6;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (int)parseResults:(id)a3 observations:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  VCPKeypoint *v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  void *v20;
  void *v21;
  NSString *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t i;
  id obj;
  void *v33;
  id v34;
  void *v35;
  VCPPetsObservation *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;
  NSRect v48;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33 = v5;
  v34 = a4;
  if (v34)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v6)
    {
      v28 = v6;
      v29 = *(_QWORD *)v42;
      while (2)
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v42 != v29)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("attributes"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("petsKeypoints"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v35, "count") != 25)
          {
LABEL_21:

            v26 = -18;
            goto LABEL_23;
          }
          v36 = objc_alloc_init(VCPPetsObservation);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v9 = v35;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v10)
          {
            v11 = *(_QWORD *)v38;
            while (2)
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v38 != v11)
                  objc_enumerationMutation(v9);
                v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
                if (objc_msgSend(v13, "count") != 3)
                {

                  goto LABEL_21;
                }
                v14 = objc_alloc_init(VCPKeypoint);
                objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "floatValue");
                v17 = v16;
                objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "floatValue");
                -[VCPKeypoint setLocation:](v14, "setLocation:", v17, v19);

                objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "floatValue");
                -[VCPKeypoint setConfidence:](v14, "setConfidence:");

                objc_msgSend(v8, "addObject:", v14);
              }
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              if (v10)
                continue;
              break;
            }
          }

          -[VCPPetsObservation setKeypoints:](v36, "setKeypoints:", v8);
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("attributes"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("petsBounds"));
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          v48 = NSRectFromString(v22);
          -[VCPPetsObservation setBounds:](v36, "setBounds:", v48.origin.x, v48.origin.y, v48.size.width, v48.size.height);

          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("attributes"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("petsType"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "intValue");

          -[VCPPetsObservation setPetsType:](v36, "setPetsType:", v25 != 0);
          -[VCPPetsObservation setRevision:](v36, "setRevision:", 1);
          objc_msgSend(v34, "addObject:", v36);

        }
        v26 = 0;
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        if (v28)
          continue;
        break;
      }
    }
    else
    {
      v26 = 0;
    }
LABEL_23:

  }
  else
  {
    v26 = -50;
  }

  return v26;
}

- (id)processImage:(__CVBuffer *)a3 withOptions:(id)a4 error:(id *)a5
{
  void *v8;
  VCPImagePetsKeypointsAnalyzer *analyzer;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v17;
  uint64_t v18;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  analyzer = self->_analyzer;
  if (analyzer)
  {
    v17 = 0;
    v10 = -[VCPImagePetsKeypointsAnalyzer analyzePixelBuffer:flags:results:cancel:](analyzer, "analyzePixelBuffer:flags:results:cancel:", a3, &v18, &v17, &__block_literal_global_70);
    v11 = v17;
    v12 = v11;
    if (!v10)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PetsKeypointsResults"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13
        || (objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PetsKeypointsResults")),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = -[VCPPetsPoseImageRequest parseResults:observations:](self, "parseResults:observations:", v14, v8),
            v14,
            !v10))
      {
        v15 = v8;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v12 = 0;
    v10 = -18;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v10, 0);
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_10:

  return v15;
}

uint64_t __58__VCPPetsPoseImageRequest_processImage_withOptions_error___block_invoke()
{
  return 0;
}

- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4
{
  VCPImagePetsKeypointsAnalyzer *analyzer;
  double preferredWidth;
  double preferredHeight;
  CGSize result;

  analyzer = self->_analyzer;
  if (analyzer)
    -[VCPImagePetsKeypointsAnalyzer preferredInputFormat:height:format:](analyzer, "preferredInputFormat:height:format:", &self->_preferredWidth, &self->_preferredHeight, &self->_preferredFormat);
  preferredWidth = (double)self->_preferredWidth;
  preferredHeight = (double)self->_preferredHeight;
  result.height = preferredHeight;
  result.width = preferredWidth;
  return result;
}

- (unsigned)preferredPixelFormat
{
  return self->_preferredFormat;
}

- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4
{
  VCPImagePetsKeypointsAnalyzer *analyzer;

  analyzer = self->_analyzer;
  self->_analyzer = 0;

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzer, 0);
}

@end
