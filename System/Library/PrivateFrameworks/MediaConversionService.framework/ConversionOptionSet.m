@implementation ConversionOptionSet

- (ConversionOptionSet)init
{
  ConversionOptionSet *v2;
  uint64_t v3;
  NSMutableArray *conversionOptionInputKeyValuePairs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ConversionOptionSet;
  v2 = -[ConversionOptionSet init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    conversionOptionInputKeyValuePairs = v2->_conversionOptionInputKeyValuePairs;
    v2->_conversionOptionInputKeyValuePairs = (NSMutableArray *)v3;

    v2->_repeatCount = 1;
  }
  return v2;
}

- (int)validateAndProcess
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  NSString *conversionType;
  void *v13;
  void *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *conversionOptions;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  const __CFString *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "knownConversionTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", self->_conversionType);

  if ((v4 & 1) != 0)
  {
    if (self->_presetName)
    {
      if (-[NSString isEqualToString:](self->_conversionType, "isEqualToString:", CFSTR("video")))
        -[ConversionOptionSet presetNameToOptionsMappingForVideoTranscoding](self, "presetNameToOptionsMappingForVideoTranscoding");
      else
        -[ConversionOptionSet presetNameToOptionsMappingForImageConversionOrVideoStillImageExtraction](self, "presetNameToOptionsMappingForImageConversionOrVideoStillImageExtraction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", self->_presetName);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        conversionType = self->_conversionType;
        -[ConversionOptionSet presetListForMapping:](self, "presetListForMapping:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Valid preset names for conversion type %@: %@\n"), conversionType, v13);

        goto LABEL_19;
      }
      v10 = (void *)v9;
      -[NSMutableArray addObjectsFromArray:](self->_conversionOptionInputKeyValuePairs, "addObjectsFromArray:", v9);

    }
    v11 = !-[NSString isEqualToString:](self->_conversionType, "isEqualToString:", CFSTR("still"))
       && -[NSMutableArray count](self->_conversionOptionInputKeyValuePairs, "count") == 0;
    if (!self->_sourcePath || !self->_destinationPath)
      goto LABEL_17;
    if (!self->_conversionType)
      v11 = 1;
    if (v11)
    {
LABEL_17:
      +[MediaConversionServiceCommandLineDriver usage](MediaConversionServiceCommandLineDriver, "usage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[MediaConversionServiceCommandLineDriver output:](MediaConversionServiceCommandLineDriver, "output:", CFSTR("%@\n"), v8);
LABEL_19:

      return 64;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "fileExistsAtPath:", self->_sourcePath) & 1) != 0)
    {
      v7 = -[ConversionOptionSet checkDestinationExists](self, "checkDestinationExists");
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        conversionOptions = self->_conversionOptions;
        self->_conversionOptions = v16;

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_conversionOptions, "setObject:forKeyedSubscript:", CFSTR("photosctl media-conversion"), CFSTR("PAMediaConversionServiceOptionRequestReasonKey"));
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v18 = self->_conversionOptionInputKeyValuePairs;
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v32;
          while (2)
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v32 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              v24 = objc_msgSend(v23, "rangeOfString:", CFSTR("="));
              if (v24)
                v25 = v24 == 0x7FFFFFFFFFFFFFFFLL;
              else
                v25 = 1;
              if (v25 || (v26 = v24, v24 == objc_msgSend(v23, "length") - 1))
              {
                +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Invalid conversion option '%@', expecting 'key=value' format\n"), v23);
LABEL_45:

                goto LABEL_49;
              }
              objc_msgSend(v23, "substringWithRange:", 0, v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "substringWithRange:", v26 + 1, objc_msgSend(v23, "length") + ~v26);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = -[ConversionOptionSet processConversionOptionKey:valueString:](self, "processConversionOptionKey:valueString:", v27, v28);

              if (!v29)
                goto LABEL_45;
            }
            v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
            if (v20)
              continue;
            break;
          }
        }

        if (!self->_sourcePathVideoComplement && !self->_destinationPathVideoComplement)
          goto LABEL_40;
        if ((-[NSString isEqual:](self->_conversionType, "isEqual:", CFSTR("image")) & 1) != 0)
        {
          if (self->_sourcePathVideoComplement)
          {
LABEL_40:
            if (self->_verbose)
              +[MediaConversionServiceCommandLineDriver output:](MediaConversionServiceCommandLineDriver, "output:", CFSTR("Conversion options: %@\n"), self->_conversionOptions);
            v7 = 0;
            goto LABEL_50;
          }
          v30 = CFSTR("--source-video-complement is required if --destination-video-complement is given\n");
        }
        else
        {
          v30 = CFSTR("--source-video-complement and --destination-video-complement are only valid for image conversions\n");
        }
        +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", v30);
