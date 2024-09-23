@implementation IMTranscoderTelemetry

- (IMTranscoderTelemetry)init
{
  IMTranscoderTelemetry *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMTranscoderTelemetry;
  v2 = -[IMTranscoderTelemetry init](&v5, sel_init);
  v3 = _iMessageTelemetryLogHandle();
  v2->_signpostId = os_signpost_id_generate(v3);
  return v2;
}

- (int64_t)_telemetryImageTypeForUTI:(id)a3
{
  if (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E0CA5BA8]))
    return 1;
  if (UTTypeConformsTo((CFStringRef)a3, CFSTR("public.heif-standard")))
    return 2;
  if (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E0CA5C10]))
    return 3;
  return 4 * (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E0CA5B68]) != 0);
}

- (void)emitTranscodeBeginFromUTI:(id)a3
{
  -[IMTranscoderTelemetry _telemetryImageTypeForUTI:](self, "_telemetryImageTypeForUTI:", a3);
  MEMORY[0x1E0DE7D20](self, sel__emitSignpostTranscodeRange_begin_);
}

- (void)emitTranscodeEndFromUTI:(id)a3
{
  -[IMTranscoderTelemetry _telemetryImageTypeForUTI:](self, "_telemetryImageTypeForUTI:", a3);
  MEMORY[0x1E0DE7D20](self, sel__emitSignpostTranscodeRange_begin_);
}

- (void)emitPreviewGenerationBeginFromUTI:(id)a3
{
  -[IMTranscoderTelemetry _telemetryImageTypeForUTI:](self, "_telemetryImageTypeForUTI:", a3);
  MEMORY[0x1E0DE7D20](self, sel__emitSignpostPreviewGenerationRange_begin_);
}

- (void)emitPreviewGenerationEndFromUTI:(id)a3
{
  -[IMTranscoderTelemetry _telemetryImageTypeForUTI:](self, "_telemetryImageTypeForUTI:", a3);
  MEMORY[0x1E0DE7D20](self, sel__emitSignpostPreviewGenerationRange_begin_);
}

- (void)_emitSignpostPreviewGenerationRange:(int64_t)a3 begin:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  char v8;
  NSObject *v9;
  os_signpost_id_t signpostId;
  os_signpost_type_t v11;
  const char *v12;
  uint8_t *v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;

  v4 = a4;
  v7 = _iMessageTelemetryLogHandle();
  if (v4)
    v8 = 1;
  else
    v8 = 2;
  v9 = v7;
  switch(a3)
  {
    case 0:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        v18 = 0;
        v11 = v8;
        v12 = "IMTranscoderImage.previewGeneration.type.other";
        v13 = (uint8_t *)&v18;
        goto LABEL_20;
      }
      break;
    case 1:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        v17 = 0;
        v11 = v8;
        v12 = "IMTranscoderImage.previewGeneration.type.jpeg";
        v13 = (uint8_t *)&v17;
        goto LABEL_20;
      }
      break;
    case 2:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        v16 = 0;
        v11 = v8;
        v12 = "IMTranscoderImage.previewGeneration.type.heif";
        v13 = (uint8_t *)&v16;
        goto LABEL_20;
      }
      break;
    case 3:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        v15 = 0;
        v11 = v8;
        v12 = "IMTranscoderImage.previewGeneration.type.png";
        v13 = (uint8_t *)&v15;
        goto LABEL_20;
      }
      break;
    case 4:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        v14 = 0;
        v11 = v8;
        v12 = "IMTranscoderImage.previewGeneration.type.gif";
        v13 = (uint8_t *)&v14;
LABEL_20:
        _os_signpost_emit_with_name_impl(&dword_19E239000, v9, v11, signpostId, v12, " enableTelemetry=YES ", v13, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)_emitSignpostTranscodeRange:(int64_t)a3 begin:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  char v8;
  NSObject *v9;
  os_signpost_id_t signpostId;
  os_signpost_type_t v11;
  const char *v12;
  uint8_t *v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;

  v4 = a4;
  v7 = _iMessageTelemetryLogHandle();
  if (v4)
    v8 = 1;
  else
    v8 = 2;
  v9 = v7;
  switch(a3)
  {
    case 0:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        v18 = 0;
        v11 = v8;
        v12 = "IMTranscoderImage.transcode.type.other";
        v13 = (uint8_t *)&v18;
        goto LABEL_20;
      }
      break;
    case 1:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        v17 = 0;
        v11 = v8;
        v12 = "IMTranscoderImage.transcode.type.jpeg";
        v13 = (uint8_t *)&v17;
        goto LABEL_20;
      }
      break;
    case 2:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        v16 = 0;
        v11 = v8;
        v12 = "IMTranscoderImage.transcode.type.heif";
        v13 = (uint8_t *)&v16;
        goto LABEL_20;
      }
      break;
    case 3:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        v15 = 0;
        v11 = v8;
        v12 = "IMTranscoderImage.transcode.type.png";
        v13 = (uint8_t *)&v15;
        goto LABEL_20;
      }
      break;
    case 4:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v7))
      {
        v14 = 0;
        v11 = v8;
        v12 = "IMTranscoderImage.transcode.type.gif";
        v13 = (uint8_t *)&v14;
LABEL_20:
        _os_signpost_emit_with_name_impl(&dword_19E239000, v9, v11, signpostId, v12, " enableTelemetry=YES ", v13, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)emitSignpostNoTranscodeFromUTI:(id)a3
{
  NSObject *v5;
  os_signpost_id_t signpostId;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;

  v5 = _iMessageTelemetryLogHandle();
  switch(-[IMTranscoderTelemetry _telemetryImageTypeForUTI:](self, "_telemetryImageTypeForUTI:", a3))
  {
    case 0:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v13 = 0;
        v7 = "IMTranscoderImage.transcode.none.other";
        v8 = (uint8_t *)&v13;
        goto LABEL_17;
      }
      break;
    case 1:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v12 = 0;
        v7 = "IMTranscoderImage.transcode.none.jpeg";
        v8 = (uint8_t *)&v12;
        goto LABEL_17;
      }
      break;
    case 2:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v11 = 0;
        v7 = "IMTranscoderImage.transcode.none.heif";
        v8 = (uint8_t *)&v11;
        goto LABEL_17;
      }
      break;
    case 3:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v10 = 0;
        v7 = "IMTranscoderImage.transcode.none.png";
        v8 = (uint8_t *)&v10;
        goto LABEL_17;
      }
      break;
    case 4:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v9 = 0;
        v7 = "IMTranscoderImage.transcode.none.gif";
        v8 = (uint8_t *)&v9;
