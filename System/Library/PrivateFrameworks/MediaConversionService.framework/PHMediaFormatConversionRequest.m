@implementation PHMediaFormatConversionRequest

- (int64_t)backwardsCompatibilityStatus
{
  void *v3;

  if (-[PHMediaFormatConversionRequest requiresFormatConversion](self, "requiresFormatConversion"))
    return 2;
  if (-[PHMediaFormatConversionRequest requiresPassthroughConversion](self, "requiresPassthroughConversion"))
    return 2;
  -[PHMediaFormatConversionRequest videoExportPreset](self, "videoExportPreset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 2;
  else
    return 1;
}

- (BOOL)requiresPassthroughConversion
{
  _BOOL4 v3;
  BOOL v4;

  v3 = -[PHMediaFormatConversionRequest useTransferBehaviorUserPreference](self, "useTransferBehaviorUserPreference");
  v4 = -[PHMediaFormatConversionRequest userPreferenceProhibitsFormatConversion](self, "userPreferenceProhibitsFormatConversion");
  return (!v3 || !v4)
      && !-[PHMediaFormatConversionRequest requiresFormatConversion](self, "requiresFormatConversion")
      && -[PHMediaFormatConversionRequest requiresMetadataChanges](self, "requiresMetadataChanges")
      && -[PHMediaFormatConversionRequest sourceSupportsPassthroughConversion](self, "sourceSupportsPassthroughConversion");
}

- (BOOL)requiresMetadataChanges
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PHMediaFormatConversionRequest source](self, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "renderOriginatingSignature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4
    || -[PHMediaFormatConversionRequest requiresLivePhotoPairingIdentifierChange](self, "requiresLivePhotoPairingIdentifierChange")|| -[PHMediaFormatConversionRequest requiresLocationMetadataChange](self, "requiresLocationMetadataChange")|| -[PHMediaFormatConversionRequest requiresCreationDateMetadataChange](self, "requiresCreationDateMetadataChange")|| -[PHMediaFormatConversionRequest requiresCaptionMetadataChange](self, "requiresCaptionMetadataChange")|| -[PHMediaFormatConversionRequest requiresAccessibilityDescriptionMetadataChange](self, "requiresAccessibilityDescriptionMetadataChange");

  return v5;
}

- (BOOL)requiresFormatConversion
{
  BOOL result;

  if (self->_didCalculateRequiresFormatConversion)
    return self->_requiresFormatConversion;
  self->_didCalculateRequiresFormatConversion = 1;
  result = -[PHMediaFormatConversionRequest _calculateRequiresFormatConversion](self, "_calculateRequiresFormatConversion");
  self->_requiresFormatConversion = result;
  return result;
}

- (PHMediaFormatConversionSource)source
{
  return (PHMediaFormatConversionSource *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)requiresLocationMetadataChange
{
  void *v3;
  BOOL v4;
  void *v5;
  BOOL v6;

  if (-[PHMediaFormatConversionRequest locationMetadataBehavior](self, "locationMetadataBehavior") == 1)
  {
    -[PHMediaFormatConversionRequest source](self, "source");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "locationMetadataStatus") == 2;

  }
  else
  {
    v4 = 0;
  }
  if (-[PHMediaFormatConversionRequest locationMetadataBehavior](self, "locationMetadataBehavior") == 2)
  {
    -[PHMediaFormatConversionRequest location](self, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }
  return v4 || v6;
}

- (int64_t)locationMetadataBehavior
{
  return self->_locationMetadataBehavior;
}

- (BOOL)userPreferenceProhibitsFormatConversion
{
  return -[PHMediaFormatConversionRequest transferBehaviorUserPreference](self, "transferBehaviorUserPreference") == 1;
}

- (BOOL)destinationCapabilitiesHintsIndicateSupportForSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[PHMediaFormatConversionRequest destinationCapabilities](self, "destinationCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outOfBandHints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D754A8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5
      && objc_msgSend(v5, "integerValue") == 1
      && -[PHMediaFormatConversionSource containsProResVideoWithFormatEligibleForTranscoding](self->_source, "containsProResVideoWithFormatEligibleForTranscoding"))
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      if (-[PHMediaFormatConversionContent isVideo](self->_source, "isVideo")
        && -[PHMediaFormatConversionSource containsVideoWithFormatEligibleForTranscoding](self->_source, "containsVideoWithFormatEligibleForTranscoding"))
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D754A0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = -[PHMediaFormatConversionSource firstVideoTrackCodec](self->_source, "firstVideoTrackCodec");
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v10 = v8;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v29;
            while (2)
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v29 != v13)
                  objc_enumerationMutation(v10);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "unsignedIntValue") == v9)
                {
                  LOBYTE(v7) = 1;
                  v15 = v10;
                  goto LABEL_37;
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
              if (v12)
                continue;
              break;
            }
          }

        }
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D75498]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D752F0];
      -[PHMediaFormatConversionContent fileType](self->_source, "fileType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "typeWithIdentifier:", v17);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v15)
        v18 = v10 == 0;
      else
        v18 = 1;
      if (v18)
      {
        LOBYTE(v7) = 0;
      }
      else
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v19 = v15;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        v7 = v20;
        if (v20)
        {
          v21 = *(_QWORD *)v25;
          while (2)
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v25 != v21)
                objc_enumerationMutation(v19);
              if ((objc_msgSend(v10, "conformsToType:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v22), (_QWORD)v24) & 1) != 0)
              {
                LOBYTE(v7) = 1;
                goto LABEL_36;
              }
              ++v22;
            }
            while (v7 != v22);
            v7 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v7)
              continue;
            break;
          }
        }
