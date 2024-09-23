@implementation PHAssetPhotosInfoPanelExtendedProperties

- (PHAssetPhotosInfoPanelExtendedProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetPhotosInfoPanelExtendedProperties *v10;
  BOOL v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  NSString *v37;
  NSString *cameraMake;
  NSString *v39;
  NSString *cameraModel;
  NSString *v41;
  NSString *lensModel;
  NSNumber *v43;
  NSNumber *flashFired;
  NSNumber *v45;
  NSNumber *whiteBalance;
  NSNumber *v47;
  NSNumber *meteringMode;
  NSNumber *v49;
  NSNumber *iso;
  NSNumber *v51;
  NSNumber *focalLength;
  NSNumber *v53;
  NSNumber *focalLengthIn35mm;
  NSNumber *v55;
  NSNumber *exposureBias;
  NSNumber *v57;
  NSNumber *aperture;
  NSNumber *v59;
  NSNumber *shutterSpeed;
  NSString *v61;
  NSString *codec;
  NSNumber *v63;
  NSNumber *fps;
  NSNumber *v65;
  NSNumber *duration;
  NSNumber *v67;
  NSNumber *sampleRate;
  NSNumber *v69;
  NSNumber *bitrate;
  NSNumber *v71;
  NSNumber *trackFormat;
  NSString *v73;
  NSString *formattedCameraModel;
  NSString *v75;
  NSNumber *v76;
  NSNumber *semanticStylePreset;
  NSNumber *v78;
  NSNumber *v79;
  NSNumber *digitalZoomRatio;
  NSNumber *v81;
  NSDate *v82;
  NSDate *dateCreated;
  NSDate *v84;
  NSNumber *v85;
  NSNumber *timezoneOffset;
  NSNumber *v87;
  NSString *v88;
  NSString *timezoneName;
  NSString *v90;
  NSNumber *v91;
  NSNumber *generativeAIType;
  NSNumber *v93;
  NSString *v94;
  NSString *credit;
  PHAssetPhotosInfoPanelExtendedProperties *v96;
  NSNumber *v98;
  NSNumber *v99;
  NSNumber *v100;
  NSNumber *v101;
  NSNumber *v102;
  NSString *v103;
  NSString *v104;
  const __CFString *v105;
  NSNumber *v106;
  const __CFString *v107;
  NSNumber *v108;
  const __CFString *v109;
  NSNumber *v110;
  const __CFString *v111;
  NSNumber *v112;
  const __CFString *v113;
  NSString *v114;
  const __CFString *v115;
  NSNumber *v116;
  const __CFString *v117;
  NSNumber *v118;
  const __CFString *v119;
  NSNumber *v120;
  const __CFString *v121;
  NSNumber *v122;
  const __CFString *v123;
  NSNumber *v124;
  const __CFString *v125;
  const __CFString *v126;
  const __CFString *v127;
  const __CFString *v128;
  const __CFString *v129;
  const __CFString *v130;
  NSString *v131;
  const __CFString *v132;
  id v133;
  objc_super v134;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v8
    && (v134.receiver = self,
        v134.super_class = (Class)PHAssetPhotosInfoPanelExtendedProperties,
        v10 = -[PHAssetPhotosInfoPanelExtendedProperties init](&v134, sel_init),
        (self = v10) != 0))
  {
    v133 = v9;
    objc_storeWeak((id *)&v10->super._asset, v9);
    v11 = !v5;
    if (v5)
      v12 = CFSTR("extendedAttributes.cameraMake");
    else
      v12 = CFSTR("cameraMake");
    if (v5)
      v13 = CFSTR("extendedAttributes.cameraModel");
    else
      v13 = CFSTR("cameraModel");
    if (v5)
      v14 = CFSTR("extendedAttributes.lensModel");
    else
      v14 = CFSTR("lensModel");
    if (v11)
      v15 = CFSTR("flashFired");
    else
      v15 = CFSTR("extendedAttributes.flashFired");
    if (v11)
      v16 = CFSTR("whiteBalance");
    else
      v16 = CFSTR("extendedAttributes.whiteBalance");
    if (v11)
      v17 = CFSTR("meteringMode");
    else
      v17 = CFSTR("extendedAttributes.meteringMode");
    if (v11)
      v18 = CFSTR("iso");
    else
      v18 = CFSTR("extendedAttributes.iso");
    if (v11)
      v19 = CFSTR("focalLength");
    else
      v19 = CFSTR("extendedAttributes.focalLength");
    if (v11)
      v20 = CFSTR("focalLengthIn35mm");
    else
      v20 = CFSTR("extendedAttributes.focalLengthIn35mm");
    v105 = v20;
    if (v11)
      v21 = CFSTR("exposureBias");
    else
      v21 = CFSTR("extendedAttributes.exposureBias");
    v22 = CFSTR("aperture");
    if (!v11)
      v22 = CFSTR("extendedAttributes.aperture");
    v107 = v21;
    v109 = v22;
    if (v11)
      v23 = CFSTR("shutterSpeed");
    else
      v23 = CFSTR("extendedAttributes.shutterSpeed");
    v24 = CFSTR("extendedAttributes.codec");
    if (v11)
      v24 = CFSTR("codec");
    v111 = v23;
    v113 = v24;
    v25 = CFSTR("fps");
    if (!v11)
      v25 = CFSTR("extendedAttributes.fps");
    v115 = v25;
    if (v11)
      v26 = CFSTR("duration");
    else
      v26 = CFSTR("extendedAttributes.duration");
    v117 = v26;
    if (v11)
      v27 = CFSTR("sampleRate");
    else
      v27 = CFSTR("extendedAttributes.sampleRate");
    v28 = CFSTR("bitrate");
    if (!v11)
      v28 = CFSTR("extendedAttributes.bitrate");
    v119 = v27;
    v121 = v28;
    if (v11)
      v29 = CFSTR("trackFormat");
    else
      v29 = CFSTR("extendedAttributes.trackFormat");
    v30 = CFSTR("extendedAttributes.slushPreset");
    if (v11)
      v30 = CFSTR("slushPreset");
    v123 = v29;
    v125 = v30;
    v31 = CFSTR("digitalZoomRatio");
    if (!v11)
      v31 = CFSTR("extendedAttributes.digitalZoomRatio");
    v126 = v31;
    if (v11)
      v32 = CFSTR("dateCreated");
    else
      v32 = CFSTR("extendedAttributes.dateCreated");
    v127 = v32;
    if (v11)
      v33 = CFSTR("timezoneOffset");
    else
      v33 = CFSTR("extendedAttributes.timezoneOffset");
    v34 = CFSTR("timezoneName");
    if (!v11)
      v34 = CFSTR("extendedAttributes.timezoneName");
    v128 = v33;
    v129 = v34;
    v35 = CFSTR("generativeAIType");
    if (!v11)
      v35 = CFSTR("extendedAttributes.generativeAIType");
    v130 = v35;
    v36 = CFSTR("extendedAttributes.credit");
    if (v11)
      v36 = CFSTR("credit");
    v132 = v36;
    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v37 = (NSString *)objc_claimAutoreleasedReturnValue();
    cameraMake = self->_cameraMake;
    self->_cameraMake = v37;

    v131 = self->_cameraMake;
    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    cameraModel = self->_cameraModel;
    self->_cameraModel = v39;

    v104 = self->_cameraModel;
    objc_msgSend(v8, "objectForKeyedSubscript:", v14);
    v41 = (NSString *)objc_claimAutoreleasedReturnValue();
    lensModel = self->_lensModel;
    self->_lensModel = v41;

    v103 = self->_lensModel;
    objc_msgSend(v8, "objectForKeyedSubscript:", v15);
    v43 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    flashFired = self->_flashFired;
    self->_flashFired = v43;

    v102 = self->_flashFired;
    objc_msgSend(v8, "objectForKeyedSubscript:", v16);
    v45 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    whiteBalance = self->_whiteBalance;
    self->_whiteBalance = v45;

    v101 = self->_whiteBalance;
    objc_msgSend(v8, "objectForKeyedSubscript:", v17);
    v47 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    meteringMode = self->_meteringMode;
    self->_meteringMode = v47;

    v100 = self->_meteringMode;
    objc_msgSend(v8, "objectForKeyedSubscript:", v18);
    v49 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    iso = self->_iso;
    self->_iso = v49;

    v99 = self->_iso;
    objc_msgSend(v8, "objectForKeyedSubscript:", v19);
    v51 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    focalLength = self->_focalLength;
    self->_focalLength = v51;

    v98 = self->_focalLength;
    objc_msgSend(v8, "objectForKeyedSubscript:", v105);
    v53 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    focalLengthIn35mm = self->_focalLengthIn35mm;
    self->_focalLengthIn35mm = v53;

    v106 = self->_focalLengthIn35mm;
    objc_msgSend(v8, "objectForKeyedSubscript:", v107);
    v55 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    exposureBias = self->_exposureBias;
    self->_exposureBias = v55;

    v108 = self->_exposureBias;
    objc_msgSend(v8, "objectForKeyedSubscript:", v109);
    v57 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    aperture = self->_aperture;
    self->_aperture = v57;

    v110 = self->_aperture;
    objc_msgSend(v8, "objectForKeyedSubscript:", v111);
    v59 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    shutterSpeed = self->_shutterSpeed;
    self->_shutterSpeed = v59;

    v112 = self->_shutterSpeed;
    objc_msgSend(v8, "objectForKeyedSubscript:", v113);
    v61 = (NSString *)objc_claimAutoreleasedReturnValue();
    codec = self->_codec;
    self->_codec = v61;

    v114 = self->_codec;
    objc_msgSend(v8, "objectForKeyedSubscript:", v115);
    v63 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    fps = self->_fps;
    self->_fps = v63;

    v116 = self->_fps;
    objc_msgSend(v8, "objectForKeyedSubscript:", v117);
    v65 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    duration = self->_duration;
    self->_duration = v65;

    v118 = self->_duration;
    objc_msgSend(v8, "objectForKeyedSubscript:", v119);
    v67 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    sampleRate = self->_sampleRate;
    self->_sampleRate = v67;

    v120 = self->_sampleRate;
    objc_msgSend(v8, "objectForKeyedSubscript:", v121);
    v69 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    bitrate = self->_bitrate;
    self->_bitrate = v69;

    v122 = self->_bitrate;
    objc_msgSend(v8, "objectForKeyedSubscript:", v123);
    v71 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    trackFormat = self->_trackFormat;
    self->_trackFormat = v71;

    v124 = self->_trackFormat;
    objc_msgSend(MEMORY[0x1E0D75130], "formattedCameraModelFromCameraModel:cameraMake:", self->_cameraModel, self->_cameraMake);
    v73 = (NSString *)objc_claimAutoreleasedReturnValue();
    formattedCameraModel = self->_formattedCameraModel;
    self->_formattedCameraModel = v73;

    v75 = self->_formattedCameraModel;
    objc_msgSend(v8, "objectForKeyedSubscript:", v125);
    v76 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    semanticStylePreset = self->_semanticStylePreset;
    self->_semanticStylePreset = v76;

    v78 = self->_semanticStylePreset;
    objc_msgSend(v8, "objectForKeyedSubscript:", v126);
    v79 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    digitalZoomRatio = self->_digitalZoomRatio;
    self->_digitalZoomRatio = v79;

    v81 = self->_digitalZoomRatio;
    objc_msgSend(v8, "objectForKeyedSubscript:", v127);
    v82 = (NSDate *)objc_claimAutoreleasedReturnValue();
    dateCreated = self->_dateCreated;
    self->_dateCreated = v82;

    v84 = self->_dateCreated;
    objc_msgSend(v8, "objectForKeyedSubscript:", v128);
    v85 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    timezoneOffset = self->_timezoneOffset;
    self->_timezoneOffset = v85;

    v87 = self->_timezoneOffset;
    objc_msgSend(v8, "objectForKeyedSubscript:", v129);
    v88 = (NSString *)objc_claimAutoreleasedReturnValue();
    timezoneName = self->_timezoneName;
    self->_timezoneName = v88;

    v90 = self->_timezoneName;
    objc_msgSend(v8, "objectForKeyedSubscript:", v130);
    v91 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    generativeAIType = self->_generativeAIType;
    self->_generativeAIType = v91;

    v93 = self->_generativeAIType;
    objc_msgSend(v8, "objectForKeyedSubscript:", v132);
    v94 = (NSString *)objc_claimAutoreleasedReturnValue();
    credit = self->_credit;
    self->_credit = v94;

    if (v131
      || v104
      || v103
      || v102
      || v101
      || v100
      || v99
      || v98
      || v106
      || v108
      || v110
      || v112
      || v114
      || v116
      || v118
      || v120
      || v122
      || v124
      || v75
      || v78
      || v81
      || v84
      || v87
      || v90
      || v93
      || self->_credit)
    {
      self = self;
      v96 = self;
    }
    else
    {
      v96 = 0;
    }
    v9 = v133;
  }
  else
  {
    v96 = 0;
  }

  return v96;
}