LABEL_49:
        v7 = 65;
      }
    }
    else
    {
      +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Source path does not exist: %@\n"), self->_sourcePath);
      v7 = 66;
    }
LABEL_50:

    return v7;
  }
  objc_msgSend((id)objc_opt_class(), "knownConversionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MediaConversionServiceCommandLineDriver output:](MediaConversionServiceCommandLineDriver, "output:", CFSTR("Please specify a valid conversion type: %@\n"), v6);

  return 65;
}

- (int)checkDestinationExists
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  char v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_destinationPath && objc_msgSend(v3, "fileExistsAtPath:"))
    objc_msgSend(v4, "addObject:", self->_destinationPath);
  if (self->_destinationPathVideoComplement && objc_msgSend(v3, "fileExistsAtPath:"))
    objc_msgSend(v4, "addObject:", self->_destinationPathVideoComplement);
  if (!objc_msgSend(v4, "count"))
  {
LABEL_18:
    v14 = 0;
    goto LABEL_22;
  }
  if (self->_replaceExistingOutput)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v17 = 0;
          v11 = objc_msgSend(v3, "removeItemAtPath:error:", v10, &v17);
          v12 = v17;
          v13 = v12;
          if ((v11 & 1) == 0)
          {
            +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Unable to remove existing item at %@: %@\n"), v10, v12);

            goto LABEL_21;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v7)
          continue;
        break;
      }
    }

    goto LABEL_18;
  }
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Destination path(s) already exist(s): %@. Use --replace option to overwrite existing output files.\n"), v15);

LABEL_21:
  v14 = 73;
LABEL_22:

  return v14;
}

- (id)presetListForMapping:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)presetNameToOptionsMappingForVideoTranscoding
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[4];
  _QWORD v35[2];
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[9];
  _QWORD v42[11];

  v42[9] = *MEMORY[0x1E0C80C00];
  v41[0] = CFSTR("CPLResourceTypeVideoLargeSize");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ExportPresetName=%@"), *MEMORY[0x1E0C89E58]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v31;
  v2 = *MEMORY[0x1E0C8A2E8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OutputFileType=%@"), *MEMORY[0x1E0C8A2E8]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v30;
  v40[2] = CFSTR("AVIncludeMetadata=1");
  v40[3] = CFSTR("AVMetadataIncludeLocation=1");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v29;
  v41[1] = CFSTR("CPLResourceTypeVideoMediumSize");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ExportPresetName=%@"), *MEMORY[0x1E0C89E48]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v28;
  v3 = *MEMORY[0x1E0C8A2E0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OutputFileType=%@"), *MEMORY[0x1E0C8A2E0]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v27;
  v39[2] = CFSTR("AVIncludeMetadata=1");
  v39[3] = CFSTR("AVMetadataIncludeLocation=1");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v26;
  v41[2] = CFSTR("CPLResourceTypeVideoMediumSize+LivePhoto");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ExportPresetName=%@"), *MEMORY[0x1E0C89E40]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v25;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OutputFileType=%@"), v2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v24;
  v38[2] = CFSTR("AVIncludeMetadata=1");
  v38[3] = CFSTR("AVMetadataIncludeLocation=1");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v23;
  v41[3] = CFSTR("CPLResourceTypeVideoMediumSize+HDR");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ExportPresetName=%@"), *MEMORY[0x1E0C89E50]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v22;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OutputFileType=%@"), v2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v21;
  v37[2] = CFSTR("AVIncludeMetadata=1");
  v37[3] = CFSTR("AVMetadataIncludeLocation=1");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v20;
  v41[4] = CFSTR("CPLResourceTypeVideoSmallSize");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ExportPresetName=%@"), *MEMORY[0x1E0C89E30]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OutputFileType=%@"), v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v18;
  v36[2] = CFSTR("AVIncludeMetadata=1");
  v36[3] = CFSTR("AVMetadataIncludeLocation=1");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v17;
  v41[5] = CFSTR("CPLResourceTypeVideoMetaData");
  v35[0] = CFSTR("IsVideoMetadataTrackExtraction=1");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OutputFileType=%@"), v2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v15;
  v41[6] = CFSTR("CPLResourceTypeVideoSmallSize+LivePhoto");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ExportPresetName=%@"), *MEMORY[0x1E0C89E38]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OutputFileType=%@"), v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v5;
  v34[2] = CFSTR("AVIncludeMetadata=1");
  v34[3] = CFSTR("AVMetadataIncludeLocation=1");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v6;
  v41[7] = CFSTR("PhotostreamSmall");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ExportPresetName=%@"), *MEMORY[0x1E0C89EA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OutputFileType=%@"), v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v8;
  v33[2] = CFSTR("AVIncludeMetadata=1");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v9;
  v41[8] = CFSTR("Photostream");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ExportPresetName=%@"), *MEMORY[0x1E0C89EA8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OutputFileType=%@"), v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v11;
  v32[2] = CFSTR("AVIncludeMetadata=1");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[8] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)presetNameToOptionsMappingForImageConversionOrVideoStillImageExtraction
{
  return &unk_1E995BE90;
}