LABEL_36:

      }
LABEL_37:

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (PFMediaCapabilities)destinationCapabilities
{
  return (PFMediaCapabilities *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)preflighted
{
  return self->_preflighted;
}

- (BOOL)requiresCaptionMetadataChange
{
  void *v3;
  BOOL v4;
  void *v5;
  BOOL v6;

  if (-[PHMediaFormatConversionRequest captionMetadataBehavior](self, "captionMetadataBehavior") == 1)
  {
    -[PHMediaFormatConversionRequest source](self, "source");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "captionMetadataStatus") == 2;

  }
  else
  {
    v4 = 0;
  }
  if (-[PHMediaFormatConversionRequest captionMetadataBehavior](self, "captionMetadataBehavior") == 2)
  {
    -[PHMediaFormatConversionRequest caption](self, "caption");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }
  return v4 || v6;
}

- (BOOL)requiresAccessibilityDescriptionMetadataChange
{
  void *v3;
  BOOL v4;
  void *v5;
  BOOL v6;

  if (-[PHMediaFormatConversionRequest accessibilityDescriptionMetadataBehavior](self, "accessibilityDescriptionMetadataBehavior") == 1)
  {
    -[PHMediaFormatConversionRequest source](self, "source");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "accessibilityDescriptionMetadataStatus") == 2;

  }
  else
  {
    v4 = 0;
  }
  if (-[PHMediaFormatConversionRequest accessibilityDescriptionMetadataBehavior](self, "accessibilityDescriptionMetadataBehavior") == 2)
  {
    -[PHMediaFormatConversionRequest accessibilityDescription](self, "accessibilityDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }
  return v4 || v6;
}

- (BOOL)useTransferBehaviorUserPreference
{
  return self->_useTransferBehaviorUserPreference;
}

- (int64_t)transferBehaviorUserPreference
{
  return self->_transferBehaviorUserPreference;
}

- (BOOL)forceFormatConversion
{
  return self->_forceFormatConversion;
}

- (int64_t)captionMetadataBehavior
{
  return self->_captionMetadataBehavior;
}

- (int64_t)accessibilityDescriptionMetadataBehavior
{
  return self->_accessibilityDescriptionMetadataBehavior;
}

- (BOOL)requiresCreationDateMetadataChange
{
  void *v3;
  BOOL v4;

  if (-[PHMediaFormatConversionRequest creationDateMetadataBehavior](self, "creationDateMetadataBehavior") != 2)
    return 0;
  -[PHMediaFormatConversionRequest creationDate](self, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)requiresLivePhotoPairingIdentifierChange
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;

  v4 = 1;
  switch(-[PHMediaFormatConversionRequest livePhotoPairingIdentifierBehavior](self, "livePhotoPairingIdentifierBehavior"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1077, CFSTR("Unexpected invalid live photo pairing identifier behavior value"));

      return 1;
    case 1:
      return 0;
    case 2:
      -[PHMediaFormatConversionRequest source](self, "source");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "livePhotoPairingIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v7 != 0;

      return v4;
    case 4:
      return -[PHMediaFormatConversionRequest requiresFormatConversion](self, "requiresFormatConversion");
    case 5:
      -[PHMediaFormatConversionRequest source](self, "source");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "livePhotoPairingIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v4 = -[PHMediaFormatConversionRequest requiresFormatConversion](self, "requiresFormatConversion");
      else
        v4 = 0;

      return v4;
    default:
      return v4;
  }
}

- (int64_t)creationDateMetadataBehavior
{
  return self->_creationDateMetadataBehavior;
}

- (int64_t)livePhotoPairingIdentifierBehavior
{
  return self->_livePhotoPairingIdentifierBehavior;
}

+ (id)requestForSource:(id)a3 destinationCapabilities:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;

  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHMediaFormatConversion.m"), 919, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source.fileURL"));

  }
  objc_msgSend((id)objc_opt_class(), "requestClass");
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setSource:", v10);

  objc_msgSend(v12, "setDestinationCapabilities:", v9);
  if (objc_msgSend(v12, "prepareWithError:", a5))
  {
    objc_msgSend(v12, "setupProgress");
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)setupProgress
{
  NSProgress *v3;
  NSProgress *progress;

  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
  v3 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  progress = self->_progress;
  self->_progress = v3;

}

- (void)setSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void)setDestinationCapabilities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)prepareWithError:(id *)a3
{
  return 1;
}