- (NSString)cameraMake
{
  return self->_cameraMake;
}

- (NSString)cameraModel
{
  return self->_cameraModel;
}

- (NSString)formattedCameraModel
{
  return self->_formattedCameraModel;
}

- (NSString)lensModel
{
  return self->_lensModel;
}

- (NSNumber)flashFired
{
  return self->_flashFired;
}

- (NSNumber)whiteBalance
{
  return self->_whiteBalance;
}

- (NSNumber)meteringMode
{
  return self->_meteringMode;
}

- (NSNumber)iso
{
  return self->_iso;
}

- (NSNumber)focalLength
{
  return self->_focalLength;
}

- (NSNumber)focalLengthIn35mm
{
  return self->_focalLengthIn35mm;
}

- (NSNumber)exposureBias
{
  return self->_exposureBias;
}

- (NSNumber)aperture
{
  return self->_aperture;
}

- (NSNumber)shutterSpeed
{
  return self->_shutterSpeed;
}

- (NSString)codec
{
  return self->_codec;
}

- (NSNumber)fps
{
  return self->_fps;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (NSNumber)sampleRate
{
  return self->_sampleRate;
}

- (NSNumber)bitrate
{
  return self->_bitrate;
}

- (NSNumber)trackFormat
{
  return self->_trackFormat;
}

- (NSNumber)semanticStylePreset
{
  return self->_semanticStylePreset;
}

- (NSNumber)digitalZoomRatio
{
  return self->_digitalZoomRatio;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSNumber)timezoneOffset
{
  return self->_timezoneOffset;
}

- (NSString)timezoneName
{
  return self->_timezoneName;
}

- (NSNumber)generativeAIType
{
  return self->_generativeAIType;
}

- (NSString)credit
{
  return self->_credit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credit, 0);
  objc_storeStrong((id *)&self->_generativeAIType, 0);
  objc_storeStrong((id *)&self->_timezoneName, 0);
  objc_storeStrong((id *)&self->_timezoneOffset, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_digitalZoomRatio, 0);
  objc_storeStrong((id *)&self->_semanticStylePreset, 0);
  objc_storeStrong((id *)&self->_trackFormat, 0);
  objc_storeStrong((id *)&self->_bitrate, 0);
  objc_storeStrong((id *)&self->_sampleRate, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_fps, 0);
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_shutterSpeed, 0);
  objc_storeStrong((id *)&self->_aperture, 0);
  objc_storeStrong((id *)&self->_exposureBias, 0);
  objc_storeStrong((id *)&self->_focalLengthIn35mm, 0);
  objc_storeStrong((id *)&self->_focalLength, 0);
  objc_storeStrong((id *)&self->_iso, 0);
  objc_storeStrong((id *)&self->_meteringMode, 0);
  objc_storeStrong((id *)&self->_whiteBalance, 0);
  objc_storeStrong((id *)&self->_flashFired, 0);
  objc_storeStrong((id *)&self->_lensModel, 0);
  objc_storeStrong((id *)&self->_formattedCameraModel, 0);
  objc_storeStrong((id *)&self->_cameraModel, 0);
  objc_storeStrong((id *)&self->_cameraMake, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetPhotosInfoPanelExtended");
}