- (BOOL)processConversionOptionKey:(id)a3 valueString:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *conversionOptions;
  double v10;
  double v11;
  double v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  unint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  if (!self->_conversionOptions)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    conversionOptions = self->_conversionOptions;
    self->_conversionOptions = v8;

  }
  if (processConversionOptionKey_valueString__onceToken != -1)
    dispatch_once(&processConversionOptionKey_valueString__onceToken, &__block_literal_global_836);
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("SharedStreamsDimensions")))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PAMediaConversionServiceOption%@Key"), v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)processConversionOptionKey_valueString__knownConversionOptions, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_conversionOptions, "objectForKeyedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v20 = objc_msgSend(v17, "integerValue");
        -[ConversionOptionSet conversionOptionValueForString:valueType:](self, "conversionOptionValueForString:valueType:", v7, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v21 != 0;
        if (v21)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_conversionOptions, "setObject:forKeyedSubscript:", v21, v16);
        }
        else
        {
          if (v20 > 0xC)
            v22 = 0;
          else
            v22 = off_1E99533A0[v20];
          v23 = v22;
          +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Unable to create value of type %@ from string '%@' for option '%@'\n"), v23, v7, v6);

        }
        goto LABEL_30;
      }
      +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Conversion option '%@' passed more than once, must be unique\n"), v6);
    }
    else
    {
      +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Unknown conversion option '%@'\n"), v6);
    }
    LOBYTE(v15) = 0;
LABEL_30:

    goto LABEL_31;
  }
  if (!-[NSString isEqualToString:](self->_conversionType, "isEqualToString:", CFSTR("image")))
  {
    v19 = CFSTR("Conversion option SharedStreamsDimensions is only valid for images\n");
LABEL_23:
    +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", v19, v25);
    goto LABEL_24;
  }
  objc_msgSend((id)objc_opt_class(), "sizeForImageAtPath:", self->_sourcePath);
  if (v11 == *MEMORY[0x1E0C9D820] && v10 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Unable to determine input image size for %@\n"), self->_sourcePath);
LABEL_24:
    LOBYTE(v15) = 0;
    goto LABEL_31;
  }
  -[ConversionOptionSet scaleFactorForInputSize:sharedStreamsSizeSpecificationString:](self, "scaleFactorForInputSize:sharedStreamsSizeSpecificationString:", v7);
  if (v13 == 0.0)
  {
    v19 = CFSTR("Unable to determine scale factor\n");
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_conversionOptions, "setObject:forKeyedSubscript:", v14, CFSTR("PAMediaConversionServiceOptionScaleFactorKey"));

  LOBYTE(v15) = 1;
LABEL_31:

  return v15;
}

- (double)scaleFactorForInputSize:(CGSize)a3 sharedStreamsSizeSpecificationString:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  height = a3.height;
  width = a3.width;
  v6 = a4;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 3)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    if (width >= height)
      v17 = height;
    else
      v17 = width;
    if (width >= height)
      v18 = width;
    else
      v18 = height;
    v19 = v10 / v17;
    v20 = floor(v18 * v19);
    if (v20 >= v13)
    {
      if (v20 > v16)
        v19 = v16 / v18;
    }
    else
    {
      v19 = v13 / v18;
    }
    if (v19 <= 1.0)
      v21 = v19;
    else
      v21 = 1.0;
  }
  else
  {
    +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Unable to get values from size specification string %@\n"), v6);
    v21 = 0.0;
  }

  return v21;
}