- (void)preflightWithConversionManager:(id)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = -[PHMediaFormatConversionRequest status](self, "status", a3);
  if (v5 <= 5 && ((1 << v5) & 0x31) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaFormatConversionRequest statusString](self, "statusString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 950, CFSTR("Preflight of request in invalid state %@"), v7);

  }
  if (-[PHMediaFormatConversionRequest preflighted](self, "preflighted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 953, CFSTR("Preflight of already preflighted request"));

  }
  -[PHMediaFormatConversionRequest source](self, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 955, CFSTR("Preflight of request without source"));

  }
  if (-[PHMediaFormatConversionRequest locationMetadataBehavior](self, "locationMetadataBehavior") != 1)
  {
    -[PHMediaFormatConversionRequest source](self, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "markLocationMetadataAsCheckedWithStatus:", 1);

  }
  if (-[PHMediaFormatConversionRequest captionMetadataBehavior](self, "captionMetadataBehavior") != 1)
  {
    -[PHMediaFormatConversionRequest source](self, "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "markCaptionMetadataAsCheckedWithStatus:", 1);

  }
  if (-[PHMediaFormatConversionRequest accessibilityDescriptionMetadataBehavior](self, "accessibilityDescriptionMetadataBehavior") != 1)
  {
    -[PHMediaFormatConversionRequest source](self, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "markAccessibilityDescriptionMetadataAsCheckedWithStatus:", 1);

  }
  -[PHMediaFormatConversionRequest source](self, "source");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v13 = objc_msgSend(v12, "preflightWithError:", &v26);
  v14 = v26;

  if ((v13 & 1) != 0)
  {
    if (!-[PHMediaFormatConversionRequest requiresSinglePassVideoConversion](self, "requiresSinglePassVideoConversion"))
      goto LABEL_25;
    -[PHMediaFormatConversionRequest source](self, "source");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "mediaType") == 1)
    {
      v16 = -[PHMediaFormatConversionRequest isCompositeRequest](self, "isCompositeRequest");

      if (!v16)
      {
        if (-[PHMediaFormatConversionRequest locationMetadataBehavior](self, "locationMetadataBehavior")
          || -[PHMediaFormatConversionRequest creationDateMetadataBehavior](self, "creationDateMetadataBehavior")
          || -[PHMediaFormatConversionRequest captionMetadataBehavior](self, "captionMetadataBehavior")
          || -[PHMediaFormatConversionRequest accessibilityDescriptionMetadataBehavior](self, "accessibilityDescriptionMetadataBehavior"))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            -[PHMediaFormatConversionRequest source](self, "source");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v28 = v17;
            v18 = MEMORY[0x1E0C81028];
            v19 = "Invalid request using single pass encoding option and metadata changes (like location stripping, custo"
                  "m location, custom creation date, custom description) for video source %@";
LABEL_36:
            _os_log_error_impl(&dword_1D51DF000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);

            goto LABEL_32;
          }
          goto LABEL_32;
        }
LABEL_25:
        -[PHMediaFormatConversionRequest destinationCapabilities](self, "destinationCapabilities");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v20, "supportsHDR") & 1) != 0)
        {
          -[PHMediaFormatConversionRequest source](self, "source");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHMediaFormatConversionRequest setShouldExportAsHDR:](self, "setShouldExportAsHDR:", objc_msgSend(v21, "isHDR"));

        }
        else
        {
          -[PHMediaFormatConversionRequest setShouldExportAsHDR:](self, "setShouldExportAsHDR:", 0);
        }

        -[PHMediaFormatConversionRequest setPreflighted:](self, "setPreflighted:", 1);
        -[PHMediaFormatConversionRequest parentRequest](self, "parentRequest");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
          objc_msgSend(v22, "didPreflightSubrequest:", self);
        goto LABEL_33;
      }
    }
    else
    {

    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[PHMediaFormatConversionRequest source](self, "source");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v17;
      v18 = MEMORY[0x1E0C81028];
      v19 = "Invalid request using single pass encoding option for non-video source %@";
      goto LABEL_36;
    }
LABEL_32:
    -[PHMediaFormatConversionRequest setStatus:](self, "setStatus:", 5);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHMediaFormatConversionErrorDomain"), 4, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaFormatConversionRequest setError:](self, "setError:", v23);
LABEL_33:

    goto LABEL_34;
  }
  -[PHMediaFormatConversionRequest setStatus:](self, "setStatus:", 5);
  -[PHMediaFormatConversionRequest setError:](self, "setError:", v14);
LABEL_34:

}

- (void)setShouldExportAsHDR:(BOOL)a3
{
  self->_shouldExportAsHDR = a3;
}

- (void)setPreflighted:(BOOL)a3
{
  self->_preflighted = a3;
}

- (BOOL)requiresSinglePassVideoConversion
{
  return self->_requiresSinglePassVideoConversion;
}

- (PHMediaFormatConversionCompositeRequest)parentRequest
{
  return (PHMediaFormatConversionCompositeRequest *)objc_loadWeakRetained((id *)&self->_parentRequest);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setTransferBehaviorUserPreference:(int64_t)a3
{
  self->_transferBehaviorUserPreference = a3;
}

- (void)setDirectoryForTemporaryFiles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PHMediaFormatConversionRequest)init
{
  PHMediaFormatConversionRequest *v2;
  uint64_t v3;
  NSUUID *identifier;
  void *v5;
  uint64_t v6;
  NSString *livePhotoPairingIdentifier;
  NSUUID *v9;
  NSString *v10;
  objc_super v11;
  uint8_t buf[4];
  NSUUID *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)PHMediaFormatConversionRequest;
  v2 = -[PHMediaFormatConversionRequest init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

    v2->_status = 1;
    v2->_livePhotoPairingIdentifierBehavior = 4;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();
    livePhotoPairingIdentifier = v2->_livePhotoPairingIdentifier;
    v2->_livePhotoPairingIdentifier = (NSString *)v6;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v9 = v2->_identifier;
      v10 = v2->_livePhotoPairingIdentifier;
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      _os_log_debug_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Initial live photo pairing identifier for request %{public}@: %{public}@", buf, 0x16u);
    }
  }
  return v2;
}

