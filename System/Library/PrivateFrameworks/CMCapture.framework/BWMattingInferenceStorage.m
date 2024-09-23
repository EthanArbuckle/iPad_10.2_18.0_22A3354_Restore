@implementation BWMattingInferenceStorage

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMattingInferenceStorage;
  -[BWInferenceProviderStorage dealloc](&v3, sel_dealloc);
}

- (void)setDictionary:(id)a3 forMetadataRequirement:(id)a4
{
  NSMutableDictionary *metadataDictionaryByRequirement;

  metadataDictionaryByRequirement = self->_metadataDictionaryByRequirement;
  if (!metadataDictionaryByRequirement)
  {
    metadataDictionaryByRequirement = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_metadataDictionaryByRequirement = metadataDictionaryByRequirement;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](metadataDictionaryByRequirement, "setObject:forKeyedSubscript:", a3, a4);
}

- (opaqueCMSampleBuffer)newSampleBufferSatisfyingRequirement:(id)a3 withPropagationSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  CFTypeRef v7;
  __CVBuffer *v8;
  const __CFString *v9;
  void *v10;
  CMAttachmentBearerRef target;
  CFTypeRef cf;

  target = 0;
  v7 = (CFTypeRef)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "videoFormat"), "underlyingVideoFormat"), "formatDescription");
  if (v7)
    v7 = CFRetain(v7);
  cf = v7;
  v8 = -[BWInferenceProviderStorage pixelBufferForRequirement:](self, "pixelBufferForRequirement:", a3);
  if (v8)
  {
    if (!BWCMSampleBufferCreateDeepCopyWithNewPixelBuffer(a4, v8, 0, &cf, (CMSampleBufferRef *)&target))
    {
      v9 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v10 = (void *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "mutableCopy");
      CMSetAttachment(target, v9, v10, 1u);

      goto LABEL_6;
    }
    fig_log_get_emitter();
  }
  else
  {
    fig_log_get_emitter();
  }
  FigDebugAssert3();
LABEL_6:
  if (cf)
    CFRelease(cf);
  return (opaqueCMSampleBuffer *)target;
}

- (id)newMetadataDictionarySatisfyingRequirement:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_metadataDictionaryByRequirement, "objectForKeyedSubscript:", a3);
}

@end
