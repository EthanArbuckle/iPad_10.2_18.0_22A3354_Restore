@implementation BWInferenceSchedulerGraphInputNode

- (BWInferenceSubmittable)submittable
{
  return 0;
}

- (id)newStorage
{
  BWInferenceSimpleStorage *v2;

  v2 = [BWInferenceSimpleStorage alloc];
  return -[BWInferenceSimpleStorage initWithRequirementsNeedingPools:](v2, "initWithRequirementsNeedingPools:", MEMORY[0x1E0C9AA60]);
}

- (BWInferenceExecutable)executable
{
  return 0;
}

- (BWInferencePropagatable)propagatable
{
  return 0;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerGraphInputNode;
  return -[NSString stringByAppendingFormat:](-[BWInferenceSchedulerGraphInputNode description](&v3, sel_description), "stringByAppendingFormat:", CFSTR(" videoPropagatedToStorage: %@"), self->_videoPropagatedToStorage);
}

- (BWInferenceSchedulerGraphInputNode)initWithVideoPropagatedToStorage:(id)a3
{
  BWInferenceSchedulerGraphInputNode *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWInferenceSchedulerGraphInputNode;
  v4 = -[BWInferenceSchedulerGraphInputNode init](&v6, sel_init);
  if (v4)
    v4->_videoPropagatedToStorage = (NSSet *)a3;
  return v4;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerGraphInputNode;
  -[BWInferenceSchedulerGraphInputNode dealloc](&v3, sel_dealloc);
}

- (int)type
{
  return 0;
}

- (int)extractFromSampleBuffer:(opaqueCMSampleBuffer *)a3 usingVideoRequirements:(id)a4 metadataRequirements:(id)a5 toStorage:(id)a6
{
  NSArray *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  opaqueCMSampleBuffer *AttachedMedia;
  CVImageBufferRef ImageBuffer;
  CFDictionaryRef v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v7 = (NSArray *)a4;
  v25 = *MEMORY[0x1E0C80C00];
  if (!a4)
    v7 = -[NSSet allObjects](self->_videoPropagatedToStorage, "allObjects", a3, 0, a5);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v14 = (void *)objc_msgSend(v13, "attachedMediaKey");
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("PrimaryFormat"));
        AttachedMedia = a3;
        if ((v15 & 1) == 0)
          AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)v14);
        if (!AttachedMedia)
          return -31712;
        ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
        if (!ImageBuffer)
          return -31712;
        objc_msgSend(a6, "setPixelBuffer:forRequirement:", ImageBuffer, v13);
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
        continue;
      break;
    }
  }
  v18 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, 1u);
  objc_msgSend(a6, "setInputSampleBufferAttachments:", v18);

  return 0;
}

- (int)extractFromStorage:(id)a3 usingVideoRequirements:(id)a4 metadataRequirements:(id)a5 toSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  return 0;
}

@end