- (void)setDestination:(id)a3
{
  PHMediaFormatConversionDestination *v5;
  PHMediaFormatConversionDestination *destination;
  void *v7;

  v5 = (PHMediaFormatConversionDestination *)a3;
  if (self->_destination)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 874, CFSTR("Conversion destination may be set only once"));

    destination = self->_destination;
  }
  else
  {
    destination = 0;
  }
  self->_destination = v5;

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaFormatConversionRequest identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaFormatConversionRequest statusString](self, "statusString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PHMediaFormatConversionRequest preflighted](self, "preflighted");
  -[PHMediaFormatConversionRequest source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p identifier=%@ status=%@ preflighted=%d path=%@>"), v5, self, v6, v7, v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSString)statusString
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "stringForRequestStatus:", -[PHMediaFormatConversionRequest status](self, "status"));
}

- (BOOL)isCompositeRequest
{
  return 0;
}

- (void)markAsCancelled
{
  id v3;

  -[PHMediaFormatConversionRequest setStatus:](self, "setStatus:", 5);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHMediaFormatConversionErrorDomain"), 3, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PHMediaFormatConversionRequest setError:](self, "setError:", v3);

}

- (BOOL)sourceSupportsPassthroughConversion
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CEC698];
  v20[0] = *MEMORY[0x1E0CEC530];
  v20[1] = v3;
  v20[2] = *MEMORY[0x1E0CEC5B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E0CEC3F8];
        -[PHMediaFormatConversionContent fileType](self->_source, "fileType", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "typeWithIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v9) = objc_msgSend(v12, "conformsToType:", v9);

        if ((v9 & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)_calculateRequiresFormatConversion
{
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  int v18;
  int v19;
  _BOOL4 v20;
  void *v21;
  char v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  int v33;
  os_log_type_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  int v38;
  void *v39;
  void *v41;
  void *v42;
  _BOOL4 v43;
  int v44;
  _BOOL4 v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  _BOOL4 v51;
  __int16 v52;
  _BOOL4 v53;
  __int16 v54;
  _BOOL4 v55;
  __int16 v56;
  int v57;
  __int16 v58;
  _BOOL4 v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;
  _BOOL4 v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  if (!-[PHMediaFormatConversionRequest preflighted](self, "preflighted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1121, CFSTR("Request must be preflighted"));

  }
  v4 = -[PHMediaFormatConversionRequest forceFormatConversion](self, "forceFormatConversion");
  v5 = -[PHMediaFormatConversionRequest useTransferBehaviorUserPreference](self, "useTransferBehaviorUserPreference");
  v6 = -[PHMediaFormatConversionRequest userPreferenceProhibitsFormatConversion](self, "userPreferenceProhibitsFormatConversion");
  v7 = -[PHMediaFormatConversionRequest destinationCapabilitiesHintsIndicateSupportForSource](self, "destinationCapabilitiesHintsIndicateSupportForSource");
  -[PHMediaFormatConversionRequest source](self, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isVideo");

  -[PHMediaFormatConversionRequest source](self, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9)
  {
    v23 = objc_msgSend(v10, "isImage");

    if (v23)
    {
      -[PHMediaFormatConversionRequest source](self, "source");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "containsImageWithFormatEligibleForTranscoding");

      if (v25)
      {
        -[PHMediaFormatConversionRequest destinationCapabilities](self, "destinationCapabilities");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)*MEMORY[0x1E0CEC698], "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "supportForContainerTypeIdentifier:", v27);

        v18 = ((unint64_t)(v28 + 1) < 2) & ~v7;
LABEL_18:
        v19 = 1;
        goto LABEL_19;
      }
    }
LABEL_14:
    v19 = 0;
    v18 = 0;
LABEL_19:
    -[PHMediaFormatConversionRequest shouldExportAsHDR](self, "shouldExportAsHDR");
    v16 = 0;
    v20 = 0;
    goto LABEL_20;
  }
  v12 = objc_msgSend(v10, "containsVideoWithFormatEligibleForTranscoding");

  if (((v12 ^ 1 | v7) & 1) != 0)
    goto LABEL_14;
  -[PHMediaFormatConversionRequest source](self, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transcodingEligibleVideoTrackFormatDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[PHMediaFormatConversionRequest source](self, "source");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "firstVideoTrackCodec");

    if (v30 == 1752589105)
    {
      -[PHMediaFormatConversionRequest destinationCapabilities](self, "destinationCapabilities");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "supportForCodec:", 1752589105);

      v18 = v32 == -1;
    }
    else
    {
      v18 = 0;
    }
    goto LABEL_18;
  }
  -[PHMediaFormatConversionRequest destinationCapabilities](self, "destinationCapabilities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "decodingSupportForFormatDescription:", v14);

  v17 = -[PHMediaFormatConversionRequest shouldExportAsHDR](self, "shouldExportAsHDR");
  v18 = 0;
  v19 = 1;
  v20 = v16 != 2;
  if (v16 != 2 && v17)
  {
    -[PHMediaFormatConversionRequest source](self, "source");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "containsProResVideoWithFormatEligibleForTranscoding");

    if ((v22 & 1) == 0)
      -[PHMediaFormatConversionRequest setShouldExportAsHDR:](self, "setShouldExportAsHDR:", 0);
    v18 = 0;
    v20 = 1;
  }
LABEL_20:
  v45 = v20;
  if ((-[PHMediaFormatConversionRequest requiresLocationMetadataChange](self, "requiresLocationMetadataChange")
     || -[PHMediaFormatConversionRequest requiresAccessibilityDescriptionMetadataChange](self, "requiresAccessibilityDescriptionMetadataChange")|| -[PHMediaFormatConversionRequest requiresCaptionMetadataChange](self, "requiresCaptionMetadataChange")|| -[PHMediaFormatConversionRequest requiresCreationDateMetadataChange](self, "requiresCreationDateMetadataChange"))&& !-[PHMediaFormatConversionRequest sourceSupportsPassthroughConversion](self, "sourceSupportsPassthroughConversion"))
  {
    v44 = 1;
    v33 = 1;
  }
  else
  {
    v44 = 0;
    v33 = v19 & (v4 | (v18 | v20) & ~(v5 && v6));
  }
  if (objc_msgSend((id)objc_opt_class(), "hasInternalDiagnostics"))
    v34 = OS_LOG_TYPE_INFO;
  else
    v34 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], v34))
  {
    objc_msgSend(MEMORY[0x1E0D75128], "stringForSupport:", v16);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[PHMediaFormatConversionRequest shouldExportAsHDR](self, "shouldExportAsHDR");
    -[PHMediaFormatConversionRequest source](self, "source");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "fileURL");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "lastPathComponent");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v18;
    v39 = (void *)v37;
    *(_DWORD *)buf = 67111939;
    v47 = v33;
    v48 = 1024;
    v49 = v19;
    v50 = 1024;
    v51 = v4;
    v52 = 1024;
    v53 = v6;
    v54 = 1024;
    v55 = v5;
    v56 = 1024;
    v57 = v38;
    v58 = 1024;
    v59 = v45;
    v60 = 2114;
    v61 = v42;
    v62 = 1024;
    v63 = v7;
    v64 = 1024;
    v65 = v44;
    v66 = 1024;
    v67 = v43;
    v68 = 2113;
    v69 = v37;
    _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], v34, "Media format conversion decision: result=%d containsModernFormat=%d forcedOnRequest=%d prohibitedByUserPreference=%d useTransferBehaviorUserChoice=%d destinationMissingSupport=%d, destinationMissingSupportForAsset=%d (assetSupport=%{public}@), destinationPlatformHintIndicatesSupport=%d, unsupportedUserModifiedMetadataPassthroughConversion=%d shouldExportAsHDR=%d filename=%{private}@", buf, 0x52u);

  }
  return v33;
}