- (id)conversionOptionValueForString:(id)a3 valueType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setNumberStyle:", 1);
  v8 = (void *)objc_opt_new();
  v9 = v8;
  switch(a4)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unable to create value from string %@ for unknown value type"), v6);
      goto LABEL_4;
    case 1uLL:
      v12 = v6;
      goto LABEL_13;
    case 2uLL:
      objc_msgSend(v7, "numberFromString:", v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 3uLL:
      objc_msgSend(v8, "dateFromString:", v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 4uLL:
      -[ConversionOptionSet pfVideoAdjustmentsDictionaryForString:](self, "pfVideoAdjustmentsDictionaryForString:", v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 5uLL:
      -[ConversionOptionSet cmTimeRangeDictionaryForString:](self, "cmTimeRangeDictionaryForString:", v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 6uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
      v10 = off_1E99533A0[a4];
      +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Value type %@ is not supported\n"), v10);

      goto LABEL_4;
    case 7uLL:
      -[ConversionOptionSet arrayOfStringsForString:](self, "arrayOfStringsForString:", v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 8uLL:
      -[ConversionOptionSet metadataPolicyForString:](self, "metadataPolicyForString:", v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 9uLL:
      -[ConversionOptionSet photosAdjustmentsDictionaryForString:](self, "photosAdjustmentsDictionaryForString:", v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v11 = v12;
      break;
    default:
LABEL_4:
      v11 = 0;
      break;
  }

  return v11;
}

- (id)arrayOfStringsForString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = a3;
  objc_msgSend(v3, "substringToIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__ConversionOptionSet_arrayOfStringsForString___block_invoke;
  v10[3] = &__block_descriptor_40_e25_B32__0__NSString_8Q16_B24l;
  v10[4] = v6 - 1;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)metadataPolicyForString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("default")))
  {
    +[PAMediaConversionServiceDefaultImageMetadataPolicy standardPolicy](PAMediaConversionServiceDefaultImageMetadataPolicy, "standardPolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PAMediaConversionServiceCompositeImageMetadataPolicy policyWithPolicies:](PAMediaConversionServiceCompositeImageMetadataPolicy, "policyWithPolicies:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "hasPrefix:", CFSTR("set-livephoto-id:")))
    {
      +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("metadata policy %@ is not supported\n"), v3);
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D75140], "livePhotoPairingIdentifierMetadataKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PAMediaConversionServiceAddPFMetadataPolicy policyWithKey:value:](PAMediaConversionServiceAddPFMetadataPolicy, "policyWithKey:value:", v5, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;

LABEL_7:
  return v8;
}

- (id)cmTimeRangeDictionaryForString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  CFDictionaryRef v21;
  void *v22;
  CMTimeRange start;
  CMTime duration;
  CMTimeRange v26;
  CMTime v27;
  CMTime v28;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^(\\d+)/(\\d+):(\\d+)/(\\d+)$"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    memset(&v28, 0, sizeof(v28));
    v7 = objc_msgSend(v5, "rangeAtIndex:", 1);
    objc_msgSend(v3, "substringWithRange:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");
    v11 = objc_msgSend(v6, "rangeAtIndex:", 2);
    objc_msgSend(v3, "substringWithRange:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake(&v28, v10, objc_msgSend(v13, "integerValue"));

    memset(&v27, 0, sizeof(v27));
    v14 = objc_msgSend(v6, "rangeAtIndex:", 3);
    objc_msgSend(v3, "substringWithRange:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");
    v18 = objc_msgSend(v6, "rangeAtIndex:", 4);
    objc_msgSend(v3, "substringWithRange:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake(&v27, v17, objc_msgSend(v20, "integerValue"));

    memset(&v26, 0, sizeof(v26));
    start.start = v28;
    duration = v27;
    CMTimeRangeMake(&v26, &start.start, &duration);
    start = v26;
    v21 = CMTimeRangeCopyAsDictionary(&start, 0);
    CFAutorelease(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Unable to parse string %@ as a CMTimeRange. Expected format is <value>/<timescale>:<value>/<timescale>, the first pair is the start time, the second pair is the duration.\n"), v3);
    v22 = 0;
  }

  return v22;
}

- (id)photosAdjustmentsDictionaryForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "stringByExpandingTildeInPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if (v7)
  {
    -[ConversionOptionSet photosAdjustmentsDictionaryForAdjustmentsFileAtPath:](self, "photosAdjustmentsDictionaryForAdjustmentsFileAtPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(":"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count") == 3)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v12, 0);
      v14 = (void *)v13;
      if (v13)
      {
        v16[0] = CFSTR("PAMediaConversionServiceAdjustmentFormatIdentifierKey");
        v16[1] = CFSTR("PAMediaConversionServiceAdjustmentFormatVersionKey");
        v17[0] = v10;
        v17[1] = v11;
        v16[2] = CFSTR("PAMediaConversionServiceAdjustmentDataKey");
        v17[2] = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Unable to parse photos adjustment option string. Unable to decode base64 encoded adjustment data\n"));
        v8 = 0;
      }

    }
    else
    {
      +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Unable to parse photos adjustment option string. Expected format is a path to an existing adjustment plist file or a colon-separated tuple of <format-identifier>:<format-version>:<base64 encoded adjustment data>\n"));
      v8 = 0;
    }

  }
  return v8;
}