LABEL_17:
        _os_signpost_emit_with_name_impl(&dword_19E239000, v5, OS_SIGNPOST_EVENT, signpostId, v7, " enableTelemetry=YES ", v8, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)emitSignpostTranscodeStepForDestinationUTI:(id)a3
{
  NSObject *v5;
  os_signpost_id_t signpostId;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;

  v5 = _iMessageTelemetryLogHandle();
  switch(-[IMTranscoderTelemetry _telemetryImageTypeForUTI:](self, "_telemetryImageTypeForUTI:", a3))
  {
    case 0:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v13 = 0;
        v7 = "IMTranscoderImage.transcode.step.other";
        v8 = (uint8_t *)&v13;
        goto LABEL_17;
      }
      break;
    case 1:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v12 = 0;
        v7 = "IMTranscoderImage.transcode.step.jpeg";
        v8 = (uint8_t *)&v12;
        goto LABEL_17;
      }
      break;
    case 2:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v11 = 0;
        v7 = "IMTranscoderImage.transcode.step.heif";
        v8 = (uint8_t *)&v11;
        goto LABEL_17;
      }
      break;
    case 3:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v10 = 0;
        v7 = "IMTranscoderImage.transcode.step.png";
        v8 = (uint8_t *)&v10;
        goto LABEL_17;
      }
      break;
    case 4:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v9 = 0;
        v7 = "IMTranscoderImage.transcode.step.gif";
        v8 = (uint8_t *)&v9;
LABEL_17:
        _os_signpost_emit_with_name_impl(&dword_19E239000, v5, OS_SIGNPOST_EVENT, signpostId, v7, " enableTelemetry=YES ", v8, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)emitSignpostTranscodeFinalForDestinationUTI:(id)a3
{
  NSObject *v5;
  os_signpost_id_t signpostId;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;

  v5 = _iMessageTelemetryLogHandle();
  switch(-[IMTranscoderTelemetry _telemetryImageTypeForUTI:](self, "_telemetryImageTypeForUTI:", a3))
  {
    case 0:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v13 = 0;
        v7 = "IMTranscoderImage.transcode.final.other";
        v8 = (uint8_t *)&v13;
        goto LABEL_17;
      }
      break;
    case 1:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v12 = 0;
        v7 = "IMTranscoderImage.transcode.final.jpeg";
        v8 = (uint8_t *)&v12;
        goto LABEL_17;
      }
      break;
    case 2:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v11 = 0;
        v7 = "IMTranscoderImage.transcode.final.heif";
        v8 = (uint8_t *)&v11;
        goto LABEL_17;
      }
      break;
    case 3:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v10 = 0;
        v7 = "IMTranscoderImage.transcode.final.png";
        v8 = (uint8_t *)&v10;
        goto LABEL_17;
      }
      break;
    case 4:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v9 = 0;
        v7 = "IMTranscoderImage.transcode.final.gif";
        v8 = (uint8_t *)&v9;
LABEL_17:
        _os_signpost_emit_with_name_impl(&dword_19E239000, v5, OS_SIGNPOST_EVENT, signpostId, v7, " enableTelemetry=YES ", v8, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)emitSignpostTranscodeSkipSourceUTI:(id)a3
{
  NSObject *v5;
  os_signpost_id_t signpostId;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;

  v5 = _iMessageTelemetryLogHandle();
  switch(-[IMTranscoderTelemetry _telemetryImageTypeForUTI:](self, "_telemetryImageTypeForUTI:", a3))
  {
    case 0:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v13 = 0;
        v7 = "IMTranscoderImage.transcode.skip.other";
        v8 = (uint8_t *)&v13;
        goto LABEL_17;
      }
      break;
    case 1:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v12 = 0;
        v7 = "IMTranscoderImage.transcode.skip.jpeg";
        v8 = (uint8_t *)&v12;
        goto LABEL_17;
      }
      break;
    case 2:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v11 = 0;
        v7 = "IMTranscoderImage.transcode.skip.heif";
        v8 = (uint8_t *)&v11;
        goto LABEL_17;
      }
      break;
    case 3:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v10 = 0;
        v7 = "IMTranscoderImage.transcode.skip.png";
        v8 = (uint8_t *)&v10;
        goto LABEL_17;
      }
      break;
    case 4:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v9 = 0;
        v7 = "IMTranscoderImage.transcode.skip.gif";
        v8 = (uint8_t *)&v9;
LABEL_17:
        _os_signpost_emit_with_name_impl(&dword_19E239000, v5, OS_SIGNPOST_EVENT, signpostId, v7, " enableTelemetry=YES ", v8, 2u);
      }
      break;
    default:
      return;
  }
}

@end