- (void)setLocationMetadataBehavior:(int64_t)a3 withLocation:(id)a4
{
  id v7;
  char v8;
  CLLocation *v9;
  CLLocation *location;
  void *v11;
  id v12;

  v7 = a4;
  v12 = v7;
  if (self->_locationMetadataBehavior != a3
    || (v8 = -[CLLocation isEqual:](self->_location, "isEqual:", v7), v7 = v12, (v8 & 1) == 0))
  {
    self->_locationMetadataBehavior = a3;
    if (a3 == 2)
    {
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1252, CFSTR("location must not be nil if behavior is PHMediaFormatMetadataBehaviorApply"));

        v7 = v12;
      }
      v9 = (CLLocation *)v7;
      location = self->_location;
      self->_location = v9;
    }
    else
    {
      location = self->_location;
      self->_location = 0;
    }

    v7 = v12;
  }

}

- (void)setCreationDateMetadataBehavior:(int64_t)a3 withCreationDate:(id)a4 inTimeZone:(id)a5
{
  id v10;
  NSTimeZone *v11;
  NSTimeZone *creationDateTimeZone;
  NSDate *creationDate;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v10 = a5;
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1260, CFSTR("Stripping creation date metadata is not permitted"));

  }
  if (self->_creationDateMetadataBehavior != a3
    || !-[NSDate isEqualToDate:](self->_creationDate, "isEqualToDate:", v16))
  {
    self->_creationDateMetadataBehavior = a3;
    if (a3 == 2)
    {
      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1267, CFSTR("creationDate must not be nil if behavior is PHMediaFormatMetadataBehaviorApply"));

      }
      objc_storeStrong((id *)&self->_creationDate, a4);
      v11 = (NSTimeZone *)v10;
      creationDateTimeZone = self->_creationDateTimeZone;
      self->_creationDateTimeZone = v11;
    }
    else
    {
      creationDate = self->_creationDate;
      self->_creationDate = 0;

      creationDateTimeZone = self->_creationDateTimeZone;
      self->_creationDateTimeZone = 0;
    }

  }
}