- (id)pfVideoAdjustmentsDictionaryForString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 5)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
    if (v7)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "integerValue");

      objc_msgSend(v3, "objectAtIndexedSubscript:", 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      v16[0] = CFSTR("adjustmentFormatIdentifier");
      v16[1] = CFSTR("adjustmentFormatVersion");
      v17[0] = v4;
      v17[1] = v5;
      v17[2] = v7;
      v16[2] = CFSTR("adjustmentData");
      v16[3] = CFSTR("adjustmentBaseVersion");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[3] = v12;
      v16[4] = CFSTR("adjustmentRenderTypes");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[4] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Unable to parse photos adjustment option string. Unable to decode base64 encoded adjustment data\n"));
      v14 = 0;
    }

  }
  else
  {
    +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Unable to parse photos adjustment option string. Expected format is a colon-separated tuple of <format-identifier>:<format-version>:<base64 encoded adjustment data>:<adjustment-base-version>:<adjustment-render-types>\n"));
    v14 = 0;
  }

  return v14;
}

- (id)photosAdjustmentsDictionaryForAdjustmentsFileAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v14;
  id v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v4, "dictionaryWithContentsOfURL:error:", v5, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75398]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D753A8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75388]);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v8)
      v12 = v9 == 0;
    else
      v12 = 1;
    if (v12 || v10 == 0)
    {
      +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Unable to parse photos adjustment option string. Interpreted as file path, but some expected information is missing in file %@\n"), v3);
      v14 = 0;
    }
    else
    {
      v17[0] = CFSTR("PAMediaConversionServiceAdjustmentFormatIdentifierKey");
      v17[1] = CFSTR("PAMediaConversionServiceAdjustmentFormatVersionKey");
      v18[0] = v8;
      v18[1] = v9;
      v17[2] = CFSTR("PAMediaConversionServiceAdjustmentDataKey");
      v18[2] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[MediaConversionServiceCommandLineDriver outputError:](MediaConversionServiceCommandLineDriver, "outputError:", CFSTR("Unable to parse photos adjustment option string. Interpreted as file path, but unable to read adjustment plist file: %@\n"), v7);
    v14 = 0;
  }

  return v14;
}

- (NSString)conversionType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConversionType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)sourcePath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSourcePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)sourcePathVideoComplement
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSourcePathVideoComplement:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)destinationPath
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDestinationPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)destinationPathVideoComplement
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDestinationPathVideoComplement:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableArray)conversionOptionInputKeyValuePairs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConversionOptionInputKeyValuePairs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)presetName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPresetName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (int64_t)repeatCount
{
  return self->_repeatCount;
}

- (void)setRepeatCount:(int64_t)a3
{
  self->_repeatCount = a3;
}

- (NSMutableDictionary)conversionOptions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setConversionOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)replaceExistingOutput
{
  return self->_replaceExistingOutput;
}

- (void)setReplaceExistingOutput:(BOOL)a3
{
  self->_replaceExistingOutput = a3;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversionOptions, 0);
  objc_storeStrong((id *)&self->_presetName, 0);
  objc_storeStrong((id *)&self->_conversionOptionInputKeyValuePairs, 0);
  objc_storeStrong((id *)&self->_destinationPathVideoComplement, 0);
  objc_storeStrong((id *)&self->_destinationPath, 0);
  objc_storeStrong((id *)&self->_sourcePathVideoComplement, 0);
  objc_storeStrong((id *)&self->_sourcePath, 0);
  objc_storeStrong((id *)&self->_conversionType, 0);
}

uint64_t __47__ConversionOptionSet_arrayOfStringsForString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;

  v5 = a2;
  v6 = v5;
  if (a3)
    a3 = *(_QWORD *)(a1 + 32) != a3 || objc_msgSend(v5, "length");

  return a3;
}

void __62__ConversionOptionSet_processConversionOptionKey_valueString___block_invoke()
{
  objc_storeStrong((id *)&processConversionOptionKey_valueString__knownConversionOptions, &unk_1E995BEB8);
}

+ (id)knownConversionTypes
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("image");
  v3[1] = CFSTR("video");
  v3[2] = CFSTR("still");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (CGSize)sizeForImageAtPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PAMediaConversionServiceImagingUtilities primaryImagePropertiesForFileAtURL:](PAMediaConversionServiceImagingUtilities, "primaryImagePropertiesForFileAtURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)objc_msgSend(v5, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (double)objc_msgSend(v7, "integerValue");

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

@end