+ (id)entityName
{
  return CFSTR("ExtendedAttributes");
}

+ (id)keyPathFromPrimaryObject
{
  return CFSTR("extendedAttributes");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_44;
}

void __61__PHAssetPhotosInfoPanelExtendedProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[26];

  v3[25] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("cameraMake");
  v3[1] = CFSTR("cameraModel");
  v3[2] = CFSTR("lensModel");
  v3[3] = CFSTR("flashFired");
  v3[4] = CFSTR("whiteBalance");
  v3[5] = CFSTR("meteringMode");
  v3[6] = CFSTR("iso");
  v3[7] = CFSTR("focalLength");
  v3[8] = CFSTR("focalLengthIn35mm");
  v3[9] = CFSTR("exposureBias");
  v3[10] = CFSTR("aperture");
  v3[11] = CFSTR("shutterSpeed");
  v3[12] = CFSTR("codec");
  v3[13] = CFSTR("fps");
  v3[14] = CFSTR("duration");
  v3[15] = CFSTR("sampleRate");
  v3[16] = CFSTR("bitrate");
  v3[17] = CFSTR("trackFormat");
  v3[18] = CFSTR("slushPreset");
  v3[19] = CFSTR("digitalZoomRatio");
  v3[20] = CFSTR("dateCreated");
  v3[21] = CFSTR("timezoneOffset");
  v3[22] = CFSTR("timezoneName");
  v3[23] = CFSTR("generativeAIType");
  v3[24] = CFSTR("credit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 25);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_44;
  propertiesToFetch_pl_once_object_44 = v1;

}

@end