- (void)setCaptionMetadataBehavior:(int64_t)a3 withCaption:(id)a4
{
  id v7;
  BOOL v8;
  NSString *v9;
  NSString *caption;
  void *v11;
  id v12;

  v7 = a4;
  v12 = v7;
  if (self->_captionMetadataBehavior != a3
    || (v8 = -[NSString isEqualToString:](self->_caption, "isEqualToString:", v7), v7 = v12, !v8))
  {
    self->_captionMetadataBehavior = a3;
    if (a3 == 2)
    {
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1283, CFSTR("caption must not be nil if behavior is PHMediaFormatMetadataBehaviorApply"));

        v7 = v12;
      }
      v9 = (NSString *)objc_msgSend(v7, "copy");
      caption = self->_caption;
      self->_caption = v9;
    }
    else
    {
      caption = self->_caption;
      self->_caption = 0;
    }

    v7 = v12;
  }

}

- (void)setAccessibilityDescriptionMetadataBehavior:(int64_t)a3 withAccessibilityDescription:(id)a4
{
  id v7;
  BOOL v8;
  NSString *v9;
  NSString *accessibilityDescription;
  void *v11;
  id v12;

  v7 = a4;
  v12 = v7;
  if (self->_accessibilityDescriptionMetadataBehavior != a3
    || (v8 = -[NSString isEqualToString:](self->_accessibilityDescription, "isEqualToString:", v7), v7 = v12, !v8))
  {
    self->_accessibilityDescriptionMetadataBehavior = a3;
    if (a3 == 2)
    {
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1297, CFSTR("caption must not be nil if accessibilityDescriptionMetadataBehavior is PHMediaFormatMetadataBehaviorApply"));

        v7 = v12;
      }
      v9 = (NSString *)objc_msgSend(v7, "copy");
      accessibilityDescription = self->_accessibilityDescription;
      self->_accessibilityDescription = v9;
    }
    else
    {
      accessibilityDescription = self->_accessibilityDescription;
      self->_accessibilityDescription = 0;
    }

    v7 = v12;
  }

}

- (NSString)outputPathExtension
{
  void *v4;
  void *v5;
  BOOL v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  if (!-[PHMediaFormatConversionRequest preflighted](self, "preflighted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1306, CFSTR("Request must be preflighted"));

  }
  -[PHMediaFormatConversionRequest source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1307, CFSTR("Invalid request for output path extension on request without source"));

  }
  -[PHMediaFormatConversionRequest source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "mediaType") != 2)
  {

    goto LABEL_9;
  }
  v6 = -[PHMediaFormatConversionRequest requiresFormatConversion](self, "requiresFormatConversion");

  if (!v6)
  {
LABEL_9:
    -[PHMediaFormatConversionRequest source](self, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathExtension");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v7;
  }
  v7 = CFSTR("jpg");
  return (NSString *)v7;
}

- (NSString)outputFileType
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  if (!-[PHMediaFormatConversionRequest preflighted](self, "preflighted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1316, CFSTR("Request must be preflighted"));

  }
  -[PHMediaFormatConversionRequest source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1317, CFSTR("Invalid request for output type identifier on request without source"));

  }
  -[PHMediaFormatConversionRequest source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "mediaType") != 2)
  {

    goto LABEL_9;
  }
  v6 = -[PHMediaFormatConversionRequest requiresFormatConversion](self, "requiresFormatConversion");

  if (!v6)
  {
LABEL_9:
    -[PHMediaFormatConversionRequest source](self, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v7;
  }
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSString *)v7;
}

- (unint64_t)estimatedOutputFileLength
{
  void *v3;
  double v4;
  double v5;
  unint64_t v6;
  _BOOL4 v7;

  if (-[PHMediaFormatConversionRequest requiresFormatConversion](self, "requiresFormatConversion"))
  {
    -[PHMediaFormatConversionRequest source](self, "source");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (double)(unint64_t)objc_msgSend(v3, "length");
    -[PHMediaFormatConversionRequest formatConversionExpansionFactor](self, "formatConversionExpansionFactor");
    v6 = (unint64_t)(v5 * v4);
  }
  else
  {
    v7 = -[PHMediaFormatConversionRequest requiresPassthroughConversion](self, "requiresPassthroughConversion");
    -[PHMediaFormatConversionRequest source](self, "source");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "length");
    if (v7)
      v6 += -[PHMediaFormatConversionRequest passthroughConversionAdditionalByteCount](self, "passthroughConversionAdditionalByteCount");
  }

  return v6;
}

- (void)setFormatConversionExpansionFactor:(double)a3
{
  double formatConversionExpansionFactor;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    formatConversionExpansionFactor = self->_formatConversionExpansionFactor;
    v6 = 134217984;
    v7 = formatConversionExpansionFactor;
    _os_log_debug_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Setting explicit formatConversionExpansionFactor: %f", (uint8_t *)&v6, 0xCu);
  }
  self->_formatConversionExpansionFactor = a3;
}

