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
  if (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x24BDC17C0]))
    return 1;
  if (UTTypeConformsTo((CFStringRef)a3, CFSTR("public.heif-standard")))
    return 2;
  if (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x24BDC1820]))
    return 3;
  return 4 * (UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x24BDC1780]) != 0);
}

- (void)emitTranscodeBeginFromUTI:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = objc_msgSend__telemetryImageTypeForUTI_(self, a2, (uint64_t)a3, v3, v4, v5, v6);
  MEMORY[0x24BEDD108](self, sel__emitSignpostTranscodeRange_begin_, v8, 1, v9, v10, v11);
}

- (void)emitTranscodeEndFromUTI:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = objc_msgSend__telemetryImageTypeForUTI_(self, a2, (uint64_t)a3, v3, v4, v5, v6);
  MEMORY[0x24BEDD108](self, sel__emitSignpostTranscodeRange_begin_, v8, 0, v9, v10, v11);
}

- (void)emitPreviewGenerationBeginFromUTI:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = objc_msgSend__telemetryImageTypeForUTI_(self, a2, (uint64_t)a3, v3, v4, v5, v6);
  MEMORY[0x24BEDD108](self, sel__emitSignpostPreviewGenerationRange_begin_, v8, 1, v9, v10, v11);
}

- (void)emitPreviewGenerationEndFromUTI:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = objc_msgSend__telemetryImageTypeForUTI_(self, a2, (uint64_t)a3, v3, v4, v5, v6);
  MEMORY[0x24BEDD108](self, sel__emitSignpostPreviewGenerationRange_begin_, v8, 0, v9, v10, v11);
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
        _os_signpost_emit_with_name_impl(&dword_21DFB1000, v9, v11, signpostId, v12, " enableTelemetry=YES ", v13, 2u);
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
        _os_signpost_emit_with_name_impl(&dword_21DFB1000, v9, v11, signpostId, v12, " enableTelemetry=YES ", v13, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)emitSignpostNoTranscodeFromUTI:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_signpost_id_t signpostId;
  const char *v12;
  uint8_t *v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;

  v5 = _iMessageTelemetryLogHandle();
  switch(objc_msgSend__telemetryImageTypeForUTI_(self, v6, (uint64_t)a3, v7, v8, v9, v10))
  {
    case 0:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v18 = 0;
        v12 = "IMTranscoderImage.transcode.none.other";
        v13 = (uint8_t *)&v18;
        goto LABEL_17;
      }
      break;
    case 1:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v17 = 0;
        v12 = "IMTranscoderImage.transcode.none.jpeg";
        v13 = (uint8_t *)&v17;
        goto LABEL_17;
      }
      break;
    case 2:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v16 = 0;
        v12 = "IMTranscoderImage.transcode.none.heif";
        v13 = (uint8_t *)&v16;
        goto LABEL_17;
      }
      break;
    case 3:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v15 = 0;
        v12 = "IMTranscoderImage.transcode.none.png";
        v13 = (uint8_t *)&v15;
        goto LABEL_17;
      }
      break;
    case 4:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v14 = 0;
        v12 = "IMTranscoderImage.transcode.none.gif";
        v13 = (uint8_t *)&v14;
LABEL_17:
        _os_signpost_emit_with_name_impl(&dword_21DFB1000, v5, OS_SIGNPOST_EVENT, signpostId, v12, " enableTelemetry=YES ", v13, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)emitSignpostTranscodeStepForDestinationUTI:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_signpost_id_t signpostId;
  const char *v12;
  uint8_t *v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;

  v5 = _iMessageTelemetryLogHandle();
  switch(objc_msgSend__telemetryImageTypeForUTI_(self, v6, (uint64_t)a3, v7, v8, v9, v10))
  {
    case 0:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v18 = 0;
        v12 = "IMTranscoderImage.transcode.step.other";
        v13 = (uint8_t *)&v18;
        goto LABEL_17;
      }
      break;
    case 1:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v17 = 0;
        v12 = "IMTranscoderImage.transcode.step.jpeg";
        v13 = (uint8_t *)&v17;
        goto LABEL_17;
      }
      break;
    case 2:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v16 = 0;
        v12 = "IMTranscoderImage.transcode.step.heif";
        v13 = (uint8_t *)&v16;
        goto LABEL_17;
      }
      break;
    case 3:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v15 = 0;
        v12 = "IMTranscoderImage.transcode.step.png";
        v13 = (uint8_t *)&v15;
        goto LABEL_17;
      }
      break;
    case 4:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v14 = 0;
        v12 = "IMTranscoderImage.transcode.step.gif";
        v13 = (uint8_t *)&v14;