- (double)formatConversionExpansionFactor
{
  double formatConversionExpansionFactor;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  double v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;
  NSSize v27;

  v26 = *MEMORY[0x1E0C80C00];
  formatConversionExpansionFactor = self->_formatConversionExpansionFactor;
  if (formatConversionExpansionFactor <= 0.0)
  {
    if (!-[PHMediaFormatConversionRequest preflighted](self, "preflighted"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1353, CFSTR("Request must be preflighted"));

    }
    -[PHMediaFormatConversionRequest source](self, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isVideo");

    if (v6)
    {
      -[PHMediaFormatConversionRequest requiresSinglePassVideoConversion](self, "requiresSinglePassVideoConversion");
      return 2.2;
    }
    else
    {
      v7 = (void *)objc_opt_class();
      -[PHMediaFormatConversionRequest source](self, "source");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageDimensions");
      v10 = v9;
      v12 = v11;
      -[PHMediaFormatConversionRequest source](self, "source");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "heifToJPEGFactorWithImageDimensions:fileLength:", objc_msgSend(v13, "length"), v10, v12);
      formatConversionExpansionFactor = v14;

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        -[PHMediaFormatConversionRequest source](self, "source");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "imageDimensions");
        NSStringFromSize(v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHMediaFormatConversionRequest source](self, "source");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 134218498;
        v21 = formatConversionExpansionFactor;
        v22 = 2112;
        v23 = v17;
        v24 = 2048;
        v25 = objc_msgSend(v18, "length");
        _os_log_debug_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Calculated formatConversionExpansionFactor: %f (image dimensions: %@, file length: %llu)", (uint8_t *)&v20, 0x20u);

      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v20 = 134217984;
    v21 = formatConversionExpansionFactor;
    _os_log_debug_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Explicit formatConversionExpansionFactor: %f", (uint8_t *)&v20, 0xCu);
    return self->_formatConversionExpansionFactor;
  }
  return formatConversionExpansionFactor;
}

- (int64_t)passthroughConversionAdditionalByteCount
{
  if (self->_passthroughConversionAdditionalByteCount <= 0)
    return 512;
  else
    return self->_passthroughConversionAdditionalByteCount;
}

- (void)padOutputFileToEstimatedLength
{
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[PHMediaFormatConversionRequest destination](self, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v4 = objc_msgSend(v3, "padToLength:error:", -[PHMediaFormatConversionRequest estimatedOutputFileLength](self, "estimatedOutputFileLength"), &v15);
  v5 = v15;

  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[PHMediaFormatConversionRequest source](self, "source");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fileType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHMediaFormatConversionRequest destination](self, "destination");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");
      v9 = -[PHMediaFormatConversionRequest estimatedOutputFileLength](self, "estimatedOutputFileLength");
      -[PHMediaFormatConversionRequest source](self, "source");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHMediaFormatConversionRequest destination](self, "destination");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fileURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v17 = v6;
      v18 = 2048;
      v19 = v8;
      v20 = 2048;
      v21 = v9;
      v22 = 2114;
      v23 = v5;
      v24 = 2112;
      v25 = v11;
      v26 = 2112;
      v27 = v13;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to pad output file (type %{public}@) of length %llu to estimated length %llu: %{public}@, %@ -> %@", buf, 0x3Eu);

    }
    -[PHMediaFormatConversionRequest setStatus:](self, "setStatus:", 5);
    -[PHMediaFormatConversionRequest setError:](self, "setError:", v5);
  }

}

- (void)didFinishProcessing
{
  void *v3;
  void *v4;
  id v5;

  if (-[PHMediaFormatConversionRequest status](self, "status") == 4
    && -[PHMediaFormatConversionRequest shouldPadOutputFileToEstimatedLength](self, "shouldPadOutputFileToEstimatedLength")&& !-[PHMediaFormatConversionRequest requiresSinglePassVideoConversion](self, "requiresSinglePassVideoConversion"))
  {
    -[PHMediaFormatConversionRequest padOutputFileToEstimatedLength](self, "padOutputFileToEstimatedLength");
  }
  if (-[PHMediaFormatConversionRequest status](self, "status") != 4
    && -[PHMediaFormatConversionRequest requiresSinglePassVideoConversion](self, "requiresSinglePassVideoConversion"))
  {
    -[PHMediaFormatConversionRequest destination](self, "destination");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "singlePassVideoExportRangeCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

  }
  -[PHMediaFormatConversionRequest progress](self, "progress");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompletedUnitCount:", 1);

}

- (void)enableSinglePassVideoEncodingWithUpdateHandler:(id)a3
{
  void *v5;
  id singlePassVideoConversionUpdateHandler;
  void *v7;
  id v8;

  v8 = a3;
  if (-[PHMediaFormatConversionContent mediaType](self->_source, "mediaType") != 1
    || -[PHMediaFormatConversionRequest isCompositeRequest](self, "isCompositeRequest"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1433, CFSTR("Invalid request configuration for single pass video conversion"));

  }
  self->_requiresSinglePassVideoConversion = 1;
  v5 = (void *)MEMORY[0x1D8270520](v8);
  singlePassVideoConversionUpdateHandler = self->_singlePassVideoConversionUpdateHandler;
  self->_singlePassVideoConversionUpdateHandler = v5;

}

- (void)updateSinglePassVideoConversionStatus:(int64_t)a3 addedRange:(_NSRange)a4 error:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  int v14;
  int64_t v15;
  uint64_t v16;

  length = a4.length;
  location = a4.location;
  v16 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (!self->_requiresSinglePassVideoConversion)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1440, CFSTR("Invalid request configuration for single pass video conversion callback"));

  }
  if (!self->_singlePassVideoConversionUpdateHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1441, CFSTR("Unexpected nil single pass video conversion update handler"));

  }
  v10 = -[PHMediaFormatConversionRequest status](self, "status");
  if (v10 == 3)
  {
    -[PHMediaFormatConversionDestination addAvailableRange:](self->_destination, "addAvailableRange:", location, length);
    (*((void (**)(void))self->_singlePassVideoConversionUpdateHandler + 2))();
  }
  else
  {
    v11 = v10;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134217984;
      v15 = v11;
      _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Ignoring single pass video conversion status update for request in non-processing state %zd", (uint8_t *)&v14, 0xCu);
    }
  }

}

- (void)setLivePhotoPairingIdentifierBehavior:(int64_t)a3
{
  self->_livePhotoPairingIdentifierBehavior = a3;
}

- (NSString)livePhotoPairingIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLivePhotoPairingIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void)setForceFormatConversion:(BOOL)a3
{
  self->_forceFormatConversion = a3;
}

- (BOOL)shouldPadOutputFileToEstimatedLength
{
  return self->_shouldPadOutputFileToEstimatedLength;
}

- (void)setShouldPadOutputFileToEstimatedLength:(BOOL)a3
{
  self->_shouldPadOutputFileToEstimatedLength = a3;
}

- (BOOL)shouldStripLocation
{
  return self->_shouldStripLocation;
}

- (void)setShouldStripLocation:(BOOL)a3
{
  self->_shouldStripLocation = a3;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)outputFilename
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOutputFilename:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setUseTransferBehaviorUserPreference:(BOOL)a3
{
  self->_useTransferBehaviorUserPreference = a3;
}

- (PHMediaFormatConversionDestination)destination
{
  return self->_destination;
}

- (id)userInfo
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)videoExportPreset
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setVideoExportPreset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 104, 1);
}

- (void)setParentRequest:(id)a3
{
  objc_storeWeak((id *)&self->_parentRequest, a3);
}

- (NSURL)directoryForTemporaryFiles
{
  return (NSURL *)objc_getProperty(self, a2, 136, 1);
}

- (id)singlePassVideoConversionUpdateHandler
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setSinglePassVideoConversionUpdateHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (void)setRequiresSinglePassVideoConversion:(BOOL)a3
{
  self->_requiresSinglePassVideoConversion = a3;
}

- (BOOL)shouldExportAsHDR
{
  return self->_shouldExportAsHDR;
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 168, 1);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 184, 1);
}

- (NSTimeZone)creationDateTimeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 192, 1);
}

- (NSString)caption
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (NSString)accessibilityDescription
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setPassthroughConversionAdditionalByteCount:(int64_t)a3
{
  self->_passthroughConversionAdditionalByteCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_creationDateTimeZone, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong(&self->_singlePassVideoConversionUpdateHandler, 0);
  objc_storeStrong((id *)&self->_directoryForTemporaryFiles, 0);
  objc_destroyWeak((id *)&self->_parentRequest);
  objc_storeStrong((id *)&self->_destinationCapabilities, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_videoExportPreset, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_outputFilename, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_livePhotoPairingIdentifier, 0);
}

+ (id)stringForRequestStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return CFSTR("PHMediaFormatRequestStatusUnknown");
  else
    return off_1E9953950[a3 - 1];
}

+ (BOOL)hasInternalDiagnostics
{
  if (hasInternalDiagnostics_onceToken != -1)
    dispatch_once(&hasInternalDiagnostics_onceToken, &__block_literal_global_360);
  return hasInternalDiagnostics_hasInternalDiagnostics;
}

+ (double)heifToJPEGFactorWithImageDimensions:(CGSize)a3 fileLength:(unint64_t)a4
{
  BOOL v4;
  double result;

  v4 = a3.height == *(double *)(MEMORY[0x1E0C9D820] + 8) && a3.width == *MEMORY[0x1E0C9D820];
  if (!a4 || v4)
    return 2.3;
  objc_msgSend(a1, "bitsPerPixelWithImageDimensions:fileLength:");
  objc_msgSend(a1, "heifToJPEGFactorForBitsPerPixel:");
  return result;
}

+ (double)bitsPerPixelWithImageDimensions:(CGSize)a3 fileLength:(unint64_t)a4
{
  return (double)a4 / (a3.width * a3.height) * 8.0;
}

+ (double)heifToJPEGFactorForBitsPerPixel:(double)a3
{
  double v3;
  BOOL v4;
  double result;

  v3 = 2.3;
  if (a3 > 1.3)
    v3 = 2.0;
  v4 = a3 > 0.7;
  result = 3.0;
  if (v4)
    return v3;
  return result;
}

uint64_t __56__PHMediaFormatConversionRequest_hasInternalDiagnostics__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  hasInternalDiagnostics_hasInternalDiagnostics = result;
  return result;
}

@end