LABEL_17:
        _os_signpost_emit_with_name_impl(&dword_21DFB1000, v5, OS_SIGNPOST_EVENT, signpostId, v12, " enableTelemetry=YES ", v13, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)emitSignpostTranscodeFinalForDestinationUTI:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_signpost_id_t signpostId;
  const char *v12;
  uint8_t *v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;

  v5 = _iMessageTelemetryLogHandle();
  switch(objc_msgSend__telemetryImageTypeForUTI_(self, v6, (uint64_t)a3, v7, v8, v9, v10))
  {
    case 0:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v18 = 0;
        v12 = "IMTranscoderImage.transcode.final.other";
        v13 = (uint8_t *)&v18;
        goto LABEL_17;
      }
      break;
    case 1:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v17 = 0;
        v12 = "IMTranscoderImage.transcode.final.jpeg";
        v13 = (uint8_t *)&v17;
        goto LABEL_17;
      }
      break;
    case 2:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v16 = 0;
        v12 = "IMTranscoderImage.transcode.final.heif";
        v13 = (uint8_t *)&v16;
        goto LABEL_17;
      }
      break;
    case 3:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v15 = 0;
        v12 = "IMTranscoderImage.transcode.final.png";
        v13 = (uint8_t *)&v15;
        goto LABEL_17;
      }
      break;
    case 4:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v14 = 0;
        v12 = "IMTranscoderImage.transcode.final.gif";
        v13 = (uint8_t *)&v14;
LABEL_17:
        _os_signpost_emit_with_name_impl(&dword_21DFB1000, v5, OS_SIGNPOST_EVENT, signpostId, v12, " enableTelemetry=YES ", v13, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)emitSignpostTranscodeSkipSourceUTI:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_signpost_id_t signpostId;
  const char *v12;
  uint8_t *v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;

  v5 = _iMessageTelemetryLogHandle();
  switch(objc_msgSend__telemetryImageTypeForUTI_(self, v6, (uint64_t)a3, v7, v8, v9, v10))
  {
    case 0:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v18 = 0;
        v12 = "IMTranscoderImage.transcode.skip.other";
        v13 = (uint8_t *)&v18;
        goto LABEL_17;
      }
      break;
    case 1:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v17 = 0;
        v12 = "IMTranscoderImage.transcode.skip.jpeg";
        v13 = (uint8_t *)&v17;
        goto LABEL_17;
      }
      break;
    case 2:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v16 = 0;
        v12 = "IMTranscoderImage.transcode.skip.heif";
        v13 = (uint8_t *)&v16;
        goto LABEL_17;
      }
      break;
    case 3:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v15 = 0;
        v12 = "IMTranscoderImage.transcode.skip.png";
        v13 = (uint8_t *)&v15;
        goto LABEL_17;
      }
      break;
    case 4:
      signpostId = self->_signpostId;
      if (signpostId && os_signpost_enabled(v5))
      {
        v14 = 0;
        v12 = "IMTranscoderImage.transcode.skip.gif";
        v13 = (uint8_t *)&v14;
LABEL_17:
        _os_signpost_emit_with_name_impl(&dword_21DFB1000, v5, OS_SIGNPOST_EVENT, signpostId, v12, " enableTelemetry=YES ", v13, 2u);
      }
      break;
    default:
      return;
  }
}

@end
